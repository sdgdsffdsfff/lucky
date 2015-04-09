<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<head>

    <%@ include file="/WEB-INF/views/include/head.jsp"%>
    <%@ include file="/WEB-INF/views/include/jquery.jsp"%>
    <%@ include file="/WEB-INF/views/include/bootstrap.jsp"%>
    <%@ include file="/WEB-INF/views/include/ztree.jsp"%>

    <script>
        var setting = {
            view: {
                dblClickExpand: false,
                showLine: true,
                selectedMulti: false
            },
            check: {
                enable: true
            },
            data: {
                simpleData: {
                    enable:true,
                    idKey: "id",
                    pIdKey: "pId",
                    rootPId: 0
                }
            },
            callback: {
                beforeClick: function(treeId, treeNode) {
                    var zTree = $.fn.zTree.getZTreeObj("tree");
                    if (treeNode.isParent) {
                        zTree.expandNode(treeNode);
                        return false;
                    }
                }
            }
        };

        var nodes = new Array();

        <c:forEach varStatus="" var="menuInfo" items="${menuList}">
        var foo = {};
        foo.id = ${menuInfo.id};
        foo.pId = ${menuInfo.parentId};
        foo.name = "${menuInfo.menuName}";
        <c:forEach items="${role.menus}" var="menu" varStatus="st">
        <c:if test="${menu.id == menuInfo.id }">
        foo.checked = true;
        </c:if>
        </c:forEach>
        foo.open = false;

        nodes.push(foo);
        </c:forEach>
        var zNodes = JSON.stringify(nodes);


        var treeNodes=eval(zNodes);
        window.onload = function() {

            $.fn.zTree.init($("#menuList"), setting, treeNodes);

        }

        function getCheckbox(){
             var treeObj = $.fn.zTree.getZTreeObj("menuList");
             var nodes = treeObj.getCheckedNodes(true);
             for(var i=0;i<nodes.length;i++){
                 $("#check").append("<input type=\"hidden\" name=\"menus\" value=\""+nodes[i].id+"\">");
             }


        }


    </script>
</head>

<body>

<form class="form-horizontal" method="post" action="${ctx}/admin/role/setMenu">
    <ul id="ztree" class="ztree"></ul>
    <fieldset>

        <!-- Form Name -->
        <legend>菜单设置</legend>

        <!-- Multiple Checkboxes -->
        <div class="control-group">
            <label class="control-label">${role.roleName}:</label>

            <div class="controls">
                <div class="zTreeDemoBackground left">
                    <ul id="menuList" class="ztree" style="width:260px; overflow:auto;"></ul>
                </div>
            </div>
        </div>

        <input type="hidden" name="id" value="${role.id}"/>
        <!-- Button -->
        <div class="control-group">
            <label class="control-label" for=""></label>

            <div class="controls">
                <button id="" name="" class="btn btn-success" onclick="getCheckbox();">提交</button>
            </div>
        </div>
        <div id="check"></div>
    </fieldset>
</form>


</body>
</html>
