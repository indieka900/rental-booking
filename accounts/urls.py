from django.urls import path
from accounts.views import (LandLordSignupView,activate,home,log_out,changePassword,login_user, edit_profile)

app_name = 'accounts'

urlpatterns = [
    path('', home, name="home"),
    path('logout/', log_out,name="logout" ),
    path('login_user/', login_user, name="login"),
    path('update-profile/', edit_profile, name='update-profile'),
    path('signup/',LandLordSignupView.as_view(), name="signup"),
    path('change-password/', changePassword, name="change-password"),
    path('activate/<str:uidb64>/<str:token>/', activate, name='activate'),
]
