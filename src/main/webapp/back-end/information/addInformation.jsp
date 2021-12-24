<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.information.model.*"%>
<%
	InformationVO informationVO = (InformationVO) request.getAttribute("informationVO");
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		$(".url").mouseenter(function() {
			$(this).css("color", "red");
		});
		$(".url").mouseleave(function() {
			$(this).css("color", "black");
		});
	});
</script>
<style>
#header {
	margin: 20px auto;
}

.content {
	width: 1100px;
	margin: 90px auto;
}
</style>
</head>
<body>
<%@ include file="/back-end/header.jsp"%>
	<div class="content">
<form method="post" action="<%=request.getContextPath()%>/information/information.do" name="form1" enctype="multipart/form-data">
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>
  <div class="form-group">
    <label for="exampleFormControlInput1">活動名稱:</label>
    <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="" name="information_name" value="<%=(informationVO == null) ? "活動名稱" : informationVO.getInformation_name()%>">
  </div>
  <div class="form-group">
    <label for="exampleFormControlTextarea1">活動介紹:</label>
    <textarea class="form-control" id="exampleFormControlTextarea1" name="information_content" rows="3" ><%=(informationVO == null) ? "活動介紹" : informationVO.getInformation_content()%></textarea>
  </div>
  <div class="form-group">
    <label for="exampleFormControlInput1">活動圖片:</label>
    <input type="file" class="form-control" id="exampleFormControlInput1" placeholder="" name="information_img" value="<%=(informationVO == null) ? "" : informationVO.getInformation_img()%>">
  </div>
  <div class="form-group">
    <label for="exampleFormControlInput1">開始時間:</label>
    <input type="date" class="form-control" id="exampleFormControlInput1" placeholder="" name="added_time" value="<%=(informationVO == null) ? "" : informationVO.getAdded_time()%>">
  </div>
  <div class="form-group">
    <label for="exampleFormControlInput1">結束時間:</label>
    <input type="date" class="form-control" id="exampleFormControlInput1" placeholder="" name="down_time" value="<%=(informationVO == null) ? "" : informationVO.getDown_time()%>">
  </div>
  <input type="hidden" name="action" value="insert">
  <button type="submit" class="btn btn-primary">新增活動</button>
</form>
	</div>
</body>
</html>