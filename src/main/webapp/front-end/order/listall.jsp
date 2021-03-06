<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.member.model.*"%>
<%@ page import="com.order.model.*"%>
<%	
	MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");	
	Order_titleService order_titleSvc = new Order_titleService();
	List<Order_titleVO> list = order_titleSvc.getallone(memberVO.getMember_account());
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
	width: 1100px;
	margin: 90px auto;
}

img {
	width: 250px;
	height: 250px
}
</style>
</head>
<body>
<%@ include file="/front-end/header.jsp"%>
<!-- 	<div id="header"> -->
<!-- 		<div class="container"> -->
<!-- 			<nav class="navbar navbar-expand-lg navbar-light bg-light"> -->
<!-- 				<a class="navbar-brand" -->
<%-- 					href="<%=request.getContextPath()%>/front-end/book/listall.jsp">bookshop</a> --%>
<!-- 				<button class="navbar-toggler" type="button" data-toggle="collapse" -->
<!-- 					data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" -->
<!-- 					aria-expanded="false" aria-label="Toggle navigation"> -->
<!-- 					<span class="navbar-toggler-icon"></span> -->
<!-- 				</button> -->
<!-- 				<div class="collapse navbar-collapse" id="navbarNavDropdown"> -->
<!-- 					<ul class="navbar-nav"> -->
<!-- 						<li class="nav-item active"><a class="nav-link" -->
<%-- 							href="<%=request.getContextPath()%>/front-end/information/listall.jsp">???????????? --%>
<!-- 								<span class="sr-only">(current)</span> -->
<!-- 						</a></li> -->
<!-- 						<li class="nav-item active"><a class="nav-link" -->
<%-- 							href="<%=request.getContextPath()%>/front-end/book/buycar.jsp">????????? --%>
<!-- 								<span class="sr-only">(current)</span> -->
<!-- 						</a></li> -->
<!-- 						<li class="nav-item dropdown"><a -->
<!-- 							class="nav-link dropdown-toggle" href="#" -->
<!-- 							id="navbarDropdownMenuLink" data-toggle="dropdown" -->
<!-- 							aria-haspopup="true" aria-expanded="false"> ?????? </a> -->
<!-- 							<div class="dropdown-menu" -->
<!-- 								aria-labelledby="navbarDropdownMenuLink"> -->
<%-- 								<c:if test="${empty memberVO}"> --%>
<!-- 							<a class="dropdown-item" -->
<%-- 									href="<%=request.getContextPath()%>/front-end/member/index.jsp">??????</a> --%>
<!-- 							<a class="dropdown-item" -->
<%-- 									href="<%=request.getContextPath()%>/front-end/member/addmember.jsp">??????</a> --%>
<%-- 							</c:if> --%>
<%-- 							<c:if test="${not empty memberVO}"> --%>
<!-- 							<a class="dropdown-item" -->
<%-- 									href="<%=request.getContextPath()%>/front-end/member/listOne.jsp">????????????</a> --%>
<!-- 									<a class="dropdown-item" -->
<%-- 									href="<%=request.getContextPath()%>/front-end/order/listall.jsp">????????????</a> --%>
<%-- 							</c:if> --%>
<!-- 							</div></li> -->
<!-- 					</ul> -->
<!-- 				</div> -->
<!-- 			</nav> -->
<!-- 		</div> -->
<!-- 	</div> -->
	<div class="content">
		<c:if test="${not empty errorMsgs}">
			<font style="color: red">?????????????????????:</font>
			<ul>
				<c:forEach var="message" items="${errorMsgs}">
					<li style="color: red">${message}</li>
				</c:forEach>
			</ul>
		</c:if>


		<table class="table">
			<thead class="thead-dark">
				<tr>
					<th scope="col">????????????</th>
					<th scope="col">????????????</th>
					<th scope="col">????????????</th>
					<th scope="col">????????????</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="order_titleVO" items="${list}" varStatus="list">
					<tr>
						<td>${order_titleVO.order_id}</td>
						<td>${order_titleVO.member_account}</td>
						<td>${order_titleVO.order_time}</td>
						<td><FORM METHOD="post"
								ACTION="<%=request.getContextPath()%>/order/order.do"
								style="margin-bottom: 0px;">
								<input type="submit" value="????????????"> <input type="hidden"
									name="order_id" value="${order_titleVO.order_id}"> <input
									type="hidden" name="action" value="getallone">
							</FORM></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	</div>
</body>
</html>