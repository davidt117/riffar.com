# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('siteuser', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='siteuser',
            name='commission_percent',
            field=models.DecimalField(default=18, verbose_name='Commission Percent', max_digits=4, decimal_places=2),
        ),
    ]
