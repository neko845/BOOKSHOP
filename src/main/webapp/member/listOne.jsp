<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.member.model.*"%>
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
<table>
	<tr>
		<th>會員暱稱</th>
		<th>創建時間</th>
	</tr>
	<tr>
		<td><%=memberVO.getMember_nick()%></td>
		<td><%=memberVO.getCreat_time()%></td>
	</tr>
</table>
</body>
</html>