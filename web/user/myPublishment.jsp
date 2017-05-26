<%@ page import="org.hibernate.Session" %>
<%@ page import="model.Book" %>
<%@ page import="model.User" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="org.hibernate.Transaction" %>
<%@ page import="java.util.List" %>
<%@ page import="org.hibernate.query.Query" %>
<%@ page import="hibernate.HibernateUtils" %>
<%--
  Created by IntelliJ IDEA.
  User: Zxc-Hugo
  Date: 2017/5/9
  Time: 18:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>我的发布</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/css/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/css/bootstrap.min.js"></script>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/publishItem.css">
</head>
<body>
    <table class="table table-responsive" style="width: 80%">
        <thead>
        <tr>
            <th width="350px">书单详情</th>
            <th width="150px">所属分类</th>
            <th width="150px">价格</th>
            <th width="150px">审核状态</th>
            <th width="150px">交易状态</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>

<%
    User user = (User) session.getAttribute("user");
    List<Book> books = null;
    Session hbntSession = HibernateUtils.getSession();
        // 获得该用户的发布书列表
    Transaction tx = hbntSession.beginTransaction();
    Query query = hbntSession.createQuery("from Book where user=?").setParameter(0, user);
    books = query.getResultList();
    tx.commit();
    HibernateUtils.destorySession();
    if(books != null) {
        Iterator<Book> iterator = books.iterator();
        while(iterator.hasNext()) {
            Book eachBook = iterator.next();

%>
        <tr style="height: 20px"></tr>
        <tr class="tr-th">
            <td colspan="6">
                <span class="gap"></span>
                <span class="dealtime">发布时间: <%=eachBook.getDate()%>></span>
                <span class="isbn">ISBN: <%=eachBook.getIsbn()%></span>
                <span class="number">书单ID: <%=eachBook.getIdbooks()%></span>
            </td>
        </tr>
        <tr>
            <td>
                <div style="display: inline; float: left" >
                    <img src="${pageContext.request.contextPath}/image/<%=user.getIduser()+eachBook.getIsbn()+"0.jpg"%>" class="img-rounded" width="80" height="80"/>
                </div>
                <div style="display: inline; float: left; margin-left: 15px">
                    <font size="3" style="vertical-align: middle">书名: <%=eachBook.getBookname()%><br></font>
                </div>
            </td>
            <td style="vertical-align: middle"><%=eachBook.getCategory()%></td>
            <td style="vertical-align: middle"><%=eachBook.getBookprice()%></td>
            <td style="vertical-align: middle"><%=(eachBook.getIschecked() == 1)?"已发布":"审核中"%></td>
            <td style="vertical-align: middle"><%=(eachBook.getIsfinished() == 1)?"交易完成":"未交易"%></td>
            <td style="vertical-align: middle" >
                <%
                    if (eachBook.getIsfinished() != 1) {
                %>
                <a href="reviseMyBook.jsp?bookID=<%=eachBook.getIdbooks()%>"><input type="button" value="修改" class="btn btn-primary btn-sm"></a><br>
                <%
                    }
                %>
                <a href="myBookDelete.action?bookID=<%=eachBook.getIdbooks()%>"><input type="button" value="删除" class="btn btn-danger btn-sm"></a>
            </td>
        </tr>
<%
        }
    }
%>
        </tbody>
    </table>
</body>
</html>
