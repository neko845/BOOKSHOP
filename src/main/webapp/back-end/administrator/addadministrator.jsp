<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.administrator.model.*"%>
<%
	AdministratorVO administratorVO = (AdministratorVO) request.getAttribute("administratorVO");
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
			id="url">全部管理員資料</a><br>
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
	<form method="post"
		action="<%=request.getContextPath()%>/administrator/administrator.do"
		name="form1" enctype="multipart/form-data">
		<table>
			<tr>
				<td>管理員帳號</td>
				<td><input type="text" name="administrator_account"
					value="<%=(administratorVO == null) ? "" : administratorVO.getAdministrator_account()%>">
				</td>
			</tr>
			<tr>
				<td>管理員密碼</td>
				<td><input type="text" name="administrator_password"
					value="<%=(administratorVO == null) ? "" : administratorVO.getAdministrator_password()%>">
				</td>
			</tr>
			<tr>
				<td>管理員階級</td>
				<td><input type="radio" name="administrator_class" value="0">高階管理員</td>
				<td><input type="radio" name="administrator_class" value="1">一般管理員</td>
			</tr>
			<tr>
				<td>管理員權限</td>
				<td><input type="radio" name="administrator_authority"
					value="0">高階權限</td>
				<td><input type="radio" name="administrator_authority"
					value="1">一般權限</td>
			</tr>
		</table>
		<br> <input type="hidden" name="action" value="insert"> <input
			type="submit" value="送出新增">
	</form>
</body>
</html>