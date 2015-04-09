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
<form class="form-horizontal" id="addform" method="post" action="${ctx}/admin/prize/add">
    <fieldset>
        <div id="legend" class="">
            <legend class="">增加奖品</legend>
        </div>


        <div class="control-group">

            <!-- Text input-->
            <label class="control-label">奖品名</label>

            <div class="controls">
                <input type="text" placeholder="" name="prizeName" id="prizeName"
                       class="validate[required,minSize[2],maxSize[20]]">

                <p class="help-block">长度2-20</p>
            </div>
        </div>


        <div class="control-group">

            <!-- Text input-->
            <label class="control-label">图片url</label>

            <div class="controls">

                <input type="text" placeholder="" id="pic" name="pic" maxlength="200" size="200" width="200"
                       class="input-xlarge validate[required]">

                <p>


                    <input id="fileupload" type="file" name="files[]" data-url="${ctx}/admin/file/upload" multiple>

                <div id="progress">
                    <div class="bar" style="width: 0%;"></div>
                </div>
                <p class="help-block">图片大小100x100</p>
                <img id="imgInfo"  width="100" height="100">

                </p>
            </div>
        </div>

        <div class="control-group">


            <!-- Text input-->
            <label class="control-label">奖品数量</label>

            <div class="controls">
                <input type="text" placeholder="" name="allCount" id="allCount"
                       class="validate[required,custom[integer]]">

                <p class="help-block">必须为整数</p>
            </div>
        </div>
        <div class="control-group">


            <!-- Text input-->
            <label class="control-label">类型</label>

            <div class="controls">
                <input type="text" placeholder="" name="type" id="type"
                       class="validate[required,custom[integer]]">

                <p class="help-block">必须为整数</p>
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
