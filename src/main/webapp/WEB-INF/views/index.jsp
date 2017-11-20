<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>主页</title>
		<script src="https://cdn.bootcss.com/jquery/2.2.4/jquery.js"></script>
		<link rel="stylesheet" type="text/css" href="resources/index.css"/>
			
		</style>
	</head>
	
	<body>
		 <div id="fabuForm">
	        <form method="post" action="/fabu">
	 			<div id="div_content"><input type="text" id="wcontent" class="text_field" placeholder="分享此刻看见" name="wcontent" /></div>
	            <div id="div_btn_fabu"><input type="submit" id="btn_fabu" value="发布"  /></div>
	
	        </form>
        </div>
        
        <form action="/search" method="get">
			搜索:<input type="text" name="q" value="${param.q }"/><input type="submit" value="搜索" />
		</form>
        
        <div class="wrapper">
			<c:forEach items="${requestScope.weibos }" var="w">
			<div class="wb">
				<div>
					<img src="/resources/image/${w.account.pic }"/>
				</div>
				<div>
					<h3><a href="/follow/${w.account.aid}">${w.account.nickName}</a></h3>
					<p>${w.wcontent }</p><br/>
					<p><fmt:formatDate value="${w.lastUpdateTime}" pattern="yyyy-MM-dd HH:mm:ss" /></p>
					<a class="liked" href="/like/${w.wid}">推荐(${w.liked })</a>
					<a>评论(${w.comment})</a>
					<p>
				</div>
				
			</div>
			</c:forEach>
		</div>
		
		<br/><br/>
		<p>热门TOP10</p>
		<div class="wrapper">
			<c:set var="weibo" value="${requestScope.weibo}"/>
			<c:forEach items="${weibo}" var="weibo">
			<div class="top">
				<img src="/resources/image/${weibo.account.pic }"/>
				<h3><a href="#">${weibo.account.nickName}</a></h3>
				<a class="follow" href="/follow/${weibo.account.aid}">${weibo.account.follow }</a>
				<p>${weibo.wcontent }</p>
				
			</div>
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
	
	<script type="text/javascript">
	$(function(){

		$('.top > a.follow').click(function( e ){
			e.preventDefault();
			var _a = $( this );
			$.get(_a.attr('href'), function(data){
				if(data==1){
					_a.html( '已关注' );
				}
				if(data==0){
					_a.html( '关注' );
				}
			}, 'json');
		});
		
	});
	</script>
</html>