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
<style type="text/css">
img{
  width:100px;
  height:100px;
</style>
</head>
<body>
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
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/book/book.do" style="margin-bottom: 0px;">
			     <input type="submit" value="加入購物車">
			     <input type="hidden" name="bookId"  value="${bookVO.bookId}">
			     <input type="hidden" name="action" value="buycar"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>
</body>
</html>