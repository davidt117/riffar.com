# -*- coding: utf-8 -*-
from django import forms
from django.contrib.auth import authenticate


class RegistrationForm(forms.Form):
    first_name = forms.CharField(
        label=u"First Name"
    )
    last_name = forms.CharField(
        label=u"Last Name"
    )
    email = forms.EmailField(
        label=u"Email"
    )
    password1 = forms.CharField(
        widget=forms.PasswordInput,
        label=u"Password",
        min_length=6
    )
    password2 = forms.CharField(
        widget=forms.PasswordInput,
        label=u"Confirm Password",
        min_length=6
    )
    pin = forms.CharField(
        label=u"PIN"
    )
    accept = forms.BooleanField(
        label=u"I accept terms and conditions *"
    )

    def __init__(self, *args, **kwargs):
        self.pin_cache = None
        self.user_model = kwargs.pop('user_model')
        self.pin_model = kwargs.pop('pin_model')
        super(RegistrationForm, self).__init__(*args, **kwargs)

    def clean_email(self):
        data = self.cleaned_data
        email = data['email'].lower()
        try:
            self.user_model.objects.get(email=email)
            raise forms.ValidationError(u"User with this email is already registered")
        except self.user_model.DoesNotExist:
            return email

    def clean_pin(self):
        data = self.cleaned_data
        pin = data['pin']
        try:
            self.pin_cache = self.pin_model.objects.get(pin=pin, is_active=True)

            try:
                if self.pin_cache.siteuser_set.exists():
                    raise forms.ValidationError(u"This PIN is already used by another user")
            except AttributeError:
                if self.pin_cache.siteadmin_set.exists():
                    raise forms.ValidationError(u"This PIN is already used by another user")

            return pin
        except self.pin_model.DoesNotExist:
            raise forms.ValidationError(u"This PIN is not valid or inactive")

    def clean_password2(self):
        data = self.cleaned_data
        if data['password1'] != data['password2']:
            raise forms.ValidationError(u"Passwords must be same")
        return data['password2']


class LoginForm(forms.Form):
    email = forms.EmailField(max_length=255, label=u"Email address")
    password = forms.CharField(widget=forms.PasswordInput, label=u"Password")
    next = forms.CharField(widget=forms.HiddenInput, required=False)

    def __init__(self, *args, **kwargs):
        self.subdomain = kwargs.pop('subdomain')
        self.user_cache = None
        self.request = kwargs.pop('request')
        super(LoginForm, self).__init__(*args, **kwargs)

    def clean(self):
        email = self.cleaned_data.get('email')
        password = self.cleaned_data.get('password')

        if email and password:
            self.user_cache = authenticate(username=email,
                                           password=password,
                                           subdomain=self.subdomain)
            if self.user_cache is None:
                raise forms.ValidationError(u"Password or email is incorrect")
        return self.cleaned_data

    def get_user(self):
        return self.user_cache


class ChangePasswordForm(forms.Form):
    old_password = forms.CharField(label=u"Current password", widget=forms.PasswordInput)
    password1 = forms.CharField(label=u"New password", widget=forms.PasswordInput, min_length=6)
    password2 = forms.CharField(label=u"New password (repeat)", widget=forms.PasswordInput, min_length=6)

    def __init__(self, *args, **kwargs):
        self.user_cache = None
        self.request = kwargs.pop('request')
        super(ChangePasswordForm, self).__init__(*args, **kwargs)

    def clean_old_password(self):
        data = self.cleaned_data
        if not self.request.user.check_password(data['old_password']):
            raise forms.ValidationError(u"Current password is incorrect")
        return data['old_password']

    def clean_password2(self):
        data = self.cleaned_data
        if data['password1'] != data['password2']:
            raise forms.ValidationError(u"Passwords must be same")
        return data['password2']
