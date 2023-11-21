from django.urls import path
from rental_app.views import (home)

app_name = 'rentals'

urlpatterns = [
    path('',home, name='home')
]
