from __future__ import absolute_import, unicode_literals, print_function
try:
    import js
except ImportError:
    js = None
from cavorite import c, t, Router, callbacks, timeouts, ajaxget
import historygraph


def initialise_all_callbacks():
    callbacks.initialise_global_callbacks()
    timeouts.initialise_timeout_callbacks()
    ajaxget.initialise_ajaxget_callbacks()

def start():
    initialise_all_callbacks()
    print('Application started')

