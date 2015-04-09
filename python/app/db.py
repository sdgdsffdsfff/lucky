#!/usr/bin/env python
# -*- coding: utf-8 -*-

__author__ = 'xiayingjie'

import redis
from lucky.settings import *

pool = redis.ConnectionPool(host=REDIS_HOST, port=REDIS_PORT, db=REDIS_DB)
#pool = redis.ConnectionPool(host='10.221.136.202', port=6379, db=0)
r = redis.Redis(connection_pool=pool)

def query_sql(sql):
    from django.db import connection, transaction
    cursor = connection.cursor()
    # 數據修改操作——提交要求
    cursor.execute(sql)
    row = cursor.fetchone()
    return row