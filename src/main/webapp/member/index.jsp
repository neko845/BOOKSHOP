<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>Insert title here</title>
</head>
<body>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
	<ul>
	    <c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>
<ul>
<li>
    <FORM METHOD="post" ACTION="member.do" >
        <b>��J�b��</b>
        <input type="text" name="member_account">
        <b>��J�K�X</b>
        <input type="text" name="member_password">
        <input type="hidden" name="action" value="getOne">
        <input type="submit" value="�e�X">
    </FORM>
  </li>
</ul>
</body>
</html>