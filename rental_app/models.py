from django.db import models
from django.utils.translation import gettext as _
from accounts.models import Landlord,Prospectivetenant

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
    
    Room_type_choices = (
        ("Singe room", "Singe room"),
        ("Bedsitter", "Bedsitter"),
        ("Studio", "Studio"),
        ("Go Down", "Go Down"),
        ("One-Bedroom", "One-Bedroom"),
        ("Two-Bedroom", "Two-Bedroom"),
        ("Three-Bedroom", "Three-Bedroom"),
        ("Four-Bedroom", "Four-Bedroom"),
        ("Shared room", "Shared room"),
        ("En suite room", "En suite room"),
        ("Self-contained apartment", "Self-contained apartment"),
        ("Other", "Other")
    )
    
    room_number = models.CharField(_("Room Number"), max_length=50)
    apartment = models.ForeignKey(Apartments, on_delete=models.CASCADE)
    tenant = models.ForeignKey(Prospectivetenant,on_delete=models.SET_NULL, null=True, blank=True)
    size = models.CharField(_("Room Size"), max_length=30)
    room_type = models.CharField(_("Room Type"), max_length=40, choices=Room_type_choices)
    booked = models.BooleanField(_("Booked"), default=False)
    rent = models.PositiveIntegerField(_("Rent per Month"), default= 0)
    image = models.ImageField(_("Room image"), upload_to='Rooms', default= 'default.png')
    date_created = models.DateTimeField(auto_now_add=True)
    date_updated = models.DateTimeField(_("Date Updates"), auto_now=True)
    
    def __str__(self):
        return self.room_number  
    class Meta:
        verbose_name = 'room'
        verbose_name_plural = 'rooms'
        

        
# Create your models here.
