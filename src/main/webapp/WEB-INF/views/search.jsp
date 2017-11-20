<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>搜索结果</title>
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
	.wrapper {
				width:960px;
				margin: 0 auto;
			}
			.wb {
				background:#fff;
				margin: 10px;
				padding: 10px 10px 10px 80px;
				position: relative;
				border-radius: 5px;
			}
			.wb > img {
				width: 50px;
				height: 50px;
				border-radius: 50%;
				position: absolute;
				left:10px;
				top:10px;
			}
			.wb > h3 {
				margin: 0;
			}
</style>
</head>
<body>
	<form action="/search" method="get">
		搜索:<input type="text" name="q" value="${param.q }"/><input type="submit" value="搜索" />
	</form>
	
	
	
		 <div class="wrapper">
			<c:forEach items="${page.list }" var="w">
			<div class="wb">
				<img src="/resources/image/${w.account.pic }"/>
				<h3><a href="/follow/${w.account.aid}">${w.account.nickName}</a></h3>
				<p>${w.wcontent }</p><br/>
				<p><fmt:formatDate value="${w.lastUpdateTime}" pattern="yyyy-MM-dd HH:mm:ss" /></p>
				<a class="liked" href="/like/${w.wid}">推荐(${w.liked })</a>
				<a>评论(${w.comment})</a>
				<p>
			</div>
			</c:forEach>
		</div>
		
		
		<div class="page-info">
			<c:if test="${page.cur gt 1 }">
				<a href="/search/?p=1&q=${ param.q }">首页</a>
				<a href='/search/?p=${page.cur - 1 }&q=${ param.q }'>上一页</a>
			</c:if>
			<c:forEach begin="1" end="${page.total }" var="p">
			
				<c:if test="${page.cur eq p }">
					<a class="cur" href="javascript:void(0);">${p }</a>
				</c:if>
				<c:if test="${page.cur ne p }">
					<a href='/search/?p=${p }&q=${ param.q }'>${p }</a>
				</c:if>
			</c:forEach>
			<c:set var="last" value="${page.total }"/>
			<c:if test="${page.cur lt last }">
				<a href="/search/?p=${page.total}&q=${param.q}">末页</a>
				<a href="/search/?p=${page.cur + 1 }&q=${param.q}">下一页</a>
			</c:if>
		</div>
</body>
</html>