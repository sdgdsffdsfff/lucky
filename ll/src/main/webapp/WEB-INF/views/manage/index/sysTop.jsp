<%@ page language="java" pageEncoding="utf-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD id=Head1>
    <link rel="stylesheet" type="text/css" media="screen" href="${ctx}/static/bootstrap/2.3.2/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" media="screen" href="${ctx}/static/css/typica-login.css" />

    <TITLE>top</TITLE>
    <STYLE type=text/css>
        * {
            FONT-SIZE: 12px;
            COLOR: white
        }

        #logo {
            COLOR: white
        }

        #logo A {
            COLOR: white
        }

        FORM {
            MARGIN: 0px
        }
    </STYLE>
    <META content="MSHTML 6.00.2900.5848" name=GENERATOR>
    <script type="text/javascript" language="javascript">
        function setTime() {

            var tempDate = new Date();


            year = tempDate.getFullYear();

            month = tempDate.getMonth() + 1;

            day = tempDate.getDate();

            var currentTime = year + "年" + month + "月" + day + "日  ";
            hour = tempDate.getHours();
            minute = tempDate.getMinutes();
            second = tempDate.getSeconds();
            currentTime += hour + ":" + minute + ":" + second + " ";

            myArray = new Array(6);
            myArray[0] = "星期日"
            myArray[1] = "星期一"
            myArray[2] = "星期二"
            myArray[3] = "星期三"
            myArray[4] = "星期四"
            myArray[5] = "星期五"
            myArray[6] = "星期六"
            weekday = tempDate.getDay();

            currentTime += myArray[weekday];


            document.getElementById("htmer_time").innerHTML = currentTime;

        }
        setInterval(setTime, 1000);
    </script>
</HEAD>
<body onload="javascript:setTime();">



<div class="navbar navbar-fixed-top">
    <div class="navbar-inner">
        <div class="container">
            <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </a>
            <a class="brand" href="http://ttpod.com"><img src="${ctx}/static/images/logo.png" ></a>


        <div class="label label-warning"> <shiro:user>你好, <shiro:principal property="userName"/> <a href="${ctx}/logout">退出</a></shiro:user></div>
        <div id="htmer_time" class="label label-info"/></div>
        </div>


</div>



</form>
</body>
</HTML>
