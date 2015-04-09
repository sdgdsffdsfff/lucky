<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>


<head>

    <%@ include file="/WEB-INF/views/include/head.jsp"%>
    <%@ include file="/WEB-INF/views/include/jquery.jsp"%>
    <%@ include file="/WEB-INF/views/include/bootstrap.jsp"%>
    <%@ include file="/WEB-INF/views/include/ztree.jsp"%>
    <meta.http-equiv="X-UA-Compatible" content="IE=8">
    <script>
        <%--var setting = {--%>
            <%--view: {--%>
                <%--dblClickExpand: false,--%>
                <%--showLine: true,--%>
                <%--selectedMulti: false--%>
            <%--},--%>
            <%--data: {--%>
                <%--simpleData: {--%>
                    <%--enable:true,--%>
                    <%--idKey: "id",--%>
                    <%--pIdKey: "pId",--%>
                    <%--rootPId: 0--%>
                <%--}--%>
            <%--},--%>
            <%--callback: {--%>
                <%--beforeClick: function(treeId, treeNode) {--%>
                    <%--var zTree = $.fn.zTree.getZTreeObj("tree");--%>
                    <%--if (treeNode.isParent) {--%>
                        <%--zTree.expandNode(treeNode);--%>
                        <%--return false;--%>
                    <%--}--%>
                <%--}--%>
            <%--}--%>
        <%--};--%>

        <%--//排序显示--%>
        <%--var treeNodes=eval('${fns:getMenuToS()}');--%>

        <%--treeNodes.sort(function(a, b){--%>
            <%--return a["order" ] > b["order" ] ? 1 : a["order"] == b[ "order"] ? 0 : -1;--%>
        <%--});--%>

        <%--window.onload = function() {--%>
            <%--alert(treeNodes);--%>
            <%--$.fn.zTree.init($("#userMenu"), setting, treeNodes);--%>

        <%--}--%>

        var setting = {
            view: {
                dblClickExpand: false,
                showLine: true,
                selectedMulti: false
            },

            data: {
                simpleData: {
                    enable: true,
                    idKey: "id",
                    pIdKey: "pId",
                    rootPId: 0
                }
            },
            callback: {
                beforeClick: function (treeId, treeNode) {
                    var zTree = $.fn.zTree.getZTreeObj("tree");
                    if (treeNode.isParent) {
                        zTree.expandNode(treeNode);
                        return false;
                    }
                }
            }
        };

        var nodes = new Array();

        <c:forEach varStatus="" var="menu" items="${menuSet}">

        var foo = {};
        foo.id = ${menu.id};
        foo.pId = ${menu.parentId};
        foo.name = "${menu.menuName}";
        foo.url="/${menu.url}";
        foo.target="mainFrame";
        foo.order="${menu.orders}" ;
        foo.open = false;
        nodes.push(foo);
        </c:forEach>

        var zNodes = JSON.stringify(nodes);

        var treeNodes = eval(zNodes);
        //排序
        treeNodes.sort(function(a, b){
          return a["order" ] > b["order" ] ? 1 : a["order"] == b[ "order"] ? 0 : -1;
        });

        window.onload = function () {


            $.fn.zTree.init($("#userMenu"), setting, treeNodes);

        }

    </script>
</head>

<body>

<div class="nav nav-pills nav-stacked ">
        <div class="nav-pills">

            <ul id="userMenu" class="ztree" style="width:260px; overflow:auto;"></ul>
    </div>
</div>



</body>
</html>
