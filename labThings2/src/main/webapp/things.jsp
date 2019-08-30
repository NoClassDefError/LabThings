<%@ page pageEncoding="utf-8" %>
<script>
    var textField = "<div class=\"layui-form-item layui-form-text\">\n" +
        "    <label class=\"layui-form-label\">修改介绍</label>\n" +
        "    <div class=\"layui-input-block\">\n        " +
        "<textarea placeholder=\"请输入内容\" name=\"things.description\" class=\"layui-textarea\"></textarea>\n" +
        "    </div>\n" +
        "</div>";

    function showTField() {
        $('#orides').remove();
        $('#description').append(textField);
        //console.log("clicked");
    }

    function deleteLog() {
        layer.confirm('确认删除这条记录？',
            {btn: ['删掉', '取消']},
            function () {
                $('#deletelog').submit();
            }, function () {
                layer.msg('好的不删', {icon: 1});
            });
    }

    layui.use('laydate', function () {
        var laydate = layui.laydate;

        laydate.render({
            elem: '#date' //指定元素
        });
    });
</script>
<form class="layui-form" action="updateThings.action" method="post">
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
        <legend>物品<s:property value="things.thingId"/> <s:property value="things.name"/></legend>
    </fieldset>
    <input type="hidden" name="things.thingId" value="<s:property value="things.thingId"/>"/>
    <input type="hidden" name="things.date" value="<s:property value="things.date"/> "/>
    <input type="hidden" id="orides" name="things.description" value="<s:property value="things.description"/> "/>
    <div class="layui-form-item">
        <label class="layui-form-label">名称</label>

        <div class="layui-input-inline">
            <input type="text" name="things.name" lay-verify="title" autocomplete="off"
                   value="<s:property value="things.name"/>" class="layui-input">
        </div>
        <label class="layui-form-label">类别id</label>
        <div class="layui-input-inline">
            <input type="text" name="catId" lay-verify="title" autocomplete="off"
                   value="<s:property value="things.categoryEnt.id"/>" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item" id="description">
        <blockquote class="layui-elem-quote layui-quote-nm">
            所属类别: <s:property value="things.categoryEnt.id"/> <s:property value="things.categoryEnt.name"/>
            <br>介绍 <s:property value="things.description"/>
            <button type="button" id="buttonDescription"
                    class="layui-btn layui-btn-primary layui-btn-radius layui-btn-sm" onclick="showTField()">点击修改
            </button>
            <br>创建日期 <s:property value="things.date"/>
        </blockquote>
    </div>
    <button type="submit" class="layui-btn layui-btn-primary layui-btn-radius">保存修改</button>
</form>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>物品图片</legend>
</fieldset>
<s:iterator value="category.images" var="image">
    <a href="/root/<s:property value="#image.url"/> "><s:property value="#image.url"/>
    </a><br>
    <img class="layui-upload-img" src="${pageContext.request.contextPath}<s:property value="#image.url"/>">
    <form action="deleteImage.action" method="post">
        <input type="hidden" name="image.imageId" value="<s:property value="#image.imageId"/>"/>
        <button type="submit" class="layui-btn layui-btn-primary layui-btn-radius layui-btn-sm">删除此图片</button>
    </form><br>
</s:iterator>
<div class="layui-upload">
    <form action="addImage.action" enctype="multipart/form-data" method="post">
        <input name="imgFile" type="file">
        <input type="hidden" value="0" name="mode"/>
        <input type="hidden" value="<s:property value="things.thingId"/>" name="id"/>
        <button type="submit" class="layui-btn layui-btn-primary layui-btn-radius layui-btn-sm">
            上传图片
        </button>
    </form>
</div>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>该物品的日志记录</legend>
</fieldset>
<div class="layui-form">
    <table class="layui-table">
        <colgroup>
            <col width="100">
            <col width="150">
            <col>
            <col width="100">
        </colgroup>
        <thead>
        <tr>
            <th>Id</th>
            <th>时间</th>
            <th>描述</th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <s:iterator value="things.logs" var="log">
            <tr>
                <td><s:property value="#log.id"/></td>
                <td><s:property value="#log.date"/></td>
                <td><s:property value="#log.content"/></td>
                <td>
                    <form id="deletelog" action="deleteLog.action" method="post">
                        <input type="hidden" value="<s:property value="#log.id"/>" name="log.id">
                        <button type="button" onclick="deleteLog()"
                                class="layui-btn layui-btn-primary layui-btn-radius layui-btn-sm">
                            删除记录
                        </button>
                    </form>
                </td>
            </tr>
        </s:iterator>
        </tbody>
    </table>
</div>
<div class="layui-form">
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
        <legend>为该物品添加日志</legend>
    </fieldset>
    <form class="layui-form" action="addLog.action" method="post">
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">日志内容</label>
            <div class="layui-input-block">
                <textarea name="log.content" placeholder="请输入内容" class="layui-textarea"></textarea>
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">日期</label>
            <div class="layui-input-inline">
                <input type="text" name="log.date" id="date" lay-verify="date" placeholder="yyyy-MM-dd"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <input type="hidden" name="thingId" value="<s:property value="things.thingId"/>"/>
        <button type="submit" class="layui-btn layui-btn-primary layui-btn-radius layui-btn-sm">添加</button>
    </form>
</div>
