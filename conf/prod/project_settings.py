__author__ = 'Dmitry Astrikov'

# Project and environment specific settings.

PROJECT_ROOT = '/var/www/riffar.ru'

APP_URL = "http://seller.riffar.ru"

PORT = 80

DEBUG = False
PRODUCTION = True

DEFAULT_FROM_EMAIL = 'no-reply@example-domain.com'
EMAIL_HOST = 'localhost'
EMAIL_PORT = 1025

YM_COUNTER_ID = 26553798

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': 'riffar_django',
        'USER': 'riffar_django',
        'PASSWORD': '37FgH1zM',
        'HOST': 'localhost',
        'PORT': '5432',
    }
}

SELLER_SUBDOMAIN = 'seller'
ADMIN_SUBDOMAIN = 'admin'
SUPERADMIN_SUBDOMAIN = 'superadmin'
