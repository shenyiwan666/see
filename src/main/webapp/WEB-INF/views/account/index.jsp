
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>账号管理</title>
<style type="text/css">
	table img {
		width:50px;
		height: 50px;
	}
	.cur {
		border: 1px solid #000;
		padding: 3px 5px;
		color: red;
	}
</style>
</head>
<body>
<!--  
	<form action="/account/" method="get">
	搜索:<input type="text" name="q" value="${param.q }"/><input type="submit" value="搜索" />
	</form>
-->
	<table>
			
			<tbody>		
				<c:set var="a" value="${requestScope.account}"/>
				
					<tr>
						<td>您当前的邮箱是  &nbsp ${a.email}</td>
						<td>
							<form action="/account/updateemail/${a.aid}" name="dynamic"  method="post">
				              <input type="hidden" name="_method" value="put" />
				              <input type="hidden" name="aid" value="${a.aid }" />
					          <span>请输入新邮箱:</span>
					          <input type="text" id="email" name="email" value="${a.email }" />
					          <input type="submit" value="修改" onclick="shownickName()" />
				             </form>
						</td>
					</tr>
					<tr>
					<td>您当前的昵称是 &nbsp ${a.nickName}</td>
						<td>
						  <form action="/account/updatenickName/${a.aid}" name="dynamic"  method="post">
			              <input type="hidden" name="_method" value="put" />
			              <input type="hidden" name="aid" value="${a.aid }" />
				          <span>请输入新昵称:</span>
				          <input type="text" id="nickName" name="nickName" value="${a.nickName }" />
				          <input type="submit" value="修改" onclick="show()" />
			             </form>
			            </td>
					</tr>
					<tr>
						<td> 您当前的密码是  &nbsp  ${a.password}</td>
						<td>
							<form action="/account/updatepassword/${a.aid}" name="dynamic"  method="post" >
				              <input type="hidden" name="_method" value="put" />
				              <input type="hidden" name="aid" value="${a.aid }" />
					          <span>请输入新密码:</span>
					          <input type="text" id="password" name="password" value="${a.password }" />
					          <input type="submit" value="修改" onclick="show()" />
				             </form>
						
						</td>
					</tr>
					<tr>
						<td>您当前的头像是  &nbsp <img src="/resources/image/${a.pic }" /></td>
						<td>
					          <form action="/account/updatepic/${a.aid}" name="dynamic"  method="post" enctype="multipart/form-data">
				              <input type="hidden" name="_method" value="put" />
				              <input type="hidden" name="aid" value="${a.aid }" />
					          <span>请上传新头像:</span>
					          <div id="div_img"><input type="file" id="img" name="file"></div>
	                          <div id="div_btn_fabu"><input type="submit" id="btn_fabu" value="上传"  /></div>
				             </form>
						</td>
					</tr>
					
			</tbody>
		</table>
		
	    <a href="/">完成</a>
       <script type="text/javascript">
			function show() {
			 var message1 = document.getElementById("nickName").value;
			 var message2 = document.getElementById("email").value;
			 var message3 = document.getElementById("password").value;
			 return true;
			}
		</script>
		
		
				
</body>

</html>