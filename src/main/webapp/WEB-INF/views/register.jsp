<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>用户注册</title>
		
		<link rel="stylesheet" type="text/css" href="resources/register.css"/>
	</head>
	<body>
		
		<div id="register">
			<div id="image_logo"><img src="resources/image/eyes_icon.png"></div>
			<form id="register-form" action="/register" method="post" enctype="multipart/form-data">
				<div id="div_email"><input type="email" id="email" class="text_field" placeholder="注册邮箱" name="email" /></div>
	            <div id="div_username"><input type="nickName" id="nickName" class="text_field" placeholder="请输入昵称" name="nickName"/></div>
	            <div id="div_password"><input type="password" id="password" class="text_field" placeholder="请输入密码" name="password"></div>
	            <div id="div_headimage"><a class="btn-head"><input title="" type="file" id="head_image" name="file"></a></div>
	            <div id="div_btn_login"><input type="submit" id="btn_login" value="马上注册"  /></div>
            </form>
		</div>	
			<!-- 用户邮箱:<input type="text" name="email" value="" /><br/>
			昵称:<input type="text" name="nickName" value=""/><br/>
			密码:<input type="text" name="password" value=""/><br/>
			头像:<input type="file" name="file"/><br/>
			<input type="submit" value="注册"/> -->
		
	</body>
</html>