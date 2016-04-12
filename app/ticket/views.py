# coding: utf-8
from django.conf import settings
from django.http import Http404, StreamingHttpResponse
from django.views.generic import DetailView, FormView, ListView

from app.lottery.models import Lottery, StopNumber
from app.ticket.models import Play, Ticket
from lib.views.generic import AjaxRequestView

from .forms import TicketForm


class SavePlayView(AjaxRequestView):
    def get_response(self, request, *args, **kwargs):
        lottery_ids = request.POST.getlist('lottery_ids[]')
        numbers = request.POST.get('numbers')
        amount = request.POST.get('amount')

        plays = request.session.get('plays', [])

        for lottery_id in lottery_ids:

            if not all([lottery_id, numbers, amount]):
                return {
                    'result': 'error',
                    'message': 'Please select lottery and enter numbers and amount'
                }

            try:
                lottery = Lottery.objects.get(pk=lottery_id)
            except Lottery.DoesNotExist:
                raise Http404

            int_numbers = [int(n) for n in numbers.split(' ')]
            stop_numbers = StopNumber.objects.filter(lottery=lottery).values_list('number', flat=True)

            for n in int_numbers:
                if n < lottery.min_number or n > lottery.max_number:
                    return {
                        'result': 'error',
                        'message': 'Please enter numbers between %s and %s' % (
                            lottery.min_number, lottery.max_number)
                    }
                if n in stop_numbers:
                    return {
                        'result': 'error',
                        'message': 'You are used not allowed number %s. Please input another one' % n
                    }

            amount = int(amount)
            if amount < lottery.min_amount or amount > lottery.max_amount:
                return {
                    'result': 'error',
                    'message': 'Please enter amount between %s and %s' % (
                        lottery.min_amount, lottery.max_amount)
                }

            play = {
                'number': numbers,
                'amount': amount,
                'lottery_id': lottery_id
            }
            plays.append(play)

        request.session['plays'] = plays

        amount = 0
        for p in plays:
            amount += p.get('amount')

        return {
            'result': 'success',
            'next_play_id': len(plays),
            'overall_plays_count': len(plays),
            'overall_amount': amount
        }


class GetPlayView(AjaxRequestView):
    def get_response(self, request, *args, **kwargs):
        play_id = request.GET.get('play_id')
        if not play_id:
            return {
                'result': 'error',
                'message': 'Internal service error'
            }

        plays = request.session.get('plays', [])
        play_id = int(play_id)
        try:
            return {
                'result': 'success',
                'play_id': play_id,
                'play': plays[play_id]
            }
        except IndexError:
            return {
                'result': 'error',
                'message': 'Play not found'
            }


class ClearPlaysView(AjaxRequestView):
    def get_response(self, request, *args, **kwargs):
        request.session['plays'] = []
        return {
            'result': 'success'
        }


class DeletePlay(AjaxRequestView):
    def get_response(self, request, *args, **kwargs):
        play_id = request.POST.get('play_id')
        if not play_id:
            return {
                'result': 'error',
                'message': 'Internal service error'
            }
        plays = request.session.get('plays', [])
        plays.pop()
        request.session['plays'] = plays

        amount = 0
        for p in plays:
            amount += p.get('amount')

        return {
            'result': 'success',
            'overall_plays_count': len(plays),
            'overall_amount': amount
        }


class CurrentTicketView(FormView):
    form_class = TicketForm
    template_name = "site/ticket/current_ticket.html"

    def get_context_data(self, **kwargs):
        context = super(CurrentTicketView, self).get_context_data(**kwargs)
        plays = self.request.session.get('plays', [])
        context['current_ticket'] = Ticket.objects.filter(user=self.request.user).count() + 1
        context['ticket_data'] = [
            {
                'lottery': Lottery.objects.get(pk=p.get('lottery_id')),
                'numbers': p.get('number'),
                'amount': p.get('amount')
            } for p in plays]

        context['total_amount'] = 0
        for p in plays:
            context['total_amount'] += p.get('amount')

        return context

    def form_valid(self, form):
        ticket_number = Ticket.objects.filter(user=self.request.user).count() + 1
        ticket = Ticket.objects.create(
            user=self.request.user,
            number=ticket_number
        )

        plays = self.request.session.get('plays', [])
        for p in plays:
            Play.objects.create(
                ticket=ticket,
                number=p.get('number'),
                amount=p.get('amount'),
                lottery_id=p.get('lottery_id')
            )

        self.request.session['plays'] = []

        filename = 'ticket_%s.txt' % ticket_number
        f = open('%s/f/%s' % (settings.MEDIA_ROOT, filename), 'w')
        f.write('---------Ticket #%s---------\n' % ticket_number)
        f.write('------%s------\n' % ticket.date_created.strftime('%Y-%m-%d %H:%M'))
        for p in ticket.ticket_plays.all():
            f.write('----------------------------\n')
            f.write('         %s\n' % p.lottery.name)
            f.write('%s            $%s.00\n' % (p.number, p.amount))
            f.write('----------------------------\n')

        f.write('Total amount: $%s.00\n' % ticket.total_amount)
        f.write('----------------------------\n')
        f.write('      Seller signature      \n')
        f.write('Thank you for buying with us\n')
        f = open('%s/f/%s' % (settings.MEDIA_ROOT, filename), 'r')
        response = StreamingHttpResponse(f.read(), content_type="text/plain")
        response['Content-Disposition'] = 'attachment; filename="%s"' % filename
        return response


class SaveTicketView(AjaxRequestView):
    def get_response(self, request, *args, **kwargs):
        ticket_number = Ticket.objects.filter(user=request.user).count() + 1

        ticket = Ticket.objects.create(
            user=request.user,
            number=ticket_number
        )

        plays = request.session.get('plays', [])
        for p in plays:
            Play.objects.create(
                ticket=ticket,
                number=p.get('number'),
                amount=p.get('amount'),
                lottery_id=p.get('lottery_id')
            )

        request.session['plays'] = []
        return {
            'result': 'success'
        }


class TicketListView(ListView):
    template_name = "site/ticket/list.html"
    model = Ticket
    paginate_by = None

    def get_queryset(self):
        return self.model.objects.filter(user=self.request.user)


class TicketDetailView(DetailView):
    template_name = "site/ticket/detail.html"
    model = Ticket

    def get_object(self, queryset=None):
        try:
            return Ticket.objects.get(pk=self.kwargs['pk'], user=self.request.user)
        except Ticket.DoesNotExist:
            raise Http404
