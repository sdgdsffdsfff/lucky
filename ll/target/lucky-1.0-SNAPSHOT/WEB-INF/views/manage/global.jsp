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


            $("#addform").validationEngine({

            });



        });


    </script>
</head>
<body>
<form class="form-horizontal" id="addform" method="post" action="${ctx}/admin/global/edit">
    <fieldset>
        <div id="legend" class="">
            <legend class="">全局配置</legend>
        </div>


        <div class="control-group">

            <!-- Text input-->
            <label class="control-label">cdn图片路径</label>

            <div class="controls">
                <input type="text" placeholder="" name="picRoot" id="picRoot"
                       class="validate[required]" value="${global.picRoot}">

                <p class="help-block">长度4-20</p>
            </div>
        </div>
        <div class="control-group">

            <!-- Text input-->
            <label class="control-label">抽奖基数</label>

            <div class="controls">
                <input type="text" placeholder="" name="drawBase" id="drawBase"
                       class="validate[required custom[integer] min[${remainCount*2}]]" value="${global.drawBase}">
                <input type="hidden" name="srcBase" value="${global.drawBase}">
                <p class="help-block">必须大于${remainCount*2}</p>
            </div>
        </div>

           ${msg}

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
