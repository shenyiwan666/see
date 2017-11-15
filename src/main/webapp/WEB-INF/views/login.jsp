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
    <p>相比之前的那个【简单版】登录界面，该模板新增：1、js 回车事件，并且能够兼容多个浏览器2、界面布局的层次结构优化3、按钮监听响应事件的实现方式优化4、包含全屏方法的实现5、连个div块的叠加</p>
    <div id="div_btn_register"><input type="button" id="btn_register" value="注册账号" onclick="/register"/></div>
</div>


<div id="login">

    <div id="image_logo"><img src="resources/image/fly_icon.png"></div>

    <div id="loginForm">
        <form method="post" action="/login">

            <div id="div_username"><input type="text" id="username" class="text_field" placeholder="请输入账号" name="email"/></div>

            <div id="div_password"><input type="password" id="password" class="text_field" placeholder="请输入密码" name="password"/></div>

            <div id="div_forget"><a id="forget_pwd" href="forget_pwd.html" target="_blank">忘记密码？</a></div>

            <div id="div_btn_login"><input type="submit" id="btn_login" value="马上登录"  /></div>

        </form>
    </div>

</div>
</body>
</html>



