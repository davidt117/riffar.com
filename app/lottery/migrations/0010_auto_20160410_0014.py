# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('lottery', '0009_auto_20151208_2155'),
    ]

    operations = [
        migrations.AlterField(
            model_name='lottery',
            name='payment_amount_first_and_second_place',
            field=models.DecimalField(verbose_name='Payment amount for pairs, 1st and 2nd places, $', max_digits=8, decimal_places=2),
        ),
        migrations.AlterField(
            model_name='lottery',
            name='payment_amount_first_and_third_place',
            field=models.DecimalField(verbose_name='Payment amount for pairs, 1st and 3rd places, $', max_digits=8, decimal_places=2),
        ),
        migrations.AlterField(
            model_name='lottery',
            name='payment_amount_first_place',
            field=models.DecimalField(verbose_name='Payment amount for single, 1st place, $', max_digits=8, decimal_places=2),
        ),
        migrations.AlterField(
            model_name='lottery',
            name='payment_amount_second_and_third_place',
            field=models.DecimalField(verbose_name='Payment amount for pairs, 2nd and 3rd places, $', max_digits=8, decimal_places=2),
        ),
        migrations.AlterField(
            model_name='lottery',
            name='payment_amount_second_place',
            field=models.DecimalField(verbose_name='Payment amount for single, 2nd place, $', max_digits=8, decimal_places=2),
        ),
        migrations.AlterField(
            model_name='lottery',
            name='payment_amount_third_place',
            field=models.DecimalField(verbose_name='Payment amount for single, 3rd place, $', max_digits=8, decimal_places=2),
        ),
        migrations.AlterField(
            model_name='lottery',
            name='payment_amount_triplets',
            field=models.DecimalField(verbose_name='Payment amount for triplets, $', max_digits=8, decimal_places=2),
        ),
    ]
