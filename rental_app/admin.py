from django.contrib import admin
from rental_app.models import (Apartments, Rooms, Booking_History,Page,Social_media,RoomType)
from django.urls import reverse
from django.utils.http import urlencode
from django.utils.html import format_html
from import_export.admin import ImportExportActionModelAdmin


@admin.action(description="book selected rooms")
def book_rooms(modeladmin, request, queryset):
    queryset.update(booked=True)


@admin.action(description="Unbook selected rooms")
def unbook_rooms(modeladmin, request, queryset):
    queryset.update(booked=False)

@admin.register(Rooms)
class RoomsAdmin(ImportExportActionModelAdmin, admin.ModelAdmin):
    ordering = ('-date_created',)
    search_fields = ('apartment__apartment_name__icontains','room_type__icontains','rent__icontains','room_number__icontains')
    list_filter = ('date_created','room_type','booked','rent','rate')
    list_display = ('room_number','rent','rate','booked','room_type','size','apartment')
    actions = [book_rooms, unbook_rooms]
    # fieldsets = [
    #     ("New-room", {
    #         "classes": ("collapse", "expanded"),
    #         "fields": ('room_number','rent','rate','booked','room_type','size','apartment'),
    #     }),
    # ]


@admin.register(Apartments)   
class ApartmentsAdmin(ImportExportActionModelAdmin, admin.ModelAdmin):
    ordering = ('-date_created',)
    search_fields = ('apartment_name__icontains','location__icontains','landlord__user__username__icontains')
    list_filter = ('date_created','date_updated')
    list_display = ('apartment_name','location','facilities','description','view_landlord_link','view_rooms_link')
    
    def view_rooms_link(self, obj):
        count = obj.rooms_set.count()
        url = (
            reverse("admin:rental_app_rooms_changelist")
            + "?"
            + urlencode({"apartment__id": f"{obj.id}"})
        )
        return format_html('<a href="{}">{}</a>', url, count)

    view_rooms_link.short_description = "Rooms"
    
    def view_landlord_link(self, obj):
        count = obj.landlord
        url = (
            reverse("admin:accounts_customuser_changelist")
            + "?"
            + urlencode({"id": f"{obj.landlord.user.id}"})
        )
        return format_html('<a href="{}">{}</a>', url, count)

    view_landlord_link.short_description = "Landlord"
    

admin.site.register(Booking_History)
admin.site.register(Page)
admin.site.register(Social_media)
admin.site.register(RoomType)

# Register your models here.
