<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<style>
.content{
	margin:auto;
	width:500px;
	height:500px;
}

</style>
</head>
<body>
<div class="content">
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
	    <c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>


    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/member/member.do" >
        <b>輸入帳號 : </b>
        <input type="text" name="member_account" class="write"><br>
        <b>輸入密碼 : </b>
        <input type="text" name="member_password" class="write"><br>
        <input type="hidden" name="action" value="getOne">
        <input type="submit" value="送出">
    </FORM>
    
</div>
</body>
</html>