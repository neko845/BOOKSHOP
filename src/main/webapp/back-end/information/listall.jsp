<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.information.model.*"%>
<%
	InformationService informationSvc = new InformationService();
	List<InformationVO> list = informationSvc.getAll();
	pageContext.setAttribute("list", list);
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
	width: 1200px;
	margin: 90px auto;
}

img {
	width: 100px;
	height: 100px;
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
		<table class="table">
			<thead class="thead-dark">
				<tr>
					<th scope="col">活動編號</th>
					<th scope="col">活動名稱</th>
					<th scope="col">活動介紹</th>
					<th scope="col">活動圖片</th>
					<th scope="col">開始時間</th>
					<th scope="col">結束時間</th>
					<th scope="col">修改</th>
					<th scope="col">刪除</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="informationVO" items="${list}" varStatus="list">
					<tr>
						<td>${informationVO.information_id}</td>
						<td>${informationVO.information_name}</td>
						<td>${informationVO.information_content}</td>
						<td><img alt=""
							src="<%=request.getContextPath()%>/information/getpic.do?picno=${informationVO.information_id}"></td>
						<td>${informationVO.added_time}</td>
						<td>${informationVO.down_time}</td>
						<td><FORM METHOD="post"
								ACTION="<%=request.getContextPath()%>/information/information.do"
								style="margin-bottom: 0px;">
								<input type="submit" value="修改"> <input type="hidden"
									name="information_id" value="${informationVO.information_id}"> <input
									type="hidden" name="action" value="getOne_For_Update">
							</FORM></td>
						<td><FORM METHOD="post"
								ACTION="<%=request.getContextPath()%>/information/information.do"
								style="margin-bottom: 0px;">
								<input type="submit" value="刪除"> <input type="hidden"
									name="information_id" value="${informationVO.information_id}"> <input
									type="hidden" name="action" value="delete">
							</FORM></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

</body>
</html>