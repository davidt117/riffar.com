# coding: utf-8
from django.db import models


class BasePin(models.Model):
    class Meta:
        abstract = True
        verbose_name = u'Pin'
        verbose_name_plural = u'Pins'
        ordering = ['-date_created']

    pin = models.SlugField(unique=True, verbose_name=u"Pin")
    is_active = models.BooleanField(verbose_name=u"Is Active", default=True)
    date_created = models.DateTimeField(auto_now_add=True)


class Pin(BasePin):
    created_by = models.ForeignKey('siteadmin.SiteAdmin', verbose_name=u"Created By", related_name='admin_pins')

    @property
    def seller(self):
        return self.siteuser_set.all().first()


class AdminPin(BasePin):
    created_by = models.ForeignKey('superadmin.SuperAdmin', verbose_name=u"Created By", related_name='superadmin_pins')

    @property
    def admin(self):
        return self.siteadmin_set.all().first()
