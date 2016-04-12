# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('lottery', '0003_stopnumber_lottery'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='stopnumber',
            name='user',
        ),
    ]
