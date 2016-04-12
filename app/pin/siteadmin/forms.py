# coding: utf-8
from django import forms

from app.pin.models import Pin


class PinForm(forms.ModelForm):
    class Meta:
        model = Pin
        fields = ['pin']
