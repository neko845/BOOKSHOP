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
</head>
<body>
	<ul>
		<li><a
			href="<%=request.getContextPath()%>/back-end/administrator/addadministrator.jsp"
			id="url">新增管理員</a><br>
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
</body>
</html>