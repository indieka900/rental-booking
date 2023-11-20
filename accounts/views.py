import datetime

from django.shortcuts import render
from django.http import HttpResponse
from django.contrib import messages
from django.contrib.auth import get_user_model
from accounts.models import CustomUser,Landlord, Prospectivetenant
from django.views.generic import CreateView
from django.contrib.sites.shortcuts import get_current_site  
from django.utils.encoding import force_bytes, force_str  
from django.utils.http import urlsafe_base64_encode, urlsafe_base64_decode  
from django.template.loader import render_to_string
from accounts.tokens import account_activation_token
from django.core.mail import EmailMessage
from accounts.forms import UserSignUpForm 


class LandLordSignupView(CreateView):
    model = CustomUser
    form_class = UserSignUpForm
    template_name = "accounts/login.html"

    def get_context_data(self, **kwargs):
        kwargs["user_type"] = "Landlord"
        return super().get_context_data(**kwargs)

    def form_valid(self, form):
        if form.is_valid():
            user = form.save(commit=False)
            user.role = "Landlord"
            user.save()
            landlord = Landlord(user=user)
            landlord.save()
            current_site = get_current_site(self.request)  
            mail_subject = 'Verify your account'  
            message = render_to_string('acc_active.html', {  
                'user': user,  
                'domain': current_site.domain,  
                'time': datetime.date.today().year,
                'uid':urlsafe_base64_encode(force_bytes(user.pk)),  
                'token':account_activation_token.make_token(user),  
            })  
            to_email = form.cleaned_data.get('email')  
            email = EmailMessage(  
                        mail_subject, message, to=[to_email]  
            )  
            email.send()

        return render(self.request, "accounts/sign_alert.html")

class ProspectivetenantView(CreateView):
    model = CustomUser
    form_class = UserSignUpForm
    template_name = "accounts/login.html"

    def get_context_data(self, **kwargs):
        kwargs["user_type"] = "Prospective tenant"
        return super().get_context_data(**kwargs)

    def form_valid(self, form):
        if form.is_valid():
            user = form.save(commit=False)
            user.role = "Prospective tenant"
            user.save()
            tenant = Prospectivetenant(user=user)
            tenant.save()
            current_site = get_current_site(self.request)  
            mail_subject = 'Verify your account'  
            message = render_to_string('accounts/acc_active.html', {  
                'user': user,  
                'time': datetime.date.today().year,
                'domain': current_site.domain,  
                'uid':urlsafe_base64_encode(force_bytes(user.pk)),  
                'token':account_activation_token.make_token(user),  
            })  
            to_email = form.cleaned_data.get('email')  
            email = EmailMessage(  
                        mail_subject, message, to=[to_email]  
            )  
            email.send()
            return render(self.request, "sign_alert.html")


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

# Create your views here.
