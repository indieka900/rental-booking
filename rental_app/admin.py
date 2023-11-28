from django.contrib import admin
from rental_app.models import (Apartments, Rooms, Booking_History,Page)



@admin.register(Rooms)
class RoomsAdmin(admin.ModelAdmin):
    ordering = ('-date_created',)
    search_fields = ('apartment','room_type','rent')
    list_filter = ('date_created','room_type','booked','rent')
    list_display = ('room_number','rent','rate','booked','room_type','size','apartment')


@admin.register(Apartments)   
class ApartmentsAdmin(admin.ModelAdmin):
    ordering = ('-date_created',)
    search_fields = ('apartment_name','location')
    list_filter = ('date_created','date_updated')
    list_display = ('apartment_name','location','facilities','description','landlord')

admin.site.register(Booking_History)
admin.site.register(Page)


# Register your models here.
