from django.shortcuts import render
from rental_app.models import Rooms, Apartments
from django.contrib.auth.decorators import login_required
from accounts.decorators import landlord_required, tenant_required
from django.contrib.auth.decorators import permission_required

# @landlord_required
def viewRoom(request, id):
    room = Rooms.objects.get(id=id)
    return render(request, 'app/detail_page.html',{'room':room})

# @permission_required('user.is_active',login_url='/')
def viewRooms(request):
    rooms = Rooms.objects.filter(booked=False)
    return render(request, 'app/rooms.html', {'rooms': rooms})

def viewApartment(request, id):
    apartment = Apartments.objects.get(id=id)
    return render(request, 'app/apartment.html', {'apartment': apartment})

@landlord_required
def viewRooms_L(request):
    user = request.user
    rooms = Rooms.objects.filter(apartment__landlord__user__id = user.id)
    return render(request, 'app/rooms.html', {'rooms': rooms})
# Create your views here.
