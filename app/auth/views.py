# -*- coding: utf-8 -*-
from django.contrib.auth import login, logout
from django.core.exceptions import ImproperlyConfigured
from django.shortcuts import redirect
from django.views.generic import FormView, RedirectView

from app.auth.forms import ChangePasswordForm, LoginForm, RegistrationForm


class BaseRegistrationView(FormView):
    template_name = "site/auth/registration.html"
    form_class = RegistrationForm
    user_model = None
    pin_model = None

    def get(self, request, *args, **kwargs):
        if self.request.user.is_authenticated():
            return redirect('homepage')
        return super(BaseRegistrationView, self).get(request, *args, **kwargs)

    def get_form_kwargs(self):
        if self.user_model is None or self.pin_model is None:
            raise ImproperlyConfigured(
                "You should provide user_model and pin_model properties for Pin Based Registration View")

        form_kwargs = super(BaseRegistrationView, self).get_form_kwargs()
        form_kwargs.update({
            'user_model': self.user_model,
            'pin_model': self.pin_model
        })
        return form_kwargs

    def form_valid(self, form):
        data = form.cleaned_data
        new_user = self.user_model.objects.create(
            first_name=data['first_name'],
            last_name=data['last_name'],
            email=data['email'],
            pin=form.pin_cache
        )
        new_user.set_password(data['password1'])
        new_user.save()
        return redirect('registration_complete')


class BaseLoginView(FormView):
    template_name = "site/auth/login.html"
    form_class = LoginForm
    subdomain = None

    def get_form_kwargs(self):
        if not self.subdomain:
            raise ImproperlyConfigured("You should provide subdomain property for Login View")

        form_kwargs = super(BaseLoginView, self).get_form_kwargs()
        form_kwargs.update({
            'request': self.request,
            'subdomain': self.subdomain
        })
        return form_kwargs

    def get_initial(self):
        return {
            'next': self.request.GET.get('next', '')
        }

    def form_valid(self, form):
        data = form.cleaned_data
        user = form.get_user()
        login(self.request, user)
        if data['next']:
            return redirect(data['next'])
        else:
            return redirect('homepage')


class BaseLogoutView(RedirectView):
    def get(self, request, *args, **kwargs):
        logout(request)
        return redirect(self.url)


class BaseChangePasswordView(FormView):
    template_name = "site/auth/change_password.html"
    form_class = ChangePasswordForm

    def get_context_data(self, **kwargs):
        context = super(BaseChangePasswordView, self).get_context_data(**kwargs)
        if 'result' in self.kwargs:
            context.update({
                'result': self.kwargs['result']
            })
        return context

    def get_form_kwargs(self):
        form_kwargs = super(BaseChangePasswordView, self).get_form_kwargs()
        form_kwargs.update({
            'request': self.request
        })
        return form_kwargs

    def form_valid(self, form):
        data = form.cleaned_data
        self.request.user.set_password(data['password1'])
        self.request.user.save()
        return redirect('change_password_result', result='saved')
