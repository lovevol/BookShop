<%--
  Created by IntelliJ IDEA.
  User: lh
  Date: 2017/4/22
  Time: 10:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="org.hibernate.cfg.Configuration" %>
<%@ page import="org.hibernate.SessionFactory" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="javax.persistence.Query" %>
<%@ page import="java.util.List" %>
<%@ page import="org.hibernate.Transaction" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="model.Book" %>
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
    Configuration configuration = new Configuration().configure();
    SessionFactory sessionFactory = configuration.buildSessionFactory();
    Session session1 = sessionFactory.openSession();
    Transaction transaction = session1.beginTransaction();
    Query query = session1.createQuery("from Book");
    List list = query.getResultList();
    transaction.commit();
    session1.close();
    sessionFactory.close();
    Iterator it = list.iterator();
    Book book = null;
    String image1;
    while (it.hasNext()) {
        book = (Book) it.next();
        image1 = book.getUser().getIduser()+book.getIsbn()+"0.jpg";
%>
<div class="product">
    <a href="${pageContext.request.contextPath}/book/bookDetail.jsp?productId=<%=book.getIdbooks()%>">
        <img src="${pageContext.request.contextPath}/image/<%=image1%>" height="80%" width="100%">
    </a>
    <h5><%=book.getBookname()%>
    </h5>
    <p>价格<%=book.getBookprice()%> 用户:<%=book.getUser().getIduser()%>
    </p>
</div>
<%
    }
%>
<%--<%
    for (int i = 1; i <= 30; i++) {
%>
<div class="product">
    <a href="${pageContext.request.contextPath}/book/bookDetail.jsp?productId=<%=book.getIdbooks()%>">
        <img src="${pageContext.request.contextPath}/image/test1.jpg" height="80%" width="100%">
    </a>
    <h5><%=book.getBookname()%>
    </h5>
    <p>价格<%=book.getBookprice()%> 用户:<%=book.getUser().getIduser()%>
    </p>
</div>
<%
    }
%>--%>
</body>
</html>
