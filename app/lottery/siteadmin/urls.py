# -*- coding: utf-8 -*-
from django.conf.urls import include, patterns, url
from django.contrib.auth.decorators import login_required

from .views import (CreateLotteryView, CreateStopNumbersView, DeleteStopNumberView, EditLotteryView,
                    ManageLotteriesView, ManageStopNumbersView, WinningNumbersLotteryListView, ManageWinningNumbersView,
                    WinningNumbersReportView)

urlpatterns = patterns(
    '',
    url(r'^create-stop-numbers/$', login_required(CreateStopNumbersView.as_view()), name='stop_number_create'),
    url(r'^manage-lottery/$', login_required(ManageLotteriesView.as_view()), name='lottery_manage'),
    url(r'^edit-lottery/(?P<pk>\d+)/$', login_required(EditLotteryView.as_view()), name='lottery_edit'),
    url(r'^lottery-stop-numbers/(?P<lottery>\d+)/$', login_required(ManageStopNumbersView.as_view()),
        name='lottery_stop_numbers'),
    url(r'^lottery-stop-numbers/delete/(?P<pk>\d+)/$', login_required(DeleteStopNumberView.as_view()),
        name='stop_number_delete'),
    url(r'^create-lottery/$', login_required(CreateLotteryView.as_view()), name='lottery_create'),
    url(r'^lottery-winning-numbers/$', login_required(WinningNumbersLotteryListView.as_view()),
        name='lottery_winning_numbers_lottery_list'),
    url(r'^lottery-winning-numbers/report/$', login_required(WinningNumbersReportView.as_view()),
        name='lottery_winning_numbers_report'),
    url(r'^lottery-winning-numbers/(?P<pk>\d+)/$', login_required(ManageWinningNumbersView.as_view()),
        name='lottery_winning_numbers'),
)
