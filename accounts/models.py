from django.contrib.auth.models import AbstractBaseUser, BaseUserManager, PermissionsMixin
from django.db import models
from django.contrib.auth.validators import UnicodeUsernameValidator
from phonenumber_field.modelfields import PhoneNumberField

class CustomUserManager(BaseUserManager):
    def create_user(self, email, password=None, **extra_fields):
        if not email:
            raise ValueError("The Email field must be set")
        email = self.normalize_email(email)
        user = self.model(email=email, **extra_fields)
        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_superuser(self, email, password=None, **extra_fields):
        extra_fields.setdefault("is_staff", True)
        extra_fields.setdefault("is_superuser", True)
        extra_fields.setdefault("role", 'Administrator')
        return self.create_user(email, password, **extra_fields)

class CustomUser(AbstractBaseUser, PermissionsMixin):
    
    Role_choices = (
        ("Administrator", "Administrator"),
        ("Prospective tenant", "Prospective tenant"),
        ("Landlord", "Landlord")
    )
    Gender_choices = (
        ("Male", "Male"),
        ("Female", "Female"),
        ("Other", "Other")
    )
    
    username_validator = UnicodeUsernameValidator()
    username = models.CharField(
        max_length=150,
        unique=True,
        validators=[username_validator],
    )
    email = models.EmailField(unique=True)
    gender = models.CharField(max_length=10, choices=Gender_choices)
    full_name = models.CharField(max_length=60,default='')
    role = models.CharField(max_length=25, choices=Role_choices, default="Prospective tenant")
    phone = PhoneNumberField( unique=True) 
    # avatar = models.CharField(max_length=500, blank=True, null=True,)
    is_active = models.BooleanField(default=True)
    is_staff = models.BooleanField(default=False)
    date_joined = models.DateTimeField(auto_now_add=True)

    objects = CustomUserManager()

    USERNAME_FIELD = "email"
    REQUIRED_FIELDS = []
    
    class Meta:
        verbose_name = 'User'
        verbose_name_plural = 'Users'
    def get_avatar_name(self):
        if self.image:
            return self.image.name
        else:
            return None
        
    def get_short_name(self):
        if (len(self.full_name) == 0):
            return self.email.split('@')[0].capitalize()
        
        else:
            return self.full_name.split(' ')[0]
        
class Profile(models.Model):
    user = models.OneToOneField(CustomUser,on_delete=models.CASCADE, unique=True)
    bio = models.TextField(blank=True, null=True)
    profile_picture = models.ImageField(upload_to="profile",default="default.png")
    
    class Meta:
        abstract= True  
            
class Administrator(Profile):
    pass
    
    def __str__(self):
        return self.user.username


class Prospectivetenant(Profile):
    pass
    
    def __str__(self):
        return self.user.username
    
class Landlord(Profile):
    pass

    def __str__(self):
        return self.user.username