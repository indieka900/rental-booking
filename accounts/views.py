
from accounts.confirmation_email import send_activation_email, send_reset_password_email
from django.contrib.auth import update_session_auth_hash
from django.contrib.auth.decorators import login_required
from django.shortcuts import render,redirect
from django.http import HttpResponse
from django.contrib import messages
from django.contrib.auth import get_user_model
from accounts.models import CustomUser,Landlord, Prospectivetenant
from django.views.generic import CreateView,View
from django.utils.encoding import force_str  
from django.utils.http import urlsafe_base64_decode 
from accounts.tokens import account_activation_token
from accounts.forms import UserSignUpForm,ProfileForm, ForgotPasswordForm
from rental_app.models import Rooms
from rental_app.views import common_data
from django.contrib.auth import authenticate, login
from django.db.models import Q

#create new account
class SignupView(CreateView):
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
            return redirect('/')
            
        return render(self.request, "accounts/sign_alert.html")

#forgot password functionality
def forgot_password(request):
    if request.method == 'POST':
        form = ForgotPasswordForm(request.POST)
        if form.is_valid():
            phone = form.cleaned_data['phone']
            new_password = form.cleaned_data['new_password']
            email = form.cleaned_data['email']

            try:
                user = CustomUser.objects.get(email=email, phone=phone)
                send_reset_password_email(user,request, new_password)
                messages.success(request, 'Check your email for complete password reset')
                return redirect('/')

            except CustomUser.DoesNotExist:
                messages.error(request, 'User with the provided email and phone does not exist.')

    else:
        form = ForgotPasswordForm()

    return render(request, 'accounts/forgot-password.html', {'form': form,**common_data(),})
   

#activate your account
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
    

#reset password   
def reset(request, uidb64, token, password):  
    User = get_user_model()  
    try:  
        uid = force_str(urlsafe_base64_decode(uidb64))
        pass_word =  force_str(urlsafe_base64_decode(password)) 
        user = User.objects.get(pk=uid)  
    except(TypeError, ValueError, OverflowError, User.DoesNotExist):  
        user = None  
    if user is not None and account_activation_token.check_token(user, token):  
        user.set_password(pass_word)
        user.save()

        messages.success(request, 'Password has been updated successfully!')
        return HttpResponse('Thank you for your email confirmation. password reset succesfully.')  
    else:  
        return HttpResponse('Activation link is invalid!')
    

#display homepage  
def home(request):
    rooms = Rooms.objects.all()
    is_must = True
    
    # Using slice notation
    available_rooms = rooms.filter(booked=False)[:3]
    
    context = {
        'rooms' : available_rooms,
        'must' : is_must,
        **common_data('home'),
    }
    return render(request, 'app/index.html', context)
  

#change password functionality
@login_required(login_url='/')
def changePassword(request):
    if request.method == 'POST':
        user = request.user
        
        current_password = request.POST.get('password')
        new_password = request.POST.get('newpassword')
        confirm = request.POST.get('confirmpassword')
        
        if new_password==confirm:
            auth_user = authenticate(email=user.email, password=current_password)

            if auth_user is not None:
                user.set_password(new_password)
                user.save()

                # Update the session to prevent the user from being logged out
                update_session_auth_hash(request, user)

                messages.success(request, 'Your password was successfully updated!')
                return redirect('/')  # Redirect to the user's profile or another page
            else:
                messages.error(request, 'Invalid current password. Please try again.')
                
        else:
            messages.error(request, 'Password didn\'t match')
            
    return render(request, 'accounts/changepassword.html',{**common_data()},)

#login user 
def login_user(request):
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
            messages.error(request, 'Incorrect password')
            return redirect('/')

#edit profile
@login_required
def edit_profile(request):
    r_user = CustomUser.objects.get(id=request.user.id)
    if request.user.role == 'Landlord':
        user = Landlord.objects.get(user=r_user)
    else:
        user = Prospectivetenant.objects.get(user=r_user)
    if request.method == 'POST':
        form = ProfileForm(request.POST, request.FILES, instance=user, user=r_user)
        if form.is_valid():
            phone = form.cleaned_data['phone']
            full_name = form.cleaned_data['full_name']
            profile_picture = form.cleaned_data['profile_picture']
            form.save()
            r_user.phone = phone
            r_user.image = profile_picture
            r_user.full_name = full_name
            r_user.save()
            messages.success(request, 'Updated succesfully')
            return redirect('/')
    else:
        form = ProfileForm(instance=user, user=r_user)

    return render(request, 'accounts/change-profile.html', {'form': form,**common_data(),})
    
# Create your views here.
