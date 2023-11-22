from django.urls import path
from rental_app.views import (viewRoom)

app_name = 'rentals'

urlpatterns = [
    path('room/<id>/',viewRoom, name='room')
]
