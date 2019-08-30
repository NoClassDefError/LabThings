<%@ page import="com.opensymphony.xwork2.ActionContext" %>
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
        <li class="layui-nav-item layui-nav-title" style="font-size: 20px;font-family: sans-serif">
            <a href="<s:url action="index"/>" style="font-size: large;color: white">小创实验室物品管理系统</a>
        </li>
        <li class="layui-nav-item" style="z-index: 9999">
            <a href="<s:url action="addCat"/>">添加分类</a>
            <dl class="layui-nav-child">
                <dd>
                    <%@include file="addCat.jsp" %>
                </dd>
            </dl>
        </li>
        <li class="layui-nav-item" style="z-index: 9999">
            <a href="<s:url action="addThings"/>">添加物品</a>
            <dl class="layui-nav-child">
                <dd>
                    <%@include file="addthings.jsp" %>
                </dd>
            </dl>
        </li>
        <%--        <li class="layui-nav-item">--%>
        <%--            <a href="javascript:">查看记录</a>--%>
        <%--            <dl class="layui-nav-child"> <!-- 二级菜单 -->--%>
        <%--                <dd><a href="">移动模块</a></dd>--%>
        <%--                <dd><a href="">后台模版</a></dd>--%>
        <%--                <dd><a href="">电商平台</a></dd>--%>
        <%--            </dl>--%>
        <%--        </li>--%>
        <li class="layui-nav-item" style="position: absolute;right: 20px;top:10px;z-index: 9999">
            <div class="layui-form component" lay-filter="LAY-site-header-component">
                <form action="getCategory.action" method="post" id="search">
                    <div class="layui-input-inline">
                        <select name="catId" lay-verify="required" lay-search="">
                            <option value="">搜索分类</option>
                            <%--                在此视图上直接使用things对象中的service进行搜索--%>
                            <s:iterator value="#session.categoryService.getCategories()" var="category">
                                <option onclick="search()" value="<s:property value="#category.id"/>">
                                    <s:property value="#category.name"/>
                                </option>
                            </s:iterator>
                        </select>
                    </div>
                </form>
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
            <s:if test="mode==1">
                <%@include file="addthings.jsp" %>
            </s:if>
            <s:elseif test="mode==2">
                <%@include file="addCat.jsp" %>
            </s:elseif>
            <s:elseif test="things==null && category==null">
                <div class="layui-carousel" id="carousel">
                    <div carousel-item>
                        <div><img src="img/img1.jpg" align="center"></div>
                        <div><img src="img/img2.jpg" align="center"></div>
                        <div><img src="img/img5.jpg" align="center"></div>
                        <div><img src="img/img4.gif" align="center"></div>
                    </div>
                </div>
            </s:elseif>
            <s:elseif test="things!=null && category==null">
                <%@include file="things.jsp" %>
            </s:elseif>
            <s:else>
                <%@include file="category.jsp" %>
            </s:else>
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
                    <img src="img/img3.jpg" width="80px">
                </p>
            </div>
        </div>
    </div>
</div>
</body>
</html>
