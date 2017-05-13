<%--
  Created by IntelliJ IDEA.
  User: ZxcHugo
  Date: 2017/5/6
  Time: 14:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>登录</title>
    <script type="text/javascript" src="js/jquery-1.9.0.min.js"></script>
    <script type="text/javascript" src="js/login.js"></script>
    <link href="css/login2.css" rel="stylesheet" type="text/css"/>
  </head>
  <body>
    <%
        String errorMsgRegister = (String) request.getAttribute("errorMsgRegister");
    %>

  <h1>上大二手书交易平台</h1>

  <div class="login" style="margin-top:50px;">
    <div class="header">
      <div class="switch" id="switch"><a class="switch_btn_focus" id="switch_qlogin" href="javascript:void(0);" tabindex="7">快速登录</a>
        <a class="switch_btn" id="switch_login" href="javascript:void(0);" tabindex="8">快速注册</a><div class="switch_bottom" id="switch_bottom" style="position: absolute; width: 64px; left: 0px;"></div>
      </div>
    </div>

    <div class="web_qr_login" id="web_qr_login" style="display: block; height: 235px;">
      <!--登录-->
      <div class="web_login" id="web_login">
        <div class="login-box">
          <div class="login_form">
            <form action="loginAction.action" name="loginform" accept-charset="utf-8" id="login_form" class="loginForm" method="post"><input type="hidden" name="did" value="0"/>
              <input type="hidden" name="to" value="log"/>
              <div class="uinArea" id="uinArea">
                <label class="input-tips" for="u">学号：</label>
                <div class="inputOuter" id="uArea">
                    <!--用户名框-->
                  <input type="number" id="u" name="userID" maxlength="8" class="inputstyle"/>
                </div>
              </div>
              <div class="pwdArea" id="pwdArea">
                <label class="input-tips" for="p">密码：</label>
                <div class="inputOuter" id="pArea">
                    <!--密码框-->
                  <input type="password" id="p" name="password" class="inputstyle"/>
                </div>
              </div>

              <div style="padding-left:50px;margin-top:20px;"><input type="submit" value="登 录" style="width:150px;" class="button_blue"/></div>
            </form>
          </div>
        </div>
      </div>
        <br>
        <br>
        <div align="center">
          <%
            String errorMsg = (String) request.getAttribute("errorMsgLogin");
            if(errorMsg != null && !errorMsg.equals("")) {
          %>
              <font size="1" color="red"><%=errorMsg%></font>
          <%
            }
          %>
        </div>
      <!--登录end-->
    </div>

    <!--注册-->
    <div class="qlogin" id="qlogin" style="display: none; ">
      <div class="web_login"><form name="form2" id="regUser" accept-charset="utf-8"  action="registerAction.action" method="post">
        <input type="hidden" name="to" value="reg"/>
        <input type="hidden" name="did" value="0"/>
        <ul class="reg_form" id="reg-ul">
          <div id="userCue" class="cue">以下都为必填项</div>
          <li>
            <label for="userID"  class="input-tips2">学号：</label>
            <div class="inputOuter2">
              <input type="number" id="userID" name="userID" maxlength="12" class="inputstyle2"/>
            </div>
          </li>
          <li>
            <label for="user"  class="input-tips2">用户名：</label>
            <div class="inputOuter2">
              <input type="text" id="user" name="username" maxlength="16" class="inputstyle2"/>
            </div>
          </li>

          <li>
            <label for="passwd" class="input-tips2">密码：</label>
            <div class="inputOuter2">
              <input type="password" id="passwd"  name="password" maxlength="20" autocomplete="false" class="inputstyle2"/>
            </div>

          </li>
          <li>
            <label for="passwd2" class="input-tips2">确认密码：</label>
            <div class="inputOuter2">
              <input type="password" id="passwd2" name="passwordRepeat" autocomplete="false" maxlength="20" class="inputstyle2" />
            </div>

          </li>

          <li>
            <label for="qq" class="input-tips2">QQ：</label>
            <div class="inputOuter2">

              <input type="text" id="qq" name="qq" maxlength="13" class="inputstyle2"/>
            </div>

          </li>

            <li>
                <label for="phone" class="input-tips2">手机号：</label>
                <div class="inputOuter2">
                    <input type="text" id="phone" name="phone" maxlength="15" class="inputstyle2"/>
                </div>

            </li>

          <li>
            <div class="inputArea">
              <input type="button" id="reg"  style="margin-top:10px;margin-left:85px;" class="button_blue" value="同意协议并注册"/> <a href="#" class="zcxy" target="_blank">注册协议</a>
            </div>

          </li><div class="cl"></div>
        </ul></form>
      </div>
    </div>
      <div align="center">
      <%
        if(errorMsgRegister != null && !errorMsgRegister.equals("")) {
      %>
            <font size="1" color="red"><%=errorMsgRegister%></font>
      <%
        }
      %>
      </div>
    <!--注册end-->
  </div>
  <div class="jianyi">*推荐使用ie8或以上版本ie浏览器或Chrome内核浏览器访问本站</div>

  </body>
</html>
