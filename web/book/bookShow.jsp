<%--
  Created by IntelliJ IDEA.
  User: lh
  Date: 2017/4/22
  Time: 10:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/css/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/css/bootstrap.min.js"></script>
<html>
<head>
    <title>展示</title>
</head>
<body>
<%
    for (int i = 1; i <= 20; i++) {
%>
<div class="product">
    <a href="${pageContext.request.contextPath}/book/bookDetail.jsp?productId=<%=i%>">
        <img src="${pageContext.request.contextPath}/image/test1.jpg" height="80%" width="100%">
    </a>
    <h3>java编程思想</h3>
    <p>价格：58.00 用户：14122232</p>
</div>
<%
    }
%>
</body>
</html>
