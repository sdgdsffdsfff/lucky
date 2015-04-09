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


        });


    </script>
</head>
<body>
<form class="form-horizontal" method="post" action="${ctx}/admin/user/setRole">
    <fieldset>

        <!-- Form Name -->
        <legend>角色设置</legend>

        <!-- Multiple Checkboxes -->
        <div class="control-group">
            <label class="control-label">${user.userName}:</label>

            <div class="controls">
                <c:forEach var="role" items="${roleList}">
                    <label class="checkbox">
                        <input type="checkbox" name="roles" id="roles" value="${role.id}"

                        <c:forEach items="${user.roles}" var="roleInfo" varStatus="st">
                        <c:if test="${role.id==roleInfo.id }">
                               checked
                        </c:if>
                        </c:forEach>

                                >
                            ${role.roleName}
                    </label>
                </c:forEach>
            </div>
        </div>
        <input type="hidden" name="id" value="${user.id}"/>
        <!-- Button -->
        <div class="control-group">
            <label class="control-label" for=""></label>

            <div class="controls">
                <button id="" name="" class="btn btn-success">提交</button>
            </div>
        </div>

    </fieldset>
</form>


</body>
</html>
