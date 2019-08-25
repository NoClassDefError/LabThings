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

function f() {
    $('#description').append(textField);
    //console.log("clicked");
}

function deleteCat() {
    layer.confirm('确认删除本类？',{btn:['确定','取消']},function () {
        $('#deleteId').submit();
    },function () {
        layer.msg('好的不删', {icon: 1});
    });
}