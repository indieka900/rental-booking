from django.conf.urls.static import static
from django.conf import settings

from django.contrib import admin
from django.urls import path,include

urlpatterns = [
    path('',include('accounts.urls')),
    path('admin/', admin.site.urls),
    path('custom-admin/', include('custom_admin.urls')),
    path('rentals/',include('rental_app.urls')),

]+static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
