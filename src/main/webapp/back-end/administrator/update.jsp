<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.administrator.model.*"%>
<%
	AdministratorVO administratorVO = (AdministratorVO) session.getAttribute("administratorVO");
%>
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
	width: 300px;
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
img {
	width: 100px;
	height: 100px;
}
nav a {
	padding: 0 10px;
	font-size: 20px;
}

.content {
	margin: 10px auto;
	width: 1200px;
	height: 600px;
	border:1px black solid;  
	text-align: center;
	font-size: 20px;
}
.content{
width: 1200px;
margin: 20px auto;
padding: 20px 60px;
border: 2px solid black;
font-size: 20px;
box-sizing: border-box;
</style>
</head>
<body>
<div id="header">
		<div class="container">
			<p>後臺管理</p>
			<nav>
				<a href="<%=request.getContextPath()%>/back-end/book/listall.jsp"
					class="url">商品管理</a> <a
					href="<%=request.getContextPath()%>/back-end/administrator/listone.jsp"
					class="url">管理員資料</a> <a
					href="<%=request.getContextPath()%>/front-end/administrator/listall.jsp"
					class="url">管理員帳號管理</a>
			</nav>
		</div>
	</div>
	<div class="content">

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
	</div>
</body>
</html>