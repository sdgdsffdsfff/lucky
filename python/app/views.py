#!/usr/bin/env python
# -*- coding: utf-8 -*-
from django.shortcuts import render

# Create your views here.

from django.contrib.auth.models import User, Group
from models import *

from django.http import HttpResponse
import json
from models import *
from datetime import datetime,date
import random
from django.db.models import Sum
import cPickle as p
from db import *
from django.core.paginator import Paginator



DATATIME='%Y-%m-%d %H:%M:%S'

class ComplexEncoder(json.JSONEncoder):
    def default(self, obj):
        if isinstance(obj, datetime):
            return obj.strftime(DATATIME)
        elif isinstance(obj, date):
            return obj.strftime('%Y-%m-%d')
        else:
            return json.JSONEncoder.default(self, obj)


def initActivity(id):
     act=None
     if r.exists('lk_activity_%s'%id) == False:
         act=Activity.objects.get(id=id)
         if(act!='' and act!=None):
             r.set('lk_activity_%s'%id,p.dumps(act))
     else:
         act=p.loads(r.get('lk_activity_%s'%id))
     return act

def callback(request,map):
        back=request.GET.get('callback', '')
        backjson= json.dumps(map,sort_keys=True,cls=ComplexEncoder)
        if back != '':
            backjson='%s(%s)'%(back,backjson)
        return backjson


def index(request,id):
     map={}
     map['code']=1
     activity=initActivity(id)
     if(activity==None):
          map['msg']=u'不存在此活动'
          return HttpResponse(json.dumps(map))
     map['msg']='ok'
     data={}
     startTime=datetime.strptime(datetime.strftime(activity.startTime,DATATIME),DATATIME)
     endTime=datetime.strptime(datetime.strftime(activity.endTime,DATATIME),DATATIME)
     currentTime=datetime.now()
     if  currentTime < startTime:
           map['msg']=u'活动未开始'
           data['state']=1
     elif currentTime > endTime:
           map['msg']=u'活动已结束'
           data['state']=2
     else:
           map['msg']=u'ok'
           data['state']=0
     data['name']=activity.name
     data['startTime']=activity.startTime
     data['endTime']=activity.endTime
     data['rule']=activity.rule
     data['boildboard']='/file/%s'%str(activity.boildboard)
     # 获取中奖用户
     if r.exists('lk_index_users_%s'%id) == False:
           wins=Winuser.objects.filter(activity_id=id).filter(enable=1).exclude(userName = '')
           paginator = Paginator(wins,5)
           page= paginator.page(1)
           wins=page.object_list
           r.set('lk_index_users_%s'%id,p.dumps(wins))
     wins=p.loads(r.get('lk_index_users_%s'%id))

     users=[]
     for win in wins:
         user={}
         user['user_name']=win.userName
         user['phone']=win.phone
         user['prize']=win.prize.name
         user['date']=win.createTime
         users.append(user)

     map['users']=users
     #获取奖品列表
     if r.exists('lk_prizes_%s'%id) == False:
           pris=Prize.objects.filter(activity_id=id).filter(enable=1)
           r.set('lk_prizes_%s'%id,p.dumps(pris))
     pris=p.loads(r.get('lk_prizes_%s'%id))
     prizes=[]
     for pri in pris:
          prize={}
          prize['name']=pri.name
          prize['details']=pri.details
          prize['count']=pri.virCount
          prizes.append(prize)
     map['prizes']=prizes
     map['data']=data

     bjson=callback(request,map)
     return HttpResponse(bjson)






def draw(request,id,taid):
    map={}
    map['code']=1
    #初始化用户信息
    if r.hexists('lk_users_%s'%id,taid)==False:
        u={'taid':taid,'count':0,'allCount':3}
        r.hset('lk_users_%s'%id,taid,u)
    u=r.hget('lk_users_%s'%id,taid)
    u=eval(u)
    #初始化中奖用户信息
    if  r.exists('lk_winusers_%s'%id) == False:
        wins=Winuser.objects.filter(activity_id=id).filter(enable=1).order_by('createTime')

        for win in wins:
            r.hset('lk_winusers_%s'%id,win.taid,p.dumps(win))
    #初始化中奖号码
    if r.exists('lk_numbers_%s'%id) == False:
        #初始化活动
         act=initActivity(id)
         prizes=Prize.objects.filter(activity_id=id).filter(enable=1)

         #获取奖品剩余数
         sql='''
         SELECT SUM(pp.allCount-IFNULL(ww.rcount,0)) AS icount FROM
            (SELECT  p.id,p.allCount FROM app_prize p WHERE p.activity_id=%s AND p.enable=1) pp
            LEFT JOIN
              (SELECT  w.prize_id AS wid,COUNT(w.id) AS rcount FROM app_winuser AS w WHERE w.activity_id=%s AND w.enable=1  AND w.type=0 GROUP BY w.prize_id) AS ww
            ON pp.id=ww.wid
         '''%(id,id)
         row=query_sql(sql)
         icount=row[0]
         if icount==0:
             r.hset('lk_numbers_%s'%id,-1,-1)
             r.hset('lk_drawbase',id,3)
         else:
             allCount=icount*act.drawBase
             r.hset('lk_drawbase',id,allCount)
             blist = range(0,allCount)
             rds = random.sample(blist, int(icount))


         j=0
         #添加到缓存列表中
         for prize in prizes:
             size=Winuser.objects.filter(prize_id=prize.id).filter(type=0).filter(enable=1).__len__()

             remainCount=range(0,prize.allCount-size)
             for i in remainCount:
                 r.hset('lk_numbers_%s'%id,rds[j],p.dumps(prize))
                 j=j+1


    #查询用户是否中过奖
    data={}
    map['data']=data


    if r.hexists('lk_winusers_%s'%id,taid)==True:
        winuser=r.hget('lk_winusers_%s'%id,taid)
        winuser=p.loads(winuser)
        if winuser.userName == '':
            data['status']=2
            map['msg']=u'中奖未领取'
        else:
            if u['count'] == u['allCount']:
               data['status']=3
               map['msg']=u'抽奖机会已用完'
            else:
               data['status']=0
               map['msg']=u'已经中过奖'
               u['count']=u['count']+1
               r.hset('lk_users_%s'%id,taid,u)

    #判断用户是否符合抽奖条件
    else:
        if u['count'] == u['allCount']:
            data['status']=3
            map['msg']=u'抽奖机会已用完'
        else:
            #抽奖次数+1
             u['count']=u['count']+1
             r.hset('lk_users_%s'%id,taid,u)
             #抽奖
             base=r.hget('lk_drawbase',id)
             ran=random.randint(0, int(base))

             pri=r.hget('lk_numbers_%s'%id,ran)
             if pri==None:
                 data['status']=0
                 map['msg']=u'未中奖'
             else:
                 #中奖 删除中奖池，保存到中奖用户
                 r.hdel('lk_numbers_%s'%id,ran)

                 wuser=Winuser()
                 wuser.taid=taid
                 pri=p.loads(pri)
                 wuser.prize_id=pri.id
                 wuser.type=0
                 wuser.enable=1
                 wuser.save()
                 #重新设置中奖人
                 r.hset('lk_winusers_%s'%id,taid,p.dumps(wuser))

                 data['produce_name']=pri.name
                 data['product_pic']='/file/%s'%str(pri.pic)

                 data['type']=pri.prizeType
                 data['status']=1
                 map['msg']=u'已中奖'
    data['count']=u['count']
    data['all_count']=u['allCount']
    bjson=callback(request,map)
    return HttpResponse(bjson)


def addWinuser(request,id,taid):
    userName=request.GET['userName']
    phone=request.GET['phone']
    content=request.GET['content']
    map={}

    winuser=Winuser.objects.filter(activity_id=id).filter(taid=taid).first()
    if (winuser ==None) or (winuser.userName != ''):
        map['code']=70703
        map['msg']='领奖失败'
    else:
        map['code']=1
        map['msg']='领奖成功'
        winuser.userName=userName
        winuser.phone=phone
        winuser.taid=taid
        winuser.content=content
        winuser.enable=1
        winuser.type=0
        Winuser.save(winuser)
        #领奖后需要清除中奖用户缓存，以及首页中奖信息更改
        r.hset('lk_winusers_%s'%id,taid,p.dumps(winuser))
        r.delete('lk_index_users_%s'%id)

    bjson=callback(request,map)
    return HttpResponse(bjson)

def addDraw(request,id,taid,count):
    map={}
    map['code']=1
    map['msg']='抽奖增加成功'
    user=r.hget('lk_users_%s'%id,taid)
    user=eval(user)
    allCount=user['allCount']
    allCount=allCount+int(count)
    if(allCount>6):
         allCount=6
    user['allCount']=allCount
    r.hset('lk_users_%s'%id,taid,user)
    bjson=callback(request,map)
    return HttpResponse(bjson)


def share(request,id):
    map={}
    map['code']=1
    map['msg']='成功'
    data={}
    id=int(id)
    share=Share.objects.get(activity_id=id)
    if(share!=None):
       data['pic']='/file/%s'%str(share.pic)
       data['text']=share.text
       data['url']=share.url
    map['data']=data
    bjson=callback(request,map)
    return HttpResponse(bjson)

from apscheduler.scheduler import Scheduler
sched = Scheduler(daemonic = False)
@sched.cron_schedule(hour=0, minute=0)
def clean():
     lk_users=r.keys('lk_users_*')
     for user in lk_users :
        print user
        r.delete(user)
sched.start()





