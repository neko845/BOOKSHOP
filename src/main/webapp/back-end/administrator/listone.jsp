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
<link href="reset.css">
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
margin:10px auto;
}
table{
margin:30px auto;
font-size: 20px;
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
	<table>
		<tr>
			<th>管理員帳號</th>
			<th>管理員密碼</th>
			<th>管理員階級</th>
		</tr>
		<tr>
			<td><%=administratorVO.getAdministrator_account()%></td>
			<td><%=administratorVO.getAdministrator_password()%></td>
			<td><%=administratorVO.getAdministrator_class()%></td>
		</tr>
		<tr>
			<td>
				<form method="post"
					action="<%=request.getContextPath()%>/administrator/administrator.do"
					style="margin-bottom: 0px;">
					<input type="submit" value="修改資料"> <input type="hidden"
						name="administrator_account"
						value="${administratorVO.administrator_account}"> <input
						type="hidden" name="action" value="getOne_For_Update">
				</form>
			</td>
		</tr>
	</table>
	</div>
</body>
</html>