package com.xyj.manage.tool;


import com.xyj.manage.entity.Menu;
import com.xyj.manage.entity.UserInfo;
import org.apache.shiro.SecurityUtils;

import java.util.Set;

/**
 * User: xiayingjie
 * Date: 13-9-25
 * Time: 上午10:19
 * To change this template use File | Settings | File Templates.
 */
public class UserUtils {
    /**
     * 获取用户的menu集合
     * @return
     */
    public static Set<Menu> getMenuSet(){

        return (Set<Menu>) SecurityUtils.getSubject().getSession().getAttribute("menuSet");
    }
    /**
     * 获取用户的menu集合
     * @return
     */
    public static String getMenuToS(){
        StringBuffer menuStr=new StringBuffer("");
        Set<Menu> menuSet=getMenuSet();
        if(menuSet!=null){
             menuStr.append("[");
             for(Menu menu:menuSet){
                 menuStr.append( "{\"id\":"+menu.getId()+", \"order\":"+menu.getOrders()+", \"pId\":"+menu.getParentId()+", \"name\":\""+menu.getMenuName()+"\"" +
                         ",\"url\":\"/"+menu.getUrl()+"\" ,\"target\":\"mainFrame\" },");

             }
            menuStr.delete(menuStr.length()-1, menuStr.length()
            );
            menuStr.append("]") ;
        }
        return menuStr.toString();
    }

    /**
     * 获取用户
     * @return
     */
    public static UserInfo getUserInfo(){
        return (UserInfo)SecurityUtils.getSubject().getPrincipal();
    }

}
