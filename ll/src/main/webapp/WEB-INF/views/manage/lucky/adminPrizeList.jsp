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
                        location.href = '${pageContext.request.contextPath}' + "/admin/prize/delete/" + id;
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
                <span class="label label-info"><h10>奖品管理</h10></span>

            </div>

            <div>


                <form class="form-inline " action="${ctx }/admin/prize/list" method="post">
                    <table class="tab-content">
                        <tr>
                            <td height="25">奖品名</td>
                            <td heigh="25"><input class="form-control" placeholder="输入奖品名" type="text"
                                                  name="search_prizeName__LIKE_S" value="${search_prizeName__LIKE_S}"/>
                            </td>
                            <td height="15">

                            </td>
                            <td>开始时间</td>
                            <td>


                                <input type="text" name="search_createTime__GT_D" id="search_createTime__GT_D"
                                       value="${search_createTime__GT_D}" onClick="WdatePicker()"></td>
                            <td>结束时间</td>
                            <td><input type="text" name="search_createTime__LT_D" id="search_createTime__LT_D"
                                       value="${search_createTime__LT_D}"></td>
                            <td><input class="btn-info" type="submit" value="搜索"/>
                                <shiro:hasPermission name="admin:prize:edit">
                                <a href="${ctx}/admin/prize/toAdd" class="btn btn-link">增加</a>
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
            <a href="javascript:setSize(5)">5</a>
            <a href="javascript:setSize(10)">10</a>
            <a href="javascript:setSize(20)">20</a>
            <a href="javascript:setSize(50)">50</a>

            <table class="table  table-hover">
                <thead>
                <tr>
                    <th>
                        id
                    </th>
                    <th>
                        奖品名称
                    </th>
                    <th>
                        奖品数量

                    </th>
                    <th>
                        奖品剩余数量
                    </th>
                    <th>
                        类型
                    </th>
                    <th>
                        添加时间
                    </th>



                        <th>
                            操作
                        </th>

                </tr>
                </thead>
                <tbody>
                <c:forEach var="prize" items="${prizePage.content}" varStatus="status">
                    <tr>
                        <td>
                                ${prize.id}
                        </td>
                        <td>
                            <a href="${ctx}/admin/winprize/list?search_prize_id__EQ_I=${prize.id}"> ${prize.prizeName}</a>
                        </td>
                        <td>
                                ${prize.allCount}


                        </td>
                        <td>
                                ${prize.remainCount}
                        </td>

                        <td>
                                ${prize.type}
                        </td>
                        <td>
                                ${prize.createTime}
                        </td>


                            <td>





                                <shiro:hasPermission name="admin:prize:edit">
                                <a href="${ctx}/admin/prize/toAlter/${prize.id}" class="label label-info">修改</a>
                                <a href="javascript:del(${prize.id} ,${fn:length(prize.winprizes)});"
                                   data-bb="confirm" class="label label-warning">删除</a>
                                </shiro:hasPermission>
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
        currentPage: '${prizePage.number+1}',
        totalPages: '${prizePage.totalPages}',
        size: 'large',
        alignment: 'center',
        pageUrl: function (type, page, current) {


            return '${ctx}' + currentPage + "&page=" + (page - 1);

        },
        onPageChanged: function (e, oldPage, newPage) {

        }
    }
    $('#page').bootstrapPaginator(options);
    $('#alert-content').text("总共${prizePage.totalPages}页 ${prizePage.totalElements}条  每页${prizePage.size}条");

</script>
</html>
