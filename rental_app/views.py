from django.shortcuts import render,redirect
from accounts.forms import UserSignUpForm
from django.contrib import messages
from accounts.models import CustomUser
from django.contrib.auth import authenticate, login, logout 

def home(request):
    signup_form = UserSignUpForm()
    if request.method == 'POST':
        email = request.POST.get('email')
        password = request.POST.get('password')
        try:
            user= CustomUser.objects.get(email=email)
        except CustomUser.DoesNotExist:
            messages.error(request, 'email does not exist!') 
        print(user.email)
        user = authenticate(request, email=email, password=password)
        
        if user is not None:
            if user.is_active:
                print('done')
                login(request, user)
                messages.success(request, 'Logged in succesfully')
                return redirect('/')
            else:
                messages.error(request, 'Please activate your account')
                return redirect('/') 
        else:
            messages.error(request, 'email or password does not exist')
            return redirect('/')

    
    return render(request, 'app/index.html')


# Create your views here.
