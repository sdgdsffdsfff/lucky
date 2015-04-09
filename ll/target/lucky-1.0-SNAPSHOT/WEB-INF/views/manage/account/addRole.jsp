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


            $("#addform").validationEngine({

            });



        });


    </script>
</head>
<body>
<form class="form-horizontal" id="addform" method="post" action="${ctx}/admin/role/add">
    <fieldset>
        <div id="legend" class="">
            <legend class="">增加角色</legend>
        </div>


        <div class="control-group">

            <!-- Text input-->
            <label class="control-label">角色名</label>

            <div class="controls">
                <input type="text" placeholder="" name="roleName" id="roleName"
                       class="validate[required,minSize[4],maxSize[20]]">

                <p class="help-block">长度4-20</p>
            </div>
        </div>


        <div class="control-group">

            <!-- Text input-->
            <label class="control-label">描述</label>

            <div class="controls">

                <input type="text" placeholder="" id="roleInfo" name="roleInfo"
                       class="validate[required],minSize[4],maxSize[100]">
                <p class="help-block">长度4-100</p>
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
