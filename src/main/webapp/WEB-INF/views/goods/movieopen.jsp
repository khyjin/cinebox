<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.main_book{
	padding:10px;
}
.main_book h3{
	border:0;
	padding: 5px 5px 5px;
	text-align: center;
}
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
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="main_book" >
<h3>현재 상영 중인 영화</h3><br>
<c:set  var="goods_count" value="0" />
<div class="movietabcontainer" id="moviecontainer">
		<ul class="movietabs">
        <li><a href="${contextPath}/goods/movieopen.do">현재 상영 중인 영화</a></li>
         <li><a href="${contextPath}/goods/moviescheduled.do">상영 예정인 영화</a></li>
        <li><a href="${contextPath}/goods/movieclosed.do">상영 종료된 영화</a></li>
        
        </ul>
      </div>
	<c:forEach var="item" items="${goodsMap.screening}">
	   <c:set  var="goods_count" value="${goods_count+1 }" />
		<div class="book">
			<a href="${contextPath}/goods/goodsDetail.do?movie_id=${item.movie_id }">
			<img class="link"  src="${contextPath}/resources/image/1px.gif"> 
			</a>

				<img width="171" height="214" src="${contextPath}/thumbnails.do?movie_id=${item.movie_id}&image_file_name=${item.movie_fileName}">

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
<br><br>
<img width="980" height="160" src="${contextPath}/resources/image/cine_event4.png">
</body>
</html>