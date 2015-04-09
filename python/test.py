#!/usr/bin/env python
# -*- coding: utf-8 -*-

'  '

__author__ = 'xiayingjie'
__date__ = '14-5-15'

from fabric.api import *
from fabric.colors import *

local('F:/py/py/Scripts/activate')
with lcd('E:/pro/lucky'):
    local('fab dptest')
