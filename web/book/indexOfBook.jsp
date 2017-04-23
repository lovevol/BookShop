<%--
  Created by IntelliJ IDEA.
  User: lh
  Date: 2017/4/14
  Time: 15:20
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
            <ul class="nav navbar-nav">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false">我 <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">我的发布</a></li>
                        <li><a href="#">我的购买</a></li>
                        <li><a href="#">我要发布</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">个人信息</a></li>
                    </ul>
                </li>
            </ul>
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
<div class="myLeft">
    <div style="text-align: center;">
        <h2>分类查看</h2>
        <a href="#">计算机</a>
        <br>
        <a href="#">通信</a>
        <br>
        <a href="#">数理</a>
        <br>
        <a href="#">法学</a>
        <br>
        <a href="#">文学</a>
        <br>
        <a href="#">其他</a>
        <br>
    </div>
</div>
<iframe scrolling="none" align="left" height="1700px" width="85%" id="iframeProductShow" frameborder="0"
        src="${pageContext.request.contextPath}/book/bookShow.jsp"></iframe>
<nav class="navbar navbar-default navbar-fixed-bottom">
    <div class="container">
        <form action="" method="post" class="navbar-form navbar-right">
            <input type="submit" class="btn btn-default" value="下一页">
        </form>
        <form action="" method="post" class="navbar-form navbar-right">
            <input type="submit" class="btn btn-default" value="上一页">
        </form>

    </div>
</nav>
</body>
</html>
