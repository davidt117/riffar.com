# -*- coding: utf-8 -*-
from django.conf import settings

from app.auth.backends import BaseAuthBackend
from app.superadmin.models import SuperAdmin


class SuperAdminAuthBackend(BaseAuthBackend):
    user_model = SuperAdmin
    subdomain = settings.SUPERADMIN_SUBDOMAIN
