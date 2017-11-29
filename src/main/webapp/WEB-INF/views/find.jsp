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
	<link rel="stylesheet" type="text/css" href="../resources/find.css"/>
</head>
<body>
	<c:set var="account" value="${requestScope.account }"/>
	 <div class="userinfo">
	      <a class="userpic" href="/find/${account.aid }">
	      <img src="/resources/image/${account.pic }"/>
	      </a>
          <span class="nickname">
          ${account.nickName} 的主页
          </span>
        
      </div>
      <div class="clr"></div>
	<div class="wrapper">
		
		<c:forEach items="${account.weibos }" var="w">
		<div class="wb">
           <%-- 		
		    <c:if test="${empty w}">
		              该用户没有发布过微博。
		    </c:if>
		  <c:if test="${not empty w}" --%>
		      <%-- <a class="pic" href="/find/${account.aid }">
	          <img src="/resources/image/${account.pic }"/>
	         </a>
			
			<h3><a href="#">${account.nickName }</a></h3>
			<div>
			<img src="/resources/image/${w.imgname }" style="heiht:250px;"/>
			</div>
			<p>${w.wcontent }</p>
			
			<a class="timer"><fmt:formatDate value="${w.lastUpdateTime}" pattern="yyyy-MM-dd HH:mm:ss" /></a> <br/>
			<a class="liked" href="/like/${w.wid}">推荐(${w.liked })</a>
			<a class="showcomment" href="/showcomment/${w.wid }">评论(${w.comment})</a> --%>
			
			
			
			
			<a class="pic1" href="/find/${account.aid }">
		         <img src="/resources/image/${account.pic }"/>
		         </a>		
					<h3><p>${account.nickName}</p></h3>
					<div class="show">
					   	<img class="img-show" src="/resources/image/${w.imgname}" style="height:250px;"/>
					    <p class="content-show">${w.wcontent }</p><br/>
				    </div>
				    <div class="clr"></div>
					<div class="comment_line">
						<a class="timer"><fmt:formatDate value="${w.lastUpdateTime}" pattern="yyyy-MM-dd HH:mm:ss" /></a>
						<a class="liked" href="/like/${w.wid}">推荐(${w.liked })</a>
						<a class="showcomment" href="/showcomment/${w.wid }">评论(${w.comment})</a>
					</div>
					<div class="clr"></div>
					<form id="subcom"  class="commentform" method="post"  action="/comment/${w.wid }">
		 				<!-- <input class="ccontent" type="text" id="ccontent" placeholder="留下你的评论" name="ccontent" /> -->
		            	<div class="comment-input">
			            	<textarea rows="1" cols="20" class="ccontent"  id="ccontent" placeholder="留下你的评论" name="ccontent" style="height:20px; width:300px;"></textarea>
			            	<input class="cc"  type="button" id="btn_pinglun"  value="评论"  />
		            	</div> 	
					</form>
					<div class="comment"></div>
	
<%-- 		</c:if> --%>
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


</html>