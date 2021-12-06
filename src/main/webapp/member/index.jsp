<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<ul>
<li>
    <FORM METHOD="post" ACTION="member.do" >
        <b>輸入帳號</b>
        <input type="text" name="member_account">
        <b>輸入密碼</b>
        <input type="text" name="member_password">
        <input type="hidden" name="action" value="getOne">
        <input type="submit" value="送出">
    </FORM>
  </li>
</ul>
</body>
</html>