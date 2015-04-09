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
            $("#checkall").click(function() {
                var arrChk=$("input[name='ids']:checkbox");
                if (this.checked) {
                    for (var i=0;i<arrChk.length;i++)
                    {
                        arrChk[i].checked=true;
                    }
                } else {   //反之 取消全选

                    for (var i=0;i<arrChk.length;i++)
                    {
                       arrChk[i].checked=false;
                    }
                }
            });


        });

        function  delAll(){

            var arrChk=$("input[name='ids']:checked");
            if(arrChk.length==0){
                bootbox.alert("请选择需要删除的项");
            }else{
                ids="";
                for (var i=0;i<arrChk.length;i++)
                {
                    ids=ids+arrChk[i].value+",";
                }


                location.href = '${pageContext.request.contextPath}' + "/admin/winprize/delete/" + ids;
            }
        }

        function del(id, count) {
            if (count > 0) {
                bootbox.alert("请删除相关的数据后再删除");
            } else {
                bootbox.confirm("是否确认删除?", function (result) {
                    if (result) {
                        location.href = '${pageContext.request.contextPath}' + "/admin/winprize/delete/" + id;
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

            </div>

            <div>


                <form class="form-inline " action="${ctx }/admin/winprize/list" method="post">
                    <table class="tab-content">
                        <tr>
                            <td height="25">中奖人</td>
                            <td heigh="25"><input class="form-control" placeholder="输入中奖人" type="text"
                                                  name="search_userName__LIKE_S" value="${search_userName__LIKE_S}"/>
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

                                <a href="javascript:delAll()" id="delAll"
                                   data-bb="confirm" class="label label-warning">批量删除</a>
                                <%--<shiro:hasPermission name="admin:winprize:edit">--%>
                                <%--<a href="${ctx}/admin/winprize/toAdd" class="btn btn-link">增加</a>--%>
                                <%--</shiro:hasPermission>--%>
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

                        <input name="checkall" id="checkall" type="checkbox" value=""  />
                        id
                    </th>
                    <th>
                        奖品名称
                    </th>
                    <th>
                        用户唯一标示

                    </th>
                    <th>
                        中奖人姓名
                    </th>
                    <th>
                        手机号码
                    </th>
                    <th>
                        信息
                    </th>

                    <th>
                        中奖时间
                    </th>
                    <%--<th>--%>
                        <%--操作--%>
                    <%--</th>--%>


                </tr>
                </thead>
                <tbody>
                <c:forEach var="winprize" items="${winprizePage.content}" varStatus="status">
                    <tr>
                        <td>
                            <input name="ids" type="checkbox" value="${winprize.id}" />
                                ${winprize.id}
                        </td>
                        <td>
                             ${winprize.prize.prizeName}
                        </td>
                        <td>
                                ${winprize.taid}


                        </td>
                        <td>
                                ${winprize.userName}
                        </td>
                        <td>
                                ${winprize.phone}
                        </td>
                        <td>
                                ${winprize.content}
                        </td>


                        <td>
                                ${winprize.createTime}
                                    <a href="javascript:del(${winprize.id});"
                                       data-bb="confirm" class="label label-warning">删除</a>
                        </td>


                            <%--<td>--%>

                                <%--<a href="${ctx}/admin/winprize/toAlter/${winprize.id}" class="label label-info">修改</a>--%>
                                <%--<a href="javascript:del(${winprize.id});"--%>
                                   <%--data-bb="confirm" class="label label-warning">删除</a>--%>

                            <%--</td>--%>

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
