# -*- coding: utf-8 -*-
from django.conf import settings
from django.conf.urls import include, patterns, url
from django.conf.urls.static import static
from django.contrib.auth.decorators import login_required
from django.http import HttpResponse

from app.pin.siteadmin.views import ManagePinView

urlpatterns = patterns(
    '',
    url(r'^$', login_required(ManagePinView.as_view()), name='homepage'),
    url(r'^pins/', include('app.pin.siteadmin.urls', namespace='pins')),
    url(r'^sales/', include('app.sales.siteadmin.urls', namespace='sales')),
    url(r'^lotteries/', include('app.lottery.siteadmin.urls', namespace='lottery')),
    url(r'^cost/', include('app.cost.siteadmin.urls', namespace='cost')),
    url(r'^auth/', include('app.siteadminauth.urls')),
    url(r'^robots.txt$', lambda r: HttpResponse("User-agent: *\nDisallow:", content_type="text/plain"))
) + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

if settings.DEBUG:
    import debug_toolbar

    urlpatterns += patterns(
        '',
        url(r'^__debug__/', include(debug_toolbar.urls)),
    )
