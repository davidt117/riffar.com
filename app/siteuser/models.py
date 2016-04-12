# coding: utf-8
from django.db import models

from app.auth.models import AbstractSimpleUser
from app.pin.models import Pin


class SiteUser(AbstractSimpleUser):
    @property
    def role(self):
        return 'seller'

    @property
    def total_sales_amount(self):
        amount = 0
        for ticket in self.user_tickets.all():
            amount += ticket.total_amount
        return amount

    pin = models.ForeignKey(Pin, verbose_name=u"Pin")
    commission_percent = models.DecimalField(decimal_places=2, verbose_name=u"Commission Percent", default=18,
                                             max_digits=4)
