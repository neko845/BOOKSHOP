<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.member.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
  MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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
		<th>會員暱稱</th>
		<th>創建時間</th>
	</tr>
	<tr>
		<td><%=memberVO.getMember_nick()%></td>
		<td><%=memberVO.getCreat_time()%></td>
	</tr>
	<tr>
		<td>
			<form method="post" action="<%=request.getContextPath()%>/member/member.do" style="margin-bottom: 0px;">
				<input type="submit" value="修改資料">
				<input type="hidden" name="member_account" value="${memberVO.member_account}">
				<input type="hidden" name="action" value="getOne_For_Update">
			</form>
		</td>
	</tr>
</table>
</body>
</html>