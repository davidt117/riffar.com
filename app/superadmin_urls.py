# -*- coding: utf-8 -*-
from django.conf import settings
from django.conf.urls import include, patterns, url
from django.conf.urls.static import static
from django.contrib.auth.decorators import login_required
from django.http import HttpResponse

from app.pin.superadmin.views import ManagePinView

urlpatterns = patterns(
    '',
    url(r'^$', login_required(ManagePinView.as_view()), name='homepage'),
    url(r'^pins/', include('app.pin.superadmin.urls', namespace='pins')),
    url(r'^auth/', include('app.superadminauth.urls')),
    url(r'^robots.txt$', lambda r: HttpResponse("User-agent: *\nDisallow:", content_type="text/plain"))
) + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

if settings.DEBUG:
    import debug_toolbar

    urlpatterns += patterns(
        '',
        url(r'^__debug__/', include(debug_toolbar.urls)),
    )
