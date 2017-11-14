<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>显示帐号列表</title>
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
	<form action="/account/" method="get">
	搜索:<input type="text" name="q" value="${param.q }"/><input type="submit" value="搜索" />
	</form>

	<table>
			<thead>
				<tr>
					<th>AID</th>
					<th>邮箱</th>
					<th>昵称</th>
					<th>密码</th>
					<th>头像</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>		
				<c:forEach items="${page.list }" var="a">
				<tr>
					<td>${a.aid }</td>
					<td>${a.email }</td>
					<td>${a.nickName }</td>
					<td>${a.password }</td>
					<td>
						<img src="/resources/image/${a.pic }" />
					</td>
					<td>
						<a href="/account/delete/${a.aid }">删除</a>
					</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<div class="page-info">
			<c:if test="${page.cur gt 1 }">
				<a href="/account/?p=1&q=${ param.q }">首页</a>
				<a href='/account/?p=${page.cur - 1 }&q=${ param.q }'>上一页</a>
			</c:if>
			<c:forEach begin="1" end="${page.total }" var="p">
			
				<c:if test="${page.cur eq p }">
					<a class="cur" href="javascript:void(0);">${p }</a>
				</c:if>
				<c:if test="${page.cur ne p }">
					<a href='/account/?p=${p }&q=${ param.q }'>${p }</a>
				</c:if>
			</c:forEach>
			
		</div>
</body>
</html>