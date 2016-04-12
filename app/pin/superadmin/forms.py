# coding: utf-8
from django import forms

from app.pin.models import AdminPin


class AdminPinForm(forms.ModelForm):
    class Meta:
        model = AdminPin
        fields = ['pin']
