package com.xyj.manage.view.account;

import com.xyj.manage.entity.Menu;
import com.xyj.manage.service.AccountService;
import com.xyj.manage.service.MenuService;
import com.xyj.manage.tool.ServletUtil;
import com.xyj.manage.tool.query.PropertyFilter;
import com.xyj.manage.tool.query.SpecificationUtil;
import com.xyj.manage.view.dto.QueryDTO;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;
import java.util.Map;

/**
 * @classDescription:
 * @author:xiayingjie
 * @createTime:13-10-15 下午3:34
 */
@Controller
@RequestMapping(value = "/admin/menu")
public class MenuController {
    private String path="/admin/menu";
    @Autowired
    private MenuService menuService;

    //查询所有的结果
    @RequiresPermissions("admin:menu:view")
    @RequestMapping(value={"","list"})
    public String list(HttpServletRequest request, HttpServletResponse response) {

        request.setAttribute("menuList",this.menuService.findAllMenus());
        request.getSession().setAttribute("currentPage",path);
        return "/manage/account/adminMenuList";
    }

    //去增加
    @RequiresPermissions("admin:menu:edit")
    @RequestMapping(value="toAdd/{id}")
    public String toAdd(Model model,@PathVariable("id")int id,String orders) {
        model.addAttribute("menuId",id);
        model.addAttribute("orders",orders);
        return "/manage/account/addMenu";
    }
    //增加
    @RequiresPermissions("admin:menu:edit")
    @RequestMapping(value="add",method = RequestMethod.POST)
    public String toAdd(Menu menuInfo,HttpServletRequest request) {
        menuInfo.setCreateTime(new Date());
        this.menuService.saveMenu(menuInfo);
        //跳转
        String currentPage= (String) request.getSession().getAttribute("currentPage");
        return "redirect:"+currentPage;
    }
    //去修改
    @RequiresPermissions("admin:menu:edit")
    @RequestMapping(value="toAlter/{id}")
    public String toAlter(Model model,@PathVariable("id")int id) {
        Menu menuInfo=this.menuService.findMenuById(id);
        model.addAttribute("menuInfo",menuInfo);
        return "/manage/account/alterMenu";
    }
    //修改
    @RequestMapping(value="alter",method = RequestMethod.POST)
    public String alter(HttpServletRequest request,Menu menuInfo) {
        Menu menu=this.menuService.findMenuById(menuInfo.getId());
        menuInfo.setCreateTime(menu.getCreateTime());
        this.menuService.saveMenu(menuInfo);
        //跳转
        String currentPage= (String) request.getSession().getAttribute("currentPage");
        return "redirect:"+currentPage;
    }
    //删除
    @RequiresPermissions("admin:menu:edit")
    @RequestMapping(value="delete/{id}")
    public String delete(HttpServletRequest request,@PathVariable("id") int id) {

        menuService.deleteMenuById(id);
        //跳转
        String currentPage= (String) request.getSession().getAttribute("currentPage");
        return "redirect:"+currentPage;
    }




}
