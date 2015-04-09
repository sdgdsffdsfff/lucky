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
        function del(id, count) {
            if (count > 0) {
                bootbox.alert("请删除相关的数据后再删除");
            } else {
                bootbox.confirm("是否确认删除?", function (result) {
                    if (result) {
                        location.href = '${pageContext.request.contextPath}' + "/admin/winUser/delete/" + id;
                    }
                });
            }
        }
        function orders(field) {

            var currentPage = '${currentPage}';
            if (currentPage.indexOf("order=") > -1) {
                var reg = new RegExp("order=(.)+($|&|\\s)");
                currentPage = currentPage.replace(reg, "order=" + field);
            } else {
                currentPage = currentPage + "&order=" + field;
            }

            location.href = '${ctx}' + currentPage;
        }
        function setSize(size) {

            var currentPage = '${currentPage}';
            if (currentPage.indexOf("size=") > -1) {
                var reg = new RegExp("size=[0-9]+($|&|\\s)");
                currentPage = currentPage.replace(reg, "");
            }
            currentPage = currentPage + "&size=" + size;

            location.href = '${ctx}' + currentPage;
        }
    </script>

</head>
<body>

<div class="container-fluid">
    <div class="row-fluid">

        <div class="span12">
            <div class="text-left">
                <span class="label label-info"><h10>中奖信息管理</h10></span>
                <a href="${ctx}/admin/winUser/toAdd" class="btn btn-link">增加</a>
            </div>



            <table class="table  table-hover">
                <thead>
                <tr>
                    <th>
                        id
                    </th>
                    <th>
                        用户名
                    </th>

                    <th>
                        奖品名
                    </th>

                    <th>
                        中奖时间
                    </th>
                    <th>
                        手机号码
                    </th>
                    <th>
                        操作
                    </th>


                </tr>
                </thead>
                <tbody>
                <c:forEach var="winUser" items="${winUserList}" varStatus="status">
                    <tr>
                        <td>
                                ${winUser.id}
                        </td>
                        <td>
                             ${winUser.userName}
                        </td>

                        <td>
                                ${winUser.product}
                        </td>
                        <td>
                                ${winUser.phone}
                        </td>
                        <td>
                                ${winUser.date}
                        </td>



                            <td>

                                <a href="${ctx}/admin/winUser/toAlter/${winUser.id}" class="label label-info">修改</a>
                                <a href="javascript:del('${winUser.id}',0);"
                                   data-bb="confirm" class="label label-warning">删除</a>

                            </td>

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
        currentPage: '${winprizePage.number+1}',
        totalPages: '${winprizePage.totalPages}',
        size: 'large',
        alignment: 'center',
        pageUrl: function (type, page, current) {


            return '${ctx}' + currentPage + "&page=" + (page - 1);

        },
        onPageChanged: function (e, oldPage, newPage) {

        }
    }
    $('#page').bootstrapPaginator(options);
    $('#alert-content').text("总共${winprizePage.totalPages}页 ${winprizePage.totalElements}条  每页${winprizePage.size}条");

</script>
</html>
