# -*- coding: utf-8 -*-
from django.conf import settings

from app.auth.backends import PinBasedBackend
from app.siteadmin.models import SiteAdmin


class AdminAuthBackend(PinBasedBackend):
    user_model = SiteAdmin
    subdomain = settings.ADMIN_SUBDOMAIN
