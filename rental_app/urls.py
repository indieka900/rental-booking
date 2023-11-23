from django.urls import path
from rental_app.views import (viewRoom,viewRooms,
                              viewApartment,viewRooms_L,
                              viewHistory, result
                              )

app_name = 'rentals'

urlpatterns = [
    path('rooms/',viewRooms, name='rooms'),
    path('landlord\'s-rooms/',viewRooms_L, name='landlords-rooms'),
    path('booking-history/', viewHistory, name='booking-history'),
    path('room/<id>/',viewRoom, name='room'),
    path('search-results', result, name='result' ),
    path('apartment/<int:id>/',viewApartment, name='apartment'),
]
