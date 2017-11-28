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
		<link rel="stylesheet" type="text/css" href="resources/indexx.css"/>
	</head>
	
	<body>
		<div id="site-name">
			<img src="image/eyes_icon.png"> 
			<h1>See<small>Share your colorful life</small></h1>
		</div>
		
		  <c:set var="account" value="${requestScope.account}"/>
		  
		  <a class="setting" href="/account/${account.aid }">
		   <img src="/resources/image/settings.png" />
		   </a>
		  
		
        <div id="searchform">
        	<form id="formsearch" name="formsearch" action="/search" method="get">
				<%-- 搜索:<input type="text" name="q" value="${param.q }"/><input type="submit" value="搜索" /> --%>
				<span>
	            <input name="q" class="editbox_search" id="editbox_search" maxlength="80" value="${param.q }" type="text" />
	            </span>
	            <input name="button_search" class="button_search" type="submit" value="     "/>
			</form>
        </div>

		<br></br>
		<div id="fabuForm">
	       <form id="formfabu" method="post" action="/fabu" enctype="multipart/form-data">
				<span><textarea rows="4" cols="20" id="wcontent" class="text_field" placeholder="分享此刻看见" name="wcontent"  maxlength="140"></textarea>
				<!-- <input type="text" id="wcontent" class="text_field" placeholder="分享此刻看见" name="wcontent"  maxlength="140"/> -->
				</span>
				<a class="share_img"><input type="file" id="img" class="img" name="file"></a>
				<div class="clr"></div>
	            <div><input type="submit" id="btn_fabu" class= "btn_fabu" value="发表" /></div>
	            <!-- <div class="clr"></div> -->
	            
	       </form>
        </div>

        <%-- 		
        <c:set var="account" value="${requestScope.account}"/>
        <a href="/account/${account.aid }">账户管理</a> --%>
   
   
        <div class="userinfo">
              <a class="userpic" href="/find/${account.aid }">
		      <img src="/resources/image/${account.pic }"/>
		      </a>
		      <div class="clr0"></div>
	          <div class="nickname"><strong>${account.nickName}</strong></div>
	          <div class="wbs"><strong>${account.allweibo}</strong></div>
	          <div class="wbs-t">微博</div>
	          <div class="follow"><strong>${account.follows}</strong></div>
	          <div class="follow-t">关注</div>
	          <div class="fans"><strong>${account.fans}</strong></div>
	          <div class="fans-t">粉丝</div>
         </div>
   
   
		<div class="clr"></div>
        
        <div class="wrapper-wb">
        	<div class= "dynamic-inform">
        	<c:forEach items="${page.list }" var="w"> 
        		<% /* <c:forEach items="${requestScope.weibos }" var="w">*/%>
				<div class="wb">
				 <a class="pic1" href="/find/${w.account.aid }">
		         <img src="/resources/image/${w.account.pic }"/>
		         </a>
					
					<h3><p>${w.account.nickName}</p></h3>
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
				</div>
				</c:forEach>

        	<div class="clr"></div>
       		<div class="page-info">
	      		<div class="page-style">
		      		<c:if test="${page.cur gt 1 }">
						<a href="/?p=1">首页</a>
						<a href='/?p=${page.cur - 1 }'>上一页</a>
					</c:if>
					<c:forEach begin="1" end="${page.total }" var="p">
	
						<c:if test="${page.cur eq p }">
							<a class="cur" href="javascript:void(0);">${p }</a>
						</c:if>
						<c:if test="${page.cur ne p }">
							<a href='/?p=${p }'>${p }</a>
						</c:if>
					</c:forEach>
					<c:set var="last" value="${page.total }"/>
					<c:if test="${page.cur lt last }">
						<a href="/?p=${page.total}">末页</a>
						<a href="/?p=${page.cur + 1 }">下一页</a>
					</c:if>
	      		</div>
	      		<div class="clr"></div>
		   		</div>
		   		
			</div>
			  
		</div>
		
		
		<!-- <br/><br/>
		 -->
		<div class="wrapper-top">
			<div class="top-inform">
				<p>热门TOP10</p>
				<c:set var="weibo" value="${requestScope.weibo}"/>
				<c:forEach items="${weibo}" var="weibo">
				<div class="top">
				 
		          <img src="/resources/image/${weibo.imgname }"/>
		           <div class="top-content" style="width:180px;height:50px;font-size:15px;"><p>${weibo.wcontent }</p></div>
		           <div class="clr0"></div>
		           <div class="ops-for-top">
			           <a class="topnickname" href="#">${weibo.account.nickName}</a>
					   <a class="follow" href="/follow/${weibo.account.aid}">${weibo.account.follow }</a>
		           </div>
				   <div class="clr0"></div>
				</div>
				</c:forEach>
			</div>
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
			var user = $('.userinfo > p.follow ');
			$.get(_a.attr('href'), function(data){
				if(data[0]==1){
					_a.html( '已关注' );
				}
				if(data[0]==0){
					_a.html( '关注' );
				}
				user.html('关注数：'+ data[1]);
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
	
/* 	侧边栏滚动效果，拷贝留用，勿动
	$(function(){
	    var oDiv = document.getElementById("float"),
	    H = 0,
	    Y = oDiv
	    while (Y) {H += Y.offsetTop; Y = Y.offsetParent}
	    window.onscroll = function()
	    {
	        var s = document.body.scrollTop || document.documentElement.scrollTop
	        if(s>H) {
	            oDiv.style = "position:fixed;top:0;"
	        } else {
	            oDiv.style = ""
	        }
	    }
	}); */
	
	$(function(){
		$('.wb> #subcom > .comment-input > input.cc').click(function( e ){
			e.preventDefault();
			var _sub = $( this );
			var _com = _sub.prev().val();
			var comment = _sub.parent().parent().parent().children(".comment");
			var _ping = _sub.parent().parent().prev().prev().children(".showcomment");
			
			$.post(_sub.parent().parent(".commentform").attr('action'),{"comment": _com },function( data ){
				_ping.html('评论 (' + data.comment + ')' );
				
				if(comment.html() == ""){
					alert("评论成功 ");
				}else{
					$('<p></p>').html(data.comments.account.nickName+":"+data.comments.ccontent).prependTo( comment );
					alert("评论success");
				}
			}, 'json');
		});
		
	});

	</script>
</html>