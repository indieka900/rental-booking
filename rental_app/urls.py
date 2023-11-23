from django.urls import path
from rental_app.views import (viewRoom,viewRooms,
                              viewApartment,viewRooms_L,
                              viewHistory, result,
                              add_room,add_apartment,
                              )

app_name = 'rentals'

urlpatterns = [
    path('rooms/',viewRooms, name='rooms'),
    path('landlord\'s-rooms/',viewRooms_L, name='landlords-rooms'),
    path('booking-history/', viewHistory, name='booking-history'),
    path('room/<id>/',viewRoom, name='room'),
    path('add-room/<id>/',add_room, name='add-room'),
    path('add-apartment/',add_apartment, name='add-apartment'),
    path('search-results', result, name='result' ),
    path('apartment/<int:id>/',viewApartment, name='apartment'),
]
