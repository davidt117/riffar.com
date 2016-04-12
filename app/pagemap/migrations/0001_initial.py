# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('adv', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Page',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('title', models.CharField(help_text='Shows inside the <title/> tag', max_length=255, verbose_name='Title')),
                ('header', models.CharField(max_length=255, verbose_name='Page Header')),
                ('menu_name', models.CharField(default=b'', max_length=255, verbose_name='Menu name')),
                ('menu_url', models.CharField(default=b'', max_length=255, verbose_name='URL for Redirect', blank=True)),
                ('slug', models.SlugField(default=b'', verbose_name='URL')),
                ('url', models.CharField(max_length=512)),
                ('sort', models.IntegerField(default=1)),
                ('module_params', models.CharField(default=None, max_length=128, null=True, verbose_name='Module parameters', blank=True)),
                ('before_content', models.TextField(default=b'', verbose_name='Before Content', blank=True)),
                ('after_content', models.TextField(default=b'', verbose_name='After Content', blank=True)),
                ('date_created', models.DateTimeField(auto_now_add=True)),
                ('date_changed', models.DateTimeField(auto_now=True)),
                ('seo_keywords', models.TextField(default=b'', verbose_name='Keywords (meta keywords)', blank=True)),
                ('seo_description', models.TextField(default=b'', verbose_name='Description (meta description)', blank=True)),
                ('is_enabled', models.BooleanField(default=True, verbose_name='Is Enabled')),
                ('is_in_menu', models.BooleanField(default=True, verbose_name='Show in Menu')),
                ('is_locked', models.BooleanField(default=False, verbose_name='Only for Authorized Users')),
                ('adv_section', models.ForeignKey(verbose_name='Ads', to='adv.AdvSection')),
            ],
            options={
                'ordering': ['sort'],
                'verbose_name': 'page',
                'verbose_name_plural': 'pages',
            },
        ),
        migrations.CreateModel(
            name='PageModule',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('slug', models.SlugField(unique=True, verbose_name='Slug')),
                ('name', models.CharField(max_length=64, verbose_name='Name (RU)')),
                ('name_en', models.CharField(max_length=64, verbose_name='Name (EN)')),
                ('is_enabled', models.BooleanField(default=True, verbose_name='Is Enabled')),
            ],
            options={
                'ordering': ['id'],
                'verbose_name': 'Module',
                'verbose_name_plural': 'Modules',
            },
        ),
        migrations.AddField(
            model_name='page',
            name='module',
            field=models.ForeignKey(verbose_name='Module', to='pagemap.PageModule'),
        ),
        migrations.AddField(
            model_name='page',
            name='parent',
            field=models.ForeignKey(related_name='children', verbose_name='Parent Page', to='pagemap.Page', null=True),
        ),
        migrations.AlterUniqueTogether(
            name='page',
            unique_together=set([('module', 'slug')]),
        ),
    ]
