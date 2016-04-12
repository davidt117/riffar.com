# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models

from app.siteadmin.models import SiteAdmin


class Migration(migrations.Migration):
    dependencies = [
        ('lottery', '0002_lottery_created_by'),
    ]

    operations = [
        migrations.AddField(
            model_name='stopnumber',
            name='lottery',
            field=models.ForeignKey(default=SiteAdmin.objects.first().pk, verbose_name='Lottery', to='lottery.Lottery'),
            preserve_default=False,
        ),
    ]
