<%--
  Created by IntelliJ IDEA.
  User: lh
  Date: 2017/5/4
  Time: 14:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/css/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/css/bootstrap.min.js"></script>
<%@taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>上传</title>
</head>
<body>
<h2>发布</h2>
<hr>
<div style="width: 600px;margin: 20px;padding: 5px;">
    <s:form action="upload" method="POST" theme="simple" enctype="multipart/form-data">
        <table class="table">
            <tr>
                <td>书名:</td>
                <td><s:textfield name="book.bookname" class="form-control" maxLength="40"/><span style="color: #e4261a; ">${errors.bookName[0]}</span> </td>
            </tr>
            <tr>
                <td>ISBN:</td>
                <td><s:textfield name="book.isbn" class="form-control" maxLength="13"/><span style="color: #e4261a; ">${errors.isbn[0]}</span></td>
            </tr>
            <tr>
                <td>类别:</td>
                <td><s:select name="book.category" list="{'计算机','通信','数理','法学','文学','其他'}" class="form-control"/></td>
            </tr>
            <tr>
                <td>价格:</td>
                <td><s:textfield name="book.bookprice" class="form-control"/></td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center;vertical-align:middle;">描述<span style="color: #e4261a; ">${errors.description[0]}</span></td>
            </tr>
            <tr>
                <td colspan="2"><s:textarea name="book.description" class="form-control" /></td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center;vertical-align: middle">图片(四张,大小<1M)<br><span style="color: #e4261a; ">${errors.file[0]}</span></td>
            </tr>
            <tr>
                <td>封面:</td>
                <td><s:file name="file" class="form-control"/></td>
            </tr>
            <tr>
                <td>内容:</td>
                <td><s:file name="file" class="form-control"/></td>
            </tr>
            <tr>
                <td>内容:</td>
                <td><s:file name="file" class="form-control"/></td>
            </tr>
            <tr>
                <td>内容:</td>
                <td><s:file name="file" class="form-control"/></td>
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
