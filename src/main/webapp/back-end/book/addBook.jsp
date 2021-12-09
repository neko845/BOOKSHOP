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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
	$(".write").focus(function(){
		$(this).css("background-color","yellow");
	});
	$(".write").blur(function(){
		$(this).css("background-color","#ffffff");
	});
});
</script>
</head>
<body>
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
</body>
</html>