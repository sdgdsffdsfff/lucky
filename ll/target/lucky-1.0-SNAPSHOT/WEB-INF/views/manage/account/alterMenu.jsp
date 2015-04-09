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


            $("#alterform").validationEngine({

            });



        });


    </script>
</head>
<body>
<form class="form-horizontal" id="alterform" method="post" action="${ctx}/admin/menu/alter">
    <fieldset>
        <div id="legend" class="">
            <legend class="">修改菜单</legend>
        </div>
        <div class="control-group">

            <!-- Text input-->
            <label class="control-label">父菜单</label>

            <div class="controls">
                <input type="text" placeholder="" name="parentId" id="parentId" value="${menuInfo.parentId}"
                       class="validate[required,custom[integer]]">

                <p class="help-block">长度4-20</p>
            </div>
        </div>

        <div class="control-group">

            <!-- Text input-->
            <label class="control-label">菜单名</label>

            <div class="controls">
                <input type="text" placeholder="" name="menuName" id="menuName" value="${menuInfo.menuName}"
                       class="validate[required,minSize[4],maxSize[20]]">

                <p class="help-block">长度4-20</p>
            </div>
        </div>

        <input type="hidden" value="${menuInfo.id}" name="id"/>
        <div class="control-group">

            <!-- Textarea -->
            <label class="control-label">url</label>
            <div class="controls">
                <div class="textarea">
                    <input type="text" id="url" name="url" value="${menuInfo.url}"/>
                    <p class="help-block">长度4-100</p>
                </div>
            </div>
        </div>
        <div class="control-group">

            <!-- Textarea -->
            <label class="control-label">orders</label>
            <div class="controls">
                <div class="textarea">
                    <input type="text" id="orders" name="orders" value="${menuInfo.orders}"/>
                    <p class="help-block">格式1.1 1.1.2</p>
                </div>
            </div>
        </div>





        <div class="control-group">

            <!-- Text input-->
            <label class="control-label">创建时间</label>

            <div class="controls">

                <label> ${menuInfo.createTime}</label>

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
