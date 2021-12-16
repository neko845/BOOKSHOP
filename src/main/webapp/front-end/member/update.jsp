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
<link href="reset.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
	$(".write").focus(function(){
		$(this).css("background-color","yellow");
	});
	$(".write").blur(function(){
		$(this).css("background-color","#ffffff");
	});
	$(".url").mouseenter(function() {
		$(this).css("color", "red");
	});
	$(".url").mouseleave(function() {
		$(this).css("color", "black");
	});
});
</script>
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
margin: 20px auto;
padding: 20px 60px;
border: 2px solid black;
font-size: 20px;
box-sizing: border-box;
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
</div>
</body>
</html>