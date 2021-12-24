<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.administrator.model.*"%>
<%
	AdministratorVO administratorVO = (AdministratorVO) request.getAttribute("administratorVO");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
	integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
	integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js"
	integrity="sha384-VHvPCCyXqtD5DqJeNxl2dtTyhF78xXNXdkwX1CZeRusQfRKp+tA7hAShOK/B/fQ2"
	crossorigin="anonymous"></script>
<style>
#header {
	margin: 20px auto;
}

.content {
	width: 900px;
	margin: 90px auto;
}
</style>
</head>
<body>
<%@ include file="/back-end/header.jsp"%>
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

			<div class="form-group row">
				<label for="staticEmail" class="col-sm-2 col-form-label">管理員帳號:</label>
				<div class="col-sm-10">
					<input type="text" readonly id="staticEmail"
						value="<%=administratorVO.getAdministrator_account()%>">
				</div>
			</div>
			<div class="form-group row">
				<label for="staticEmail" class="col-sm-2 col-form-label">管理員密碼:</label>
				<div class="col-sm-10">
					<input type="text" readonly id="staticEmail"
						value="<%=administratorVO.getAdministrator_password()%>">
				</div>
			</div>
			<div class="form-group row">
				<label for="inputPassword" class="col-sm-2 col-form-label">管理員階級:</label>
				<div class="col-sm-10">
					<input name="administrator_class" type="radio" id="inputPassword" value="0">高階管理員
					<input name="administrator_class" type="radio" id="inputPassword" value="1">一般管理員
				</div>
			</div>
			<div class="form-group row">
				<label for="inputPassword" class="col-sm-2 col-form-label">管理員權限:</label>
				<div class="col-sm-10">
					<input name="administrator_authority" type="radio" id="inputPassword" value="0">高階權限
					<input name="administrator_authority" type="radio" id="inputPassword" value="1">一般權限
				</div>
			</div>
			<input type="hidden" name="action" value="updateclass">
			<input type="hidden" name="administrator_id" value="<%=administratorVO.getAdministrator_id()%>">
			<button type="submit" class="btn btn-primary">修改</button>
		</form>
	
	
<!-- 	<FORM METHOD="post" -->
<%-- 		ACTION="<%=request.getContextPath()%>/administrator/administrator.do" --%>
<!-- 		name="form1" enctype="multipart/form-data"> -->
<!-- 		<table> -->
<!-- 			<tr> -->
<!-- 				<td>管理員帳號:</td> -->
<%-- 				<td><%=administratorVO.getAdministrator_account()%></td> --%>
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td>管理員密碼:</td> -->
<%-- 				<td><%=administratorVO.getAdministrator_password()%></td> --%>
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td>管理員階級</td> -->
<!-- 				<td><input type="radio" name="administrator_class" value="0">高階管理員</td> -->
<!-- 				<td><input type="radio" name="administrator_class" value="1">一般管理員</td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td>管理員權限</td> -->
<!-- 				<td><input type="radio" name="administrator_authority" -->
<!-- 					value="0">高階權限</td> -->
<!-- 				<td><input type="radio" name="administrator_authority" -->
<!-- 					value="1">一般權限</td> -->
<!-- 			</tr> -->

<!-- 		</table> -->
<!-- 		<br> <input type="hidden" name="action" value="updateclass"> -->
<!-- 		<input type="hidden" name="administrator_id" -->
<%-- 			value="<%=administratorVO.getAdministrator_id()%>"> <input --%>
<!-- 			type="submit" value="送出修改"> -->
<!-- 	</FORM> -->
	</div>
</body>
</html>