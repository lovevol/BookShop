<%--
  Created by IntelliJ IDEA.
  User: lh
  Date: 2017/5/4
  Time: 15:24
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
            <a class="navbar-brand" href="${pageContext.request.contextPath}/book/indexOfBook.jsp">主页</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <form class="navbar-form navbar-left">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="Search">
                </div>
                <button type="submit" class="btn btn-default">搜索</button>
            </form>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#">消息 <span class="badge">4</span></a></li>
                <li><a href="#">退出</a></li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<div style="height: 55px">

</div>
<div class="myLeft" style="text-align: center">
    <h2>我</h2>
    <nav class="navbar navbar-inverse" id="sidebar-wrapper" role="navigation" style="background-color: #f7f7f7;border: none">
        <ul class="nav sidebar-nav">
            <li>
                <a href="#">我的发布</a>
            </li>
            <li>
                <a href="#">我的购买</a>
            </li>
            <li>
                <a href="#">我要发布</a>
            </li>
            <li>
                <a href="#">个人信息</a>
            </li>
        </ul>
    </nav>
</div>

<div style="float: left;height:600px;width: 90%;">
    <iframe style="margin-left: 12%" align="left" height="1750px" width="1750px" id="iframeUser" frameborder="0"
            src="${pageContext.request.contextPath}/book/uploadBook.jsp"></iframe>
</div>
</body>
</html>
