# -*- coding: utf-8 -*-
from django.conf.urls import include, patterns, url
from django.contrib.auth.decorators import login_required
from django.views.decorators.csrf import csrf_exempt

from .views import (ClearPlaysView, CurrentTicketView, DeletePlay, GetPlayView,
                    SavePlayView, SaveTicketView, TicketDetailView,
                    TicketListView)

urlpatterns = patterns(
    '',
    url(r'^$', login_required(TicketListView.as_view()), name='index'),
    url(r'^view-ticket/(?P<pk>\d+)/', login_required(TicketDetailView.as_view()), name='detail'),
    url(r'^current-ticket/', login_required(csrf_exempt(CurrentTicketView.as_view())), name='current_ticket'),
    url(r'^save-play/', login_required(csrf_exempt(SavePlayView.as_view())), name='save_play'),
    url(r'^get-play/', login_required(csrf_exempt(GetPlayView.as_view())), name='get_play'),
    url(r'^clear-plays/', login_required(csrf_exempt(ClearPlaysView.as_view())), name='clear_play'),
    url(r'^delete-play/', login_required(csrf_exempt(DeletePlay.as_view())), name='delete_play'),
    url(r'^save-ticket/', login_required(csrf_exempt(SaveTicketView.as_view())), name='save_ticket'),
)
