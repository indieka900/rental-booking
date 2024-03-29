from django.db import models
from django.forms import ValidationError
from django.utils.translation import gettext as _
from accounts.models import Landlord,Prospectivetenant,CustomUser
from django.db.models.signals import post_save
from django.dispatch import receiver


class RoomType(models.Model):
    room_type = models.CharField(_("Room Type"), max_length=200, unique=True)
    
    def __str__(self):
        return self.room_type
    
    class Meta:
        ordering = ('room_type',)

class Apartments(models.Model):
    apartment_name = models.CharField(_("Apartment Name"), max_length=80, unique=True)
    landlord = models.ForeignKey(Landlord,on_delete=models.CASCADE)
    description = models.TextField(_("Apartment Desciption"))
    facilities = models.TextField(_("General Facilities"),blank=True, null=True)
    image = models.ImageField(_("Appartment image"), upload_to='Appartments', default= 'default.png')
    paid_for = models.TextField(_("Facilities to be Paid For"),blank=True, null=True)
    location = models.CharField(_("Describe the location"), max_length=500)
    date_created = models.DateTimeField(auto_now_add=True)
    date_updated = models.DateTimeField(_("Date Updates"), auto_now=True)
    
    def __str__(self):
        return self.apartment_name  
    
    class Meta:
        verbose_name = 'Apartment'
        verbose_name_plural = 'Apartments'
        
class Rooms(models.Model):
    
    charged_choices = (
        ("Per Hour", "Per Hour"),
        ("Per Day","Per Day"),
        ("Per Month", "Per Month")
    )
    

    
    room_number = models.CharField(_("Room Number"), max_length=50)
    apartment = models.ForeignKey(Apartments, on_delete=models.CASCADE)
    tenant = models.ForeignKey(Prospectivetenant,on_delete=models.SET_NULL, null=True, blank=True)
    size = models.CharField(_("Room Size"), max_length=30)
    room_type = models.ForeignKey(RoomType, verbose_name=_("Room-Type"), on_delete=models.CASCADE)
    booked = models.BooleanField(_("Booked"), default=False)
    rent = models.PositiveIntegerField(_("Rent Charged"), default= 0)
    rate = models.CharField(_("Charged Per"), max_length=50, choices=charged_choices, default="Per Month")
    image = models.ImageField(_("Room image"), upload_to='Rooms', default= 'default.png')
    date_created = models.DateTimeField(auto_now_add=True)
    date_updated = models.DateTimeField(_("Date Updates"), auto_now=True)
    
    def __str__(self):
        return self.room_number  
    class Meta:
        verbose_name = 'room'
        verbose_name_plural = 'rooms'
        get_latest_by = 'date_updated'
        
        unique_together = ('room_number', 'apartment')
    
class Booking_History(models.Model):
    user = models.ForeignKey(Prospectivetenant, verbose_name=_("Tenant"), on_delete=models.CASCADE)
    room = models.ForeignKey(Rooms, verbose_name=_("Room"), on_delete=models.SET_NULL, null=True, blank=True)
    date_booked = models.DateTimeField(_("Date Booked"), auto_now=True)

    
    def __str__(self):
        return self.user.user.username
    
    def save(self, *args, **kwargs):
        super().save(*args, **kwargs)
        if self.room:
            self.room.booked = True
            self.room.save()
    
    def clean(self):
        # Check if the room is booked before allowing the booking
        if self.room and self.room.booked:
            raise ValidationError(_("Cannot book a room that is already booked."), code="room_already_booked")
    
    class Meta:
        verbose_name = 'Booking History'
        verbose_name_plural = 'Booking Histories'
        get_latest_by = 'date_booked'
        
        
# @receiver(post_save, sender=CustomUser)
# def update_booking_history_on_user_role_change(sender, instance, created, **kwargs):
#     if not created and instance.role != "Prospective tenant":
#         Booking_History.objects.filter(user=instance).delete()

@receiver(post_save, sender=Rooms)
def update_booking_history_on_room_booking_status_change(sender, instance, created, **kwargs):
    if not created and instance.booked == False:
        Booking_History.objects.filter(room=instance).update(room=None)


class Page(models.Model):
    type = models.CharField(_("Page Type"), max_length=50)
    details = models.TextField(_("Page Detail"))
    
    def __str__(self):
        return self.type
    
class Social_media(models.Model):
    name = models.CharField( max_length=50)
    link = models.CharField(_("The actual link"), max_length=250)
    icon = models.CharField(_("Icon"), max_length=10)
    
    def __str__(self):
        return self.name
        
# Create your models here.

