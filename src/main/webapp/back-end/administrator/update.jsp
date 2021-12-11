<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.administrator.model.*"%>
<%
	AdministratorVO administratorVO = (AdministratorVO) session.getAttribute("administratorVO");
%>
<title>Insert title here</title>
</head>
<body>
	<ul>
		<li><a
			href="<%=request.getContextPath()%>/back-end/administrator/listone.jsp"
			id="url">個人管理員資料</a><br>
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

	<FORM METHOD="post"
		ACTION="<%=request.getContextPath()%>/administrator/administrator.do"
		name="form1" enctype="multipart/form-data">
		<table>
			<tr>
				<td>管理員帳號:</td>
				<td><%=administratorVO.getAdministrator_account()%></td>
			</tr>
			<tr>
				<td>管理員密碼:</td>
				<td><input type="TEXT" name="administrator_password" size="45"
					value="<%=administratorVO.getAdministrator_password()%>" /></td>
			</tr>

		</table>
		<br> <input type="hidden" name="action" value="update"> <input
			type="hidden" name="administrator_id"
			value="<%=administratorVO.getAdministrator_id()%>"> <input
			type="submit" value="送出修改">
	</FORM>
</body>
</html>