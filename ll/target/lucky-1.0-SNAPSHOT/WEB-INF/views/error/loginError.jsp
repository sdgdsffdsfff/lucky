<%@page import="com.xyj.manage.tool.shiro.CaptchaException"%>
<%@page import="org.apache.shiro.SecurityUtils"%>
<%@page import="org.apache.shiro.subject.Subject"%>
<%@page import="org.apache.shiro.authc.*"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>


<%
    Object obj=request.getAttribute(org.apache.shiro.web.filter.authc.FormAuthenticationFilter.DEFAULT_ERROR_KEY_ATTRIBUTE_NAME);
    AuthenticationException authExp = (AuthenticationException)obj;
    if( authExp != null ){
        String expMsg="";


        if(authExp instanceof UnknownAccountException || authExp instanceof IncorrectCredentialsException){
            expMsg="错误的用户账号或密码！";
        }else if( authExp instanceof CaptchaException){
            expMsg="验证码错误！";
        }else if( obj instanceof LockedAccountException ){
            expMsg= "用户账号已禁用！";
        }else if( obj instanceof ExpiredCredentialsException ){
            expMsg= "用户账号已过期！";
        }else{
            expMsg="登录异常:"+authExp.getMessage() ;
        }

        request.setAttribute("exMesg","账号或者密码错误");
    }
%>