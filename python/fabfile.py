#!/usr/bin/env python
# -*- coding: utf-8 -*-

'  '

__author__ = 'xiayingjie'
__date__ = '14-5-15'

from fabric.api import *
from fabric.colors import *
from fabric.tasks import *
from fabric.contrib.files import *
def show():
    print green('success')
    print red('fail')
    print yellow('yellow')

env.roledefs = {
            'testserver': ['root@tx:22',],
            'realserver': ['user2@host2:port2', ]
            }
env.password='jiege520'

@roles('testserver')
def dptest():
    # 定义分发版本的名称和版本号
    with lcd('E:/pro'):
         local('copy  lucky\lucky\config\settings-test.py  lucky\lucky\settings.py /y')
         local('tar zcvf  lk.tar.gz lucky/')
         local('xcopy  lucky\lucky\config\settings-dev.py  lucky\lucky\settings.py /y')
         # 把 tar 压缩包格式的源代码上传到服务器的临时文件夹
         put('./lk.tar.gz','/opt/py-apps/tmp/lk.tar.gz')

      # 创建一个用于解压缩的文件夹，并进入该文件夹

    #判断文件是否存在
    if contains('/opt/py-apps/tmp/','lk.tar.gz'):
        pass

    with cd('/opt/py-apps/tmp/'):
        run('tar -vxzf lk.tar.gz')
        run('rm -rf ../other/*')
        run('mv  ../lucky ../other/')
        run('mv /opt/py-apps/tmp/lucky ../')
        run('rm -rf ../lucky/file')
        run('mv ../other/lucky/file  ../lucky')
    # 安装完成，删除文件夹
    run('rm -rf /opt/py-apps/tmp/lk.tar.gz')
    with cd ('/opt/py-apps/lucky'):
        count=run('ps -ef | grep uwsgi|grep -v grep|wc -l')
        if int(count):
            run('killall -9 uwsgi')
        run('source /opt/python/env/lucky/bin/activate')
        run('uwsgi -i uwsgi.ini')


