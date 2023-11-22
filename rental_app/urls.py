from django.urls import path
from rental_app.views import (home2)

app_name = 'rentals'

urlpatterns = [
    path('',home2, name='home')
]
