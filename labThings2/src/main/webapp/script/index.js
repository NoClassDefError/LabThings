
var data = {title:'root',children:null};//data的初值应当为空
// var data = [{
//     title: '1 江西' //一级菜单
//     , children: [{
//         title: '2 南昌' //二级菜单
//         , children: [{
//             title: '12 高新区', //三级菜单
//             children: {}//…… //以此类推，可无限层级
//         }]
//     }]
// }, {
//     title: '3 陕西' //一级菜单
//     , children: [{
//         title: '4 西安' //二级菜单
//     }]
// }];

/**
 *  category通信接口 前端向后台发送当前被点击的节点，后台查找并返回子节点的json后，
 *  前端将其拼接至原来的data内, data只增不减
 *  @param str 必须是字符串
 */
function getData(str) {
    $.ajax({
        url: "http://localhost:8080/labThings2_war_exploded/category.action",
        data: str,
        type: "POST",
        dataType: "json",
        success: function (replacement) {
            replaceNode(str, data, replacement);
        },
        async: false
    })
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
        if (JSON.stringify(data[i].title).indexOf(son) !== -1) {
            console.log("replaced");
            data[i].children = replacement;
            return;
        } else if (IsJsonString(data[i].children)) {
            replaceNode(son, data[i].children, replacement);
        }
    }
}

//使用layui库的通用格式，其中，layui.use()是加载对应模块的意思
layui.use(['tree', 'util'], function () {
    var tree = layui.tree;
    var layer = layui.layer;
    var util = layui.util;

    //基本演示
    tree.render({
        elem: '#test12'
        , data: data
        , showCheckbox: true  //是否显示复选框
        , id: 'demoId1'
        , isJump: true //是否允许点击节点时弹出新窗口跳转
        , click: function (obj) {//节点被单击的事件处理
            var data = obj.data;  //获取当前点击的节点数据

            layer.msg('状态：' + obj.state + '<br>节点数据：' + JSON.stringify(data));
        }
    });

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