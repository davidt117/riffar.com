# -*- coding: utf-8 -*-
from django.conf.urls import include, patterns, url
from django.contrib.auth.decorators import login_required

from .views import DetailReportView, TotalReportView, EarningReportView

urlpatterns = patterns(
    '',
    url(r'^$', login_required(TotalReportView.as_view()), name='report_total'),
    url(r'^details/$', login_required(DetailReportView.as_view()), name='report_detail'),
    url(r'^earnings/$', login_required(EarningReportView.as_view()), name='report_earnings'),
)
