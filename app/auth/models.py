# coding: utf-8
from django.contrib.auth.models import AbstractBaseUser
from django.db import models


class AbstractSimpleUser(AbstractBaseUser):
    class Meta:
        abstract = True
        ordering = ['email']

    USERNAME_FIELD = 'email'

    email = models.EmailField(verbose_name=u"Email")
    first_name = models.CharField(max_length=255, verbose_name=u"First Name")
    last_name = models.CharField(max_length=255, verbose_name=u"Last Name")

    def get_full_name(self):
        return u"%s %s" % (self.first_name, self.last_name)

    def get_short_name(self):
        return self.first_name
