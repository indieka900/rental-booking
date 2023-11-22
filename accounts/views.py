
from accounts.confirmation_email import send_activation_email
from django.shortcuts import render,redirect
from django.http import HttpResponse
from django.contrib import messages
from django.contrib.auth import get_user_model
from accounts.models import CustomUser,Landlord, Prospectivetenant
from django.views.generic import CreateView
from django.utils.encoding import force_str  
from django.utils.http import urlsafe_base64_decode 
from accounts.tokens import account_activation_token
from accounts.forms import UserSignUpForm 
from rental_app.models import Rooms
from django.contrib.auth import authenticate, login, logout


class LandLordSignupView(CreateView):
    model = CustomUser
    form_class = UserSignUpForm
    template_name = "accounts/sign_up.html"

    def get_context_data(self, **kwargs):
        kwargs["user_type"] = "Landlord"
        return super().get_context_data(**kwargs)

    def form_valid(self, form):
        if form.is_valid():
            user = form.save(commit=False)
            user.role = self.request.POST.get('user_type')
            user.save()
            if user.role == "Landlord":
                Landlord.objects.create(user=user)
            elif user.role == "Prospective tenant":
                Prospectivetenant.objects.create(user=user)
                
            send_activation_email(user,self.request)
            
        return render(self.request, "accounts/sign_alert.html")



def activate(request, uidb64, token):  
    User = get_user_model()  
    try:  
        uid = force_str(urlsafe_base64_decode(uidb64))  
        user = User.objects.get(pk=uid)  
    except(TypeError, ValueError, OverflowError, User.DoesNotExist):  
        user = None  
    if user is not None and account_activation_token.check_token(user, token):  
        user.is_active = True  
        user.save()  
        messages.success(request,"Account was Successfully Verified.")
        return HttpResponse('Thank you for your email confirmation. Now you can login your account.')  
    else:  
        return HttpResponse('Activation link is invalid!')
    
    
def home(request):
    rooms = Rooms.objects.all().order_by('?')[:4]
    is_must = True
    if request.method == 'POST':
        email = request.POST.get('email')
        password = request.POST.get('password')
        try:
            user= CustomUser.objects.get(email=email)
        except CustomUser.DoesNotExist:
            messages.error(request, 'email does not exist!') 
        user = authenticate(request, email=email, password=password)
        
        if user is not None:
            if user.is_active:
                login(request, user)
                messages.success(request, 'Logged in succesfully')
                return redirect('/')
            else:
                messages.error(request, 'Please activate your account')
                return redirect('/') 
        else:
            messages.error(request, 'email or password does not exist')
            return redirect('/')
    context = {
        'rooms' : rooms,
        'must' : is_must,
    }
    return render(request, 'app/index.html', context)   
    
def log_out(request):
    logout(request)
    return redirect('/')
# Create your views here.
