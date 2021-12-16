<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.book.model.*"%>
<%
	BookService bookSvc = new BookService();
    List<BookVO> list = bookSvc.getAll();
    pageContext.setAttribute("list",list);
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
<style>
.container {
	width: 1200px;
	height: 90px;
	margin: 0 auto;
	border: 2px solid black;
	box-sizing: border-box;
}

p {
	font-size: 40px;
	width: 300px;
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
img {
	width: 100px;
	height: 100px;
}
nav a {
	padding: 0 10px;
	font-size: 20px;
}

.content {
	margin: 10px auto;
	width: 1200px;
	height: 600px;
	border:1px black solid;  
	text-align: center;
	font-size: 20px;
}
.content {
	margin: 20px auto;
	width: 900px;
	box-sizing: border-box;
}

td {
	width: 1200px;
}

table {
	margin: 1px;
}
.wrap {
            width: 1200px;
            margin: auto;
            display: flex;
        }
.left{
width:300px;
border: 1px black solid;
margin:20px auto;
padding:20px auto;
box-sizing: border-box;
}
.add{
width:200px;
margin:300px 100px;
}
</style>

</head>
<body>
<div id="header">
		<div class="container">
			<p>後臺管理</p>
			<nav>
				<a href="<%=request.getContextPath()%>/back-end/book/listall.jsp"
					class="url">商品管理</a> <a
					href="<%=request.getContextPath()%>/back-end/administrator/listone.jsp"
					class="url">管理員資料</a> <a
					href="<%=request.getContextPath()%>/back-end/administrator/listall.jsp"
					class="url">管理員帳號管理</a>
			</nav>
		</div>
	</div>
	<div class="wrap">
	<div class="left">
	<a href="<%=request.getContextPath()%>/back-end/book/addBook.jsp"
					class="add">新增商品</a>
	</div>
	<div class="content">
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>
<table>
	<tr>
		<th>商品編號</th>
		<th>商品名稱</th>
		<th>商品介紹</th>
		<th>商品數量</th>
		<th>商品圖片</th>
		<th>上架時間</th>
		<th>下架時間</th>
	</tr>
	<c:forEach var="bookVO" items="${list}" varStatus="list">
		
		<tr>
			<td>${bookVO.bookId}</td>
			<td>${bookVO.bookName}</td>
			<td>${bookVO.bookContent}</td>
			<td>${bookVO.bookQty}</td>
			<td>
				<img alt="" src="<%=request.getContextPath()%>/book/getpic.do?picno=${bookVO.bookId}">
			</td>
			<td>${bookVO.addedTime}</td>
			<td>${bookVO.downTime}</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/book/book.do" style="margin-bottom: 0px;">
			     <input type="submit" value="修改">
			     <input type="hidden" name="bookId"  value="${bookVO.bookId}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/book/book.do" style="margin-bottom: 0px;">
			     <input type="submit" value="刪除">
			     <input type="hidden" name="bookId"  value="${bookVO.bookId}">
			     <input type="hidden" name="action" value="delete"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>
</div>
</div>
</body>
</html>