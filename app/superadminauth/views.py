# -*- coding: utf-8 -*-
from django.conf import settings

from app.auth.views import BaseLoginView, BaseLogoutView


class LoginView(BaseLoginView):
    subdomain = settings.SUPERADMIN_SUBDOMAIN


class LogoutView(BaseLogoutView):
    url = 'homepage'
