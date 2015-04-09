<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>

<html>
<head>
    <%@ include file="/WEB-INF/views/include/head.jsp" %>
    <%@ include file="/WEB-INF/views/include/jquery.jsp" %>
    <%@ include file="/WEB-INF/views/include/bootstrap.jsp" %>
    <%@ include file="/WEB-INF/views/include/page.jsp" %>
    <%@ include file="/WEB-INF/views/include/picker.jsp" %>
    <link href="${ctx}/static/css/common.css" rel="stylesheet" type="text/css"/>

    <script type="text/javascript">
        $(function () {
            $("#search_createTime__GT_D").datepicker();
            $("#search_createTime__LT_D").datepicker();
        });
        function delUser(id) {
            bootbox.confirm("是否确认删除?", function (result) {
                if (result) {
                    location.href = '${pageContext.request.contextPath}' + "/admin/module/delete/" + id;
                }
            });
        }
    </script>

</head>
<body>

<div class="container-fluid">
    <div class="row-fluid">

        <div class="span12">
            <div class="text-left">
                <span class="label label-info"><h10>模块管理</h10></span>

            </div>

            <div>


                <form class="form-inline " action="${ctx }/admin/module/list" method="post">
                    <table class="tab-content">
                        <tr>
                            <td height="25">模块名</td>
                            <td heigh="25"><input class="form-control" placeholder="输入模块名" type="text"
                                                  name="search_moduleName__LIKE_S"
                                                  value="${search_moduleName__LIKE_S}"/></td>
                            <td>开始时间</td>
                            <td>


                                <input type="text" name="search_createTime__GT_D" id="search_createTime__GT_D"
                                       value="${search_createTime__GT_D}" onClick="WdatePicker()"></td>
                            <td>结束时间</td>
                            <td><input type="text" name="search_createTime__LT_D" id="search_createTime__LT_D"
                                       value="${search_createTime__LT_D}"></td>
                            <td><input class="btn-info" type="submit" value="搜索"/>
                                <shiro:hasPermission name="admin:module:edit">
                                <a href="${ctx}/admin/module/toAdd" class="btn btn-link">增加</a>
                                </shiro:hasPermission>
                        </tr>
                        <tr>
                            <td height="22" colspan="7">
                                <em>筛选：</em>
                                <c:forEach items="${conditionMap}" var="map">
                                    <a title="取消" class="delete" href="${map.value}">
                                        <em>${map.key}</em>
                                    </a>
                                </c:forEach>

                            </td>
                        </tr>
                    </table>
                </form>


            </div>

            <table class="table  table-hover">
                <thead>
                <tr>
                    <th>
                        id
                    </th>
                    <th>
                        模块名
                    </th>
                    <th>
                        描述信息
                    </th>
                    <th>
                        注册时间
                    </th>
                    <shiro:hasPermission name="admin:module:edit">
                        <th>
                            操作
                        </th>
                    </shiro:hasPermission>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="module" items="${modulePage.content}" varStatus="status">
                    <tr>
                        <td>
                                ${module.id}
                        </td>
                        <td>
                            <a href="${ctx}/admin/action/list?search_module_id__EQ_I=${module.id}">${module.moduleName}</a>
                        </td>
                        <td>
                                ${module.moduleInfo}
                        </td>
                        <td>
                                ${module.createTime}
                        </td>
                        <shiro:hasPermission name="admin:module:edit">
                            <td>
                                <a href="${ctx}/admin/module/toAlter/${module.id}" class="label label-info">修改</a>
                                <a href="javascript:delUser(${module.id});" data-bb="confirm"
                                   class="label label-warning">删除</a>

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
<script type='text/javascript'>

    var currentPage = '${currentPage}';
    var reg = new RegExp("page=[0-9]+&");
    var currentPage = currentPage.replace(reg, "");

    var options = {
        currentPage: '${modulePage.number+1}',
        totalPages: '${modulePage.totalPages}',
        size: 'large',
        alignment: 'center',
        pageUrl: function (type, page, current) {


            return '${ctx}' + currentPage + "&page=" + (page - 1);

        },
        onPageChanged: function (e, oldPage, newPage) {

        }
    }
    $('#page').bootstrapPaginator(options);
    $('#alert-content').text("总共${modulePage.totalPages}页 ${modulePage.totalElements}条  每页${modulePage.size}条");

</script>
</html>
