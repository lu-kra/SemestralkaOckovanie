<%--
  Created by IntelliJ IDEA.
  User: Lukas-PC
  Date: 16. 5. 2021
  Time: 12:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isErrorPage="true" %>
<html>
<head>
    <title>Error</title>
</head>
<body>

<%@include file="indexnavbar.html"%>


<h1 style="color: red">ERROR SITE</h1>


<p>
    <%= exception.getMessage()%>
</p>



<%@include file="footer.jsp"%>

</body>
</html>
