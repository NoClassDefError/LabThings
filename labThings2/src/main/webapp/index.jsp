<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="script/css/layui.css" media="all">

    <!-- 使用的库有 jquery 与 layui-->
    <script src="script/jquery3.4.1.js"></script>
    <script src="script/layui.js"></script>
    <script src="script/index.js"></script>
    <title>物品管理系统</title>
</head>

<body>
<div class="layui-layout layui-layout-admin">
    <!--    顶部导航栏-->
    <ul class="layui-nav" lay-filter="">
        <li class="layui-nav-item layui-nav-title" style="font-size: 20px;font-family: sans-serif">小创实验室物品管理系统</li>

        <li class="layui-nav-item"><a href="">添加分类</a></li>
        <li class="layui-nav-item"><a href="">添加物品</a></li>
        <li class="layui-nav-item">
            <a href="javascript:">查看记录</a>
            <dl class="layui-nav-child"> <!-- 二级菜单 -->
                <dd><a href="">移动模块</a></dd>
                <dd><a href="">后台模版</a></dd>
                <dd><a href="">电商平台</a></dd>
            </dl>
        </li>
        <li class="layui-nav-item" style="position: absolute;right: 20px;top:10px">
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

                    </dl>
                </div>
            </div>
        </li>
    </ul>

    <!--    边缘树状导航栏，由于数据格式是json，此处使用js进行处理操作，而不是jsp -->
    <div class="layui-side layui-bg-gray" style="display: table;height: 100%;min-width: 200px">
        <div class="layui-side-scroll" style="display: table-cell">
            <div id="test12" class="demo-tree-more"></div>
        </div>
    </div>

    <!--        主体-->
    <div class="layui-tab layui-tab-brief" lay-filter="demoTitle" style="width: available">
        <!--        主体顶栏-->
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
        <!--    主体内容-->
        <div class="layui-body layui-tab-content site-demo site-demo-body">
            <form id="hidform" action="getCategory.action" method="post" style="display: none">
                <input id="input1" type="text" name="data" value="1">
            </form>
            <%
                //在页面中要存有一个“待显示对象”
                //System.out.println("Test:"+request.getAttribute("things"));

                //Things things = (Things) request.getAttribute("things");
                //Category category = (Category) request.getAttribute("category");

            %>
            <s:if test="things==null && category==null">
                主页
            </s:if>
            <s:elseif test="things!=null && category==null">
                查看物品
                <s:property value="things"/>
            </s:elseif>
            <s:else>
                <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                    <legend>查看类别</legend>
                </fieldset>
                <s:actionmessage/>
                id: <s:property value="category.id"/>
                <form class="layui-form" action="">
                    <div class="layui-form-item">
                        <label class="layui-form-label">类别名称</label>
                        <div class="layui-input-block">
                            <input type="text" name="title" lay-verify="title" autocomplete="off"
                                   placeholder="<s:property value="category.name"/>" class="layui-input">
                        </div>
                    </div>
                </form>
                <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                    <legend>类别描述，创建日期</legend>
                </fieldset>
                <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                    <legend>类别图片</legend>
                </fieldset>
                <s:iterator value="category.images" var="image">
                    <a href="<s:property value="image.url"/> "><s:property value="image.url"/>
                    </a><br>
                </s:iterator>
                <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                    <legend>类别日志表格</legend>
                </fieldset>

                <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                    <legend>该类下的物品表格</legend>
                </fieldset>
                <div class="layui-form">
                    <table class="layui-table">
                        <colgroup>
                            <col width="150">
                            <col width="150">
                            <col>
                        </colgroup>
                        <thead>
                        <tr>
                            <th>物品Id</th>
                            <th>物品名称</th>
                            <th>时间</th>
                        </tr>
                        </thead>
                        <tbody>
                        <s:iterator value="category.things" var="thing">
                            <tr>
                                <td>
                                    <a href="http://localhost:8080/labThings2_Web_exploded/getThings.action?data=<s:property value="thing.thingId"/>">
                                        <s:property value="thing.thingId"/>
                                    </a>
                                </td>
                                <td><s:property value="thing.name"/></td>
                                <td><s:property value="thing.date"/></td>
                            </tr>
                        </s:iterator>
                        </tbody>
                    </table>
                </div>
            </s:else>

            <button type="button" class="layui-btn layui-btn-primary layui-btn-radius">保存修改</button>
        </div>
        <!--        脚注-->
        <div class="layui-footer footer footer-demo"
             style="text-align: center;height:unset;background-color: mintcream">
            <div class="layui-main">
                <p>© 2019 <a href="${pageContext.request.contextPath}/">labThings.com</a> GNU License</p>
                <p>
                    <a href="http://Macswelle@outlook.com" target="_blank">联系作者邮箱</a>
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
