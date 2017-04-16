<%--
  Created by IntelliJ IDEA.
  User: lh
  Date: 2017/4/14
  Time: 15:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<script type="javascript" src="${pageContext.request.contextPath}/css/bootstrap.min.js"></script>
<html>
<head>
    <title>主页</title>
</head>
<body>
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <a class="navbar-brand" href="#">导航</a>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li><a href="#">我</a></li>
            </ul>
            <form class="navbar-form navbar-right">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="Search">
                </div>
                <button type="submit" class="btn btn-default">搜索</button>
            </form>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#">消息</a></li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<div class="myLeft">
    <div style="text-align: center;">
        <h2>分类查看</h2>
        <a href="#">计算机</a>
    </div>

</div>
<div style="width: 100%;height: 1700px">
    <%
        for (int i = 1; i <= 20; i++) {
    %>
    <div class="product">
        <a href="${pageContext.request.contextPath}/product/productDetail.jsp?productId=<%=i%>">
            <img src="${pageContext.request.contextPath}/image/test2.jpg" height="80%" width="100%">
        </a>
        <h3>java编程思想</h3>
        <p>价格：58.00 用户：14122232</p>
    </div>
    <%
        }
    %>
</div>
<div style="top: 1850px;width: 100%;text-align: right">
    <form action="" method="post">
        <input type="submit" class="btn btn-default" value="上一页">
    </form>
    <form action="" method="post">
        <input type="submit" class="btn btn-default" value="下一页">
    </form>
</div>
</body>
</html>
