<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.member.model.*"%>
<%
	MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
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
<script>
	$(document).ready(function() {
		$(".write ").focus(function() {
			$(this).css("background-color", "yellow");
		});
		$(".write ").blur(function() {
			$(this).css("background-color", "#ffffff");
		});
		$(".url ").mouseenter(function() {
			$(this).css("color", "red");
		});
		$(".url ").mouseleave(function() {
			$(this).css("color", "black");
		});
	});
</script>
<style>
#header {
	margin: 20px auto;
}

#content {
	width: 600px;
	margin: 90px auto;
}
</style>
</head>
<body>
	<%@ include file="/front-end/header.jsp"%>
	<div id="content">
		<c:if test="${not empty errorMsgs}">
			<font style="color: red">?????????????????????:</font>
			<ul>
				<c:forEach var="message" items="${errorMsgs}">
					<li style="color: red">${message}</li>
				</c:forEach>
			</ul>
		</c:if>
		<form method="post"
			action="<%=request.getContextPath()%>/member/member.do" name="form1"
			enctype="multipart/form-data">

			<div class="form-group row">
				<label for="staticEmail" class="col-sm-2 col-form-label">????????????:</label>
				<div class="col-sm-10">
					<input type="text" readonly id="staticEmail"
						value="<%=memberVO.getMember_account()%>">
				</div>
			</div>
			<div class="form-group row">
				<label for="inputPassword" class="col-sm-2 col-form-label">????????????:</label>
				<div class="col-sm-10">
					<input name="member_password" type="text" id="inputPassword"
						placeholder="" value="<%=memberVO.getMember_password()%>">
				</div>
			</div>
			<div class="form-group row">
				<label for="inputPassword" class="col-sm-2 col-form-label">????????????:</label>
				<div class="col-sm-10">
					<input name="member_nick" type="text" id="inputPassword"
						placeholder="" value="<%=memberVO.getMember_nick()%>">
				</div>
			</div>
			<input type="hidden" name="action" value="update"> <input
				type="hidden" name="member_id" value="<%=memberVO.getMember_id()%>">
			<button type="submit" class="btn btn-primary">??????</button>
		</form>
	</div>
</body>
</html>