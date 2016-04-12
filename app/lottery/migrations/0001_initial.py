# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('siteadmin', '__first__'),
        ('siteuser', '__first__'),
    ]

    operations = [
        migrations.CreateModel(
            name='Lottery',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=255, verbose_name='Name')),
                ('min_number', models.IntegerField(verbose_name='Min number')),
                ('max_number', models.IntegerField(verbose_name='Max number')),
                ('min_amount', models.IntegerField(verbose_name='Max amount played')),
                ('max_amount', models.IntegerField(verbose_name='Max amount played')),
                ('open_time', models.TimeField(verbose_name='Open time')),
                ('close_time', models.TimeField(verbose_name='Close time')),
            ],
            options={
                'ordering': ['name'],
                'verbose_name': 'lottery',
                'verbose_name_plural': 'lotteries',
            },
        ),
        migrations.CreateModel(
            name='StopNumber',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('number', models.IntegerField(verbose_name='Number')),
                ('date_created', models.DateTimeField(auto_now_add=True)),
                ('admin', models.ForeignKey(verbose_name='Admin', to='siteadmin.SiteAdmin')),
                ('user', models.ForeignKey(verbose_name='Seller', to='siteuser.SiteUser')),
            ],
            options={
                'ordering': ['number'],
                'verbose_name': 'stop number',
                'verbose_name_plural': 'stop numbers',
            },
        ),
    ]
