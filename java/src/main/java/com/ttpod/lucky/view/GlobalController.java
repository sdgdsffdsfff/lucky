package com.ttpod.lucky.view;


import com.ttpod.lucky.dao.PrizeDAO;
import com.ttpod.lucky.service.HeadService;
import com.ttpod.lucky.view.dto.Global;
import com.xyj.manage.tool.PropertiesUtil;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.support.PropertiesLoaderUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.net.URL;
import java.util.Properties;

/**
 * @classDescription:全局设置
 * @author:xiayingjie
 * @createTime:13-11-4 下午8:55
 */

@Controller
@RequestMapping(value = "/admin/global")
public class GlobalController extends BaseController {
    @Autowired
    private PrizeDAO prizeDAO;
    @Autowired
    private HeadService headService;


    //删除
    @RequiresPermissions("admin:global:edit")
    @RequestMapping(value = "toEdit")
    public String toEdit(HttpServletRequest request) {
             Global global=new Global();
        try {
                Properties props = PropertiesLoaderUtils.loadAllProperties("db.properties");
                global.setPicRoot(props.getProperty("pic.root"));
                global.setDrawBase(Integer.parseInt(props.getProperty("draw.base")));
                request.setAttribute("global",global);
                request.setAttribute("remainCount",this.prizeDAO.getRemainNumbers());


        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return "/manage/global";

    }

    //删除
    @RequiresPermissions("admin:global:edit")
    @RequestMapping(value = "edit")
    public String edit(HttpServletRequest request, Global global,int srcBase) throws IOException {

        URL url=Thread.currentThread().getContextClassLoader().getResource("db.properties");
        String path=url.getPath();
        PropertiesUtil.write(path,"pic.root",global.getPicRoot());
        if(global.getDrawBase()!=srcBase){
            PropertiesUtil.write(path,"draw.base",String.valueOf(global.getDrawBase()));
            //更新抽奖号码
            headService.randomWinNum(global.getDrawBase());
            updateGlobal();
        }
        request.setAttribute("remainCount",this.prizeDAO.getRemainNumbers());
        request.setAttribute("msg","修改成功");
        return "/manage/global";
    }


}
