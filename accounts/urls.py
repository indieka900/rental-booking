from django.urls import path
from django.contrib.auth import views as auth_views
from accounts.views import (
    SignupView,activate,forgot_password,
    home,changePassword,
    login_user, edit_profile, reset
)

app_name = 'accounts'

urlpatterns = [
    path('', home, name="home"),
    path('logout/',auth_views.LogoutView.as_view(),name="logout" ),
    path('login_user/', login_user, name="login"),
    path('update-profile/', edit_profile, name='update-profile'),
    path('forgot-password/', forgot_password, name="forgot-pass"),
    path('signup/',SignupView.as_view(), name="signup"),
    path('change-password/', changePassword, name="change-password"),
    path('activate/<str:uidb64>/<str:token>/', activate, name='activate'),
    path('reset/<str:uidb64>/<str:token>/<str:password>/', reset, name='reset'),
]
