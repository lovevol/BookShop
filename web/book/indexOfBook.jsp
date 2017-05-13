<%@ page import="model.User" %><%--
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
            <a class="navbar-brand" href="${pageContext.request.contextPath}/book/indexOfBook.jsp?index=index">主页</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false">我<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="${pageContext.request.contextPath}/user/indexOfUser.jsp?pageOfUser=myPublishment.jsp">我的发布</a></li>
                        <li><a href="#">我的购买</a></li>
                        <li><a href="${pageContext.request.contextPath}/user/indexOfUser.jsp?pageOfUser=uploadBook.jsp">我要发布</a>
                        </li>
                        <li role="separator" class="divider"></li>
                        <li><a href="${pageContext.request.contextPath}/user/indexOfUser.jsp?pageOfUser=userInfo.jsp">个人信息</a></li>
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
                <li><a href="logout.action">退出</a></li>
                <li><a href="pageControl.action?pageControl=pageUp">上一页</a></li>
                <li><a href="pageControl.action?pageControl=pageDown">下一页</a></li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<div style="height: 55px">

</div>
<%
    /*User user = new User();
    user.setIduser("14122232");
    user.setUsername("刘豪");
    user.setPassword("123456");
    user.setPhone("13120527361");
    session.setAttribute("user", user);*/
    User user = (User) session.getAttribute("user");
    String category;
    category = (String) session.getAttribute("category");//初始化分类信息
    if (category == null) {
        session.setAttribute("category", "all");
    }
    category = (String) request.getParameter("category");//根据请求设置分类信息
    if (!(category == null))
        session.setAttribute("category", category);
    String pageControl = (String) request.getAttribute("pageControl");
    String index = request.getParameter("index");
    if (session.getAttribute("pageSize") == null && session.getAttribute("currentPage") == null) {//初始化页面控制信息
        session.setAttribute("pageSize", 42);
        session.setAttribute("currentPage", 1);
    }
    if (!(pageControl == null)) {
        int currentPage = (int) session.getAttribute("currentPage");//修改页面控制信息
        if (pageControl.equals("pageUp")) {
            if (currentPage >= 2)
                session.setAttribute("currentPage", currentPage - 1);
        } else if (pageControl.equals("pageDown")) {
            session.setAttribute("currentPage", currentPage + 1);
        }
    }
    if (!(index==null)){
        session.setAttribute("currentPage", 1);
    }
%>

<div class="myLeft" style="text-align: center;">
    <h2>分类查看</h2>
    <nav class="navbar navbar-inverse" id="sidebar-wrapper" role="navigation"
         style="background-color: #f7f7f7;border: none">
        <ul class="nav sidebar-nav">
            <li>
                <a href="${pageContext.request.contextPath}/book/indexOfBook.jsp?category=计算机&index=index">计算机</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/book/indexOfBook.jsp?category=通信&index=index">通信</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/book/indexOfBook.jsp?category=数理&index=index">数理</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/book/indexOfBook.jsp?category=法学&index=index">法学</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/book/indexOfBook.jsp?category=文学&index=index">文学</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/book/indexOfBook.jsp?category=其他&index=index">其他</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/book/indexOfBook.jsp?category=all&index=index">取消分类</a>
            </li>
        </ul>
        <h4>当前类别</h4>
        <%=session.getAttribute("category")%>
    </nav>
    <div style="margin-top: 400px">
        第<%=session.getAttribute("currentPage")%>页
    </div>
</div>
<div style="float: left;height:1750px;width: 90%;">
    <iframe style="margin-left: 12%" align="left" height="1750px" width="1750px" id="iframeProductShow" name="iframeProductShow" frameborder="0"
            src="${pageContext.request.contextPath}/book/bookShow.jsp"></iframe>
</div>
</body>
</html>
