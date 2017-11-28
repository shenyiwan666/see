<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户空间</title>
<script src="https://cdn.bootcss.com/jquery/2.2.4/jquery.js"></script>
<link rel="stylesheet" type="text/css" href="resources/find.css"/>
</head>
<body>
<div class="wrapper">
			<c:set var="account" value="${requestScope.account }"/>
			<c:forEach items="${account.weibos }" var="w">
			<div class="wb">
			
			    <c:if test="${empty w}">
			              该用户没有发布过微博。
			    </c:if>
			  <c:if test="${not empty w}">
			      <a class="pic" href="/find/${account.aid }">
		          <img src="/resources/image/${account.pic }"/>
		         </a>
				
				<h3><a href="#">${account.nickName }</a></h3>
				<div>
				<img src="/resources/image/${w.imgname }"/>
				</div>
				<p>${w.wcontent }</p>
				
				<a class="timer"><fmt:formatDate value="${w.lastUpdateTime}" pattern="yyyy-MM-dd HH:mm:ss" /></a> <br/>
				<a class="liked" href="/like/${w.wid}">推荐(${w.liked })</a>
				<a class="showcomment" href="/showcomment/${w.wid }">评论(${w.comment})</a>
			</div>
			</c:if>
		
			</c:forEach>
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