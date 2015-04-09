package com.xyj.manage.view.account;

import com.xyj.manage.entity.Menu;
import com.xyj.manage.tool.shiro.CaptchaException;
import nl.captcha.Captcha;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.ExpiredCredentialsException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Set;

/**
 * @classDescription:
 * @author:xiayingjie
 * @createTime:13-10-15 下午3:34
 */
@Controller
public class LoginController {
    private static final Logger LOG = LoggerFactory.getLogger(LoginController.class);

    private static final String LOGIN_PAGE = "/manage/sysLogin";
    private static final String LOGIN_INDEX = "/manage/index/sysIndex";


    /**
     * 跳转到登陆页面
     *
     * @return
     */
    @RequestMapping(value = "/login")
    public String login(HttpServletRequest request) {

        Object authExp = request.getAttribute(org.apache.shiro.web.filter.authc.FormAuthenticationFilter.DEFAULT_ERROR_KEY_ATTRIBUTE_NAME);
        if (authExp != null) {
            String expMsg="";
            if(authExp instanceof UnknownAccountException || authExp instanceof IncorrectCredentialsException){
                expMsg="错误的用户账号或密码！";
            }else if( authExp instanceof CaptchaException){
                expMsg="验证码错误！";
            }else if( authExp instanceof LockedAccountException){
                expMsg= "用户账号已禁用！";
            }else if( authExp instanceof ExpiredCredentialsException){
                expMsg= "用户账号已过期！";
            }else{
                expMsg="登录账号或密码不正确" ;
            }
            request.setAttribute("expMsg",expMsg);
        }
        if (!SecurityUtils.getSubject().isAuthenticated()) {
            return LOGIN_PAGE;
        }


        return "redirect:/admin/index";
    }

    /**
     * 首页
     *
     * @return
     */
    @RequiresPermissions("index")
    @RequestMapping(value = "/admin/index")
    public String index(HttpServletRequest request, HttpServletResponse response) {

        if (!SecurityUtils.getSubject().isAuthenticated()) {
            return LOGIN_PAGE;
        }
        Set<Menu> menuSet = (Set<Menu>) SecurityUtils.getSubject().getSession().getAttribute("menuSet");

        request.setAttribute("menuSet", menuSet);


        return LOGIN_INDEX;
    }

    /**
     * 退出
     *
     * @return
     */
    @RequestMapping(value = "/logout")
    public String logout(HttpServletRequest request, HttpServletResponse response) {

        SecurityUtils.getSubject().logout();

        return LOGIN_PAGE;
    }

    /**
     * 跳转到相应的error页面
     *
     * @return
     */
    @RequestMapping(value = "/jsp/error/{path}")
    public String error(HttpServletRequest request, HttpServletResponse response, @PathVariable("path") String path) {
        return "/error/" + path;
    }

    /**
     * 跳转到相应的framset页面
     *
     * @return
     */
    @RequestMapping(value = "/jsp/index/{path}")
    public String framset(HttpServletRequest request, HttpServletResponse response, @PathVariable("path") String path) {
        return "/manage/index/" + path;
    }

    //检测用户名
    @RequestMapping(value = "/checkCaptcha")
    public String checkUserName(HttpServletRequest request, HttpServletResponse response, String fieldId, String fieldValue) throws IOException {
        Captcha scaptcha = (Captcha) request.getSession().getAttribute(
                Captcha.NAME);
        String simpleCaptcha = scaptcha.getAnswer();
        boolean flag = true;
        if (!simpleCaptcha.equals(fieldValue)) {
            flag = false;
        }
        String out = "{\"jsonValidateReturn\":[\"" + fieldId + "\"," + flag + "]}";

        response.getWriter().write(out);

        return null;

    }
}
