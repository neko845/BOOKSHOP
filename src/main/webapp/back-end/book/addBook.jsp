<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.book.model.*"%>
<%
	BookVO bookVO = (BookVO) request.getAttribute("bookVO");
%>
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
	width: 300px;
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
.content{
width: 1200px;
margin: 20px auto;
padding: 20px 60px;
border: 2px solid black;
font-size: 20px;
box-sizing: border-box;
}
</style>
</head>
<body>
<div id="header">
		<div class="container">
			<p>後臺管理</p>
			<nav>
				<a href="<%=request.getContextPath()%>/back-end/book/listall.jsp"
					class="url">商品管理</a> <a
					href="<%=request.getContextPath()%>/back-end/administrator/listone.jsp"
					class="url">管理員資料</a> <a
					href="<%=request.getContextPath()%>/back-end/administrator/listall.jsp"
					class="url">管理員帳號管理</a>
			</nav>
		</div>
	</div>
	<div class="content">
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<form method="post" action="<%=request.getContextPath()%>/book/book.do"
		name="form1" enctype="multipart/form-data">
		<table>
			<tr>
				<td>商品名稱:</td>
				<td><input type="TEXT" name="bookName" class="write"
					value="<%=(bookVO == null) ? "商品名稱" : bookVO.getBookName()%>" /></td>
			</tr>
			<tr>
				<td>活動簡介:</td>
				<td><textarea class="write" name="bookContent"  rows="14"><%=(bookVO == null) ? "商品介紹" : bookVO.getBookContent()%></textarea></td>

			</tr>
			<tr>
				<td>商品數量:</td>
				<td><input type="TEXT" name="bookQty" class="write"
					value="<%=(bookVO == null) ? "1" : bookVO.getBookQty()%>" /></td>
			</tr>
			<tr>
				<td>活動圖片:</td>
				<td><input type="file" name="bookImg" class="write"
					value="<%=(bookVO == null) ? "" : bookVO.getBookImg()%>" /></td>
			</tr>
			<tr>
				<td>上架時間:</td>
				<td><input type="date" name="addedTime" class="write"
					value="<%=(bookVO == null) ? "" : bookVO.getAddedTime()%>" /></td>
			</tr>
			<tr>
				<td>下架時間:</td>
				<td><input type="date" name="downTime" class="write"
					value="<%=(bookVO == null) ? "" : bookVO.getDownTime()%>" /></td>
			</tr>
			
		</table>
		<br> <input type="hidden" name="action" value="insert"> <input
			type="submit" value="送出新增">
	</form>
	</div>
</body>
</html>