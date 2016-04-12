# coding: utf-8
from django import forms


class ReportForm(forms.Form):
    date_to = forms.DateField(label=u"Date To", required=False)
    date_from = forms.DateField(label=u"Date From", required=False)
