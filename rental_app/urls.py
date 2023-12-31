from django.urls import path
from rental_app.views import (viewRoom,viewRooms,
                              viewApartment,viewRooms_L,
                              viewHistory, delete_history, result,
                              add_room,add_apartment,pages,
                              update_apartment,update_room,
                              delete_apartment,delete_room,
                              my_appartments,
                              )

app_name = 'rentals'

urlpatterns = [
    path('rooms/',viewRooms, name='rooms'),
    path('landlord\'s-rooms/',viewRooms_L, name='landlords-rooms'),
    path('booking-history/', viewHistory, name='booking-history'),
    path('delete-booking-history/<id>/', delete_history, name='delete-booking-history'),
    path('page/<id>/',pages, name='page'),
    path('room/<id>/',viewRoom, name='room'),
    path('add-room/<id>/',add_room, name='add-room'),
    path('update-room/<id>/',update_room, name='update-room'),
    path('delete-room/<id>/',delete_room, name='delete-room'),
    path('add-apartment/',add_apartment, name='add-apartment'),
    path('my-apartments/',my_appartments, name='my-apartments'),
    path('update-apartment/<id>/',update_apartment, name='update-apartment'),
    path('delete-apartment/<id>/',delete_apartment, name='delete-apartment'),
    path('search-results', result, name='result' ),
    path('apartment/<int:id>/',viewApartment, name='apartment'),
]
