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
<form class="form-horizontal" id="addform" method="post" action="${ctx}/admin/menu/add">
    <fieldset>
        <div id="legend" class="">
            <legend class="">增加菜单</legend>
        </div>
        <div class="control-group">

            <!-- Text input-->
            <label class="control-label">父菜单id</label>

            <div class="controls">
                <input type="text" placeholder="" name="parentId"  id="parentId" value="${menuId}"
                       class="validate[required,custom[integer]]">

                <p class="help-block">如果为顶级菜单，父菜单id为0</p>
            </div>
        </div>

        <div class="control-group">

            <!-- Text input-->
            <label class="control-label">菜单名</label>

            <div class="controls">
                <input type="text" placeholder="" name="menuName" id="menuName"
                       class="validate[required,minSize[2],maxSize[20]]">

                <p class="help-block">长度2-20</p>
            </div>
        </div>


        <div class="control-group">

            <!-- Text input-->
            <label class="control-label">url</label>

            <div class="controls">

                <input type="text" placeholder="" id="url" name="url">

            </div>
        </div>

        <div class="control-group">

            <!-- Text input-->
            <label class="control-label">排序</label>

            <div class="controls">
                <input type="text" placeholder="" name="orders" id="orders"  value="${orders}."
                       class="validate[required]">

                <p class="help-block">格式1.1 1.1.2</p>
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
