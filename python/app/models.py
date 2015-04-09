#!/usr/bin/env python
# -*- coding: utf-8 -*-
from django.db import models
import django.forms.models
# Create your models here.
from django.db import connection
from db import *
ENABLE_CHOICE = (
    (True,u'上线'),
    (False,u'下线',),
)
class Activity(models.Model):
    name=models.CharField(max_length=50,verbose_name=u'活动名称')
    channel=models.CharField(max_length=50,verbose_name=u'渠道')
    rule=models.TextField(verbose_name=u'活动规则',blank=True)
    details=models.TextField(verbose_name=u'活动介绍',blank=True)
    hint=models.TextField(verbose_name=u'活动提示',blank=True)
    startTime=models.DateTimeField(verbose_name=u'开始时间',null=True)
    endTime=models.DateTimeField(verbose_name=u'结束时间',null=True)
    createTime=models.DateTimeField(verbose_name=u'创建时间',null=True,auto_now=True )
    boildboard=models.ImageField(verbose_name=u'活动图片',upload_to=u'image/')
    drawBase=models.BigIntegerField(verbose_name=u'中奖倍数',)
    def __unicode__(self):
        return self.name
    class Meta:
        ordering = [u'-createTime']
        verbose_name =u'活动'
        verbose_name_plural = u'活动'





class Prize(models.Model):
    PRIZE_TYPE_CHOICE = (
    (0,u'实物'),
    (1,u'彩票'),
    (2,u'话费'),
    )

    name=models.CharField(max_length=50,verbose_name=u'奖品名称')
    activity=models.ForeignKey(Activity)
    pic=models.ImageField(verbose_name=u'奖品图片',upload_to=u'image/')
    allCount=models.IntegerField(max_length=50,verbose_name=u'数量')
    virCount=models.IntegerField(max_length=50,verbose_name=u'对外数量')
    details=models.TextField(verbose_name=u'奖品介绍',blank=True)
    prizeType=models.IntegerField(verbose_name=u'奖品类型',choices=PRIZE_TYPE_CHOICE)
    createTime=models.DateTimeField(verbose_name=u'创建时间',null=True,auto_now=True )
    enable=models.BooleanField(verbose_name=u'上下线',choices=ENABLE_CHOICE)

    def image_img(self):
        if self.pic:
            return u'<img src="%s" height="50" width="50">' % self.pic.url
        else:
            return u'没有图片'
    image_img.short_description = u'图片'
    image_img.allow_tags  = True

    def save(self):
        super(Prize,self).save()

    def remain_count(self):
        sql=''' SELECT pp.allCount-IFNULL(ww.rcount,0) AS icount FROM
            (SELECT  p.id,p.allCount FROM app_prize p WHERE id=%s AND p.enable=1) pp
            LEFT JOIN
              (SELECT  w.prize_id AS wid,COUNT(w.id) AS rcount FROM app_winuser AS w WHERE w.prize_id=%s AND w.enable=1  AND w.type=0 GROUP BY w.prize_id) AS ww
            ON pp.id=ww.wid'''%(self.id,self.id)
        row=query_sql(sql)
        return row[0]
    remain_count.short_description = u'剩余数量'
    remain_count.allow_tags  = True

    def __unicode__(self):
        return self.name

    class Meta:
        ordering = ['-createTime']
        verbose_name =u'奖品'
        verbose_name_plural = u'奖品'


class Winuser(models.Model):
    WIN_ENABLE_CHOICE = (
    (True,u'有效'),
    (False,u'无效',),
    )
    USER_TYPE_CHOICE = (
    (0,u'系统'),
    (1,u'人工',),
    )
    prize=models.ForeignKey(Prize)
    activity=models.ForeignKey(Activity)
    userName=models.CharField(max_length=20,verbose_name=u'中奖用户',blank=True)
    phone=models.CharField(max_length=11,verbose_name=u'手机',blank=True)
    taid=models.CharField(max_length=50,verbose_name=u'用户标示')
    content=models.TextField(verbose_name=u'内容',blank=True)
    createTime=models.DateTimeField(verbose_name=u'创建时间',null=True,auto_now=True )
    enable=models.BooleanField(verbose_name=u'是否失效',choices=WIN_ENABLE_CHOICE)
    type=models.IntegerField(verbose_name=u'类型',choices=USER_TYPE_CHOICE)
    def __unicode__(self):
        return self.userName

    def save(self, *args, **kwargs):
        if not self.id :
            pass
            # Prize.objects.filter(id=self.prize_id).update(remainCount=self.prize.remainCount-1)
        self.activity=self.prize.activity
        super(Winuser,self).save()



    class Meta:
        ordering = ['-createTime']
        verbose_name = u'中奖信息'
        verbose_name_plural = u'中奖信息'

class Share(models.Model):
    activity=models.ForeignKey(Activity)
    pic=models.ImageField(verbose_name=u'分享图片',upload_to=u'image/')
    url=models.CharField(max_length=200,verbose_name=u'下载地址',blank=True)
    text=models.TextField(verbose_name=u'分享内容',blank=True)
    createTime=models.DateTimeField(verbose_name=u'创建时间',null=True,auto_now=True )

    def __unicode__(self):
        return self.text

    class Meta:
        ordering = ['-createTime']
        verbose_name = u'分享'
        verbose_name_plural = u'分享'




