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
<style type="text/css">
			body {
				margin: 0;
				background: #ccc;
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
<div class="wrapper">
			<c:set var="account" value="${requestScope.account }"/>
			<c:forEach items="${account.weibos }" var="w">
			<div class="wb">
				<img src="/resources/image/${account.pic }"/>
				<h3><a href="#">${account.nickName }</a></h3>
				<p>${w.wcontent }</p>
			</div>
			</c:forEach>
		</div>
	</body>


</body>
</html>