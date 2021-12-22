<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.book.model.*"%>
<%
	List<BookVO> list = (List) session.getAttribute("buycar");
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
img{
width: 100px;
height:100px
}
.bt{

}
</style>
</head>
<body>
		<div id="header">
		<div class="container">
			<nav class="navbar navbar-expand-lg navbar-light bg-light">
				<a class="navbar-brand"
					href="<%=request.getContextPath()%>/front-end/book/listall.jsp">bookshop</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown"
					aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarNavDropdown">
					<ul class="navbar-nav">
					<li class="nav-item active"><a class="nav-link"
							href="<%=request.getContextPath()%>/front-end/information/listall.jsp">活動資訊
								<span class="sr-only">(current)</span>
						</a></li>
						<li class="nav-item active"><a class="nav-link"
							href="<%=request.getContextPath()%>/front-end/book/buycar.jsp">購物車
								<span class="sr-only">(current)</span>
						</a></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#"
							id="navbarDropdownMenuLink" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false"> 會員 </a>
							<div class="dropdown-menu"
								aria-labelledby="navbarDropdownMenuLink">
								<a class="dropdown-item"
									href="<%=request.getContextPath()%>/front-end/member/addmember.jsp">新增會員</a>
								<a class="dropdown-item"
									href="<%=request.getContextPath()%>/front-end/member/listOne.jsp">我的會員</a>
								<a class="dropdown-item"
									href="<%=request.getContextPath()%>/front-end/order/listall.jsp">我的訂單</a>
							</div></li>
					</ul>
				</div>
			</nav>
		</div>
	</div>
	<div class="content">
		<h1>購物車</h1>
		<table class="table">
			<thead class="thead-dark">
				<tr>
					<th scope="col">商品圖片</th>
					<th scope="col">商品名稱</th>
					<th scope="col">商品介紹</th>
					<th scope="col"></th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="bookVO" items="${list}" varStatus="list">
				<tr>
					<td><img alt=""
						src="<%=request.getContextPath()%>/book/getpic.do?picno=${bookVO.bookId}">
					</td>
					<td>${bookVO.bookName}</td>
					<td>${bookVO.bookContent}</td>

					<td>
						<FORM METHOD="post"
							ACTION="<%=request.getContextPath()%>/book/book.do"
							style="margin-bottom: 0px;">
							<input type="submit" value="移除商品"> <input type="hidden"
								name="bookId" value="${bookVO.bookId}"> <input
								type="hidden" name="action" value="deletecar">
						</FORM>
					</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
		<a href="<%=request.getContextPath()%>/front-end/book/checkout.jsp" class="btn btn-secondary btn-lg active" role="button" aria-pressed="true">確定商品</a>
	</div>
</body>
</html>