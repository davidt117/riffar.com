# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('lottery', '0004_remove_stopnumber_user'),
    ]

    operations = [
        migrations.AddField(
            model_name='lottery',
            name='is_available',
            field=models.BooleanField(default=True, verbose_name='Is Available'),
        ),
        migrations.AlterField(
            model_name='lottery',
            name='min_amount',
            field=models.IntegerField(verbose_name='Min amount played'),
        ),
    ]
