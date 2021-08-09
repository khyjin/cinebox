<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>

div.checkPoint {
	font-family : "맑은 고딕";
	font-weight : bold;
	font-size:30;
	padding: 10;
}
table#point {
	font-family : "맑은 고딕";
	font-size : 25;
	width : 100%;
	text-align : left;
}
</style>
<title>Insert title here</title>
</head>
<body>
<section class="mypage_main">
<div class="checkPoint">
<img src="${contextPath}/resources/image/coinlogo.jpg" width="70" height="70"/>
 CINEBOX 포인트 
 <hr>
 </div><br>
 
<table id="point" cellspacing="20">
<tr>
	<td width="350">
	${memberInfo.member_name}님의 사용가능 포인트  
	
	</td>
	
	<td>
	<Strong><fmt:formatNumber type="number" value="${point}" pattern="#,##0" />점</Strong>
	</td>
</tr>


</table>
<br>



</section>
</body>
</html>