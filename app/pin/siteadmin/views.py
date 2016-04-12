# coding: utf-8
from django.core.urlresolvers import reverse_lazy
from django.http import Http404
from django.shortcuts import redirect
from django.views.generic import CreateView, FormView, ListView

from app.pin.models import Pin
from lib.views.generic import AjaxRequestView

from .forms import PinForm


class ManagePinView(ListView):
    model = Pin
    template_name = "site/pin/siteadmin/manage.html"

    def get_queryset(self):
        queryset = super(ManagePinView, self).get_queryset()
        queryset = queryset.filter(created_by=self.request.user)
        return queryset


class CreatePinView(CreateView):
    model = Pin
    form_class = PinForm
    template_name = "site/pin/siteadmin/create_pin.html"
    success_url = reverse_lazy('pins:index')

    def form_valid(self, form):
        pin = form.save(commit=False)
        pin.created_by = self.request.user
        pin.save()
        return redirect(self.success_url)


class ChangePinStateView(AjaxRequestView):
    def get_response(self, request, *args, **kwargs):
        pk = request.POST.get('pk')
        action = request.POST.get('action')

        try:
            pin = Pin.objects.get(pk=pk, created_by=self.request.user)
        except Pin.DoesNotExist:
            raise Http404

        pin.is_active = True if action == 'activate' else False
        pin.save(update_fields=['is_active'])
        return {
            'result': 'success'
        }
