<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>


<html>
<head>


    <%@ include file="/WEB-INF/views/include/head.jsp" %>
    <%@ include file="/WEB-INF/views/include/jquery.jsp" %>
    <%@ include file="/WEB-INF/views/include/bootstrap.jsp" %>
    <%@ include file="/WEB-INF/views/include/validate.jsp" %>
    <%@ include file="/WEB-INF/views/include/fileupload.jsp"%>

    <script type="text/javascript">


        $(document).ready(function () {


            $("#addform").validationEngine({

            });

            $('#fileupload').fileupload({
                dataType: 'json',

                done: function (e, data) {

                    $("tr:has(td)").remove();
                    $.each(data.result, function (index, file) {
                        $("#pic").val(file.fileName);
                        $("#imgInfo").attr("src", ${ctx}file.fileName);
                        console.log(JSON.stringify(result.result));
                    });
                },

                progressall: function (e, data) {
                    var progress = parseInt(data.loaded / data.total * 100, 10);
                    $('#progress .bar').css(
                            'width',
                            progress + '%'
                    );
                }


            });

        });


    </script>

</head>
<body>
<form class="form-horizontal" id="addform" method="post" action="${ctx}/admin/winUser/alter">
    <fieldset>
        <div id="legend" class="">
            <legend class="">修改中奖人信息</legend>
        </div>

       <input type="hidden" name="id" value="${winUser.id}"/>
        <div class="control-group">

            <!-- Text input-->
            <label class="control-label">用户名</label>

            <div class="controls">
                <input type="text" placeholder="" name="userName" id="userName" value="${winUser.userName }"
                       class="validate[required,minSize[2],maxSize[20]]">

                <p class="help-block">长度2-20</p>
            </div>
        </div>

        <div class="control-group">


            <!-- Text input-->
            <label class="control-label">手机号码</label>

            <div class="controls">
                <input type="text" placeholder="" name="phone" id="phone"  value="${winUser.phone }"
                       class="validate[required]">

                <p class="help-block">必须</p>
            </div>
        </div>


        <div class="control-group">


            <!-- Text input-->
            <label class="control-label">奖品名称</label>

            <div class="controls">
                <input type="text" placeholder="" name="product" id="product"  value="${winUser.product }"
                       class="validate[required]">

                <p class="help-block">必须</p>
            </div>
        </div>

        <div class="control-group">


            <!-- Text input-->
            <label class="control-label">中奖时间</label>

            <div class="controls">
                <input type="text" placeholder="" name="date" id="date"  value="${winUser.date }"
                       class="validate[required]">

                <p class="help-block">必须</p>
            </div>
        </div>


        <%--<div class="control-group">--%>

        <%--<!-- Text input-->--%>
        <%--<label class="control-label">奖品剩余数</label>--%>

        <%--<div class="controls">--%>

        <%--<input type="text" placeholder="" id="remainCount" name="remainCount"--%>
        <%--class="validate[required],custom[integer]">--%>
        <%--</div>--%>
        <%--</div>--%>


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
