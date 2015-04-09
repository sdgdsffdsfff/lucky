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
<form class="form-horizontal" id="alterform" method="post" action="${ctx}/admin/role/alter">
    <fieldset>
        <div id="legend" class="">
            <legend class="">修改角色</legend>
        </div>


        <div class="control-group">

            <!-- Text input-->
            <label class="control-label">角色名</label>

            <div class="controls">
                <input type="text" placeholder="" name="roleName" id="roleName" value="${roleInfo.roleName}"
                       class="validate[required,minSize[4],maxSize[20]]">

                <p class="help-block">长度4-20</p>
            </div>
        </div>

        <input type="hidden" value="${roleInfo.id}" name="id"/>

        <div class="control-group">

            <!-- Textarea -->
            <label class="control-label">描述</label>
            <div class="controls">
                <div class="textarea">
                    <textarea id="roleInfo" name="roleInfo"
                              class="validate[required],minSize[4],maxSize[100]" >${roleInfo.roleInfo}</textarea>
                    <p class="help-block">长度4-100</p>
                </div>
            </div>
        </div>



        <div class="control-group">

            <!-- Text input-->
            <label class="control-label">创建时间</label>

            <div class="controls">

                <label> ${roleInfo.createTime}</label>

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
