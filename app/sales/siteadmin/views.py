# coding: utf-8
import datetime

from django.views.generic import ListView, TemplateView

from app.siteuser.models import SiteUser
from app.ticket.models import Ticket
from app.lottery.models import WinningNumberLog
from .forms import AdminReportForm, EarningReportForm
from .mixins import WinningReportCalculationMixin


class TotalReportView(ListView):
    template_name = "site/sales/siteadmin/total_report.html"
    model = Ticket

    def get_queryset(self):
        date_from = self.request.GET.get('date_from')
        date_to = self.request.GET.get('date_to')
        seller = self.request.GET.get('seller_id')
        seller_ids = self.request.GET.getlist('seller', [])

        queryset = super(TotalReportView, self).get_queryset()

        if not seller:
            if seller_ids:
                sellers = SiteUser.objects.filter(pin__created_by=self.request.user, pk__in=seller_ids)
            else:
                sellers = SiteUser.objects.filter(pin__created_by=self.request.user)
        else:
            sellers = SiteUser.objects.filter(pin__created_by=self.request.user, pk=seller)

        queryset = queryset.filter(user__in=sellers)

        if date_from or date_to:
            try:
                if date_from:
                    date_from = datetime.datetime.strptime(date_from, "%m/%d/%Y")
                    queryset = queryset.filter(date_created__gte=date_from)
                if date_to:
                    date_to = datetime.datetime.strptime(date_to, "%m/%d/%Y")
                    queryset = queryset.filter(date_created__lte=date_to)
            except ValueError:
                queryset = []

        return queryset

    def get_context_data(self, **kwargs):
        context = super(TotalReportView, self).get_context_data(**kwargs)
        context['amount'] = 0
        for obj in context['object_list']:
            context['amount'] += obj.total_amount

        if 'seller_id' in self.request.GET:
            seller_id = self.request.GET.get('seller_id')
            context['show_detailed_report'] = True
            context['seller'] = SiteUser.objects.get(pin__created_by=self.request.user, pk=seller_id)
        else:
            context['sellers'] = SiteUser.objects.filter(pin__created_by=self.request.user)

        if 'get_report' in self.request.GET:
            context['show_results'] = True
            context['form'] = AdminReportForm(request=self.request, initial={
                'date_from': self.request.GET.get('date_from'),
                'date_to': self.request.GET.get('date_to'),
                'seller': SiteUser.objects.filter(pin__created_by=self.request.user,
                                                  pk__in=self.request.GET.getlist('seller', [])),
            })
        else:
            context['form'] = AdminReportForm(request=self.request)

        return context


class DetailReportView(TotalReportView):
    template_name = "site/sales/siteadmin/detail_report.html"

    def get_context_data(self, **kwargs):
        context = super(TotalReportView, self).get_context_data(**kwargs)
        context['amount'] = 0
        for obj in context['object_list']:
            context['amount'] += obj.total_amount

        context['show_results'] = 'get_report' in self.request.GET

        if 'seller_id' in self.request.GET:
            seller_id = self.request.GET.get('seller_id')
            context['show_detailed_report'] = True
            context['seller'] = SiteUser.objects.get(pin__created_by=self.request.user, pk=seller_id)
        else:
            context['sellers'] = SiteUser.objects.filter(pin__created_by=self.request.user)
            context['amounts'] = []
            date_from = self.request.GET.get('date_from')
            date_to = self.request.GET.get('date_to')

            try:
                date_from = datetime.datetime.strptime(date_from, "%m/%d/%Y")
            except (TypeError, ValueError):
                date_from = None

            try:
                date_to = datetime.datetime.strptime(date_to, "%m/%d/%Y")
            except (TypeError, ValueError):
                date_to = None

            for seller in SiteUser.objects.filter(pin__created_by=self.request.user):

                tickets = seller.user_tickets.all()
                if date_from:
                    tickets = tickets.filter(date_created__gte=date_from)
                if date_to:
                    tickets = tickets.filter(date_created__lte=date_to)

                amount = 0
                for t in tickets:
                    amount += t.total_amount

                context['amounts'].append(amount)

        if 'get_report' in self.request.GET:
            context['show_results'] = True
            context['form'] = AdminReportForm(request=self.request, initial={
                'date_from': self.request.GET.get('date_from'),
                'date_to': self.request.GET.get('date_to'),
                'seller': SiteUser.objects.filter(pin__created_by=self.request.user,
                                                  pk__in=self.request.GET.getlist('seller', [])),
            })
        else:
            context['form'] = AdminReportForm(request=self.request)

        return context


class EarningReportView(WinningReportCalculationMixin, TemplateView):
    template_name = "site/sales/siteadmin/earning_report.html"

    def get_reports(self, date):
        if not date:
            return

        date = datetime.datetime.strptime(date, "%m/%d/%Y")

        logs = WinningNumberLog.objects.filter(
            lottery__created_by=self.request.user,
            date_of_report__day=date.day,
            date_of_report__month=date.month,
            date_of_report__year=date.year,
        )
        lotteries = []
        prepared_logs = []

        for log in logs:
            if log.lottery not in lotteries:
                lotteries.append(log.lottery)
                prepared_logs.append(log)

        reports = []
        for log in prepared_logs:
            reports.append({
                'lottery': log.lottery,
                'report': self.calculate_report(log)
            })
        return reports

    def get_context_data(self, **kwargs):
        context = super(EarningReportView, self).get_context_data(**kwargs)

        if 'get_report' in self.request.GET:
            context['reports'] = self.get_reports(self.request.GET.get('date'))

            context['totals'] = {
                'total_sold': 0,
                'total_commissions': 0,
                'total_won': 0,
                'total_net': 0,
            }

            for rep in context['reports']:
                context['totals']['total_sold'] += rep['report']['total_sold']
                context['totals']['total_commissions'] += rep['report']['total_commissions']
                context['totals']['total_won'] += rep['report']['total_won']
                context['totals']['total_net'] += rep['report']['total_net']

            context['show_results'] = True
            context['form'] = EarningReportForm(initial={
                'date': self.request.GET.get('date'),
            })
        else:
            context['form'] = EarningReportForm()

        return context
