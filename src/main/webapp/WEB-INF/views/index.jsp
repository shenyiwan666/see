<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>主页</title>
		<script src="https://cdn.bootcss.com/jquery/2.2.4/jquery.js"></script>
		<link rel="stylesheet" type="text/css" href="resources/index.css"/>
	</head>
	
	<body>
		<div>
			<img src="eyes_icon.png">
			<h1>See</h1>
		</div>
		<br></br>
		<div id="head_menu">
			<div id="fabuForm">
		        <form method="post" action="/fabu">
		 			<div id="div_content"><input type="text" id="wcontent" class="text_field" placeholder="分享此刻看见" name="wcontent" /></div>
		            <div id="div_btn_fabu"><input type="submit" id="btn_fabu" value="分享"  /></div>
		        </form>
	        </div>
	        <div class="searchform">
	        	<form id="formsearch" name="formsearch" action="/search" method="get">
					<%-- 搜索:<input type="text" name="q" value="${param.q }"/><input type="submit" value="搜索" /> --%>
					<span>
		            <input name="q" class="editbox_search" id="editbox_search" maxlength="80" value="${param.q }" type="text" />
		            </span>
		            <input name="button_search" class="button_search" type="submit" value="     "/>
				</form>
	        </div>
		</div>
		<div class="clr"></div>
        
        
        <div class="wrapper">
			<c:forEach items="${requestScope.weibos }" var="w">
			<div class="wb">
				<img src="/resources/image/${w.account.pic }"/>
				<h3><p>${w.account.nickName}</p></h3>
				<p>${w.wcontent }</p><br/>
				<div class="comment_line">
					<a><fmt:formatDate value="${w.lastUpdateTime}" pattern="yyyy-MM-dd HH:mm:ss" /></a>
					<a class="liked" href="/like/${w.wid}">推荐(${w.liked })</a>
					<a class="showcomment" href="/showcomment/${w.wid }">评论(${w.comment})</a>
				</div>
				<form id="subcom" method="post" action="/comment/${w.wid }">
	 				<input type="text" id="ccontent" placeholder="留下你的评论" name="ccontent" />
	            	<input type="button" id="btn_pinglun"  value="评论"  />
				</form>
				
				<div class="comment">
				
<<<<<<< HEAD
				</div>	
=======
				</div>
			
>>>>>>> 83789e82fb3b7487c29e0963054c9c93493ca1f0
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
		
		$('.wb > .comment_line > a.liked ').click(function( e ){
			e.preventDefault();
			var _a = $( this );
			$.get(_a.attr('href'), function( data ){
				_a.html( '推荐(' + data + ')' );
			}, 'json');
		});
		
	});

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
	
	
	$(function(){
		var i=0;
		$('.wb > .comment_line > a.showcomment').click(
			function( e ){
				e.preventDefault();
				var _a = $( this );
				if(i==0){
				$.get(_a.attr('href'), function(data){
					var comment = _a.parent().parent().children(".comment");
						for(var i=0;i<data.length;i++){
							$('<p></p>').html(data[i].account.nickName+":"+data[i].ccontent ).appendTo( comment );
						}
							$('<a></a>').attr("class","closecomment").css("cursor","pointer").html("收起 ").on('click',function(){
								comment.empty();
							}).appendTo( comment );
				}, 'json');
				i=1;
			}else{
				var comment = _a.parent().parent().children(".comment");
				comment.empty();
				i=0;
			}
		});
	});

	

	</script>
</html>