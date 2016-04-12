# -*- coding: utf-8 -*-
from django.conf import settings

from app.auth.views import BaseLoginView, BaseLogoutView, BaseRegistrationView
from app.pin.models import Pin
from app.siteuser.models import SiteUser


class RegistrationView(BaseRegistrationView):
    user_model = SiteUser
    pin_model = Pin


class LoginView(BaseLoginView):
    subdomain = settings.SELLER_SUBDOMAIN


class LogoutView(BaseLogoutView):
    url = 'homepage'
