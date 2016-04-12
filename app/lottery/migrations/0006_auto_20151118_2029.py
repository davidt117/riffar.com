# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('lottery', '0005_auto_20151112_2254'),
    ]

    operations = [
        migrations.AddField(
            model_name='lottery',
            name='payment_amount_first_place',
            field=models.DecimalField(default=0, verbose_name='Payment amount (1st place)', max_digits=6, decimal_places=2),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='lottery',
            name='payment_amount_second_place',
            field=models.DecimalField(default=0, verbose_name='Payment amount (2nd place)', max_digits=6, decimal_places=2),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='lottery',
            name='payment_amount_third_place',
            field=models.DecimalField(default=0, verbose_name='Payment amount (3rd place)', max_digits=6, decimal_places=2),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='lottery',
            name='winning_numbers_first_place',
            field=models.CharField(default='', max_length=255, verbose_name='Winning numbers (1st place)'),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='lottery',
            name='winning_numbers_second_place',
            field=models.CharField(default='', max_length=255, verbose_name='Winning numbers (2nd place)'),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='lottery',
            name='winning_numbers_third_place',
            field=models.CharField(default='', max_length=255, verbose_name='Winning numbers (3rd place)'),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name='lottery',
            name='is_available',
            field=models.BooleanField(default=True, verbose_name='Is available for plays'),
        ),
    ]
