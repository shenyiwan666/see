<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>账号管理</title>
		<link rel="stylesheet" type="text/css" href="../resources/account/index.css"/>
		
	</head>
	<body>
	
		<table id="table">
				
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
					         
					          <div  class="btn" >  
					                                    浏览
					          <input type="file" class="ac_file" id="img" name="file" onchange="xmTanUploadImg(this)" accept="image/*">
					          </div>
					          	 <img class="shangchuan" id="fabuimg"/>
         						 <div id="fabudiv"></div>
	                          <div id="div_btn_fabu"><input type="submit" id="btn_fabu" value="上传"  /></div>
				             </form>
						</td>
					</tr>
					<tr>
						<td></td>
						<td>
							<input type="submit" id="btn_login" value="确定" 
							onclick="javascript:top.location.href='/'"/>
						</td>
					</tr>
				</tbody>
			</table>
			
		   
	       <script type="text/javascript">
				function show() {
				 var message1 = document.getElementById("nickName").value;
				 var message2 = document.getElementById("email").value;
				 var message3 = document.getElementById("password").value;
				 return true;
				}
			</script>
		
	</body>

	<script type="text/javascript">	
		function xmTanUploadImg(obj) {
	        var file = obj.files[0];
	        
	        console.log(obj);console.log(file);
	        console.log("file.size = " + file.size);  //file.size 单位为byte
	
	        var reader = new FileReader();
	
	        //读取文件过程方法
	        reader.onloadstart = function (e) {
	            console.log("开始读取....");
	        }
	        reader.onprogress = function (e) {
	            console.log("正在读取中....");
	        }
	        reader.onabort = function (e) {
	            console.log("中断读取....");
	        }
	        reader.onerror = function (e) {
	            console.log("读取异常....");
	        }
	        reader.onload = function (e) {
	            console.log("成功读取....");
	
	            var img = document.getElementById("fabuimg");
	            img.src = e.target.result;
	            //或者 img.src = this.result;  //e.target == this
	        }
	
	        reader.readAsDataURL(file)
	    }
	</script>
	
</html>


<%-- 


<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>主页</title>
		<script src="https://cdn.bootcss.com/jquery/2.2.4/jquery.js"></script>
		<link rel="stylesheet" type="text/css" href="resources/index.css"/>
	</head>
	
	<body>
		<div id="site-name">
			<img src="image/eyes_icon.png">
			<h1>See<small>Share your colorful life</small></h1>
		</div>
		
		<div class="menu_nav">
	       <ul>
	         <li class="active"><a href="index.html"><span>Home Page</span></a></li>
	         <li><c:set var="account" value="${requestScope.account}"/><a href="/account/${account.aid }"><span>Setting</span></a></li>
	         <li><a href="about.html"><span>About Us</span></a></li>
	         <li><a href="contact.html"><span>Contact Us</span></a></li>
	       </ul>
	     </div>
		
		
        <div id="searchform">
        	<form id="formsearch" name="formsearch" action="/search" method="get">
				搜索:<input type="text" name="q" value="${param.q }"/><input type="submit" value="搜索" />
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
		
	</body>
	
</html> --%>