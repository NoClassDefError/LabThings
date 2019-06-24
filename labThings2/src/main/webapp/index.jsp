<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
<h2>intellij中使用 maven整合 SSH框架</h2>

<a href="https://blog.csdn.net/sysushui/article/details/73722870?locationNum=11&fps=1#">参考教程</a>
<pre>
    步骤：
1.新建项目时选择maven项目，选择ssh框架模板工具包（archetypes）
但没有现成的官方SSH模板，可以创建一个空的再自行添加依赖并配置目录结构，内容详见
<a href="file://C:\Users\DELL\Desktop\code\labThings\labThings2\pom.xml">pom.xml</a>
在pom.xml中，可以看到，版本可以使用全局的properties标签统一配置
<img src="img/directory.jpg" alt="123"/>
2.编写spring的配置文件
在src/main/resources下面建立两个文件，一个是applicationContext.xml，一个是db.properties;
在xml中使用<code><context:property-placeholder location="classpath:db.properties" /></code>
3.连接数据库，并生成持久层代码
其中需要在projest structure中为项目添加hibernate属性，这样才会出现persistence界面

4.
</pre>


</body>
</html>
