# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('siteuser', '0002_siteuser_commission_percent'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='siteuser',
            options={'ordering': ['email']},
        ),
    ]
