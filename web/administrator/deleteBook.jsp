<%--
  Created by IntelliJ IDEA.
  User: lh
  Date: 2017/5/9
  Time: 18:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="org.hibernate.SessionFactory" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="javax.persistence.Query" %>
<%@ page import="java.util.List" %>
<%@ page import="org.hibernate.Transaction" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="model.Book" %>
<%@ page import="org.springframework.context.ApplicationContext" %>
<%@ page import="org.springframework.context.support.ClassPathXmlApplicationContext" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/css/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/css/bootstrap.min.js"></script>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/publishItem.css">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>图书清理</title>
</head>
<body>
<table class="table table-responsive" style="width: 60%">
    <thead>
    <tr>
        <th width="350px">书单详情</th>
        <th width="150px">所属分类</th>
        <th width="150px">交易状态</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <% ApplicationContext ctx = new ClassPathXmlApplicationContext("spring.xml");
        SessionFactory sessionFactory = (SessionFactory) ctx.getBean("sessionFactory");
        Session session1 = sessionFactory.openSession();
        Transaction transaction = session1.beginTransaction();
        Query query;
        query = session1.createQuery("from Book where isfinished = 0 and ischecked = 1 order by date asc ");
        query.setMaxResults(100);
        List list = query.getResultList();
        transaction.commit();
        session1.close();
        sessionFactory.close();
        Iterator it = list.iterator();
        Book book = null;
        String image1;
        if (!it.hasNext())
            out.print("<h2>没有图书需要清理！</h2>");
        while (it.hasNext()) {
            book = (Book) it.next();
            image1 = book.getUser().getIduser() + book.getIsbn() + "0.jpg";
    %>
    <tr style="height: 20px"></tr>
    <tr class="tr-th">
        <td colspan="6">
            <span class="gap"></span>
            <span class="dealtime">发布时间: <%=book.getDate()%></span>
            <span class="isbn">ISBN: <%=book.getIsbn()%></span>
            <span class="number">书单ID: <%=book.getIdbooks()%></span>
        </td>
    </tr>
    <tr>
        <td>
            <div style="display: inline; float: left">
                <img src="${pageContext.request.contextPath}/image/<%=book.getUser().getIduser()+book.getIsbn()+"0.jpg"%>"
                     class="img-rounded" width="80" height="80"/>
            </div>
            <div style="display: inline; float: left; margin-left: 15px">
                <font size="3" style="vertical-align: middle">书名: <%=book.getBookname()%><br></font>
            </div>
        </td>
        <td style="vertical-align: middle"><%=book.getCategory()%>
        </td>
        <td style="vertical-align: middle"><%=book.getBookprice()%>
        </td>
        <td style="vertical-align: middle">
            <a href="myBookDelete.action?bookID=<%=book.getIdbooks()%>"><input type="button" value="删除"
                                                                               class="btn btn-danger btn-sm"></a>
        </td>
    </tr>
    <%
        }
    %>
    </tbody>
</table>
</body>
</html>
