<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="model.User" %><%--
  Created by IntelliJ IDEA.
  User: Zxc-Hugo
  Date: 2017/5/8
  Time: 12:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>修改个人信息</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/css/jquery-3.2.1.min.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/css/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <%--<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.9.0.min.js"></script>--%>
    <style>
        .cue {
            height:40px;
            line-height:40px;
            font-size:14px;
            border:none;
            margin-top:10px;margin-bottom:5px;
            text-align:left;
            font-family:"Hiragino Sans GB", "Microsoft Yahei";
        }
    </style>
    <script>
        $(document).ready(function () {
            $('#formbtn').click(function () {

                var value = document.getElementById("formbtn").value;
                if(value == "修改") {
                    document.getElementById("td_username").readOnly=false;
                    document.getElementById("td_qq").readOnly=false;
                    document.getElementById("td_phone").readOnly=false;
                    document.getElementById("formbtn").value="保存";
                    return true;
                }
                if ($('#td_username').val().length < 2 || $('#td_username').val().length > 16) {

                    $('#td_username').focus().css({
                        border: "1px solid red",
                        boxShadow: "0 0 2px red"
                    });
                    $('#userCue').html("<font color='red'><b>×用户名位2-16字符</b></font>");
                    return false;

                }

                var sqq = /^[1-9]{1}[0-9]{4,9}$/;
                if (!sqq.test($('#td_qq').val()) || $('#td_qq').val().length < 5 || $('#td_qq').val().length > 12) {
                    $('#td_qq').focus().css({
                        border: "1px solid red",
                        boxShadow: "0 0 2px red"
                    });
                    $('#userCue').html("<font color='red'><b>×QQ号码格式不正确</b></font>");return false;
                } else {
                    $('#td_qq').css({
                        border: "1px solid #D7D7D7",
                        boxShadow: "none"
                    });

                }

                if ($('#td_phone').val() == "") {
                    $('#td_phone').focus().css({
                        border: "1px solid red",
                        boxShadow: "0 0 2px red"
                    });
                    $('#userCue').html("<font color='red'><b>×手机号不能为空</b></font>");
                    return false;
                }
                $('#revisePersonalInfo').submit();
            });
        });
    </script>
</head>
<body>
<div style="margin: 20px;padding: 5px">
    <%User user = (User) session.getAttribute("user");%>
    <h2 style="display: inline">个人信息</h2><input type="button" class="btn btn-danger btn-sm" value="修改密码" style="display: inline;margin-left: 20px" data-toggle="modal" data-target="#modal"/>
    <font color="#e4261a">
        ${errors.oldPassword[0]}
        ${errors.newPassword[0]}
    </font>
    <hr>
    <div id="userCue" class="cue">修改时请注意格式</div>
    <form id="revisePersonalInfo" method="post" action="revisePersonInfo.action">
        <table>
            <tr>
                <td style="vertical-align: middle">学号:</td>
                <td><input type="text" class="form-control" readonly="true" name="userID" value="<%=user.getIduser()%>"></td>
            </tr>
            <tr><td><br><br></td></tr>
            <tr>
                <td style="vertical-align: middle">用户名:</td>
                <td><input type="text" class="form-control" id="td_username" readonly="true" name="username" maxlength="16" value="<%=user.getUsername()%>"></td>
            </tr>
            <tr><td><br><br></td></tr>
            <tr>
                <td style="vertical-align: middle">电话/手机:</td>
                <td><input type="number" class="form-control" id="td_phone" readonly="true" name="phone" maxlength="15" value="<%=user.getPhone()%>"></td>
            </tr>
            <tr><td><br><br></td></tr>
            <tr>
                <td style="vertical-align: middle">QQ:</td>
                <td><input type="number" class="form-control" id="td_qq" readonly="true" name="qq" maxlength="13" value="<%=user.getQq()%>"></td>
            </tr>
            <tr><td><br><br></td></tr>
            <tr>
                <td colspan="2" align="center"><input id="formbtn" type="button" value="修改" class="btn btn-primary">
                <input type="reset" value="重置" class="btn btn-danger"></td>
            </tr>
        </table>
    </form>
    <div class="modal fade" id="modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">修改密码</h4>
                </div>
                <s:form action="revisePassword" method="post" theme="simple">
                <div class="modal-body">
                    <table class="table table-responsive">
                        <tr>
                            <td>旧密码:</td><td> <s:textfield class="form-control" name="oldPassword" type="password"/></td>
                        </tr>
                        <tr>
                            <td>新密码:</td><td> <s:textfield class="form-control" name="newPassword1" type="password"/></td>
                        </tr>
                        <tr>
                            <td>再确认:</td><td> <s:textfield class="form-control" name="newPassword2" type="password"/></td>
                        </tr>
                    </table>
                    <div style="text-align: center;"><h6><span style="color: #e4261a; ">若密码修改成功请退出后重新登陆！</span> </h6></div>
                </div>
                <div class="modal-footer" align="center">
                        <input  type="submit" class="btn btn-danger" value="确定">
                    </s:form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
