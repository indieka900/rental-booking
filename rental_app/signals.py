from django.db.models.signals import post_save
from django.dispatch import receiver
from accounts.models import Prospectivetenant
from rental_app.models import Booking_History, Rooms

'''@receiver(post_save, sender=Prospectivetenant)
def update_booking_history_on_user_role_change(sender, instance, created, **kwargs):
    if not created and instance.role != "Prospective tenant":
        Booking_History.objects.filter(user=instance).delete()

@receiver(post_save, sender=Rooms)
def update_booking_history_on_room_booking_status_change(sender, instance, created, **kwargs):
    if not created and instance.booked == False:
        Booking_History.objects.filter(room=instance).update(status="Room was removed/deleted")'''
