from django.urls import path
from custom_admin.views import (
    login
)

app_name = 'custom_admin'

urlpatterns = [
    path('', login, name='login')
]
