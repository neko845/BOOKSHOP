<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.administrator.model.*"%>
<%
	AdministratorVO administratorVO = (AdministratorVO) session.getAttribute("administratorVO");
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
	width: 600px;
	margin: 90px auto;
}
</style>
</head>
<body>
	<div id="header">
		<div class="container">
			<nav class="navbar navbar-expand-lg navbar-light bg-light">
				<a class="navbar-brand"
					href="<%=request.getContextPath()%>/back-end/administrator/listone.jsp">後臺管理</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown"
					aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarNavDropdown">
					<ul class="navbar-nav">
						<li class="nav-item active"><a class="nav-link"
							href="<%=request.getContextPath()%>/back-end/member/listall.jsp">會員管理
								<span class="sr-only">(current)</span>
						</a></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#"
							id="navbarDropdownMenuLink" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false">商品管理</a>
							<div class="dropdown-menu"
								aria-labelledby="navbarDropdownMenuLink">
								<a class="dropdown-item"
									href="<%=request.getContextPath()%>/back-end/book/addBook.jsp">新增商品</a>
								<a class="dropdown-item"
									href="<%=request.getContextPath()%>/back-end/book/listall.jsp">查看商品</a>
							</div></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#"
							id="navbarDropdownMenuLink" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false">管理員管理</a>
							<div class="dropdown-menu"
								aria-labelledby="navbarDropdownMenuLink">
								<a class="dropdown-item"
									href="<%=request.getContextPath()%>/back-end/administrator/addadministrator.jsp">新增管理員</a>
								<a class="dropdown-item"
									href="<%=request.getContextPath()%>/back-end/administrator/listall.jsp">查看管理員</a>
								<a class="dropdown-item"
									href="<%=request.getContextPath()%>/back-end/administrator/listone.jsp">管理員資料</a>
							</div></li>
					</ul>
				</div>
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

		<table class="table">
			<thead class="thead-dark">
				<tr>
					<th scope="col">管理員帳號</th>
					<th scope="col">管理員密碼</th>
					<th scope="col">管理員階級</th>
					<th scope="col">修改管理員</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><%=administratorVO.getAdministrator_account()%></td>
					<td><%=administratorVO.getAdministrator_password()%></td>
					<td><%=administratorVO.getAdministrator_class()%></td>
					<td><form method="post"
							action="<%=request.getContextPath()%>/administrator/administrator.do"
							style="margin-bottom: 0px;">
							<input type="submit" value="修改資料"> <input type="hidden"
								name="administrator_account"
								value="${administratorVO.administrator_account}"> <input
								type="hidden" name="action" value="getOne_For_Update">
						</form></td>
				</tr>
			</tbody>
		</table>


		<!-- 	<table> -->
		<!-- 		<tr> -->
		<!-- 			<th>管理員帳號</th> -->
		<!-- 			<th>管理員密碼</th> -->
		<!-- 			<th>管理員階級</th> -->
		<!-- 		</tr> -->
		<!-- 		<tr> -->
		<%-- 			<td><%=administratorVO.getAdministrator_account()%></td> --%>
		<%-- 			<td><%=administratorVO.getAdministrator_password()%></td> --%>
		<%-- 			<td><%=administratorVO.getAdministrator_class()%></td> --%>
		<!-- 		</tr> -->
		<!-- 		<tr> -->
		<!-- 			<td> -->
		<!-- 				<form method="post" -->
		<%-- 					action="<%=request.getContextPath()%>/administrator/administrator.do" --%>
		<!-- 					style="margin-bottom: 0px;"> -->
		<!-- 					<input type="submit" value="修改資料"> <input type="hidden" -->
		<!-- 						name="administrator_account" -->
		<%-- 						value="${administratorVO.administrator_account}"> <input --%>
		<!-- 						type="hidden" name="action" value="getOne_For_Update"> -->
		<!-- 				</form> -->
		<!-- 			</td> -->
		<!-- 		</tr> -->
		<!-- 	</table> -->
	</div>
</body>
</html>