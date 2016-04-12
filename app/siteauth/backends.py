# -*- coding: utf-8 -*-
from django.conf import settings

from app.auth.backends import PinBasedBackend
from app.siteuser.models import SiteUser


class UserAuthBackend(PinBasedBackend):
    user_model = SiteUser
    subdomain = settings.SELLER_SUBDOMAIN
