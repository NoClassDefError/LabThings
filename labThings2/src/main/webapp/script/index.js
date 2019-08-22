var data = [];
var layer;
data.push({title: '', id: '', children: '', spread: true});//data的初值应当为空


/**
 *  category通信接口 前端向后台发送当前被点击的节点，后台查找并返回子节点的json后，
 *  前端将其拼接至原来的data内, data只增不减
 *  @param str 必须是字符串格式，子节点的id号
 */
function getData(str) {
    $.ajax({
        url: "http://localhost:8080/labThings2_Web_exploded/category.action",
        data: {
            data: str
        },
        header: {
            'content-type': 'application/x-www-form-urlencoded'
        },
        type: "POST",
        success: function (replacement) {
            console.log(replacement);
            console.log(JSON.parse(replacement));
            replaceNode(str, data, replacement);
        },
        async: false,
        error: function (e) {
            layer.alert("没有子类了");
        }
    });
}

/**
 * @return {boolean}
 */
function IsJsonString(str) {
    try {
        var s = JSON.stringify(str);
        JSON.parse(s);
    } catch (e) {
        return false;
    }
    return true;
}

/**
 * 递归遍历data对象，如果其中有son节点，则将其替换为replacement
 */
function replaceNode(son, data, replacement) {
    for (var i in data) {
        if (JSON.stringify(data[i].id) === "") {
            data[i].children = JSON.parse(replacement);
            return;
        }
        if (JSON.stringify(data[i].id).indexOf(son) !== -1) {
            //data[i]的title属性中是否包含son，包含的话：
            console.log("replaced");
            data[i].children = JSON.parse(replacement);
            return;
        } else if (IsJsonString(data[i].children)) {
            replaceNode(son, data[i].children, replacement);
        }
    }
}

function reloadTree(tree) {
    //基本演示
    tree.render({
        elem: '#test12'
        , data: data
        , showCheckbox: true  //是否显示复选框
        , id: 'demoId1'
        , isJump: true //是否允许点击节点时弹出新窗口跳转
        , click: function (obj) {//节点被单击的事件处理
            var data = obj.data;  //获取当前点击的节点数据
            //getData('');
            //console.log('状态：' + obj.state + '<br>节点数据：' + JSON.stringify(data));
            console.log(data);
            getData(data.id.toString());
            reloadTree(tree);
        }
    });
}

//使用layui库的通用格式，其中，layui.use()是加载对应模块的意思
layui.use(['tree', 'util', 'layer'], function () {
    layer = layui.layer;
    var tree = layui.tree;
    var util = layui.util;
    reloadTree(tree);

    //三个按钮的事件
    util.event('lay-demo', {
        getChecked: function (othis) {
            var checkedData = tree.getChecked('demoId1'); //获取选中节点的数据
            layer.alert(JSON.stringify(checkedData), {shade: 0});

            console.log(checkedData);
        }
        , setChecked: function () {
            tree.setChecked('demoId1', [12, 16]); //勾选指定节点
        }
        , reload: function () {
            //重载实例
            tree.reload('demoId1', {});
        }
    });

});

//注意：导航 依赖 element 模块，否则无法进行功能性操作
layui.use('element', function () {
    var element = layui.element;


});