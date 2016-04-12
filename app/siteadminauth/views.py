# -*- coding: utf-8 -*-
from django.conf import settings

from app.auth.views import (BaseChangePasswordView, BaseLoginView,
                            BaseLogoutView, BaseRegistrationView)
from app.pin.models import AdminPin
from app.siteadmin.models import SiteAdmin


class RegistrationView(BaseRegistrationView):
    user_model = SiteAdmin
    pin_model = AdminPin


class LoginView(BaseLoginView):
    subdomain = settings.ADMIN_SUBDOMAIN


class LogoutView(BaseLogoutView):
    url = 'homepage'
