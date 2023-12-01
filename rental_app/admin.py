from django.contrib import admin
from rental_app.models import (Apartments, Rooms, Booking_History,Page,Social_media)



@admin.register(Rooms)
class RoomsAdmin(admin.ModelAdmin):
    ordering = ('-date_created',)
    search_fields = ('apartment__apartment_name__icontains','room_type__icontains','rent__icontains','room_number__icontains')
    list_filter = ('date_created','room_type','booked','rent','rate')
    list_display = ('room_number','rent','rate','booked','room_type','size','apartment')


@admin.register(Apartments)   
class ApartmentsAdmin(admin.ModelAdmin):
    ordering = ('-date_created',)
    search_fields = ('apartment_name__icontains','location__icontains','landlord__user__username__icontains')
    list_filter = ('date_created','date_updated')
    list_display = ('apartment_name','location','facilities','description','landlord')

admin.site.register(Booking_History)
admin.site.register(Page)
admin.site.register(Social_media)


# Register your models here.
