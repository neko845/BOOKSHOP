<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="reset.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		$(".write").focus(function() {
			$(this).css("background-color", "yellow");
		});
		$(".write").blur(function() {
			$(this).css("background-color", "#ffffff");
		});
		$(".url").mouseenter(function() {
			$(this).css("color", "red");
		});
		$(".url").mouseleave(function() {
			$(this).css("color", "black");
		});
	});
</script>
<style>
.container {
	width: 1200px;
	height: 90px;
	margin: 0 auto;
	border: 2px solid black;
	box-sizing: border-box;
}

p {
	font-size: 40px;
	width: 200px;
	height: auto;
	float: left;
	margin: 0;
	padding: 20px 45px;
	box-sizing: border-box;
}

nav {
	float: right;
	padding: 24px 60px;
}

nav a {
	padding: 0 10px;
	font-size: 20px;
}

.content {
	margin: 10px auto;
	width: 1200px;
	height: 600px;
	/* border:1px black solid;  */
	text-align: center;
	font-size: 20px;
}

#login {
	margin: 250px;
}
</style>
</head>
<body>
	<div id="header">
		<div class="container">
			<p>bookshop</p>
			<nav>
				<a href="<%=request.getContextPath()%>/front-end/book/listall.jsp"
					class="url">商品</a> <a
					href="<%=request.getContextPath()%>/front-end/member/listOne.jsp"
					class="url">我的會員</a><a
					href="<%=request.getContextPath()%>/front-end/member/addmember.jsp"
					class="url">新增會員</a> <a
					href="<%=request.getContextPath()%>/front-end/book/buycar.jsp"
					class="url">購物車</a>
			</nav>
		</div>
	</div>
	<div class="content">


		<div id="login">
			<c:if test="${not empty errorMsgs}">
				<font style="color: red">請修正以下錯誤:</font>
				<ul>
					<c:forEach var="message" items="${errorMsgs}">
						<li style="color: red">${message}</li>
					</c:forEach>
				</ul>
			</c:if>
			<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/member/member.do">
				<b>輸入帳號 : </b> 
				<input type="text" name="member_account" class="write"><br> 
				<b>輸入密碼 : </b> 
				<input type="text" name="member_password" class="write"><br> 
				<input type="hidden" name="action" value="getOne"> 
				<input type="submit" value="送出">
			</FORM>
		</div>
	</div>
</body>
</html>