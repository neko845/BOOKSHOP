<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js" integrity="sha384-VHvPCCyXqtD5DqJeNxl2dtTyhF78xXNXdkwX1CZeRusQfRKp+tA7hAShOK/B/fQ2" crossorigin="anonymous"></script>
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
#header{
margin: 20px auto;

}
.content {
	margin: 100px auto;
	width: 600px; 
	height: 600px;
	text-align: center;
	font-size: 20px;
}
</style>
</head>
<body>
	<%@ include file="/front-end/header.jsp"%>
	<div class="content">

		<FORM METHOD="post"
			ACTION="<%=request.getContextPath()%>/member/member.do">
			<c:if test="${not empty errorMsgs}">
				<font style="color: red">請修正以下錯誤:</font>
				<ul>
					<c:forEach var="message" items="${errorMsgs}">
						<li style="color: red">${message}</li>
					</c:forEach>
				</ul>
			</c:if>
			<div class="form-group">
				<label for="exampleDropdownFormEmail2">輸入帳號 : </label> <input
					type="text" class="form-control" id="exampleDropdownFormEmail2"
					placeholder="Account" name="member_account">
			</div>
			<div class="form-group">
				<label for="exampleDropdownFormPassword2">輸入密碼 : </label> <input
					type="password" class="form-control"
					id="exampleDropdownFormPassword2" placeholder="Password"
					name="member_password">
			</div>
			<input type="hidden" name="action" value="getOne">
			<button type="submit" class="btn btn-primary">登入</button>
		</form>
	</div>
</body>
</html>