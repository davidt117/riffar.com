# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('lottery', '0007_auto_20151119_0022'),
    ]

    operations = [
        migrations.AddField(
            model_name='lottery',
            name='payment_amount_first_and_second_place',
            field=models.DecimalField(default=0, verbose_name='Payment amount for 1st and 2nd places, $', max_digits=6, decimal_places=2),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='lottery',
            name='payment_amount_first_and_third_place',
            field=models.DecimalField(default=0, verbose_name='Payment amount for 1st and 3rd places, $', max_digits=6, decimal_places=2),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='lottery',
            name='payment_amount_second_and_third_place',
            field=models.DecimalField(default=0, verbose_name='Payment amount for 2nd and 3rd places, $', max_digits=6, decimal_places=2),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='lottery',
            name='payment_amount_triplets',
            field=models.DecimalField(default=0, verbose_name='Payment amount for triplets, $', max_digits=6, decimal_places=2),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name='lottery',
            name='payment_amount_first_place',
            field=models.DecimalField(verbose_name='Payment amount, 1st place, $', max_digits=6, decimal_places=2),
        ),
        migrations.AlterField(
            model_name='lottery',
            name='payment_amount_second_place',
            field=models.DecimalField(verbose_name='Payment amount, 2nd place, $', max_digits=6, decimal_places=2),
        ),
        migrations.AlterField(
            model_name='lottery',
            name='payment_amount_third_place',
            field=models.DecimalField(verbose_name='Payment amount, 3rd place, $', max_digits=6, decimal_places=2),
        ),
    ]
