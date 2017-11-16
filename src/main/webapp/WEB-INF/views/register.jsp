<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>用户注册</title>
	</head>
	<body>
		<form action="/register" method="post" enctype="multipart/form-data">			
			用户邮箱:<input type="text" name="email" value="" /><br/>
			昵称:<input type="text" name="nickName" value=""/><br/>
			密码:<input type="text" name="password" value=""/><br/>
			头像:<input type="file" name="file"/><br/>
			
			<input type="submit" value="注册"/>
		</form>
	</body>
</html>