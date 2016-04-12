# -*- coding: utf-8 -*-
from django.conf import settings
from django.contrib.sites.models import Site

from app.cms.models import SiteSettings


def template_variables(request):
    context = {}
    if request.subdomain != settings.ADMIN_APP_SUBDOMAIN:
        sitesettings = {}
        for s in SiteSettings.objects.all():
            sitesettings[s.name] = s.value

        current_app = {
            settings.SELLER_SUBDOMAIN: 'seller',
            settings.ADMIN_SUBDOMAIN: 'admin',
            settings.SUPERADMIN_SUBDOMAIN: 'superadmin',
        }.get(request.subdomain)

        context.update({
            'site': Site.objects.get_current(),
            'app_url': settings.APP_URL,
            'sitesettings': sitesettings,
            'disable_registration': request.subdomain == settings.SUPERADMIN_SUBDOMAIN,
            'current_app': current_app
        })

    return context
