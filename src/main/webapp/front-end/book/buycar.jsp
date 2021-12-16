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
<link href="reset.css">
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
<style type="text/css">
.container {
	width: 1200px;
	height: 90px;
	margin: 0 auto;
	border: 2px solid black;
	box-sizing: border-box;
}

p {
	font-size: 40px;
	width: 200px;
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

nav a {
	padding: 0 10px;
	font-size: 20px
}

img {
	width: 150px;
	height: 200px;
}

.content {
	/* 	border:2px solid black; */
	margin: 20px auto;
	padding: 10px 50px;
	width: 1200px;
	box-sizing: border-box;
}

#bookpic {
	width: 300px;
	font-size: 20px;
}

#bookname {
	width: 300px;
	font-size: 20px;
}

#booktext {
	width: 500px;
	font-size: 20px;
}

td {
	border: 2px solid black;
}
</style>
</head>
<body>
	<div id="header">
		<div class="container">
			<p>bookshop</p>
			<nav>
				<a href="<%=request.getContextPath()%>/front-end/book/listall.jsp"
					class="url">商品</a> <a
					href="<%=request.getContextPath()%>/front-end/member/listOne.jsp"
					class="url">我的會員</a> <a
					href="<%=request.getContextPath()%>/front-end/member/addmember.jsp"
					class="url">新增會員</a> <a
					href="<%=request.getContextPath()%>/front-end/book/buycar.jsp"
					class="url">購物車</a>
			</nav>
		</div>
	</div>
	<div class="content">
		<h1>購物車</h1>
		<table>
			<tr>
				<td id="bookpic">商品圖片</td>
				<td id="bookname">商品名稱</td>
				<td id="booktext">商品介紹</td>
			</tr>
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
		</table>
	</div>
</body>
</html>