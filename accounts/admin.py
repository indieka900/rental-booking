from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from .models import CustomUser,Landlord,Prospectivetenant,Profile


@admin.action(description="activate selected users")
def activate_users(modeladmin, request, queryset):
    queryset.update(is_active=True)


@admin.action(description="deactivate selected users")
def deactivate_users(modeladmin, request, queryset):
    queryset.update(is_active=False)

@admin.register(CustomUser)
class UserAdminConfig(UserAdmin):
    ordering = ('-date_joined',)
    search_fields = ('email','full_name','username')
    list_filter = ('email','is_active','is_staff',)
    list_display = ('id','email','full_name','phone','is_active','username','role')
    fieldsets = (
        (None, {'fields': ('email','full_name','phone','username',)}),
        ("Permissions", {"fields" :('is_staff','is_active','is_superuser',)}),
        ("Personal", {"fields":("role","image")}),
    )
    add_fieldsets = (
        (None, {
            'classes':('wide',),
            'fields': ('email','full_name','password1','password2','phone','is_staff','is_active','is_superuser','image')
        }),
    )
    actions = [activate_users,deactivate_users]


admin.site.register(Landlord)
admin.site.register(Prospectivetenant)
