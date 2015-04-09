#!/usr/bin/env python
# -*- coding: utf-8 -*-
from django.test import TestCase

# Create your tests here.



from django.core.cache import cache

cache.set('key', 'myname', timeout=0)
cache.set('key1', 'asdf', timeout=None)
