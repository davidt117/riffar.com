# coding: utf-8
from django import forms

from app.siteuser.models import SiteUser


class CommissionForm(forms.ModelForm):
    class Meta:
        model = SiteUser
        fields = ['commission_percent']
