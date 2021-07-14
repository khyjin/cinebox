<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
section{
	font-family:'맑은 고딕';
	color :#168;
	position:relative;
	text-align:center;
}
</style>
<meta charset="UTF-8">
<title>찾아오시는 길</title>
</head>
<body>
	<h1>찾아오시는 길</h1>
	<br><section>
		
		<br><strong>
		경기도 수원시 팔달구 덕영대로 899(매산로 1가, 세진브론즈빌)
		<br>지하철 1호선 수원역 13번 출구 20m 직진 세브론즈빌딩 3F 
		</strong>
		<p><br>
		<img src="${contextPath}/resources/image/pin.png" width="50" height="50">
		<br><br>
		<h3>대표전화 031) 253-5225
		<br>
		Fax 031) 253-9900<br>
		</h3><br>
		<img src="${contextPath}/resources/image/map.PNG" style="border-radius:10%"><br>
		</section>
</body>
</html>