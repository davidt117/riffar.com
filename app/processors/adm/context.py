# -*- coding: utf-8 -*-
from django.conf import settings


def template_variables(request):
    if not request.is_ajax() and request.user.is_authenticated() and request.subdomain == settings.ADMIN_APP_SUBDOMAIN:
        from app.cms.models import CMSModule

        cms_modules = request.user.cmsmodule_set.all()

        cms_module_groups = [m.group for m in cms_modules]
        cms_module_groups_set = set(cms_module_groups)
        active_module_slug = request.path.strip("/").split("/")[0]
        if active_module_slug != "":
            try:
                active_module = CMSModule.objects.get(slug=active_module_slug)
            except CMSModule.DoesNotExist:
                active_module = None
        else:
            active_module = None

        return {
            'cms_module_groups': cms_module_groups_set,
            'active_module': active_module
        }
    else:
        return {}
