<%@ page pageEncoding="utf-8" %>
<script>
    var textField = "<div class=\"layui-form-item layui-form-text\">\n" +
        "    <label class=\"layui-form-label\">修改介绍</label>\n" +
        "    <div class=\"layui-input-block\">\n        " +
        "<textarea placeholder=\"请输入内容\" name=\"category.description\" class=\"layui-textarea\"></textarea>\n" +
        "    </div>\n" +
        "</div>";

    layui.use('upload', function () {
        var upload = layui.upload;

        //执行实例
        var uploadInst = upload.render({
            elem: '#test1' //绑定元素
            , url: '/upload/' //上传接口
            , done: function (res) {
                //上传完毕回调
            }
            , error: function () {
                //请求异常回调
            }
        });
    });

    function showTField() {
        $('#orides').remove();
        $('#description').append(textField);
        //console.log("clicked");
    }

    function deleteCat() {
        layer.confirm('确认删除本类？这样做很危险，由于Hibernate配置了级联删除，它的信息与物品都会被删除，它的子类将不显示',
            {btn: ['删！', '取消']},
            function () {
                $('#deleteId').submit();
                clearTree();
            }, function () {
                layer.msg('好的不删', {icon: 1});
            });
    }
</script>
<form method="post" action="deleteCategory.action" style="display: none" id="deleteId">
    <input type="hidden" name="category.id" value="<s:property value="category.id"/>">
</form>
<form class="layui-form" action="updateCategory.action" method="post">
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
        <legend>类别<s:property value="category.id"/> <s:property value="category.name"/></legend>
    </fieldset>
    <input type="hidden" name="category.id" value="<s:property value="category.id"/>"/>
    <input type="hidden" name="category.date" value="<s:property value="category.date"/> "/>
    <input type="hidden" name="category.description" id="orides" value="<s:property value="category.description"/>">
    <div class="layui-form-item">
        <label class="layui-form-label">名称</label>
        <div class="layui-input-inline">
            <input type="text" name="category.name" lay-verify="title" autocomplete="off"
                   value="<s:property value="category.name"/>" class="layui-input">
        </div>
        <label class="layui-form-label">父类id</label>
        <div class="layui-input-inline">
            <input type="text" name="category.parentCategory" lay-verify="title" autocomplete="off"
                   value="<s:property value="category.parentCategory"/>" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item" id="description">
        <blockquote class="layui-elem-quote layui-quote-nm">
            介绍 <s:property value="category.description"/>
            <button type="button" id="buttonDescription"
                    class="layui-btn layui-btn-primary layui-btn-radius layui-btn-sm" onclick="showTField()">点击修改
            </button>
            <br>创建日期 <s:property value="category.date"/>
        </blockquote>
    </div>
    <button type="submit" class="layui-btn layui-btn-checked layui-btn-radius"
            style="margin-right: 100px" onclick="clearTree()">
        保存修改
    </button>
    <button type="button" class="layui-btn layui-btn-checked layui-btn-radius"
            style="" onclick="deleteCat()">
        删除本类
    </button>
</form>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>类别图片</legend>
</fieldset>
<%
    Object o = ActionContext.getContext().getValueStack().findValue("category.images[1].url");
    //System.out.println(o);
%>
<s:iterator value="category.images" var="image">
    <%--                    image[0].url:<s:property value="category.images[0].url"/><br>--%>
    <%--                    image.url:<s:property value="#image.url"/><br>--%>
    <%--                    images:<s:property value="category.images"/><br>--%>
    <a href="/root<s:property value="#image.url"/> "><s:property value="#image.url"/>
    </a><br>
    <img class="layui-upload-img" src="/root<s:property value="#image.url"/>" style="width: 30%">
    <form action="deleteImage.action" method="post">
        <input type="hidden" name="image.imageId" value="<s:property value="#image.imageId"/>"/>
        <button type="submit" class="layui-btn layui-btn-primary layui-btn-radius layui-btn-sm">删除此图片</button>
    </form><br>
</s:iterator>
<div class="layui-upload">
    <form action="addImage.action" enctype="multipart/form-data" method="post">
        <input name="imgFile" type="file">
        <input type="hidden" value="1" name="mode"/>
        <input type="hidden" value="<s:property value="category.id"/>" name="id"/>
        <button type="submit" class="layui-btn layui-btn-primary layui-btn-radius layui-btn-sm">上传图片</button>
    </form>
</div>

<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>该类下的物品</legend>
</fieldset>
<div class="layui-form">
    <table class="layui-table">
        <colgroup>
            <col width="100">
            <col width="150">
            <col width="250">
            <col>
        </colgroup>
        <thead>
        <tr>
            <th>物品Id</th>
            <th>物品名称</th>
            <th>时间</th>
            <th>描述</th>
        </tr>
        </thead>
        <tbody>
        <s:iterator value="category.things" var="thing">
            <tr>
                <td>
                    <a href="<s:url action="getThings">
                                               <s:param name="things.thingId"><s:property value="#thing.thingId"/></s:param>
                                             </s:url>">
                        <s:property value="#thing.thingId"/>
                    </a>
                </td>
                <td>
                    <a href="<s:url action="getThings">
                                               <s:param name="things.thingId"><s:property value="#thing.thingId"/></s:param>
                                             </s:url>">
                        <s:property value="#thing.name"/>
                    </a>
                </td>
                <td><s:property value="#thing.date"/></td>
                <td><s:property value="#thing.description"/></td>
            </tr>
        </s:iterator>
        </tbody>
    </table>
</div>