<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<%@ page import="com.member.model.*"%>
<%
  MemberVO memberVO = (MemberVO) request.getAttribute("memberVO");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>Insert title here</title>
</head>
<body>
<table>
	<tr>
		<th>�|���ʺ�</th>
		<th>�Ыخɶ�</th>
	</tr>
	<tr>
		<td><%=memberVO.getMember_nick()%></td>
		<td><%=memberVO.getCreat_time()%></td>
	</tr>
</table>
</body>
</html>