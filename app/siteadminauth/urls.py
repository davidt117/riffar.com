# -*- coding: utf-8 -*-
from django.conf.urls import patterns, url
from django.contrib.auth.decorators import login_required
from django.views.generic import TemplateView

from app.auth.views import BaseChangePasswordView
from views import LoginView, LogoutView, RegistrationView

urlpatterns = patterns(
    '',
    url(r'^login/$', LoginView.as_view(), name='login'),
    url(r'^logout/$', login_required(LogoutView.as_view()), name='logout'),
    url(r'^change-password/$', login_required(BaseChangePasswordView.as_view()), name='change_password'),
    url(r'^change-password/(?P<result>(saved|error))/$', login_required(BaseChangePasswordView.as_view()),
        name='change_password_result'),
    url(r'^registration/$', RegistrationView.as_view(), name='registration'),
    url(r'^registration-complete/$', TemplateView.as_view(
        template_name="site/auth/registration_complete.html"),
        name='registration_complete'),
)
