from django.urls import path
from accounts.views import (LandLordSignupView,activate,home,log_out)

app_name = 'accounts'

urlpatterns = [
    path('', home, name="home"),
    path('logout/', log_out,name="logout" ),
    path('signup/',LandLordSignupView.as_view(), name="signup"),
    path('activate/(?P<uidb64>[0-9A-Za-z_\-]+)/(?P<token>[0-9A-Za-z]{1,13}-[0-9A-Za-z]{1,20})/',  
        activate, name='activate'),
]
