<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>

<head>
    <%@ include file="/WEB-INF/views/include/head.jsp" %>
    <%@ include file="/WEB-INF/views/include/jquery.jsp" %>
    <%@ include file="/WEB-INF/views/include/bootstrap.jsp" %>
    <%@ include file="/WEB-INF/views/include/validate.jsp" %>

    <script type="text/javascript">


        $(document).ready(function () {


            $("#alterform").validationEngine(
            );


        });


    </script>
</head>
<body>

<form id="alterform" class="form-horizontal" method="post" action="${ctx}/admin/user/alter">
    <fieldset>
        <div id="legend" class="">
            <legend class="">修改用户</legend>
        </div>


        <div class="control-group">

            <!-- Text input-->
            <label class="control-label">用户名</label>

            <div class="controls">
                <label>${userInfo.userName}</label>
                <input type="hidden" value="${userInfo.id}" name="id"/>

            </div>
        </div>


        <div class="control-group">

            <!-- Text input-->
            <label class="control-label">输入密码</label>

            <div class="controls">

                <input type="password" placeholder="" id="userPassword" value="${userInfo.userPassword}"
                       name="userPassword"
                       class="validate[required],minSize[4],maxSize[20]">

                <p class="help-block">长度4-20</p>
            </div>
        </div>
        <div class="control-group">

            <!-- Search input-->
            <label class="control-label">再次输入密码</label>

            <div class="controls">
                <input type="password" placeholder="" name="reUserPassword" value="${userInfo.userPassword}"
                       id="reUserPassword"
                       class="validate[required],minSize[4],maxSize[20],equals[userPassword]">

                <p class="help-block"></p>
            </div>

        </div>
        <div class="control-group">

            <!-- Text input-->
            <label class="control-label">邮箱</label>

            <div class="controls">
                <input type="text" placeholder="" value="${userInfo.email}" id="email" name="email"
                       class="validate[required,custom[email]]">

                <p class="help-block"></p>
            </div>
        </div>


        <div class="control-group">

            <!-- Text input-->
            <label class="control-label">创建时间</label>

            <div class="controls">

                <label> ${userInfo.createTime}</label>

            </div>
        </div>


        <div class="control-group">
            <label class="control-label"></label>

            <!-- Button -->
            <div class="controls">
                <button type="submit" class="btn btn-success">修改</button>
            </div>
        </div>


    </fieldset>
</form>

</body>
</html>
