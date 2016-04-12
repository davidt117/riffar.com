# -*- coding: utf-8 -*-
from django.conf.urls import include, patterns, url
from django.contrib.auth.decorators import login_required

from .views import (ChangeAdminStateView, ChangePinStateView,
                    CreateAdminPinView, ManageAdminPinView, ManagePinView)

urlpatterns = patterns(
    '',
    url(r'^$', login_required(ManagePinView.as_view()), name='index'),
    url(r'^change-state/$', login_required(ChangePinStateView.as_view()), name='change_pin_state'),
    url(r'^manage-admin-pins/$', login_required(ManageAdminPinView.as_view()), name='admin_pin_manage'),
    url(r'^manage-admin-pins/change-state/$', login_required(ChangeAdminStateView.as_view()), name='change_admin_pin_state'),
    url(r'^create-admin-pin/$', login_required(CreateAdminPinView.as_view()), name='admin_pin_create'),
)
