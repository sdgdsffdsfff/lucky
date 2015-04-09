package com.xyj.manage.view.account;

import com.xyj.manage.entity.Action;
import com.xyj.manage.entity.Menu;
import com.xyj.manage.entity.Role;
import com.xyj.manage.service.ActionService;
import com.xyj.manage.service.MenuService;
import com.xyj.manage.service.ModuleService;
import com.xyj.manage.service.RoleService;
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
import java.util.*;

/**
 * @classDescription:
 * @author:xiayingjie
 * @createTime:13-10-15 下午3:34
 */
@Controller
@RequestMapping(value = "/admin/role")
public class RoleController {
    private String path="/admin/role";
    @Autowired
    private RoleService roleService;

    @Autowired
    private MenuService menuService;

    @Autowired
    private ModuleService moduleService;



    //查询
    @RequiresPermissions("admin:role:view")
    @RequestMapping(value={"","list"})
    public String list(HttpServletRequest request, HttpServletResponse response,QueryDTO queryDTO) {

        Map searchMap= ServletUtil.getParametersStartingWith(request, "search");
        //查询结果
        Specification specification=SpecificationUtil.bySearchFilter(searchMap,Role.class);
        PageRequest pageRequest=SpecificationUtil.getPageRequest(queryDTO);
        Page<Role> rolePage = roleService.findAllRoles(specification,pageRequest);
        //获取查询条件
        Map conditionMap=PropertyFilter.parseCondition(searchMap,queryDTO,path);

        PropertyFilter.setAttribute(request,searchMap);
        request.setAttribute("conditionMap",conditionMap);
        request.setAttribute("rolePage", rolePage);
        request.getSession().setAttribute("currentPage",path+"?"+PropertyFilter.parseUrl(searchMap,queryDTO));
        return "/manage/account/adminRoleList";
    }

    //去增加
    @RequiresPermissions("admin:role:edit")
    @RequestMapping(value="toAdd")
    public String toAdd(Model model) {
        return "/manage/account/addRole";
    }
    //增加
    @RequiresPermissions("admin:role:edit")
    @RequestMapping(value="add",method = RequestMethod.POST)
    public String toAdd(Role roleInfo,HttpServletRequest request) {
        roleInfo.setCreateTime(new Date());
        this.roleService.saveRole(roleInfo);
        //跳转
        String currentPage= (String) request.getSession().getAttribute("currentPage");
        return "redirect:"+currentPage;
    }
    //去修改
    @RequiresPermissions("admin:role:edit")
    @RequestMapping(value="toAlter/{id}")
    public String toAlter(Model model,@PathVariable("id")int id) {
        Role roleInfo=this.roleService.findRoleById(id);
        model.addAttribute("roleInfo",roleInfo);
        return "/manage/account/alterRole";
    }
    //修改
    @RequiresPermissions("admin:role:edit")
    @RequestMapping(value="alter",method = RequestMethod.POST)
    public String alter(HttpServletRequest request,Role roleInfo ) {
        Role role=this.roleService.findRoleById(roleInfo.getId());
        roleInfo.setCreateTime(role.getCreateTime());
        this.roleService.saveRole(roleInfo);
        //跳转
        String currentPage= (String) request.getSession().getAttribute("currentPage");
        return "redirect:"+currentPage;
    }
    //删除
    @RequiresPermissions("admin:role:edit")
    @RequestMapping(value="delete/{id}")
    public String delete(HttpServletRequest request,@PathVariable("id") int id) {
        roleService.deleteRoleById(id);
        //跳转
        String currentPage= (String) request.getSession().getAttribute("currentPage");
        return "redirect:"+currentPage;
    }

    //去设置菜单
    @RequiresPermissions("admin:role:edit")
    @RequestMapping(value = "toSetMenu/{id}")
    public String toSetMenu(HttpServletRequest request, @PathVariable("id") int id) {
        Role role= this.roleService.findRoleById(id);
        if (role != null) {
            request.setAttribute("role", role);
        }
        List<Menu> menuList = menuService.findAllMenus();

        request.setAttribute("menuList",menuList);

        return "/manage/account/setMenu";
    }

    //设置菜单
    @RequiresPermissions("admin:role:edit")
    @RequestMapping(value = "setMenu")
    public String setMenu(HttpServletRequest request, String[] menus, int id) {
        Role role =roleService.findRoleById(id);

        Set menuSet = new HashSet();
        if (role != null) {
            if (menus != null) {
                for (String menuId : menus) {
                    Menu menu = new Menu();
                    menu.setId(Integer.parseInt(menuId));
                    menuSet.add(menu);
                }
            }

            role.setMenus(menuSet);
            roleService.saveRole(role);
        }

        //跳转
        String currentPage = (String) request.getSession().getAttribute("currentPage");
        return "redirect:" + currentPage;
    }

    //去设置权限
    @RequiresPermissions("admin:role:edit")
    @RequestMapping(value = "toSetAction/{id}")
    public String toSetAction(HttpServletRequest request, @PathVariable("id") int id) {
        Role role= this.roleService.findRoleById(id);
        if (role != null) {
            request.setAttribute("role", role);
        }
        request.setAttribute("moduleList",moduleService.findAllModules());

        return "/manage/account/setAction";
    }

    //设置权限
    @RequiresPermissions("admin:role:edit")
    @RequestMapping(value = "setAction")
    public String setAction(HttpServletRequest request, String[] actions, int id) {
        Role role =roleService.findRoleById(id);

        Set actionSet = new HashSet();
        if (role != null) {
            if (actions != null) {
                for (String actionId : actions) {
                    Action action = new Action();
                    action.setId(Integer.parseInt(actionId));
                    actionSet.add(action);
                }
            }

            role.setActions(actionSet);
            roleService.saveRole(role);
        }

        //跳转
        String currentPage = (String) request.getSession().getAttribute("currentPage");
        return "redirect:" + currentPage;
    }


}
