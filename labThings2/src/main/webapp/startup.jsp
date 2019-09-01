<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>等待跳转</title>
</head>
<body>
<a id="a" href="<s:url value="index.action"/>">若未跳转，请点击</a>
<script>
    document.getElementById("a").click();
</script>
</body>
</html>
