package com.xyj.manage.tool.shiro;

import org.apache.shiro.authc.UsernamePasswordToken;

import javax.security.auth.Subject;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

/**
 * @classDescription:
 * @author:xiayingjie
 * @createTime:13-10-18 下午2:54
 */
public class UsernamePasswordCaptchaToken  extends UsernamePasswordToken {


    public  UsernamePasswordCaptchaToken() {
        super();
    }

    public UsernamePasswordCaptchaToken(String username,String password,boolean rememberMe,String host,String capcha){
        super(username,password,rememberMe,host);
        this.captcha=capcha;
    }




    private static final long serialVersionUID = 1L;

    private String captcha;

    public String getCaptcha() {
        return captcha;
    }

    public void setCaptcha(String captcha) {
        this.captcha = captcha;
    }


}
