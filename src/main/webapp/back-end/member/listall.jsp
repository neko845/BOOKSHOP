<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.member.model.*"%>
<%
	MemberService memberSvc = new MemberService();
	List<MemberVO> list = memberSvc.getAll();
	pageContext.setAttribute("list",list);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
	<tr>
		<th>會員編號</th>
		<th>會員帳號</th>
		<th>會員密碼</th>
		<th>會員暱稱</th>
		<th>創建時間</th>
		<th>會員狀態</th>
	</tr>
	<c:forEach var="memberVO" items="${list}" varStatus="list">
		<tr>
			<td>${memberVO.member_id}</td>
			<td>${memberVO.member_account}</td>
			<td>${memberVO.member_password}</td>
			<td>${memberVO.member_nick}</td>
			<td>${memberVO.creat_time}</td>
			<td>${memberVO.member_state}</td>
			<td>
				<form method="post" action="<%=request.getContextPath()%>/member/member.do" style="margin-bottom: 0px;">
					<input type="submit" value="刪除">
					<input type="hidden" name="member_id" value="${memberVO.member_id}">
					<input type="hidden" name="action" value="delete">
				</form>
			</td>
		</tr>
	</c:forEach>
</table>
</body>
</html>