# -*- coding: utf-8 -*-
from django.contrib.auth.backends import ModelBackend


class BaseAuthBackend(ModelBackend):
    user_model = None
    subdomain = None

    def authenticate(self, username=None, password=None, **kwargs):
        if 'subdomain' in kwargs and kwargs['subdomain'] == self.subdomain:
            try:
                user = self.user_model.objects.get(email=username)
                if user.check_password(password):
                    return user
            except self.user_model.DoesNotExist:
                return None
        else:
            return None

    def get_user(self, user_id):
        try:
            return self.user_model.objects.get(pk=user_id)
        except self.user_model.DoesNotExist:
            return None


class PinBasedBackend(BaseAuthBackend):
    def authenticate(self, username=None, password=None, **kwargs):
        if 'subdomain' in kwargs and kwargs['subdomain'] == self.subdomain:
            try:
                user = self.user_model.objects.get(email=username, pin__is_active=True)
                if user.check_password(password):
                    return user
            except self.user_model.DoesNotExist:
                return None
        else:
            return None
