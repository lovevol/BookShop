<%@ page import="org.hibernate.Session" %>
<%@ page import="hibernate.HibernateUtils" %>
<%@ page import="model.Book" %>
<%@ page import="model.User" %>
<%@taglib prefix="s" uri="/struts-tags" %><%--
  Created by IntelliJ IDEA.
  User: Zxc-Hugo
  Date: 2017/5/11
  Time: 10:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script type="text/javascript" src="${pageContext.request.contextPath}/css/jquery-3.2.1.min.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/css/bootstrap.min.js"></script>
    <title>修改图书</title>
</head>
<body>
    <%
        int bookID = Integer.valueOf(request.getParameter("bookID"));
        Session hbntSession = HibernateUtils.getSession();
        Book curBook = hbntSession.load(Book.class, bookID);
        //HibernateUtils.destorySession();
    %>
    <div style="width: 400px;margin: 10px;padding: 5px;">
        <s:form action="myBookRevise" method="POST" theme="simple" enctype="multipart/form-data">
            <h2>发布</h2>
            <table class="table">
                <tr>
                    <td style="vertical-align: middle">书名:</td>
                    <input type="hidden" name="book.idbooks" value="<%=curBook.getIdbooks()%>">
                    <input type="hidden" name="book.date" value="<%=curBook.getDate()%>">
                    <td><input type="text" maxlength="40" name="book.bookname" class="form-control" value="<%=curBook.getBookname()%>"/><span style="color: #e4261a; ">${errors.bookName[0]}</span> </td>
                </tr>
                <tr>
                    <td style="vertical-align: middle">ISBN:</td>
                    <td><input readonly="true" name="book.isbn" class="form-control" value="<%=curBook.getIsbn()%>"/><span style="color: #e4261a; ">${errors.isbn[0]}</span></td>
                </tr>
                <tr>
                    <td style="vertical-align: middle">类别:</td>
                    <td><s:select name="book.category" list="{'计算机','通信','数理','法学','文学','其他'}" class="form-control" /></td>
                </tr>
                <tr>
                    <td style="vertical-align: middle">价格:</td>
                    <td><input type="text" maxlength="6" name="book.bookprice" class="form-control" value="<%=curBook.getBookprice()%>"/></td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center;vertical-align:middle;">描述<span style="color: #e4261a; ">${errors.description[0]}</td>
                </tr>
                <tr>
                    <td colspan="2"><input type="text" maxlength="300" name="book.description" class="form-control" value="<%=curBook.getDescription()%>"/></td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center;vertical-align: middle">图片<span style="color: #e4261a; ">${errors.file[0]}</td>
                </tr>
                <tr>
                    <td>封面:</td>
                    <td><s:file name="imageCover" class="form-control"/></td>
                </tr>
                <tr>
                    <td>内容:</td>
                    <td><s:file name="imageContent01" class="form-control"/></td>
                </tr>
                <tr>
                    <td>内容:</td>
                    <td><s:file name="imageContent02" class="form-control"/></td>
                </tr>
                <tr>
                    <td>内容:</td>
                    <td><s:file name="imageContent03" class="form-control"/></td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center">
                        <s:submit value="提交" class="btn btn-primary"/>
                        <s:reset value="重置" class="btn btn-danger"/>
                    </td>
                </tr>
            </table>
        </s:form>
    </div>
</body>
</html>
