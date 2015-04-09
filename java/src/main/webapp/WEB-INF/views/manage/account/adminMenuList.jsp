<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>

<html>
<head>
    <%@ include file="/WEB-INF/views/include/head.jsp" %>
    <%@ include file="/WEB-INF/views/include/jquery.jsp" %>
    <%@ include file="/WEB-INF/views/include/bootstrap.jsp" %>
    <%@ include file="/WEB-INF/views/include/treetable.jsp" %>


    <link href="${ctx}/static/css/common.css" rel="stylesheet" type="text/css"/>

    <script type="text/javascript">

        function delUser(id) {
            bootbox.confirm("是否确认删除?", function (result) {
                if (result) {
                    location.href = '${pageContext.request.contextPath}' + "/admin/menu/delete/" + id;
                }
            });
        }
        $(document).ready(function () {
            $("#menuList").treetable({ expandable: true, clickableNodeNames: true});
            $("#abc").treetable({ expandable: true, clickableNodeNames: true});
        });
    </script>

</head>
<body>

<div class="container-fluid">
    <div class="row-fluid">

        <div class="span12">
            <div class="text-left">
                <span class="label label-info"><h10>菜单管理</h10></span>

            </div>


            <table id="menuList" class="table  table-hover">
                <%--<table id="menuList">--%>
                <thead>
                <tr>
                    <th>
                        排序
                    </th>
                    <th>
                        菜单名
                    </th>
                    <th>
                        id
                    </th>
                    <th>
                        url
                    </th>
                    <shiro:hasPermission name="admin:menu:edit">
                        <th>
                            操作
                        </th>
                    </shiro:hasPermission>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="menu" items="${menuList}" varStatus="status">

                    <tr data-tt-id="${menu.id}"   <c:if
                            test="${menu.parentId != 0}"> data-tt-parent-id="${menu.parentId}" </c:if> >
                        <td>
                                ${menu.orders}

                        </td>
                        <td>
                                ${menu.menuName}
                        </td>
                        <td>
                                ${menu.id}
                        </td>

                        <td>
                                ${menu.url}
                        </td>
                        <shiro:hasPermission name="admin:menu:edit">
                            <td>
                                <a href="${ctx}/admin/menu/toAdd/${menu.id}?orders=${menu.orders}"
                                   class="label label-info">增加子菜单</a>
                                <a href="${ctx}/admin/menu/toAlter/${menu.id}" class="label label-info">修改</a>
                                <a href="javascript:delUser(${menu.id});" data-bb="confirm" class="label label-warning">删除</a>

                            </td>
                        </shiro:hasPermission>
                    </tr>


                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

<div id="page">
</div>
<div id="alert-content" class="text-center"></div>

<div class="control-group">


</div>
</body>

</html>
