__author__ = 'Dmitry Astrikov'

import datetime
import time

from django import template

register = template.Library()

@register.filter
def ymdate(value):
    return datetime.datetime.strptime(value, "%Y%m%d")
