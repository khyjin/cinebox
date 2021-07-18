<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    isELIgnored="false"
    %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<html>
<head>
<style type="text/css">
#sticky ul li a:hover {
	font-size:15px;
}
</style>
</head>
</html>
<body>    
    <div id="sticky" >
	<ul>
		<li><h3>CINEBOX</h3></li>&emsp;
		<li><a href="${contextPath}/cscenter/cscenterNotice.do">
			공지사항</a></li>
		<li><a href="${contextPath}/schedule/selectSchedule.do">
		   상영시간표</a></li>
		 <li><a href="${contextPath}/ticket/reservation.do">
		   빠른예매</a></li>
		   <li></li>
		<li style="font-family: 맑은 고딕">공유하기</li>
		<li><a href="https://www.facebook.com">
		   <img	width="52" height="52" src="${contextPath}/resources/image/facebook_icon2.png">
		</a></li>&emsp;
		<li><a href="https://www.instagram.com">
		   <img width="33" height="33" src="${contextPath}/resources/image/instagram_icon.png">
		</a></li>
		<li><a href="https://www.twitter.com">
		   <img width="35" height="35" src="${contextPath}/resources/image/twitter_icon2.png">
		</a></li>&emsp;&emsp;&emsp;
		 <li><a href="#"  id="top">
		   <img width="45" height="45" src="${contextPath}/resources/image/top3.png">
		  </a></li>&emsp;
	</ul>&emsp;
</div>
</body>
</html>
 
