# coding: utf-8
from django.core.urlresolvers import reverse_lazy
from django.http import Http404
from django.shortcuts import redirect
from django.views.generic import CreateView, FormView, ListView

from app.pin.models import AdminPin, Pin
from lib.views.generic import AjaxRequestView

from .forms import AdminPinForm


class ManagePinView(ListView):
    model = Pin
    template_name = "site/pin/superadmin/manage.html"


class ManageAdminPinView(ListView):
    model = AdminPin
    template_name = "site/pin/superadmin/manage_admin_pin.html"


class CreateAdminPinView(CreateView):
    model = AdminPin
    form_class = AdminPinForm
    template_name = "site/pin/superadmin/create_admin_pin.html"
    success_url = reverse_lazy('pins:admin_pin_manage')

    def form_valid(self, form):
        pin = form.save(commit=False)
        pin.created_by = self.request.user
        pin.save()
        return redirect(self.success_url)


class BaseChangePinStateView(AjaxRequestView):
    model = None

    def get_response(self, request, *args, **kwargs):
        pk = request.POST.get('pk')
        action = request.POST.get('action')

        try:
            pin = self.model.objects.get(pk=pk)
        except self.model.DoesNotExist:
            raise Http404

        pin.is_active = True if action == 'activate' else False
        pin.save(update_fields=['is_active'])
        return {
            'result': 'success'
        }


class ChangeAdminStateView(BaseChangePinStateView):
    model = AdminPin


class ChangePinStateView(BaseChangePinStateView):
    model = Pin
