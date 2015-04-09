#!/usr/bin/env python
# -*- coding: utf-8 -*-
from django.conf.urls import patterns, include, url

from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'lucky.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),

    url(r'^admin/', include(admin.site.urls)),
)

import xadmin
xadmin.autodiscover()

# version模块自动注册需要版本控制的 Model
from xadmin.plugins import xversion
xversion.register_models()

urlpatterns += patterns('',
    url(r'xadmin/', include(xadmin.site.urls)),
)

import os
DIRNAME = os.path.dirname(__file__)
import settings
from app.views import *
urlpatterns += patterns("",
    (r'^file/(?P<path>.*)$', 'django.views.static.serve', {'document_root': settings.MEDIA_ROOT, 'show_indexes': True}),
    ('index/(\d{1,})$',index),
    ('draw/(\d{1,})/(.+)$',draw),
    ('addWinUser/(\d{1,})/(.+)$',addWinuser),
    ('addDraw/(\d{1,})/(.+)/(\d{1})$',addDraw),
    ('share/(\d{1,})$$',share),

)


