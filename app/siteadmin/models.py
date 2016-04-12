# coding: utf-8
from django.db import models

from app.auth.models import AbstractSimpleUser
from app.pin.models import AdminPin


class SiteAdmin(AbstractSimpleUser):
    @property
    def role(self):
        return 'admin'

    pin = models.ForeignKey(AdminPin, verbose_name=u"Pin")
