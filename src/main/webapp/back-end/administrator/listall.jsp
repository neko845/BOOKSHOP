<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.administrator.model.*"%>
<%
	AdministratorService administratorSvc = new AdministratorService();
	List<AdministratorVO> list = administratorSvc.getAll();
	pageContext.setAttribute("list", list);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

.content {
	margin: 10px auto;
	width: 1200px;
	height: 600px; 
	text-align: center;
	font-size: 20px;
}
.content {
	margin: 20px auto;
	width: 1200px;
	box-sizing: border-box; 
}

td {
	width: 1200px;
}

table {
	margin: 1px;
 	border: 1px black solid; 
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
			<th>管理員編號</th>
			<th>管理員帳號</th>
			<th>管理員密碼</th>
			<th>管理員階級</th>
			<th>管理員權限</th>
		</tr>
		<c:forEach var="administratorVO" items="${list}" varStatus="list">

			<tr>
				<td>${administratorVO.administrator_id}</td>
				<td>${administratorVO.administrator_account}</td>
				<td>${administratorVO.administrator_password}</td>
				<td>${administratorVO.administrator_class}</td>
				<td>${administratorVO.administrator_authority}</td>
				<td>
					<FORM METHOD="post"
						ACTION="<%=request.getContextPath()%>/administrator/administrator.do"
						style="margin-bottom: 0px;">
						<input type="submit" value="修改"> <input type="hidden"
							name="administrator_id"
							value="${administratorVO.administrator_id}"> <input
							type="hidden" name="action" value="getOne_For_UpdateClass">
					</FORM>
				</td>
				<td>
					<FORM METHOD="post"
						ACTION="<%=request.getContextPath()%>/administrator/administrator.do"
						style="margin-bottom: 0px;">
						<input type="submit" value="刪除"> <input type="hidden"
							name="administrator_id"
							value="${administratorVO.administrator_id}"> <input
							type="hidden" name="action" value="delete">
					</FORM>
				</td>
			</tr>
		</c:forEach>
	</table>
	</div>
</body>
</html>