package com.xyj.manage.view.account;

import com.xyj.manage.entity.Action;
import com.xyj.manage.entity.Module;
import com.xyj.manage.service.ActionService;
import com.xyj.manage.service.ModuleService;
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
import java.util.Date;
import java.util.Map;

/**
 * @classDescription:
 * @author:xiayingjie
 * @createTime:13-10-15 下午3:34
 */
@Controller
@RequestMapping(value = "/admin/action")
public class ActionController {
    private String path="/admin/action";
    @Autowired
    private ActionService actionService;

    @Autowired
    private ModuleService moduleService;
    //查询
    @RequiresPermissions("admin:action:view")
    @RequestMapping(value={"","list"})
    public String list(HttpServletRequest request, HttpServletResponse response,QueryDTO queryDTO) {

        Map searchMap= ServletUtil.getParametersStartingWith(request, "search");
        //查询结果
        Specification specification=SpecificationUtil.bySearchFilter(searchMap,Action.class);
        PageRequest pageRequest=SpecificationUtil.getPageRequest(queryDTO);
        Page<Action> actionPage = actionService.findAllActions(specification,pageRequest);
        //获取查询条件
        Map conditionMap=PropertyFilter.parseCondition(searchMap,queryDTO,path);

        PropertyFilter.setAttribute(request,searchMap);
        request.setAttribute("conditionMap",conditionMap);
        request.setAttribute("actionPage", actionPage);
        request.getSession().setAttribute("currentPage",path+"?"+PropertyFilter.parseUrl(searchMap,queryDTO));
        return "/manage/account/adminActionList";
    }

    //去增加
    @RequiresPermissions("admin:action:edit")
    @RequestMapping(value="toAdd")
    public String toAdd(Model model) {
        model.addAttribute("moduleList",this.moduleService.findAllModules());
        return "/manage/account/addAction";
    }
    //增加
    @RequiresPermissions("admin:action:edit")
    @RequestMapping(value="add",method = RequestMethod.POST)
    public String toAdd(Action actionInfo,HttpServletRequest request,int moduleId) {
        actionInfo.setCreateTime(new Date());
        actionInfo.setModule(this.moduleService.findModuleById(moduleId));
        this.actionService.saveAction(actionInfo);

        //跳转
        String currentPage= (String) request.getSession().getAttribute("currentPage");
        return "redirect:"+currentPage;
    }
    //去修改
    @RequiresPermissions("admin:action:edit")
    @RequestMapping(value="toAlter/{id}")
    public String toAlter(Model model,@PathVariable("id")int id) {
        Action actionInfo=this.actionService.findActionById(id);
        model.addAttribute("moduleList",this.moduleService.findAllModules());
        model.addAttribute("actionInfo",actionInfo);
        return "/manage/account/alterAction";
    }
    //修改
    @RequiresPermissions("admin:action:edit")
    @RequestMapping(value="alter")
    public String alter(HttpServletRequest request,Action actionInfo,int moduleId) {
        Action action=this.actionService.findActionById(actionInfo.getId());
        actionInfo.setModule(this.moduleService.findModuleById(moduleId));
        actionInfo.setCreateTime(action.getCreateTime());
        this.actionService.saveAction(actionInfo);
        //跳转
        String currentPage= (String) request.getSession().getAttribute("currentPage");
        return "redirect:"+currentPage;
    }
    //删除
    @RequiresPermissions("admin:action:edit")
    @RequestMapping(value="delete/{id}")
    public String delete(HttpServletRequest request,@PathVariable("id") int id) {
        actionService.deleteActionById(id);
        //跳转
        String currentPage= (String) request.getSession().getAttribute("currentPage");
        return "redirect:"+currentPage;
    }




}
