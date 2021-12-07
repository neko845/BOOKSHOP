<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.book.model.*"%>
<%
BookVO bookVO = (BookVO) request.getAttribute("bookVO");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

<FORM METHOD="post" ACTION="<%= request.getContextPath()%>/book/book.do" name="form1" enctype="multipart/form-data">
<table>
	<tr>
		<td>商品編號:<font color=red><b>*</b></font></td>
		<td><%=bookVO.getBookId()%></td>
	</tr>
	<tr>
		<td>商品名稱:</td>
		<td><input type="TEXT" name="bookName" size="45"	value="<%=bookVO.getBookName()%>" /></td>
	</tr>
	<tr>
		<td>商品介紹:</td>
		<td><textarea class="form-control" name="bookContent" placeholder="Message" rows="14"><%=bookVO.getBookContent()%></textarea></td>
	</tr>
	<tr>
		<td>店家數量:</td>
		<td><input type="TEXT" name="bookQty" size="45" value="<%=bookVO.getBookQty()%>" /></td>
	</tr>
	<tr>
		<td>商品圖片:</td>
		<td><input type="FILE" name="bookImg" size="45" value="<%=bookVO.getBookImg()%>" /></td>
	</tr>
	<tr>
		<td>上架時間:</td>
		<td><input type="date" name="addedTime" size="45" value="<%=bookVO.getAddedTime()%>" /></td>
	</tr>
	<tr>
		<td>下架時間:</td>
		<td><input type="date" name="downTime" size="45" value="<%=bookVO.getDownTime()%>" /></td>
	</tr>

</table>
<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="bookId" value="<%=bookVO.getBookId()%>">
<input type="submit" value="送出修改"></FORM>
</body>
</html>