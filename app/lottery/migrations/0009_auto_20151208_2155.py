# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('lottery', '0008_auto_20151119_2032'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='winningnumberlog',
            options={'ordering': ['-date_created'], 'verbose_name': 'winning numbers log', 'verbose_name_plural': 'winning numbers log'},
        ),
        migrations.AddField(
            model_name='winningnumberlog',
            name='date_of_report',
            field=models.DateTimeField(default=None, null=True, verbose_name='Date of report'),
        ),
        migrations.AlterField(
            model_name='lottery',
            name='payment_amount_first_and_second_place',
            field=models.DecimalField(verbose_name='Payment amount for pairs, 1st and 2nd places, $', max_digits=6, decimal_places=2),
        ),
        migrations.AlterField(
            model_name='lottery',
            name='payment_amount_first_and_third_place',
            field=models.DecimalField(verbose_name='Payment amount for pairs, 1st and 3rd places, $', max_digits=6, decimal_places=2),
        ),
        migrations.AlterField(
            model_name='lottery',
            name='payment_amount_first_place',
            field=models.DecimalField(verbose_name='Payment amount for single, 1st place, $', max_digits=6, decimal_places=2),
        ),
        migrations.AlterField(
            model_name='lottery',
            name='payment_amount_second_and_third_place',
            field=models.DecimalField(verbose_name='Payment amount for pairs, 2nd and 3rd places, $', max_digits=6, decimal_places=2),
        ),
        migrations.AlterField(
            model_name='lottery',
            name='payment_amount_second_place',
            field=models.DecimalField(verbose_name='Payment amount for single, 2nd place, $', max_digits=6, decimal_places=2),
        ),
        migrations.AlterField(
            model_name='lottery',
            name='payment_amount_third_place',
            field=models.DecimalField(verbose_name='Payment amount for single, 3rd place, $', max_digits=6, decimal_places=2),
        ),
    ]
