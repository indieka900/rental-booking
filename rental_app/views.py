from django.shortcuts import render
from rental_app.models import Rooms

def viewRoom(request, id):
    room = Rooms.objects.get(id=id)
    return render(request, 'app/detail_page.html',{'room':room})


# Create your views here.
