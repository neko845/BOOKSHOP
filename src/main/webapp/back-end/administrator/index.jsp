<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
.content{
width:300px;
margin:200px auto;
}
</style>
</head>
<body>

<div class="content">
<h1>管理員登入</h1>
<c:if test="${not empty errorMsgs}">
				<font style="color: red">請修正以下錯誤:</font>
				<ul>
					<c:forEach var="message" items="${errorMsgs}">
						<li style="color: red">${message}</li>
					</c:forEach>
				</ul>
			</c:if>
		<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/administrator/administrator.do" >
			
			<div class="form-group">
				<label for="exampleDropdownFormEmail2">輸入帳號 : </label> <input
					type="text" class="form-control" id="exampleDropdownFormEmail2"
					placeholder="" name="administrator_account">
			</div>
			<div class="form-group">
				<label for="exampleDropdownFormPassword2">輸入密碼 : </label> <input
					type="password" class="form-control"
					id="exampleDropdownFormPassword2" placeholder=""
					name="administrator_password">
			</div>
			<input type="hidden" name="action" value="login">
			<button type="submit" class="btn btn-primary">登入</button>
		</form>
	</div>

<!-- <div class="content"> -->


<%--     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/administrator/administrator.do" > --%>
<!--         <b>輸入帳號 : </b> -->
<!--         <input type="text" name="administrator_account" class="write"><br> -->
<!--         <b>輸入密碼 : </b> -->
<!--         <input type="text" name="administrator_password" class="write"><br> -->
<!--         <input type="hidden" name="action" value="login"> -->
<!--         <input type="submit" value="送出"> -->
<!--     </FORM> -->
<!--     </div> -->
</body>
</html>