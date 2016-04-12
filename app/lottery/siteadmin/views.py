# coding: utf-8
import datetime

from django.contrib import messages
from django.core.urlresolvers import reverse_lazy
from django.http import Http404
from django.shortcuts import redirect
from django.views.generic import (CreateView, DeleteView, DetailView, FormView, ListView,
                                  UpdateView, TemplateView)

from app.lottery.models import Lottery, StopNumber, WinningNumberLog

from .forms import LotteryEditForm, LotteryForm, StopNumbersForm, WinningNumbersForm, ReportForm


class ManageLotteriesView(ListView):
    model = Lottery
    template_name = 'site/lottery/siteadmin/manage_lotteries.html'
    paginate_by = None

    def get_queryset(self):
        queryset = super(ManageLotteriesView, self).get_queryset()
        return queryset.filter(created_by=self.request.user)


class WinningNumbersLotteryListView(ManageLotteriesView):
    template_name = "site/lottery/siteadmin/winning_numbers_lottery_list.html"


class CreateLotteryView(CreateView):
    model = Lottery
    form_class = LotteryForm
    template_name = 'site/lottery/siteadmin/create_lottery.html'
    success_url = reverse_lazy('lottery:lottery_create')

    def form_valid(self, form):
        lottery = form.save(commit=False)
        lottery.created_by = self.request.user
        lottery.save()
        messages.add_message(self.request, messages.INFO, u'Lottery has been added successfully')
        return redirect(self.success_url)


class EditLotteryView(UpdateView):
    model = Lottery
    form_class = LotteryEditForm
    template_name = 'site/lottery/siteadmin/edit_lottery.html'
    success_url = reverse_lazy('lottery:lottery_manage')

    def get_object(self, queryset=None):
        obj = super(EditLotteryView, self).get_object(queryset)
        if obj.created_by != self.request.user:
            raise Http404
        return obj

    def form_valid(self, form):
        self.object = form.save()
        messages.add_message(self.request, messages.INFO, u'Lottery has been changed successfully')
        return redirect(self.success_url)


class ManageStopNumbersView(ListView):
    model = StopNumber
    template_name = 'site/lottery/siteadmin/manage_stop_numbers.html'
    paginate_by = None

    def get_queryset(self):
        queryset = super(ManageStopNumbersView, self).get_queryset()
        return queryset.filter(admin=self.request.user, lottery_id=self.kwargs['lottery'])


class DeleteStopNumberView(DeleteView):
    model = StopNumber
    template_name = 'site/lottery/siteadmin/stop_number_delete.html'

    def get_success_url(self):
        return reverse_lazy('lottery:lottery_stop_numbers', kwargs={'lottery': self.object.lottery_id})

    def get_object(self, queryset=None):
        obj = super(DeleteStopNumberView, self).get_object(queryset)
        if obj.lottery.created_by != self.request.user:
            raise Http404
        return obj


class CreateStopNumbersView(FormView):
    form_class = StopNumbersForm
    template_name = 'site/lottery/siteadmin/create_stop_numbers.html'
    success_url = reverse_lazy('lottery:stop_number_create')

    def get_form_kwargs(self):
        kwargs = super(CreateStopNumbersView, self).get_form_kwargs()
        kwargs['request'] = self.request
        kwargs['queryset'] = Lottery.objects.filter(created_by=self.request.user)
        return kwargs

    def form_valid(self, form):
        data = form.cleaned_data
        for number in data.get('numbers', []):
            StopNumber.objects.create(
                lottery=data.get('lottery'),
                admin=self.request.user,
                number=number
            )
        messages.add_message(self.request, messages.INFO, u'Stop numbers were added successfully')
        return redirect(self.success_url)


class ManageWinningNumbersView(CreateView):
    model = WinningNumberLog
    template_name = 'site/lottery/siteadmin/manage_winning_numbers.html'
    form_class = WinningNumbersForm

    def get_success_url(self):
        return reverse_lazy('lottery:lottery_winning_numbers_lottery_list')

    def form_valid(self, form):
        self.obj = form.save(commit=False)
        self.obj.lottery_id = self.kwargs['pk']
        self.obj.save()
        return redirect(self.get_success_url())


class WinningNumbersReportView(TemplateView):
    model = WinningNumberLog
    template_name = 'site/lottery/siteadmin/winning_numbers_report.html'

    def get_context_data(self, **kwargs):
        context = super(WinningNumbersReportView, self).get_context_data(**kwargs)

        if 'get_report' in self.request.GET:
            context['form'] = ReportForm(initial={
                'date_from': self.request.GET.get('date_from'),
                'date_to': self.request.GET.get('date_to'),
            })

            date_from = self.request.GET.get('date_from')
            date_to = self.request.GET.get('date_to')

            qs = self.model.objects.filter(lottery__created_by=self.request.user)
            if date_from or date_to:
                try:
                    if date_from:
                        date_from = datetime.datetime.strptime(date_from, "%m/%d/%Y")
                        qs = qs.filter(date_created__gte=date_from)
                    if date_to:
                        date_to = datetime.datetime.strptime(date_to, "%m/%d/%Y")
                        qs = qs.filter(date_created__lte=date_to)
                except ValueError:
                    qs = []

            total_report = {
                'total_played': 0,
                'total_commissions': 0,
                'total_won': 0,
                'total_net': 0,
            }
            for obj in qs:
                rep = self.calculate_report(obj)
                total_report['total_played'] += rep['total_sold']
                total_report['total_commissions'] += rep['total_commissions']
                total_report['total_won'] += rep['total_won']
                total_report['total_net'] += rep['total_net']

            total_report['total_commissions'] *= -1
            total_report['total_won'] *= -1

            context['total_report'] = total_report

        else:
            context['form'] = ReportForm()

        context['show_report'] = 'get_report' in self.request.GET

        return context