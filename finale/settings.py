import os
from pathlib import Path
from dotenv import load_dotenv

load_dotenv()

# Build paths inside the project like this: BASE_DIR / 'subdir'.
BASE_DIR = Path(__file__).resolve().parent.parent


# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/3.2/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = os.getenv('SECRET_KEY')
# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

ALLOWED_HOSTS = ["*"]


# Application definition

INSTALLED_APPS = [
    "admin_interface",
    "colorfield",
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'phonenumber_field',
    'easyaudit',
    "import_export",
    #installed apps
    'accounts',
    'rental_app',
    'custom_admin',
    ###########################
]

X_FRAME_OPTIONS = "SAMEORIGIN"              # allows you to use modals insated of popups
SILENCED_SYSTEM_CHECKS = ["security.W019"]  # ignores redundant warning messages

PHONENUMBER_DB_FORMAT = 'NATIONAL'
PHONENUMBER_DEFUALT_REGION = 'KE'

AUTH_USER_MODEL = "accounts.CustomUser"

MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
    'easyaudit.middleware.easyaudit.EasyAuditMiddleware',
]

ROOT_URLCONF = 'finale.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': ['templates'],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]

WSGI_APPLICATION = 'finale.wsgi.application'


# Database
# https://docs.djangoproject.com/en/3.2/ref/settings/#databases

DATABASES = {
    'default': {
        'ENGINE' : 'djongo',
        "CLIENT": {
           "name": 'mine',
           "host": 'mongodb+srv://room-booking:joseph900@mine.5khgva7.mongodb.net/',
           "username": 'room-booking',
           "password": 'joseph900',
           "authMechanism": "SCRAM-SHA-1",
        },
    } 
}

# DATABASES = {
#     'default': {
#         'ENGINE' : 'djongo',
#         "CLIENT": {
#            "name": os.getenv('DB_NAME'),
#            "host": os.getenv('DB_STRING'),
#            "username": os.getenv('DB_USERNAME'),
#            "password": 'joseph900',
#            "authMechanism": "SCRAM-SHA-1",
#         },
#     } 
# }
    


'''
'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'final_project',
        'USER': 'root',
        'PASSWORD': '',
        'HOST':'localhost',
        'PORT':'3306',
        "OPTIONS": {
                'init_command': "SET sql_mode='STRICT_TRANS_TABLES', innodb_strict_mode=1",
                'charset': 'utf8mb4',
                "autocommit": True,
            }
    },

'''

# Password validation
# https://docs.djangoproject.com/en/3.2/ref/settings/#auth-password-validators

AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]


# Internationalization
# https://docs.djangoproject.com/en/3.2/topics/i18n/

LANGUAGE_CODE = 'en-us'

TIME_ZONE = 'UTC'

USE_I18N = True

USE_L10N = True

USE_TZ = True


# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/3.2/howto/static-files/



STATIC_URL = 'static/'

STATIC_ROOT = 'static/'

MEDIA_ROOT = os.path.join(BASE_DIR, 'media')

MEDIA_URL = '/media/'



# Default primary key field type
# https://docs.djangoproject.com/en/3.2/ref/settings/#default-auto-field

DEFAULT_AUTO_FIELD = 'django.db.models.BigAutoField'

LOGGING = {
    'version': 1,
    'disable_existing_loggers': False,
    'handlers': {
        'console': {
            'class': 'logging.StreamHandler',
        },
    },
    'root': {
        'handlers': ['console'],
        'level': 'DEBUG',
    },
}


EMAIL_USE_TLS = True  
EMAIL_HOST = 'smtp.gmail.com'  
EMAIL_HOST_USER = os.getenv('EMAIL')  
EMAIL_HOST_PASSWORD = os.getenv('EMAIL_PASSWORD')  
EMAIL_PORT = 587 