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
		            		<div style="display:inline;height:36px;">
		            			<textarea rows="1" cols="20" class="ccontent"  id="ccontent" placeholder="留下你的评论" name="ccontent" style="height:20px; width:300px;"></textarea>
		            		</div>
		            		<div style="display:inline;" class="ping">
			            		<input class="cc"  type="button" id="btn_pinglun"  value="评论"  />
		            		</div>
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
		
		$('.wb > .comment_line > a.liked').click(function( e ){
			e.preventDefault();
			var _a = $( this );
			$.get(_a.attr('href'), function( data ){
				_a.html( '推荐(' + data + ')' );
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
							$('<a></a>').attr("class","closecomment").css("cursor","pointer").html("  收起 ").on('click',function(){
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
	
	$(function(){
		$('.wb> #subcom > .comment-input > .ping > input.cc').click(function( e ){
			e.preventDefault();
			var _sub = $( this );
			var _com = _sub.parent().prev().children(".ccontent").val();
			var comment = _sub.parent().parent().parent().parent().children(".comment");
			var _ping = _sub.parent().parent().parent().prev().prev().children(".showcomment");
			
			$.post(_sub.parent().parent().parent(".commentform").attr('action'),{"comment": _com },function( data ){
				_ping.html('评论 (' + data.comment + ')' );
				
				if(comment.html() == ""){
					alert("评论成功 ");
				}else{
					$('<p></p>').html(data.comments.account.nickName+":"+data.comments.ccontent).prependTo( comment );
					alert("评论成功");
				}
			}, 'json');
		});
		
	});
</script>


</html>