<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>


<html>
<head>


    <%@ include file="/WEB-INF/views/include/head.jsp" %>
    <%@ include file="/WEB-INF/views/include/jquery.jsp" %>
    <%@ include file="/WEB-INF/views/include/bootstrap.jsp" %>
    <%@ include file="/WEB-INF/views/include/validate.jsp" %>

    <script type="text/javascript">


        jQuery(document).ready(function () {
            jQuery("#addform").validationEngine({

            });
        });


    </script>
</head>
<body>
<form class="form-horizontal" id="addform" method="post" action="${ctx}/admin/user/add">
    <fieldset>
        <div id="legend" class="">
            <legend class="">增加用户</legend>
        </div>


        <div class="control-group">

            <!-- Text input-->
            <label class="control-label">用户名</label>

            <div class="controls">
                <input type="text" placeholder="" name="userName" id="userName"
                       class="validate[required,minSize[4],maxSize[20],ajax[ajaxNameCallUser]]">

                <p class="help-block">长度4-20</p>
            </div>
        </div>


        <div class="control-group">

            <!-- Text input-->
            <label class="control-label">输入密码</label>

            <div class="controls">

                <input type="password" placeholder="" id="userPassword" name="userPassword"
                       class="validate[required],minSize[4],maxSize[20]">

                <p class="help-block">长度4-20</p>
            </div>
        </div>
        <div class="control-group">

            <!-- Search input-->
            <label class="control-label">再次输入密码</label>

            <div class="controls">
                <input type="password" placeholder="" name="reUserPassword" id="reUserPassword"
                       class="validate[required],minSize[4],maxSize[20],equals[userPassword]">

                <p class="help-block"></p>
            </div>

        </div>
        <div class="control-group">

            <!-- Text input-->
            <label class="control-label">邮箱</label>

            <div class="controls">
                <input type="text" placeholder="" id="email" name="email" class="validate[required,custom[email]]">

                <p class="help-block"></p>
            </div>
        </div>


        <div class="control-group">
            <label class="control-label"></label>

            <!-- Button -->
            <div class="controls">
                <button class="btn btn-success">提交</button>
            </div>
        </div>


    </fieldset>
</form>

</body>
</html>
