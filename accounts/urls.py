from django.urls import path
from accounts.views import (LandLordSignupView,ProspectivetenantView)

urlpatterns = [
    path('',LandLordSignupView.as_view(), name="signup")
]
