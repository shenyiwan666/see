<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>SEE</title>

    <link rel="stylesheet" type="text/css" href="resources/login.css"/>
   
</head>

<body onkeydown="keyLogin(event);">
<div id="register">

    <h1>还没有账号？</h1>
    <p>欢迎！</br>请您使用邮箱和密码登录。</br></br></p>
<!-- 	<div><a id="btn_register" href="/register">注册帐号</a></div> -->
	<div id="div_btn_register"><input type="button" id="btn_register" value="注册账号" onclick="javascript:top.location.href='/register'"/></div>
</div>


<div id="login">

    <div id="image_logo"><img src="resources/image/eyes_icon.png"></div>

    <div id="loginForm">
        <form method="post" action="/login">

            <div id="div_username">邮箱：<input type="text" id="username" class="text_field" placeholder="请输入账号" name="email" /></div>

            <div id="div_password">密码：<input type="password" id="password" class="text_field" placeholder="请输入密码" name="password"/></div>

            <div id="div_forget"><a id="forget_pwd" href="forget_pwd.html" target="_blank">忘记密码？</a></div>

            <div id="div_btn_login"><input type="submit" id="btn_login" value="马上登录"  /></div>

        </form>
    </div>

</div>
</body>
</html>



