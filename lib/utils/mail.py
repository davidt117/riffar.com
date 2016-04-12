# -*- coding: utf-8 -*-
__author__ = 'Dmitry Astrikov'

from django.conf import settings
from django.core.mail import BadHeaderError, send_mail
from django.template.loader import render_to_string


def mail(subject, recipients, template, sender=None, context={}):
    """
    Send email.
    """
    try:
        context.update({
            'app_url': settings.APP_URL
        })
        if sender is None:
            sender = settings.DEFAULT_FROM_EMAIL
        message = render_to_string(template, context)
        send_mail(subject, message, sender, recipients)
    except BadHeaderError:
        return False
    return True
