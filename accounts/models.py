from django.contrib.auth.models import AbstractBaseUser, BaseUserManager, PermissionsMixin
from django.db import models
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
        return self.create_user(email, password, **extra_fields)

class CustomUser(AbstractBaseUser, PermissionsMixin):
    
    Role_choices = (
        ("Administrator", "Administrator"),
        ("Community Member", "Community Member"),
        ("Medical Personel", "Medical Personel")
    )
    Gender_choices = (
        ("Male", "Male"),
        ("Female", "Female"),
        ("Other", "Other")
    )
    
    
    email = models.EmailField(unique=True)
    image = models.ImageField(upload_to='uploads/',null=True)
    gender = models.CharField(max_length=10, choices=Gender_choices)
    full_name = models.CharField(max_length=30,default='')
    phone = PhoneNumberField( unique=True,blank=True, null=True, max_length=27) 
    avatar = models.CharField(max_length=500, blank=True, null=True,)
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