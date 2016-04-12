# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models

from app.siteadmin.models import SiteAdmin


class Migration(migrations.Migration):
    dependencies = [
        ('siteadmin', '__first__'),
        ('lottery', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='lottery',
            name='created_by',
            field=models.ForeignKey(default=SiteAdmin.objects.first().pk, verbose_name='Created By',
                                    to='siteadmin.SiteAdmin'),
            preserve_default=False,
        ),
    ]
