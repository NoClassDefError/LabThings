<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2019/8/30
  Time: 17:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script>
    document.getElementById("a").click();
</script>
<html>
<head>
    <title>等待跳转</title>
</head>
<body>
<a id="a" href="<s:url value="index.action"/>">若未跳转，请点击</a>

</body>
</html>
