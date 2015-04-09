#!/usr/bin/env python
# -*- coding: utf-8 -*-
from django.contrib import admin
import models
import xadmin
from django.db.models.signals import pre_delete
from django.db.models.signals import pre_save
from django.dispatch.dispatcher import receiver
from db import *



# Register your models here.
class ActivityAdmin(object):
    search_fields = ('name','channel')
    fields = ('name','channel','boildboard','startTime','endTime','details','rule','hint','drawBase')
    list_display = ('id','name','channel','startTime','endTime','channel','drawBase' )
    list_per_page = 15
    save_on_top = True
    #删除或者更新活动是对应的更新缓存
    @receiver(pre_save, sender=models.Activity)
    def _activity_save(sender, instance, *args, **kwargs):
         r.delete('lk_activity_%s'%instance.id)
         r.hdel('lk_drawbase',instance.id)
         #中奖号码缓存
         r.delete('lk_numbers_%s'%instance.id)
    @receiver(pre_delete, sender=models.Activity)
    def _activity_delete(sender, instance, **kwargs):
         r.delete('lk_activity_%s'%instance.id)
         r.hdel('lk_drawbase',instance.id)
         r.delete('lk_numbers_%s'%instance.id)



class PrizeAdmin(object):
    search_fields = ('name')
    fields = ('name','activity','pic','allCount','virCount','details','prizeType','enable')
    list_display = ('name','activity','allCount','remain_count','virCount','prizeType','enable','image_img')
    list_display_links = ('name','enable',)
    list_per_page = 15
    save_on_top = True
    readonly_fields = ('image_img',)
    #删除或者更新奖品是对应的更新缓存
    @receiver(pre_save, sender=models.Prize)
    def _activity_save(sender, instance, *args, **kwargs):
         #中奖号码缓存
         r.delete('lk_numbers_%s'%instance.activity_id)
         r.delete('lk_index_users_%s'%instance.activity_id)
         r.delete('lk_prizes_%s'%instance.activity_id)

    @receiver(pre_delete, sender=models.Prize)
    def _activity_delete(sender, instance, **kwargs):
         r.delete('lk_numbers_%s'%instance.activity_id)
         r.delete('lk_index_users_%s'%instance.activity_id)
         r.delete('lk_prizes_%s'%instance.activity_id)


class WinuserAdmin(object):
    search_fields = ('userName','phone','content')
    fields = ('userName','prize','phone','taid','content','enable','type')
    list_display = ('userName','prize','phone','taid','content','enable')
    list_per_page = 15
    save_on_top = True

    @receiver(pre_delete, sender=models.Winuser)
    def _winuser_delete(sender, instance, **kwargs):
         #中奖号码缓存
         r.delete('lk_numbers_%s'%instance.activity_id)
         #中奖用户列表
         r.delete('lk_winusers_%s'%instance.activity_id)
         r.delete('lk_index_users_%s'%instance.activity_id)
    @receiver(pre_save, sender=models.Winuser)
    def _activity_save(sender, instance, *args, **kwargs):
         #中奖号码缓存
         r.delete('lk_numbers_%s'%instance.activity_id)
         #中奖用户列表
         r.delete('lk_winusers_%s'%instance.activity_id)
         r.delete('lk_index_users_%s'%instance.activity_id)
         #models.Prize.objects.filter(id=p.id).update(remainCount=p.remainCount+1)

class ShareAdmin(object):
    search_fields = ('text')
    fields = ('activity','pic','url','text')
    list_display = ('activity','pic','url','text')
    list_per_page = 15
    save_on_top = True

xadmin.site.register(models.Activity,ActivityAdmin)
xadmin.site.register(models.Prize,PrizeAdmin)
xadmin.site.register(models.Winuser,WinuserAdmin)
xadmin.site.register(models.Share,ShareAdmin)
