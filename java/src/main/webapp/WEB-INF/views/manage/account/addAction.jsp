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
<form class="form-horizontal" id="addform" method="post" action="${ctx}/admin/action/add">
    <fieldset>
        <div id="legend" class="">
            <legend class="">增加权限</legend>
        </div>


        <div class="control-group">

            <!-- Text input-->
            <label class="control-label">权限名</label>

            <div class="controls">
                <input type="text" placeholder="" name="actionName" id="actionName"
                       class="validate[required,minSize[4],maxSize[20]]">

                <p class="help-block">长度4-20</p>
            </div>
        </div>

        <div class="control-group">

            <!-- Text input-->
            <label class="control-label">权限路径</label>

            <div class="controls">
                <input type="text" placeholder="" name="path" id="path"
                       class="validate[required]">


            </div>
        </div>

        <div class="control-group">

            <!-- Text input-->
            <label class="control-label">排序</label>

            <div class="controls">
                <input type="text" placeholder="" name="orders" id="orders"
                       class="validate[required,custom[integer]]">


            </div>
        </div>
        <div class="control-group">

            <!-- Select Basic -->
            <label class="control-label">模块</label>
            <div class="controls">
                <select name="moduleId" class="input-xlarge">
                   <c:forEach var="module" items="${moduleList}" varStatus="status">
                     <option value="${module.id}">${module.moduleName}</option>
                   </c:forEach>
                   </select>
                </select>
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
