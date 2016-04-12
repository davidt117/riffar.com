# coding: utf-8
from django import forms

from app.sales.forms import ReportForm
from app.siteuser.models import SiteUser


class AdminReportForm(ReportForm):
    def __init__(self, *args, **kwargs):
        request = kwargs.pop('request')
        super(AdminReportForm, self).__init__(*args, **kwargs)
        self.fields['seller'].queryset = SiteUser.objects.filter(pin__created_by=request.user)

    seller = forms.ModelMultipleChoiceField(queryset=None, label=u"Seller", required=False)


class EarningReportForm(forms.Form):
    date = forms.DateField(label=u"Date", required=False)
