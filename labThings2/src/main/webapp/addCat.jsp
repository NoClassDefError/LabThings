<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<form class="layui-form" action="updateCategory.action" method="post">
    <div class="layui-inline">
        <div class="layui-form-item">
            <label class="layui-form-label">类别名称</label>
            <div class="layui-input-block">
                <input type="text" name="category.name" required lay-verify="required" placeholder="请输入标题"
                       autocomplete="off" class="layui-input"/>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">搜索父类</label>
            <div class="layui-input-block">
                <select name="category.parentCategory" lay-verify="required" lay-search="">
                    <option value="">直接选择或搜索选择</option>
                    <%--                在此视图上直接使用things对象中的service进行搜索--%>
                    <s:iterator value="#session.list" var="category">
                        <option name="category.parentCategory" value="<s:property value="#category.id"/>">
                            <s:property value="#category.name"/>
                        </option>
                    </s:iterator>
                </select>
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">描述</label>
            <div class="layui-input-block">
                <textarea name="category.description" placeholder="请输入内容" class="layui-textarea"></textarea>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <button type="submit" class="layui-btn" lay-submit lay-filter="formDemo" onclick="clearTree()">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </div>
</form>
