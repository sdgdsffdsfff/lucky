package com.ttpod.lucky.view;

import antlr.StringUtils;
import com.ttpod.lucky.entity.Winprize;
import com.ttpod.lucky.view.dto.WinUser;
import com.xyj.manage.entity.UserInfo;
import com.xyj.manage.service.AccountService;
import com.xyj.manage.service.RoleService;
import com.xyj.manage.tool.EHCacheUtil;
import com.xyj.manage.tool.ServletUtil;
import com.xyj.manage.tool.query.PropertyFilter;
import com.xyj.manage.tool.query.SpecificationUtil;
import com.xyj.manage.tool.redis.spring.RedisSpringUtil;
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

import java.util.Map;
import java.util.Map.Entry;

/**
 * @classDescription:
 * @author:xiayingjie
 * @createTime:14-4-11
 */
@Controller
@RequestMapping(value = "/admin/winUser")
public class WinUserController {

    private String path = "/admin/winUser";
    @Autowired
    private RedisSpringUtil redisDAO;

    //查询
    //  @RequiresPermissions("admin:winUser:view")
    @RequestMapping(value = {"", "list"})
    public String list(HttpServletRequest request, HttpServletResponse response, QueryDTO queryDTO) {

        Map map = redisDAO.hGetAll("lk_otherUsers");
        List<WinUser> list = new ArrayList<WinUser>();

        if (null != map) {
            Set set = map.entrySet();

            Iterator iterator = set.iterator();

            while (iterator.hasNext()) {

                Map.Entry mapentry = (Map.Entry) iterator.next();
                list.add((WinUser) mapentry.getValue());
            }
        }

        request.setAttribute("winUserList", list);
        request.getSession().setAttribute("currentPage", path);
        return "/manage/lucky/adminWinUserList";
    }

    //清除缓存
    @RequiresPermissions("admin:prize:edit")
    @RequestMapping(value = {"clear"})
    public void addWinUser(HttpServletRequest request, HttpServletResponse response, String key, String value) {
        if (org.apache.commons.lang3.StringUtils.isBlank(value)) {
            this.redisDAO.delete(key);
        } else {
            this.redisDAO.hDelKey(key,value);
        }

    }

    //去增加
    //  @RequiresPermissions("admin:winUser:edit")
    @RequestMapping(value = "toAdd")
    public String toAdd(Model model) {
        return "/manage/lucky/addWinUser";
    }

    //增加
    //  @RequiresPermissions("admin:winUser:edit")
    @RequestMapping(value = "add", method = RequestMethod.POST)
    public String toAdd(WinUser winUser, HttpServletRequest request) {
        winUser.setId(UUID.randomUUID().toString());
        this.redisDAO.hSet("lk_otherUsers", winUser.getId(), winUser);
        //跳转
        String currentPage = (String) request.getSession().getAttribute("currentPage");
        return "redirect:" + currentPage;
    }

    //去修改
    //  @RequiresPermissions("admin:winUser:edit")
    @RequestMapping(value = "toAlter/{id}")
    public String toAlter(Model model, @PathVariable("id") String id) {
        WinUser winUser = (WinUser) this.redisDAO.hGet("lk_otherUsers", id);
        model.addAttribute("winUser", winUser);
        return "/manage/lucky/alterWinUser";
    }

    //修改
    //  @RequiresPermissions("admin:winUser:edit")
    @RequestMapping(value = "alter", method = RequestMethod.POST)
    public String alter(HttpServletRequest request, WinUser winUser) {

        this.redisDAO.hSet("lk_otherUsers", winUser.getId(), winUser);
        //跳转
        String currentPage = (String) request.getSession().getAttribute("currentPage");
        return "redirect:" + currentPage;
    }

    //删除
    // @RequiresPermissions("admin:winUser:edit")
    @RequestMapping(value = "delete/{id}")
    public String delete(HttpServletRequest request, @PathVariable("id") String id) {
        this.redisDAO.hDelKey("lk_otherUsers", id);
        //跳转
        String currentPage = (String) request.getSession().getAttribute("currentPage");
        return "redirect:" + currentPage;
    }

}
