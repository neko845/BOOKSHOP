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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
	integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
	integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js"
	integrity="sha384-VHvPCCyXqtD5DqJeNxl2dtTyhF78xXNXdkwX1CZeRusQfRKp+tA7hAShOK/B/fQ2"
	crossorigin="anonymous"></script>
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
#header {
	margin: 20px auto;
}

.content {
	width: 600px;
	margin: 90px auto;
}
</style>
</head>
<body>
	<%@ include file="/back-end/header.jsp"%>
	<div class="content">
	<c:if test="${not empty errorMsgs}">
				<font style="color: red">請修正以下錯誤:</font>
				<ul>
					<c:forEach var="message" items="${errorMsgs}">
						<li style="color: red">${message}</li>
					</c:forEach>
				</ul>
			</c:if>
		<FORM METHOD="post"
			ACTION="<%=request.getContextPath()%>/book/book.do" name="form1"
			enctype="multipart/form-data">
			<div class="form-group row">
				<label for="staticEmail" class="col-sm-2 col-form-label">商品編號:</label>
				<div class="col-sm-10">
					<input type="text" readonly id="staticEmail"
						name="bookId" value="<%=bookVO.getBookId()%>">
				</div>
			</div>
			<div class="form-group row">
				<label for="inputPassword" class="col-sm-2 col-form-label">商品名稱:</label>
				<div class="col-sm-10">
					<input name="bookName" type="text" id="inputPassword"
						placeholder="" value="<%=bookVO.getBookName()%>">
				</div>
			</div>
			<div class="form-group row">
				<label for="inputPassword" class="col-sm-2 col-form-label">商品介紹:</label>
				<div class="col-sm-10">
					<textarea name="bookContent" id="inputPassword" placeholder=""
						rows="3"><%=bookVO.getBookContent()%></textarea>
				</div>
			</div>
			<div class="form-group row">
				<label for="inputPassword" class="col-sm-2 col-form-label">商品數量:</label>
				<div class="col-sm-10">
					<input name="bookQty" type="text" id="inputPassword" placeholder=""
						value="<%=bookVO.getBookQty()%>">
				</div>
			</div>
			<div class="form-group row">
				<label for="inputPassword" class="col-sm-2 col-form-label">商品圖片:</label>
				<div class="col-sm-10">
					<input name="bookImg" type="file" id="inputPassword" placeholder=""
						value="<%=bookVO.getBookImg()%>">
				</div>
			</div>
			<div class="form-group row">
				<label for="inputPassword" class="col-sm-2 col-form-label">上架時間:</label>
				<div class="col-sm-10">
					<input name="addedTime" type="date" id="inputPassword"
						placeholder="" value="<%=bookVO.getAddedTime()%>">
				</div>
			</div>
			<div class="form-group row">
				<label for="inputPassword" class="col-sm-2 col-form-label">下架時間:</label>
				<div class="col-sm-10">
					<input name="downTime" type="date" id="inputPassword"
						placeholder="" value="<%=bookVO.getDownTime()%>">
				</div>
			</div>

			<input type="hidden" name="action" value="update"> <input
				type="hidden" name="bookId" value="<%=bookVO.getBookId()%>">
			<button type="submit" class="btn btn-primary">修改</button>
		</form>
	</div>
</body>
</html>