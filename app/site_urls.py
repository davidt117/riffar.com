# -*- coding: utf-8 -*-
from django.conf import settings
from django.conf.urls import include, patterns, url
from django.conf.urls.static import static
from django.contrib.auth.decorators import login_required
from django.http import HttpResponse

from app.homepage.views import HomepageView

urlpatterns = patterns(
    '',
    url(r'^$', login_required(HomepageView.as_view()), name='homepage'),
    url(r'^auth/', include('app.siteauth.urls')),
    url(r'^page/', include('app.pagemap.urls', namespace="page")),
    url(r'^ticket/', include('app.ticket.urls', namespace="ticket")),
    url(r'^sales/', include('app.sales.urls', namespace="sales")),
    url(r'^robots.txt$', lambda r: HttpResponse("User-agent: *\nDisallow:", content_type="text/plain"))
) + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

if settings.DEBUG:
    import debug_toolbar

    urlpatterns += patterns(
        '',
        url(r'^__debug__/', include(debug_toolbar.urls)),
    )
