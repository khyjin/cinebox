<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    isELIgnored="false"
    %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
 
<body>    
    <div id="sticky" >
	<ul>
		<li><h3>CINEBOX</h3></li>&emsp;
		<li><a href="#">
			공지사항 <img width="20" height="15" src="${contextPath}/resources/image/more2.png"></a></li>
		<li><a href="#">
		   상영시간표  <img width="15" height="10" src="${contextPath}/resources/image/more2.png">
		 </a></li>
		 <li><a href="#">
		   빠른예매  <img width="20" height="15" src="${contextPath}/resources/image/more2.png">
		 </a></li>
		<li><a>공유하기</a>
			<img width="15" height="20" src="${contextPath}/resources/image/more3.png"></li>
		<li><a href="#">
		   <img	width="52" height="52" src="${contextPath}/resources/image/facebook_icon2.png">
		</a></li>&emsp;
		<li><a href="#">
		   <img width="33" height="33" src="${contextPath}/resources/image/instagram_icon.png">
		</a></li>
		<li><a href="#">
		   <img width="35" height="35" src="${contextPath}/resources/image/twitter_icon2.png">
		</a></li>&emsp;&emsp;&emsp;
		 <li><a href="#"  id="top">
		   <img width="45" height="45" src="${contextPath}/resources/image/top3.png">
		  </a></li>&emsp;
	</ul>&emsp;
</div>
</body>
</html>
 
