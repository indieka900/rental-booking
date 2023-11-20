from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from .models import CustomUser,Landlord,Prospectivetenant


class UserAdminConfig(UserAdmin):
    ordering = ('-date_joined',)
    search_fields = ('email','full_name','username')
    list_filter = ('email','is_active','is_staff',)
    list_display = ('id','email','full_name','phone','is_staff','username','role')
    fieldsets = (
        (None, {'fields': ('email','full_name','phone','username',)}),
        ("Permissions", {"fields" :('is_staff','is_active','is_superuser',)}),
        ("Personal", {"fields":("role",)}),
    )
    add_fieldsets = (
        (None, {
            'classes':('wide',),
            'fields': ('email','full_name','password1','password2','phone','is_staff','is_active','is_superuser','image')
        }),
    )

admin.site.register(CustomUser,UserAdminConfig)
admin.site .register(Landlord)
admin.site.register(Prospectivetenant)
