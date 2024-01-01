from django.conf.urls.static import static
from django.conf import settings

from django.contrib import admin
from django.urls import path,include

admin.site.site_title = "RBMS site admin (DEV)"
admin.site.site_header = "RBMS administration"
admin.site.index_title = "Site administration"

urlpatterns = [
    path('',include('accounts.urls')),
    path('admin/', admin.site.urls),
    path('custom-admin/', include('custom_admin.urls')),
    path('rentals/',include('rental_app.urls')),

]

urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
