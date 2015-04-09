<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>

<head>

    <%@ include file="/WEB-INF/views/include/head.jsp" %>
    <%@ include file="/WEB-INF/views/include/jquery.jsp" %>
    <%@ include file="/WEB-INF/views/include/bootstrap.jsp" %>
    <%@ include file="/WEB-INF/views/include/ztree.jsp" %>

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

        <c:forEach varStatus="" var="module" items="${moduleList}">

        var foo = {};
        foo.id = ${module.id};
        foo.pId = 0;
        foo.name = "${module.moduleName}";
        foo.open = false;
        nodes.push(foo);
        <c:forEach varStatus="" var="action" items="${module.actions}">
             var foo = {};
             foo.id = ${action.id};
             foo.pId = ${action.module.id};
             foo.name = "${action.actionName}";
              <c:forEach items="${role.actions}" var="actionInfo" varStatus="st">
                  <c:if test="${action.id == actionInfo.id }">
                      foo.checked = true;
                  </c:if>
               </c:forEach>
             foo.open = false;

             nodes.push(foo);
         </c:forEach>
        </c:forEach>
        var zNodes = JSON.stringify(nodes);


        var treeNodes = eval(zNodes);
        window.onload = function () {

            $.fn.zTree.init($("#actionList"), setting, treeNodes);

        }

        function getCheckbox() {

            var treeObj = $.fn.zTree.getZTreeObj("actionList");
            var nodes = treeObj.getCheckedNodes(true);

            for (var i = 0; i < nodes.length; i++) {
                if(nodes[i].isParent==false){
                  $("#check").append("<input type=\"hidden\" name=\"actions\" value=\"" + nodes[i].id + "\">");
                }
            }


        }


    </script>
</head>

<body>

<form class="form-horizontal" method="post" action="${ctx}/admin/role/setAction">
    <ul id="ztree" class="ztree"></ul>
    <fieldset>

        <!-- Form Name -->
        <legend>权限设置</legend>

        <!-- Multiple Checkboxes -->
        <div class="control-group">
            <label class="control-label">${role.roleName}:</label>

            <div class="controls">
                <div class="zTreeDemoBackground left">
                    <ul id="actionList" class="ztree" style="width:260px; overflow:auto;"></ul>
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
