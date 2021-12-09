<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.member.model.*"%>
<%
	MemberVO memberVO = (MemberVO) request.getAttribute("memberVO");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
	$(".write").focus(function(){
		$(this).css("background-color","yellow");
	});
	$(".write").blur(function(){
		$(this).css("background-color","#ffffff");
	});
});
</script>
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
	<form method="post" action="<%=request.getContextPath()%>/member/member.do" name="form1" enctype="multipart/form-data">
		<table>
			<tr>
				<td>會員帳號</td>
				<td>
					<input type="text" name="member_account" class="write" value="<%=(memberVO == null) ? "" : memberVO.getMember_account()%>">
				</td>
			</tr>
			<tr>
				<td>會員密碼</td>
				<td>
					<input type="text" name="member_password" class="write" value="<%=(memberVO == null) ? "" : memberVO.getMember_password()%>">
				</td>
			</tr>
			<tr>
				<td>會員暱稱</td>
				<td>
					<input type="text" name="member_nick" class="write" value="<%=(memberVO == null) ? "" : memberVO.getMember_nick()%>">
				</td>
			</tr>
		</table>
		<br>
		<input type="hidden" name="action" value="insert">
		<input type="submit" value="送出新增">
	</form>
</body>
</html>