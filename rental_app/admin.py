from django.contrib import admin
from rental_app.models import (Apartments, Rooms)



@admin.register(Rooms)
class RoomsAdmin(admin.ModelAdmin):
    ordering = ('-date_created',)
    search_fields = ('apartment','room_type')
    list_filter = ('date_created','room_type','booked','rent')


@admin.register(Apartments)   
class ApartmentsAdmin(admin.ModelAdmin):
    ordering = ('-date_created',)
    search_fields = ('apartment_name','location')
    list_filter = ('date_created','date_updated')




# Register your models here.
