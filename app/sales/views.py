# coding: utf-8
import datetime

from django.views.generic import ListView

from app.ticket.models import Ticket

from .forms import ReportForm


class TotalReportView(ListView):
    template_name = "site/sales/total_report.html"
    model = Ticket

    def get_queryset(self):
        date_from = self.request.GET.get('date_from')
        date_to = self.request.GET.get('date_to')
        queryset = super(TotalReportView, self).get_queryset()
        queryset = queryset.filter(user=self.request.user)
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

        if 'get_report' in self.request.GET:
            context['show_results'] = True
            context['form'] = ReportForm(initial={
                'date_from': self.request.GET.get('date_from'),
                'date_to': self.request.GET.get('date_to'),
            })
        else:
            context['form'] = ReportForm()

        return context


class DetailReportView(TotalReportView):
    template_name = "site/sales/detail_report.html"
