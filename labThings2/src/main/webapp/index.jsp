<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<title>物品管理系统</title>
<link rel="stylesheet" href="css/jquery.treeview.css" type="text/css"/>
<link rel="stylesheet" href="css/screen.css" type="text/css"/>
<link rel="stylesheet" href="css/layui.css" media="all">
<link rel="stylesheet" href="css/global.css" media="all">

<%--使用的库有 jquery 与 layui--%>
<script src="script/jquery3.4.1.js"></script>
<script src="script/jquery.cookie.js"></script>
<script src="script/jquery.treeview.js" type="text/javascript"></script>
<script src="script/layui.js"></script>
<script type="text/javascript">

    var data = [{
        title: '江西' //一级菜单
        , children: [{
            title: '南昌' //二级菜单
            , children: [{
                title: '高新区' //三级菜单
                //…… //以此类推，可无限层级
            }]
        }]
    }, {
        title: '陕西' //一级菜单
        , children: [{
            title: '西安' //二级菜单
        }]
    }];//data的初值应当为空

    function getData(str) {
        // category通信接口 前端向后台发送当前被点击的节点，后台查找并返回子节点的json后，前端将其拼接至原来的data内
        $.ajax({
            url: "",
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
     * 递归遍历data对象，如果其中有son节点，则将其替换为replacement
     */
    function replaceNode(son, data, replacement) {
        for (var i in data) {
            if (data[i].title.indexOf(son) !== -1) {
                data[i].children = replacement;
                return;
            } else try {
                if (typeof JSON.parse(data[i].children) == "object")
                    replaceNode(son, data[i].children);
            } catch (e) {
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

</script>
<body>
<div class="layui-layout layui-layout-admin">
    <%--    顶部导航栏--%>
    <div class="layui-header header header-demo" summer>
        <div class="layui-main">

            <%--            标题--%>
            <a class="logo" href="${pageContext.request.contextPath}/">
                小创实验室物品管理系统
            </a>

            <%--            搜索相关物品或分类--%>
            <div class="layui-form component" lay-filter="LAY-site-header-component">
                <select lay-search="" lay-filter="component">
                    <option value="">搜索物品或分类</option>
                    <option value="element/layout.html">grid 栅格布局</option>
                </select>
                <div class="layui-form-select">
                    <div class="layui-select-title">
                        <input type="text" placeholder="搜索物品或分类" value="" class="layui-input">
                        <i class="layui-edge"></i>
                    </div>
                    <dl class="layui-anim layui-anim-upbit">
                        <dd lay-value="" class="layui-select-tips">搜索物品或分类</dd>
                        <dd lay-value="element/layout.html" class="">grid 栅格布局</dd>

                    </dl>
                </div>
            </div>

            <%-- 添加分类，添加物品，添加记录三个按钮--%>
            <ul class="layui-nav">
                <li class="layui-nav-item ">
                    <a href="/doc/">添加分类<!-- <span class="layui-badge-dot"></span> --></a>
                </li>
                <li class="layui-nav-item layui-this">
                    <a href="/demo/">添加物品<!--  --></a>
                </li>
                <li class="layui-nav-item ">
                    <a href="/doc/">添加记录<span class="layui-badge-dot"></span></a>
                </li>
            </ul>


        </div>
    </div>

    <%--    边缘树状导航栏 --%>
    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <div id="test12" class="demo-tree-more"></div>

        </div>
    </div>

    <%--        主体--%>
    <div class="layui-tab layui-tab-brief" lay-filter="demoTitle">
        <%--        主体顶栏--%>
        <div class="layui-tab-item">
            <div class="layui-btn-container">
                <ul class="layui-tab-title site-demo-title">
                    <li>
                        <button type="button" class="layui-btn layui-btn-sm" lay-demo="getChecked">获取选中节点数据</button>
                    </li>
                    <li>
                        <button type="button" class="layui-btn layui-btn-sm" lay-demo="setChecked">勾选指定节点</button>
                    </li>
                    <li>
                        <button type="button" class="layui-btn layui-btn-sm" lay-demo="reload">重载实例</button>
                    </li>
                </ul>
            </div>
        </div>
        <%--    主体内容--%>
        <div class="layui-body layui-tab-content site-demo site-demo-body">


        </div>
        <%--        脚注--%>
        <div class="layui-footer footer footer-demo">
            <div class="layui-main">
                <p>© 2019 <a href="${pageContext.request.contextPath}/">labThings.com</a> GNU Lisense</p>
                <p>
                    <a href="http://Macswelle@outlook.com" target="_blank">联系作者QQ 1003472560</a>
                    <a href="https://github.com/NoClassDefError/LabThings" target="_blank" rel="nofollow">GitHub</a>
                    <a href="" target="_blank">创新创业实验室</a>
                    <a href="https://electric.ncepu.edu.cn/" target="_blank" rel="nofollow">华北电力大学电气学院</a>
                </p>
            </div>
        </div>
    </div>
</div>
</body>
</html>
