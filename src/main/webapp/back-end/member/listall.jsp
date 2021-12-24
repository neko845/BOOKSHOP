<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.member.model.*"%>
<%
	MemberService memberSvc = new MemberService();
	List<MemberVO> list = memberSvc.getAll();
	pageContext.setAttribute("list", list);
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
<style>
#header {
	margin: 20px auto;
}

.content {
	width: 1100px;
	margin: 90px auto;
}
</style>
</head>
<body>
	<%@ include file="/back-end/header.jsp"%>
	<div class="content">
		<table class="table">
			<thead class="thead-dark">
				<tr>
					<th scope="col">會員編號</th>
					<th scope="col">會員帳號</th>
					<th scope="col">會員密碼</th>
					<th scope="col">會員暱稱</th>
					<th scope="col">創建時間</th>
					<th scope="col">會員狀態</th>
					<th scope="col"></th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="memberVO" items="${list}" varStatus="list">
				<tr>
					<td>${memberVO.member_id}</td>
					<td>${memberVO.member_account}</td>
					<td>${memberVO.member_password}</td>
					<td>${memberVO.member_nick}</td>
					<td>${memberVO.creat_time}</td>
					<td>${memberVO.member_state}</td>
					<td><form method="post"
						action="<%=request.getContextPath()%>/member/member.do"
						style="margin-bottom: 0px;">
						<input type="submit" value="刪除"> <input type="hidden"
							name="member_id" value="${memberVO.member_id}"> <input
							type="hidden" name="action" value="delete">
					</form></td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>