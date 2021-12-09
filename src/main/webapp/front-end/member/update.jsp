<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<FORM METHOD="post" ACTION="<%= request.getContextPath()%>/member/member.do" name="form1" enctype="multipart/form-data">
<table>
	<tr>
		<td>會員帳號:</td>
		<td><%=memberVO.getMember_account()%></td>
	</tr>
	<tr>
		<td>會員密碼:</td>
		<td><textarea class="TEXT" name="member_password" size="45"><%=memberVO.getMember_password()%></textarea></td>
	</tr>
	<tr>
		<td>會員暱稱:</td>
		<td><textarea class="TEXT" name="member_nick" size="45"><%=memberVO.getMember_nick()%></textarea></td>
	</tr>

</table>
<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="member_id" value="<%=memberVO.getMember_id()%>">
<input type="submit" value="送出修改"></FORM>
</body>
</html>