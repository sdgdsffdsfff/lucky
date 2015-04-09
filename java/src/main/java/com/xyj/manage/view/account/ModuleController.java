package com.xyj.manage.view.account;

import com.xyj.manage.entity.Module;
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
@RequestMapping(value = "/admin/module")
public class ModuleController {
    private String path="/admin/module";
    @Autowired
    private ModuleService moduleService;
    //查询
    @RequiresPermissions("admin:module:view")
    @RequestMapping(value={"","list"})
    public String list(HttpServletRequest request, HttpServletResponse response,QueryDTO queryDTO) {

        Map searchMap= ServletUtil.getParametersStartingWith(request, "search");
        //查询结果
        Specification specification=SpecificationUtil.bySearchFilter(searchMap,Module.class);
        PageRequest pageRequest=SpecificationUtil.getPageRequest(queryDTO);
        Page<Module> modulePage = moduleService.findAllModules(specification,pageRequest);
        //获取查询条件
        Map conditionMap=PropertyFilter.parseCondition(searchMap,queryDTO,path);

        PropertyFilter.setAttribute(request,searchMap);
        request.setAttribute("conditionMap",conditionMap);
        request.setAttribute("modulePage", modulePage);
        request.getSession().setAttribute("currentPage",path+"?"+PropertyFilter.parseUrl(searchMap,queryDTO));
        return "/manage/account/adminModuleList";
    }

    //去增加
    @RequiresPermissions("admin:module:edit")
    @RequestMapping(value="toAdd")
    public String toAdd(Model model) {
        return "/manage/account/addModule";
    }
    //增加
    @RequiresPermissions("admin:module:edit")
    @RequestMapping(value="add",method = RequestMethod.POST)
    public String toAdd(Module moduleInfo,HttpServletRequest request) {
        moduleInfo.setCreateTime(new Date());
        this.moduleService.saveModule(moduleInfo);
        //跳转
        String currentPage= (String) request.getSession().getAttribute("currentPage");
        return "redirect:"+currentPage;
    }
    //去修改
    @RequiresPermissions("admin:module:edit")
    @RequestMapping(value="toAlter/{id}")
    public String toAlter(Model model,@PathVariable("id")int id) {
        Module moduleInfo=this.moduleService.findModuleById(id);
        model.addAttribute("moduleInfo",moduleInfo);
        return "/manage/account/alterModule";
    }
    //修改
    @RequiresPermissions("admin:module:edit")
    @RequestMapping(value="alter")
    public String alter(HttpServletRequest request,Module moduleInfo) {
        Module module=this.moduleService.findModuleById(moduleInfo.getId());
        moduleInfo.setCreateTime(module.getCreateTime());
        this.moduleService.saveModule(moduleInfo);
        //跳转
        String currentPage= (String) request.getSession().getAttribute("currentPage");
        return "redirect:"+currentPage;
    }
    //删除
    @RequiresPermissions("admin:module:edit")
    @RequestMapping(value="delete/{id}")
    public String delete(HttpServletRequest request,@PathVariable("id") int id) {
        moduleService.deleteModuleById(id);
        //跳转
        String currentPage= (String) request.getSession().getAttribute("currentPage");
        return "redirect:"+currentPage;
    }




}
