# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('lottery', '0006_auto_20151118_2029'),
    ]

    operations = [
        migrations.CreateModel(
            name='WinningNumberLog',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('winning_numbers_first_place', models.CharField(max_length=255, verbose_name='Winning numbers')),
                ('winning_numbers_second_place', models.CharField(max_length=255, verbose_name='Winning numbers')),
                ('winning_numbers_third_place', models.CharField(max_length=255, verbose_name='Winning numbers')),
                ('date_created', models.DateTimeField(auto_now_add=True)),
            ],
            options={
                'verbose_name': 'winning numbers log',
                'verbose_name_plural': 'winning numbers log',
            },
        ),
        migrations.RemoveField(
            model_name='lottery',
            name='winning_numbers_first_place',
        ),
        migrations.RemoveField(
            model_name='lottery',
            name='winning_numbers_second_place',
        ),
        migrations.RemoveField(
            model_name='lottery',
            name='winning_numbers_third_place',
        ),
        migrations.AlterField(
            model_name='lottery',
            name='payment_amount_first_place',
            field=models.DecimalField(verbose_name='Payment amount, $', max_digits=6, decimal_places=2),
        ),
        migrations.AlterField(
            model_name='lottery',
            name='payment_amount_second_place',
            field=models.DecimalField(verbose_name='Payment amount, $', max_digits=6, decimal_places=2),
        ),
        migrations.AlterField(
            model_name='lottery',
            name='payment_amount_third_place',
            field=models.DecimalField(verbose_name='Payment amount, $', max_digits=6, decimal_places=2),
        ),
        migrations.AddField(
            model_name='winningnumberlog',
            name='lottery',
            field=models.ForeignKey(verbose_name='Lottery', to='lottery.Lottery'),
        ),
    ]
