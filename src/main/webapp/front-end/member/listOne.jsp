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
<link href="reset.css">
<style>
.container {
	width: 1200px;
	height: 90px;
	margin: 0 auto;
	border: 2px solid black;
	box-sizing: border-box;
}

p {
	font-size: 40px;
	width: 200px;
	height: auto;
	float: left;
	margin: 0;
	padding: 20px 45px;
	box-sizing: border-box;
}

nav {
	float: right;
	padding: 24px 60px;
}

nav a {
	padding: 0 10px;
	font-size: 20px;
}
.content{
width: 1200px;
margin:10px auto;
}
table{
margin:30px auto;
font-size: 20px;
}
</style>
</head>
<body>
<div id="header">
		<div class="container">
			<p>bookshop</p>
			<nav>
				<a href="<%=request.getContextPath()%>/front-end/book/listall.jsp"
					class="url">商品</a> <a
					href="<%=request.getContextPath()%>/front-end/member/listOne.jsp"
					class="url">我的會員</a><a
					href="<%=request.getContextPath()%>/front-end/member/addmember.jsp"
					class="url">新增會員</a> <a
					href="<%=request.getContextPath()%>/front-end/book/buycar.jsp"
					class="url">購物車</a>
			</nav>
		</div>
	</div>
	<div class="content">
<%-- <c:if test="${not empty errorMsgs}"> --%>
<!-- 		<font style="color: red">請修正以下錯誤:</font> -->
<!-- 		<ul> -->
<%-- 			<c:forEach var="message" items="${errorMsgs}"> --%>
<%-- 				<li style="color: red">${message}</li> --%>
<%-- 			</c:forEach> --%>
<!-- 		</ul> -->
<%-- </c:if> --%>
<table>
<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
</c:if>
	<tr>
		<th>會員暱稱</th>
		<th>創建時間</th>
	</tr>
	<tr>
		<td><%=memberVO.getMember_nick()%></td>
		<td><%=memberVO.getCreat_time()%></td>
		<td>
			<form method="post" action="<%=request.getContextPath()%>/member/member.do" style="margin-bottom: 0px;">
				<input type="submit" value="修改資料">
				<input type="hidden" name="member_account" value="${memberVO.member_account}">
				<input type="hidden" name="action" value="getOne_For_Update">
			</form>
		</td>
	</tr>
</table>
</div>
</body>
</html>