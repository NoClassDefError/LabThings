var data = [];
var layer;
data.push({title: '物品分类树', id: '', children: '', spread: true});//data的初值应当为空

function getCategoryInfo(str) {

    if (str !== "") {
        var form = document.getElementById("hidform");
        var input = document.getElementById("input1");
        input.value = str;
        form.submit();
    }

    // var form1 = document.createElement('form');
    // form1.id = "form1";
    // form1.name = "form1";
    // var input = document.createElement('input');
    // input.type = "text";
    // input.name = "data";
    // input.value = str;
    // form1.appendChild(input);
    // // form 的提交方式
    // form1.method = "POST";
    // // form 提交路径
    // form1.action = "http://localhost:8080/labThings2_Web_exploded/getCategory.action";
    // // 对该 form 执行提交
    // form1.submit();

    // var XHR = new XMLHttpRequest();
    // var urlEncodedData = "";
    // var urlEncodedDataPairs = [];
    // var name;
    // var data = {data: str};
    // // 将数据对象转换为URL编码的键/值对数组。
    // for (name in data) {
    //     urlEncodedDataPairs.push(encodeURIComponent(name) + '=' + encodeURIComponent(data[name]));
    // }
    // // 将配对合并为单个字符串，并将所有%编码的空格替换为
    // // “+”字符；匹配浏览器表单提交的行为。
    // urlEncodedData = urlEncodedDataPairs.join('&').replace(/%20/g, '+');
    // // 建立我们的请求
    // XHR.open('POST', 'http://localhost:8080/labThings2_Web_exploded/getCategory.action');
    // // 为表单数据POST请求添加所需的HTTP头
    // XHR.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    // // 最后，发送我们的数据。
    // XHR.send(urlEncodedData);


    // 不能用ajax，用了它action执行之后页面根本不跳转
    // $.ajax({
    //     url: "http://localhost:8080/labThings2_Web_exploded/getCategory.action",
    //     data: {
    //         data: str
    //     },
    //     header: {
    //         'content-type': 'application/x-www-form-urlencoded'
    //     },
    //     type: "POST",
    //     async: false,
    //     error: function (e) {
    //         layer.alert("未找到该类信息");
    //     }
    // });
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
            //console.log("replaced");
            data[i].children = JSON.parse(replacement);
            return;
        } else if (IsJsonString(data[i].children)) {
            replaceNode(son, data[i].children, replacement);
        }
    }
}

function clearTree() {
    sessionStorage.clear();
    data = [];
    data.push({title: '物品分类树', id: '', children: '', spread: true});//data的初值应当为空
}

function reloadTree(tree) {
    var temp = sessionStorage.getItem('data');
    if (temp != null) {
        console.log('sessionStorage: ' + temp);
        data = JSON.parse(temp);
    }
    //基本演示
    tree.render({
        elem: '#test12'
        , data: data
        , showCheckbox: true  //是否显示复选框
        , id: 'demoId1'
        , isJump: true //是否允许点击节点时弹出新窗口跳转
        , click: function (obj) {//节点被单击的事件处理
            var ndata = obj.data;  //获取当前点击的节点数据
            //getData('');
            //console.log('状态：' + obj.state + '<br>节点数据：' + JSON.stringify(data));
            console.log('ndata:' + ndata);
            getData(ndata.id.toString());
            sessionStorage.setItem('data', JSON.stringify(data));
            reloadTree(tree);
            getCategoryInfo(ndata.id.toString());
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

layui.use('carousel', function(){
    var carousel = layui.carousel;
    //建造实例
    carousel.render({
        elem: '#carousel'
        ,width: '100%' //设置容器宽度
        ,height:'90%'
        ,arrow: 'always' //始终显示箭头
        ,interval: '30000'
        //,anim: 'updown' //切换动画方式
    });
});

//注意：导航 依赖 element 模块，否则无法进行功能性操作
layui.use('element', function () {
    var element = layui.element;


});

function search(){
    $("#search").submit();
}