<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"	isELIgnored="false"
	%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
  request.setCharacterEncoding("UTF-8");
%>  
<head>
<style type="text/css">
.myButton {
	box-shadow:inset 0px 0px 0px 0px #155961;
	background:linear-gradient(to bottom, #1e4a4f 5%, #1c4145 100%);
	background-color:#1e4a4f;
	border:2px solid #20494d;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:'맑은 고딕';
	font-size:small;
	font-weight:bold;
	padding:2px 40px;
	text-decoration:none;
	text-shadow:2px 0px 0px #08383d;
	margin-top: 10px;
}
.myButton:hover {
	background:linear-gradient(to bottom, #1c4145 5%, #1e4a4f 100%);
	background-color:#1c4145;
}
.myButton:active {
	position:relative;
	top:1px;
}


</style>
</head>
<div class="main_book">
   <c:set  var="goods_count" value="0" />
	<h3>예매율 순위&emsp;<a href="${contextPath}/goods/movieopen.do" id="more">더 보기<img width="23" height="15" src="${contextPath}/resources/image/more.png"></a></h3><br>
	<c:forEach var="item" items="${goodsMap.screening}">
	   <c:set  var="goods_count" value="${goods_count+1 }" />
		<div class="book">
			<a href="${contextPath}/goods/goodsDetail.do?movie_id=${item.movie_id }">
			<img class="link"  src="${contextPath}/resources/image/1px.gif"> 
			</a>
				<img width="171" height="204" src="${contextPath}/thumbnails.do?movie_id=${item.movie_id}&image_file_name=${item.movie_fileName}">
			<div class="title">${item.movie_title }</div>
		  	  <a href="${contextPath}/ticket/reservation.do" class="myButton">예매하기</a>

		</div>
	   <c:if test="${goods_count==8}">
         <div class="book">
           <font size=20> <a href="#">more</a></font>
         </div>
     </c:if>
  </c:forEach>
</div>


<div class="clear"></div>

<div class="clear"></div>
<div class="main_book">
<c:set  var="goods_count" value="0" />
	<h3>상영 예정작&emsp;<a href="${contextPath}/goods/moviescheduled.do" id="more">더 보기 <img width="23" height="15" src="${contextPath}/resources/image/more.png"></a></h3><br>
	<c:forEach var="item" items="${goodsMap.readysc}" >
	   <c:set  var="goods_count" value="${goods_count+1 }" />
		<div class="book">
		  <a href="${contextPath}/goods/goodsDetail.do?movie_id=${item.movie_id}">
	       <img class="link"  src="${contextPath}/resources/image/1px.gif"> 
	      </a>
		 <img width="171" height="204" 
		 src="${contextPath}/thumbnails.do?movie_id=${item.movie_id}&image_file_name=${item.movie_fileName}">
		<div class="title">${item.movie_title }</div>
			<div class="date">개봉일&emsp;<fmt:formatDate value="${item.movie_open_date}" pattern="yy-MM-dd"/></div>
	</div>
	 <c:if test="${goods_count==15}">
   </c:if>
	</c:forEach>
</div>

<div class="clear"></div>
<div id="ad_main_banner">
	<ul class="bjqs">	 	
	  <li><img width="970" height="160" src="${contextPath}/resources/image/cine_event.png"></li>
		<li><img width="970" height="160" src="${contextPath}/resources/image/cine_event2.png"></li>
		<li><img width="970" height="160" src="${contextPath}/resources/image/cine_event3.png"></li> 
	</ul>
</div>






   
   