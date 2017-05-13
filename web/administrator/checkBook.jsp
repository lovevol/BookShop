<%--
  Created by IntelliJ IDEA.
  User: lh
  Date: 2017/5/9
  Time: 18:07
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
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>图书审核</title>
</head>
<body>
<%

    ApplicationContext ctx = new ClassPathXmlApplicationContext("spring.xml");
    SessionFactory sessionFactory = (SessionFactory) ctx.getBean("sessionFactory");
    Session session1 = sessionFactory.openSession();
    Transaction transaction = session1.beginTransaction();
    Query query;
    query = session1.createQuery("from Book where isfinished = 0 and ischecked = 0");
    List list = query.getResultList();
    transaction.commit();
    session1.close();
    sessionFactory.close();
    Iterator it = list.iterator();
    Book book = null;
    String image1;
    if(!it.hasNext())
        out.print("<h2>没有图书需要审核！</h2>");
    while (it.hasNext()) {
        book = (Book) it.next();
        image1 = book.getUser().getIduser()+book.getIsbn()+"0.jpg";
%>
<div class="product">
    <a href="${pageContext.request.contextPath}/administrator/bookDetail.jsp?productId=<%=book.getIdbooks()%>">
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
</body>
</html>
