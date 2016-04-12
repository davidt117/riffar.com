# -*- coding: utf-8 -*-
import datetime

from django.views.generic import TemplateView

from app.lottery.models import Lottery
from app.ticket.models import Ticket


class HomepageView(TemplateView):
    template_name = "site/homepage/index.html"

    def get_context_data(self, **kwargs):
        context = super(HomepageView, self).get_context_data(**kwargs)
        current_time = datetime.datetime.now().strftime("%H:%M:%S")

        context['current_ticket'] = Ticket.objects.filter(user=self.request.user).count() + 1
        context['lotteries'] = Lottery.objects.filter(open_time__lte=current_time, close_time__gte=current_time,
                                                      created_by=self.request.user.pin.created_by, is_available=True)

        plays = self.request.session.get('plays', [])
        amount = 0
        for p in plays:
            amount += p.get('amount')

        plays_count = len(plays)
        context['overall_amount'] = amount
        context['overall_plays_count'] = plays_count
        context['current_play'] = plays_count  # Current play is equal to plays_count

        return context
