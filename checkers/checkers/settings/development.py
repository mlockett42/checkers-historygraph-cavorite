# -*- coding: utf-8 -*-
from __future__ import absolute_import, unicode_literals, print_function
import os
from .base import *

ALLOWED_HOSTS = ['*']

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = '379j8sr!^@b&cb@%8a5!2#87y6x!357h&tm41df!_mc&!b1_fi'

# Database
# https://docs.djangoproject.com/en/1.11/ref/settings/#databases

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),
    }
}



