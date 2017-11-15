<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>用户登录</title>
	</head>
	<body>
		<span style="color:red;">${ msg }</span>
		<form action="/login" method="post">
			邮箱:<input type="text" name="email" /><br/>
			密码:<input type="password" name="password"/><br/>
			<input type="submit" value="登录" />
		</form>
		<a href="/register">注册</a>
	</body>
</html>