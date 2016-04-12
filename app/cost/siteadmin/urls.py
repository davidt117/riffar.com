# -*- coding: utf-8 -*-
from django.conf.urls import include, patterns, url
from django.contrib.auth.decorators import login_required

from .views import SellersListView, UpdateSellerCommissionView

urlpatterns = patterns(
    '',
    url(r'^sellers-commission/$', login_required(SellersListView.as_view()), name='sellers_commission'),
    url(r'^sellers-commission/(?P<pk>\d+)/$', login_required(UpdateSellerCommissionView.as_view()),
        name='sellers_commission'),
)
