<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>搜索结果</title>
<script src="https://cdn.bootcss.com/jquery/2.2.4/jquery.js"></script>
<link rel="stylesheet" type="text/css" href="resources/search.css"/>
</head>
<body>
	<form action="/search" method="get">
		搜索:<input type="text" name="q" value="${param.q }"/><input type="submit" value="搜索" />
	</form>
	
	
	
	  <div class="users">
	  <c:forEach items="${accounts}" var="a">
		  <div class="user">
		  <a class="userpic" href="/find/${a.aid }">
		  <img src="/resources/image/${a.pic }"/>
		  </a>
		  <a class="username">${a.nickName}</a>
		  </div>
	  </c:forEach>
	  </div>
	
	<div class="seperateline"></div>
	
		 <div class="wrapper">
			<c:forEach items="${page.list }" var="w">
			<div class="wb">
			    <a class="pic" href="/find/${w.account.aid }">
		         <img src="/resources/image/${w.account.pic }"/>
		         </a>
				
				<h3><a href="/follow/${w.account.aid}">${w.account.nickName}</a></h3>
				<div>
				<img src="/resources/image/${w.imgname }"/>
				</div>
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


<script type="text/javascript">
	
	$(function(){
		
		$('.wb > a.liked').click(function( e ){
			e.preventDefault();
			var _a = $( this );
			$.get(_a.attr('href'), function( data ){
				_a.html( '推荐(' + data + ')' );
			}, 'json');
		});
		
	});
</script>
	
	
</html>