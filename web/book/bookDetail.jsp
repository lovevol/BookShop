<%@ page import="model.Book" %>
<%@ page import="org.hibernate.cfg.Configuration" %>
<%@ page import="org.hibernate.SessionFactory" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="javax.persistence.Query" %>
<%@ page import="java.util.List" %>
<%@ page import="org.hibernate.Transaction" %>
<%@ page import="javax.persistence.criteria.CriteriaBuilder" %><%--
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
    Configuration configuration = new Configuration().configure();
    SessionFactory sessionFactory = configuration.buildSessionFactory();
    Session session1 = sessionFactory.openSession();
    Transaction transaction = session1.beginTransaction();
    Query query = session1.createQuery("from Book where idbooks = ?");
    query.setParameter(0,id);
    List list = query.getResultList();
    transaction.commit();
    session1.close();
    sessionFactory.close();
    Book book = null;
    if(list.get(0)!=null){
        book = (Book) list.get(0);
    }
    String dir = request.getServletContext().getRealPath("/");
    String image1 = "test1.jpg";
    String image2 = "test2.jpg";
    String image3 = "test3.jpg";
    String image4 = "test4.jpg";
    assert book != null;%>
<h2>java编程思想</h2>
<div style="display: inline">

    <div class="productImage">
        <div style="text-align: center;">
            <img src="${pageContext.request.contextPath}/image/<%=image1%>" width="300" height="400">
            <br>
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
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
            购买
        </button>
    </div>
</div>
<div style="width:100%; border: 1px solid #e4e4e4;float: left">
    <h3>详细信息</h3>
    <%=book.getDescription()%>
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
                ...
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">确定</button>
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
            </div>
            <div class="modal-body" style="text-align: center">
                <img src="${pageContext.request.contextPath}/image/<%=image4%>">
            </div>
        </div>
    </div>
</div>
</body>
</html>
