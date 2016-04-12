# coding: utf-8
from django.db import models

from app.lottery.models import Lottery
from app.siteuser.models import SiteUser


class Ticket(models.Model):
    class Meta:
        verbose_name = u'ticket'
        verbose_name_plural = u'tickets'
        ordering = ['id']

    number = models.IntegerField(verbose_name=u"Ticket Number")
    user = models.ForeignKey(SiteUser, verbose_name=u'User', related_name='user_tickets')
    date_created = models.DateTimeField(auto_now_add=True)

    def __unicode__(self):
        return u"Ticket # %s" % self.pk

    @property
    def play_numbers(self):
        if self.ticket_plays.all():
            return u' '.join(self.ticket_plays.all().values_list('number', flat=True))
        return u'-'

    @property
    def total_amount(self):
        amount = 0
        try:
            for p in self.ticket_plays.all():
                amount += int(p.amount)
        except BaseException:
            return 0
        return amount


class Play(models.Model):
    class Meta:
        verbose_name = u'play'
        verbose_name_plural = u'plays'
        ordering = ['-id']

    ticket = models.ForeignKey(Ticket, verbose_name=u'Ticket', related_name='ticket_plays')
    number = models.CharField(max_length=64, verbose_name=u'Play Number')
    amount = models.CharField(max_length=64, verbose_name=u'Play Amount')
    lottery = models.ForeignKey(Lottery, verbose_name=u'Lottery', related_name='lottery_plays')
    date_created = models.DateTimeField(auto_now_add=True)

    def __unicode__(self):
        return u"Play for Ticket # %s" % self.ticket_id
