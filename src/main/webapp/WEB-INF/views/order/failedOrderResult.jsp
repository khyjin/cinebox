<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	isELIgnored="false"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<style>
#list td{
	text-align: left; 
	font-size:14px;
	
}

h1{
	text-align:center;
}

#buttons{
	font-size:20px;
	border-radius:10px; 
	border:0;
	padding: 15px 32px;
	background-color: #555555;
	color:white;
}

</style>
</head>
<BODY><center>
	<H1>결제가 실패했습니다.</H1>
	이미 예약된 좌석입니다.
	

    <DIV class="clear"></DIV>
	<br>
	<br>
	<br>
		<center>
		<br>
		<br> 
		<a href="${contextPath}/main/main.do">
		<button id="buttons">홈으로</button>
		</a>
		<a href="${contextPath}/ticket/reservation.do">
		<button id="buttons">다시 예매하기</button>
		</a>
		<br>
		<br>
<DIV class="clear"></DIV>		
	
			
			
			