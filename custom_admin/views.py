from django.shortcuts import render

def login(request):
    return render(request, 'c_admin/login.html')

# Create your views here.
