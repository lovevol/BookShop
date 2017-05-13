<%@ page import="model.User" %><%--
  Created by IntelliJ IDEA.
  User: lh
  Date: 2017/5/10
  Time: 16:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/css/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/css/bootstrap.min.js"></script>
<html>
<head>
    <title>密码重置</title>
</head>
<body>
<s:form action="searchUser" method="POST" theme="simple">
    <table class="table" style="width:340px;">
        <h3>请输入学号查询用户信息:</h3>
        <tr>
            <td style="vertical-align: middle" width="70px">学号:</td>
            <td width="200px"><s:textfield name="userID" class="form-control"/></td>
            <td width="70px"><s:submit class="btn btn-primary" value="查询"/></td>
        </tr>
        <%
            User user = (User) request.getAttribute("ResultOfSearch");
            if (!(user == null)) {
        %>
        <tr>
            <td>学号:</td>
            <td colspan="2"><%=user.getIduser()%>
            </td>
        </tr>
        <tr>
            <td>姓名:</td>
            <td colspan="2"><%=user.getUsername()%>
            </td>
        </tr>
        <tr>
            <td>手机:</td>
            <td colspan="2"><%=user.getPhone()%>
            </td>
        </tr>
        <tr>
            <td>QQ:</td>
            <td colspan="2"><%=user.getQq()%>
            </td>
        </tr>
        <tr>
            <td colspan="3" style="text-align: center">
                <a href="resetPassword.action?userID=<%=user.getIduser()%>"><input type="button" value="重置密码"
                                                                                   class="btn btn-danger"/></a>
            </td>
        </tr>
    </table>
    <%
        }
    %>
</s:form>

</body>
</html>
