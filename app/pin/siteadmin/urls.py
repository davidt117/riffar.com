# -*- coding: utf-8 -*-
from django.conf.urls import include, patterns, url
from django.contrib.auth.decorators import login_required

from .views import ChangePinStateView, CreatePinView, ManagePinView

urlpatterns = patterns(
    '',
    url(r'^$', login_required(ManagePinView.as_view()), name='index'),
    url(r'^change-pin-state/$', login_required(ChangePinStateView.as_view()), name='change_state'),
    url(r'^create-pin/$', login_required(CreatePinView.as_view()), name='pin_create'),
)
