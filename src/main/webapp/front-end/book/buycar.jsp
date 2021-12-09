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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
	$("#url").mouseenter(function(){
		$(this).css("color","red");
	});
	$("#url").mouseleave(function(){
		$(this).css("color","black");
	});
});
</script>
<style type="text/css">
img{
  width:100px;
  height:100px;
</style>
</head>
<body>
<ul>
  <li><a href="<%=request.getContextPath()%>/front-end/book/listall.jsp" id="url">首頁</a><br><br></li>
</ul>
<table>
	<tr>
		<th>商品編號</th>
		<th>商品名稱</th>
		<th>商品介紹</th>
		<th>商品圖片</th>
	</tr>
	<c:forEach var="bookVO" items="${list}" varStatus="list">
		
		<tr>
			<td>${bookVO.bookId}</td>
			<td>${bookVO.bookName}</td>
			<td>${bookVO.bookContent}</td>
			<td>
				<img alt="" src="<%=request.getContextPath()%>/book/getpic.do?picno=${bookVO.bookId}">
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/book/book.do" style="margin-bottom: 0px;">
			     <input type="submit" value="移除商品">
			     <input type="hidden" name="bookId"  value="${bookVO.bookId}">
			     <input type="hidden" name="action" value="deletecar"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>
</body>
</html>