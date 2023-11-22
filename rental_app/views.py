from django.shortcuts import render
from accounts.confirmation_email import send_booking_confirmation_email
from accounts.models import Prospectivetenant
from rental_app.models import Rooms, Apartments, Booking_History
from django.contrib.auth.decorators import login_required
from accounts.decorators import landlord_required, tenant_required
from django.contrib.auth.decorators import permission_required

# @landlord_required
def viewRoom(request, id):
    room = Rooms.objects.get(id=id)
    if request.method == 'POST':
        user = request.user
        real_user = Prospectivetenant.objects.get(user=user)
        booking_history = Booking_History(room=room,user=real_user)
        booking_history.save()
        send_booking_confirmation_email(real_user,room,request)
        
        room.booked=True
        room.tenant=real_user
        room.save()
        return render(request, "app/notification.html")
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
