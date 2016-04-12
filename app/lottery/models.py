# coding: utf-8
from django.db import models

from app.siteadmin.models import SiteAdmin


class Lottery(models.Model):
    class Meta:
        verbose_name = u'lottery'
        verbose_name_plural = u'lotteries'
        ordering = ['name']

    name = models.CharField(max_length=255, verbose_name=u"Name")
    min_number = models.IntegerField(verbose_name=u"Min number")
    max_number = models.IntegerField(verbose_name=u"Max number")
    min_amount = models.IntegerField(verbose_name=u"Min amount played")
    max_amount = models.IntegerField(verbose_name=u"Max amount played")
    open_time = models.TimeField(verbose_name=u"Open time")
    close_time = models.TimeField(verbose_name=u"Close time")
    created_by = models.ForeignKey(SiteAdmin, verbose_name=u"Created By")

    payment_amount_first_place = models.DecimalField(verbose_name=u"Payment amount for single, 1st place, $",
                                                     max_digits=8,
                                                     decimal_places=2)

    payment_amount_second_place = models.DecimalField(verbose_name=u"Payment amount for single, 2nd place, $",
                                                      max_digits=8,
                                                      decimal_places=2)

    payment_amount_third_place = models.DecimalField(verbose_name=u"Payment amount for single, 3rd place, $",
                                                     max_digits=8,
                                                     decimal_places=2)

    payment_amount_first_and_second_place = models.DecimalField(
        verbose_name=u"Payment amount for pairs, 1st and 2nd places, $",
        max_digits=8,
        decimal_places=2)

    payment_amount_first_and_third_place = models.DecimalField(
        verbose_name=u"Payment amount for pairs, 1st and 3rd places, $",
        max_digits=8,
        decimal_places=2)

    payment_amount_second_and_third_place = models.DecimalField(
        verbose_name=u"Payment amount for pairs, 2nd and 3rd places, $",
        max_digits=8,
        decimal_places=2)

    payment_amount_triplets = models.DecimalField(
        verbose_name=u"Payment amount for triplets, $",
        max_digits=8,
        decimal_places=2)

    is_available = models.BooleanField(default=True, verbose_name=u"Is available for plays")

    def __unicode__(self):
        return self.name


class StopNumber(models.Model):
    class Meta:
        verbose_name = u'stop number'
        verbose_name_plural = u'stop numbers'
        ordering = ['number']

    lottery = models.ForeignKey(Lottery, verbose_name=u"Lottery")
    admin = models.ForeignKey(SiteAdmin, verbose_name=u"Admin")
    number = models.IntegerField(verbose_name=u"Number")
    date_created = models.DateTimeField(auto_now_add=True)


class WinningNumberLog(models.Model):
    class Meta:
        verbose_name = u'winning numbers log'
        verbose_name_plural = u'winning numbers log'
        ordering = ['-date_created']

    lottery = models.ForeignKey(Lottery, verbose_name=u"Lottery")
    winning_numbers_first_place = models.CharField(verbose_name=u"Winning numbers", max_length=255)
    winning_numbers_second_place = models.CharField(verbose_name=u"Winning numbers", max_length=255)
    winning_numbers_third_place = models.CharField(verbose_name=u"Winning numbers", max_length=255)
    date_of_report = models.DateTimeField(verbose_name=u"Date of report", default=None, null=True)
    date_created = models.DateTimeField(auto_now_add=True)