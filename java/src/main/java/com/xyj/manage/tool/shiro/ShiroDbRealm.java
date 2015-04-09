package com.xyj.manage.tool.shiro;

import com.xyj.manage.entity.Action;
import com.xyj.manage.entity.Menu;
import com.xyj.manage.entity.Role;
import com.xyj.manage.entity.UserInfo;
import com.xyj.manage.service.AccountService;
import com.xyj.manage.tool.shiro.CaptchaException;
import com.xyj.manage.tool.shiro.UsernamePasswordCaptchaToken;
import nl.captcha.Captcha;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.HashSet;
import java.util.Set;

/**
 * @classDescription:
 * @author:xiayingjie
 * @createTime:13-10-15 下午3:20
 */

public class ShiroDbRealm extends AuthorizingRealm {
    private static final Logger log = LoggerFactory.getLogger(ShiroDbRealm.class);

    protected AccountService accountService;

    /**
     * 认证回调函数,登录时调用.
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authcToken) throws AuthenticationException {

       // 使用验证码
       // UsernamePasswordCaptchaToken token = (UsernamePasswordCaptchaToken) authcToken;

        // 使用验证码
        UsernamePasswordToken token = (UsernamePasswordToken) authcToken;

        token.isRememberMe();

        UserInfo user = accountService.login(token.getUsername(), String.valueOf(token.getPassword()));
        if (user == null) {
            throw new IncorrectCredentialsException("账号或者密码错误");
        }
        //记住用户登录

        return new SimpleAuthenticationInfo(user, user.getUserPassword(), getName());
    }

    /**
     * 授权查询回调函数, 进行鉴权但缓存中无用户的授权信息时调用.
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {


        UserInfo userInfo = (UserInfo) principals.fromRealm(getName()).iterator().next();


        if (userInfo != null) {
            UserInfo user=this.accountService.findUserById(userInfo.getId());
            if (user != null && user.getRoles() != null) {
                Session session = SecurityUtils.getSubject().getSession();

                //如果用戶已经获取过相关的权限列表直接返回
                if (null != session.getAttribute("authorInfo")) {
                    return (AuthorizationInfo) session.getAttribute("authorInfo");
                }

                SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
                Set<Menu> menuSet = new HashSet<Menu>();


                //增加角色和权限
                for (Role role : user.getRoles()) {
                    info.addRole(role.getRoleName());
                    menuSet.addAll(role.getMenus());
                    for (Action action : role.getActions()) {
                        info.addStringPermission(action.getPath());
                    }
                }
                session.setAttribute("menuSet", menuSet);
                session.setAttribute("authorInfo", info);

                return info;
            }
        }

        return null;
    }


    public void setAccountService(AccountService accountService) {
        this.accountService = accountService;
    }
}

