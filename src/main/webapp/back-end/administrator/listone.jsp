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
</head>
<body>
	<ul>
		<li><a
			href="<%=request.getContextPath()%>/back-end/administrator/listall.jsp"
			id="url">查看全部</a><br>
		<br></li>
	</ul>

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
</body>
</html>