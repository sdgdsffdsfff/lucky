package com.ttpod.lucky.view;

import com.ttpod.lucky.view.dto.Global;
import com.xyj.manage.tool.EHCacheUtil;
import org.springframework.core.io.support.PropertiesLoaderUtils;

import java.io.IOException;
import java.util.Properties;

/**
 * @classDescription:
 * @author:xiayingjie
 * @createTime:14-4-8
 */
public class BaseController {

    /**
     * 初始化全局变量
     * @return
     */
    public Global initGlobal(){
        Global global=new Global();
        initEcache();

        Object dobj=EHCacheUtil.get("drawBase");
        Object pobj=EHCacheUtil.get("picRoot");
        if(dobj==null||pobj==null){
            Properties props = null;
            try {
                props = PropertiesLoaderUtils.loadAllProperties("db.properties");
            } catch (IOException e) {
                e.printStackTrace();
            }
            EHCacheUtil.put("picRoot",props.getProperty("pic.root"));
            EHCacheUtil.put("drawBase",Integer.parseInt(props.getProperty("draw.base")));

            global.setPicRoot(props.getProperty("pic.root"));
            global.setDrawBase(Integer.parseInt(props.getProperty("draw.base")));
        }else{
            global.setDrawBase(Integer.parseInt(dobj.toString()));
            global.setPicRoot(pobj.toString());
        }

        return global;
    }

    /**
     * 初始化全局变量
     * @return
     */
    public void updateGlobal(){

        initEcache();
        EHCacheUtil.remove("drawBase");
        EHCacheUtil.remove("picRoot");

        initGlobal();
    }

    /**
     * 初始化缓存
     */
    public void initEcache(){
        //获取随机基数
        EHCacheUtil.initCacheManager("/cache/ehcache.xml");
        EHCacheUtil.initCache("lucky");
    }


}
