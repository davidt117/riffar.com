# coding: utf-8
from django.http import Http404
from django.core.urlresolvers import reverse_lazy
from django.views.generic import UpdateView, ListView

from app.siteuser.models import SiteUser

from .forms import CommissionForm


class SellersListView(ListView):
    model = SiteUser
    template_name = "site/cost/siteadmin/sellers_list.html"

    def get_queryset(self):
        queryset = super(SellersListView, self).get_queryset()
        queryset = queryset.filter(pin__created_by=self.request.user)
        return queryset


class UpdateSellerCommissionView(UpdateView):
    model = SiteUser
    form_class = CommissionForm
    template_name = "site/cost/siteadmin/update_commission.html"
    success_url = reverse_lazy("cost:sellers_commission")

    def get_object(self, queryset=None):
        obj = super(UpdateSellerCommissionView, self).get_object(queryset)
        if obj.pin.created_by != self.request.user:
            raise Http404
        return obj