<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="reset.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		$(".write").focus(function() {
			$(this).css("background-color", "yellow");
		});
		$(".write").blur(function() {
			$(this).css("background-color", "#ffffff");
		});
	});
</script>
<style>
.content {
	margin: 10px auto;
	padding:100px auto;
	width: 1200px;
	height: 600px;
/* 	border:1px black solid; */
	text-align: center;
	font-size: 20px;
}
#login{
width:600px;
text-align: center;
margin: 200px auto;
}
</style>
</head>
<body>
<div class="content">
<div id="login">
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
	    <c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>


    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/administrator/administrator.do" >
        <b>輸入帳號 : </b>
        <input type="text" name="administrator_account" class="write"><br>
        <b>輸入密碼 : </b>
        <input type="text" name="administrator_password" class="write"><br>
        <input type="hidden" name="action" value="login">
        <input type="submit" value="送出">
    </FORM>
    </div>
    </div>
</body>
</html>