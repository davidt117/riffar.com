# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('superadmin', '__first__'),
        ('siteadmin', '__first__'),
    ]

    operations = [
        migrations.CreateModel(
            name='AdminPin',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('pin', models.SlugField(unique=True, verbose_name='Pin')),
                ('date_created', models.DateTimeField(auto_now_add=True)),
                ('is_active', models.BooleanField(default=True, verbose_name='Is Active')),
                ('created_by', models.ForeignKey(related_name='superadmin_pins', verbose_name='Created By', to='superadmin.SuperAdmin')),
            ],
            options={
                'ordering': ['-date_created'],
                'abstract': False,
                'verbose_name': 'Pin',
                'verbose_name_plural': 'Pins',
            },
        ),
        migrations.CreateModel(
            name='Pin',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('pin', models.SlugField(unique=True, verbose_name='Pin')),
                ('date_created', models.DateTimeField(auto_now_add=True)),
                ('is_active', models.BooleanField(default=False, verbose_name='Is Active')),
                ('created_by', models.ForeignKey(related_name='admin_pins', verbose_name='Created By', to='siteadmin.SiteAdmin')),
            ],
            options={
                'ordering': ['-date_created'],
                'abstract': False,
                'verbose_name': 'Pin',
                'verbose_name_plural': 'Pins',
            },
        ),
    ]
