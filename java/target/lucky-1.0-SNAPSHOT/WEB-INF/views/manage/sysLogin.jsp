<%@ page import="org.apache.shiro.authc.IncorrectCredentialsException" %>
<%@ page import="org.apache.shiro.authc.UnknownAccountException" %>
<%@ page import="javax.naming.AuthenticationException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>


    <title>天天动听抽奖后台管理登陆</title>
    <link rel="stylesheet" type="text/css" media="screen" href="${ctx}/static/css/typica-login.css"/>
    <%@ include file="/WEB-INF/views/include/head.jsp" %>
    <%@ include file="/WEB-INF/views/include/jquery.jsp" %>
    <%@ include file="/WEB-INF/views/include/bootstrap.jsp" %>
    <%@ include file="/WEB-INF/views/include/validate.jsp" %>
    <%--<noscript>你的script被禁用了</noscript>    --%>
    <script type="text/javascript">
        function checkCookieAble() {
            if (!navigator.cookieEnabled) {
                alert("你的cookie被禁用了,拒绝访问！");
                return false;
            } else {
                return true;
            }
        }

        window.onload = function () {
            checkCookieAble();
            jQuery("#loginForm").validationEngine({

            });

            if (top.location != self.location) {
                top.location = self.location;
            }


        }


    </script>
</head>

<body>

<div class="navbar navbar-fixed-top">
    <div class="navbar-inner">
        <div class="container">
            <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </a>
            <a class="brand" href="index.html"><img src="${ctx}/static/images/logo.png"></a>
        </div>
    </div>
</div>

<div class="container">

    <div id="login-wraper">
        <form class="form login-form" id="loginForm" name="form1" method="post" action="${ctc}/login"
              onsubmit="return checkCookieAble();">
            <legend><span class="blue">天天动听抽奖管理后台</span></legend>

            <div class="body">
                <div class="input-prepend">
                    <span class="add-on"><i class="icon-user"></i> 用户名</span>
                    <input name="username" type="text" id="username" value=""
                           class="username span3 validate[required,minSize[2],maxSize[20]]"/>
                </div>

                <div class="input-prepend">
                    <span class="add-on"><i class="icon-lock"></i> 密　码</span>
                    <input name="password" type="password" id="password"
                           class="password span3 validate[required,minSize[2],maxSize[20]]"/>
                </div>

                <%--<div class="input-prepend">--%>
                <%--<span class="add-on"><i class="icon-barcode"></i> 验证码</span>--%>
                <%--<input name="captcha" type="text" id="captcha" class="vcode span2 validate[required,ajax[ajaxCaptcha]]" />--%>
                <%--<img title="点击更换" src="${ctx}/stickyImg"  onclick="this.src='<c:url value="/stickyImg"/>?'+Math.random();"    style="border: 1px solid #ccc;" width="80" height="40">--%>
                <%--</div>--%>


            </div>
            <div class="footer">
                <c:if test="${not empty msg}">
                    <span class="error" id="error" style="color: red;">${msg}</span>
                    <c:set var="msg" value="" scope="session"/>
                    <script type="text/javascript">
                        setInterval(function () {
                            document.getElementById("error").style.display = "none";
                        }, 2000);
                    </script>
                </c:if>

                <button type="submit" class="btn btn-success" style="float: right;margin-right: 70px;">登录</button>


                <div class="error">${expMsg} </div>
            </div>

        </form>
    </div>
</div>

</body>
</html>
