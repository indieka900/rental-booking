from django.contrib import admin
from rental_app.models import (Apartments, Rooms, Booking_History)



@admin.register(Rooms)
class RoomsAdmin(admin.ModelAdmin):
    ordering = ('-date_created',)
    search_fields = ('apartment','room_type','rent')
    list_filter = ('date_created','room_type','booked','rent')


@admin.register(Apartments)   
class ApartmentsAdmin(admin.ModelAdmin):
    ordering = ('-date_created',)
    search_fields = ('apartment_name','location')
    list_filter = ('date_created','date_updated')

admin.site.register(Booking_History)


# Register your models here.
