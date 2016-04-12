# coding: utf-8
from app.auth.models import AbstractSimpleUser


class SuperAdmin(AbstractSimpleUser):
    @property
    def role(self):
        return 'superadmin'
