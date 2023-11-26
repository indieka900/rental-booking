import datetime
from django.utils import timezone
from django.contrib.sites.shortcuts import get_current_site
from django.core.mail import EmailMessage
from django.template.loader import render_to_string
from django.utils.encoding import force_bytes
from django.utils.http import urlsafe_base64_encode
from accounts.tokens import account_activation_token



def new_time():
    current_time = timezone.localtime(timezone.now())
    new_time = current_time + timezone.timedelta(hours=3)
    return new_time 

def send_booking_confirmation_email(tenant, room):
    # Send email to the user who booked the room (tenant)
    tenant_subject = 'Booking Confirmation'
    tenant_message = render_to_string('app/booking_confirmation.html', {
        'tenant': tenant.user.username,
        'owner': room.apartment.landlord.user,
        'room': room,
        'time': new_time()
    })
    tenant_email = EmailMessage(
        tenant_subject, tenant_message, to=[tenant.user.email]
    )
    tenant_email.send()

    # Send email to the owner of the room
    owner_subject = 'New Booking Notification'
    owner_message = render_to_string('app/booking_notification.html', {
        'tenant': tenant.user,
        'owner': room.apartment.landlord.user.username,
        'room': room,
        'time': new_time(),
    })
    owner_email = EmailMessage(
        owner_subject, owner_message, to=[room.apartment.landlord.user.email]
    )
    owner_email.send()
    
    
def send_activation_email(user,request, email_template='acc_active.html'):
    current_site = get_current_site(request)  # Use None because there's no request in this context
    mail_subject = 'Verify your account'
    message = render_to_string(email_template, {
        'user': user,
        'domain': current_site.domain,
        'time': datetime.date.today().year,
        'uid': urlsafe_base64_encode(force_bytes(user.pk)),
        'token': account_activation_token.make_token(user),
    })
    to_email = user.email
    email = EmailMessage(
        mail_subject, message, to=[to_email]
    )
    email.send()
    
    
def send_reset_password_email(user,request, password, email_template='accounts/reset_pass.html'):
    current_site = get_current_site(request)  # Use None because there's no request in this context
    mail_subject = 'Reset Password'
    message = render_to_string(email_template, {
        'user': user,
        'domain': current_site.domain,
        'pass':password,
        'time': datetime.date.today().year,
        'uid': urlsafe_base64_encode(force_bytes(user.pk)),
        'token': account_activation_token.make_token(user),
    })
    to_email = user.email
    email = EmailMessage(
        mail_subject, message, to=[to_email]
    )
    email.send()
    
    
    