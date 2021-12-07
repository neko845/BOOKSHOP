<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.book.model.*"%>
<%
    List<BookVO> list = (List)session.getAttribute("buycar");
    pageContext.setAttribute("list",list);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
img{
  width:100px;
  height:100px;
</style>
</head>
<body>
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
		</tr>
	</c:forEach>
</table>
</body>
</html>