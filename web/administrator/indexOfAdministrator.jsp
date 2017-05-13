<%--
  Created by IntelliJ IDEA.
  User: lh
  Date: 2017/5/9
  Time: 18:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/css/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/css/bootstrap.min.js"></script>
<html>
<head>
    <title>主页</title>
</head>
<body>

<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <a class="navbar-brand" href="${pageContext.request.contextPath}/administrator/indexOfAdministrator.jsp">管理员</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="logout.action">退出</a></li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<div style="height: 55px">

</div>
<div class="myLeft" style="text-align: center">
    <h2>管理员</h2>
    <nav class="navbar navbar-inverse" id="sidebar-wrapper" role="navigation" style="background-color: #f7f7f7;border: none">
        <ul class="nav sidebar-nav">
            <li>
                <a href="${pageContext.request.contextPath}/administrator/checkBook.jsp" target="iframeAdministrator">图书审核</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/administrator/deleteBook.jsp" target="iframeAdministrator">图书清理</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/administrator/resetPasswordOfUser.jsp" target="iframeAdministrator">用户密码重置</a>
            </li>
        </ul>
    </nav>
</div>
<%
    String pageOfUser = (String)request.getParameter("pageOfUser");

%>
<div style="float: left;height:600px;width: 90%;">
    <iframe style="margin-left: 12%" align="left" height="1750px" width="1750px" name="iframeAdministrator" id="iframeAdministrator" frameborder="0"
            src="${pageContext.request.contextPath}/administrator/checkBook.jsp"></iframe>
</div>
</body>
</html>
