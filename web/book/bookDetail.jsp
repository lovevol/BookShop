<%@ page import="model.Book" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="org.hibernate.SessionFactory" %>
<%@ page import="org.hibernate.Transaction" %>
<%@ page import="org.springframework.context.ApplicationContext" %>
<%@ page import="org.springframework.context.support.ClassPathXmlApplicationContext" %>
<%@ page import="javax.persistence.Query" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: lh
  Date: 2017/4/15
  Time: 16:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/css/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/css/bootstrap.min.js"></script>
<html>
<head>
    <title>详情页</title>
</head>
<body>
<%
    String productId = request.getParameter("productId");
    int id = Integer.parseInt(productId);
    //Configuration configuration = new Configuration().configure();
    //SessionFactory sessionFactory = configuration.buildSessionFactory();
    ApplicationContext ctx = new ClassPathXmlApplicationContext("spring.xml");
    SessionFactory sessionFactory = (SessionFactory) ctx.getBean("sessionFactory");
    Session session1 = sessionFactory.openSession();
    Transaction transaction = session1.beginTransaction();
    Query query = session1.createQuery("from Book where idbooks = ?");
    query.setParameter(0, id);
    List list = query.getResultList();
    transaction.commit();
    Book book = null;
    if (list.get(0) != null) {
        book = (Book) list.get(0);
    }
    String image1 = book.getUser().getIduser()+book.getIsbn()+"0.jpg";
    String image2 = book.getUser().getIduser()+book.getIsbn()+"1.jpg";
    String image3 = book.getUser().getIduser()+book.getIsbn()+"2.jpg";
    String image4 = book.getUser().getIduser()+book.getIsbn()+"3.jpg";
    %>
<h2 style="margin:5px "><%=book.getBookname()%></h2>
<div style="display: inline">

    <div class="productImage">
        <div style="text-align: center;">
            <img src="${pageContext.request.contextPath}/image/<%=image1%>" width="300" height="400">
            <p></p>
            <img src="${pageContext.request.contextPath}/image/<%=image1%>" width="60" height="80" data-toggle="modal"
                 data-target="#myImageModal1">
            <img src="${pageContext.request.contextPath}/image/<%=image2%>" width="60" height="80" data-toggle="modal"
                 data-target="#myImageModal2">
            <img src="${pageContext.request.contextPath}/image/<%=image3%>" width="60" height="80" data-toggle="modal"
                 data-target="#myImageModal3">
            <img src="${pageContext.request.contextPath}/image/<%=image4%>" width="60" height="80" data-toggle="modal"
                 data-target="#myImageModal4">
        </div>
    </div>

    <div class="productDetials">
        <br>
        <table class="table">
            <tr>
                <td>ISBN:</td>
                <td><%=book.getIsbn()%></td>
            </tr>
            <tr>
                <td>价格:</td>
                <td><%=book.getBookprice()%></td>
            </tr>
            <tr>
                <td>类别:</td>
                <td><%=book.getCategory()%></td>
            </tr>
            <tr>
                <td colspan="2">
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
                        购买
                    </button>
                </td>
            </tr>
        </table>
    </div>
</div>
<div style="width:1000px; border: 1px solid #e4e4e4;float: left;padding: 5px">
    <h3>详细信息</h3>
    <%=book.getDescription()%>
</div>
<div style="width:90%;float: left">
    <h3>该用户发布的书:</h3>
    <%
        Transaction transaction2 = session1.beginTransaction();
        Query query2 = session1.createQuery("from Book where user = ? and isfinished = 0");
        query2.setParameter(0, book.getUser());
        List list2 = query2.getResultList();
        query2.setMaxResults(21);
        transaction2.commit();
        session1.close();
        sessionFactory.close();
        Iterator iterator = list2.iterator();
        Book theBook;
        while (iterator.hasNext()){
            theBook = (Book) iterator.next();
            image1 = theBook.getUser().getIduser()+theBook.getIsbn()+"0.jpg";
    %>
    <div class="product">
        <a href="${pageContext.request.contextPath}/book/bookDetail.jsp?productId=<%=theBook.getIdbooks()%>">
            <img src="${pageContext.request.contextPath}/image/<%=image1%>" height="80%" width="100%">
        </a>
        <h5><%=theBook.getBookname()%>
        </h5>
        <p>价格<%=theBook.getBookprice()%> 用户:<%=book.getUser().getIduser()%>
        </p>
    </div>
    <%
        }
    %>
</div>
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">购买</h4>
            </div>
            <div class="modal-body">
                <p>确定购买，并且给相关用户发私信，双方通信方式互换，并尽快完成线下交易！</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">确定</button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="myImageModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" >图片浏览</h4>
            </div>
            <div class="modal-body" style="text-align: center">
                <img src="${pageContext.request.contextPath}/image/<%=image1%>">
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="myImageModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" >图片浏览</h4>
            </div>
            <div class="modal-body" style="text-align: center">
                <img src="${pageContext.request.contextPath}/image/<%=image2%>">
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="myImageModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" >图片浏览</h4>
            </div>
            <div class="modal-body" style="text-align: center">
                <img src="${pageContext.request.contextPath}/image/<%=image3%>">
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="myImageModal4" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" >图片浏览</h4>
            </div>
            <div class="modal-body" style="text-align: center">
                <img src="${pageContext.request.contextPath}/image/<%=image4%>">
            </div>
        </div>
    </div>
</div>
</body>
</html>
