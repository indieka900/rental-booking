from django.shortcuts import render
from rental_app.models import Rooms, Apartments

def viewRoom(request, id):
    room = Rooms.objects.get(id=id)
    return render(request, 'app/detail_page.html',{'room':room})

def viewRooms(request):
    rooms = Rooms.objects.filter(booked=False)
    return render(request, 'app/rooms.html', {'rooms': rooms})

def viewApartment(request, id):
    apartment = Apartments.objects.get(id=id)
    return render(request, 'app/apartment.html', {'apartment': apartment})


# Create your views here.
