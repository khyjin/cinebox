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
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="main_book" >
<h3>상영 종료된 영화</h3><br>
<div class="movietabcontainer" id="moviecontainer">
		<ul class="movietabs">
        <li><a href="${contextPath}/goods/movieopen.do">현재 상영 중인 영화</a></li>
         <li><a href="${contextPath}/goods/moviescheduled.do">상영 예정인 영화</a></li>
        <li><a href="${contextPath}/goods/movieclosed.do">상영 종료된 영화</a></li>
        </ul>
      </div>
	<c:forEach var="item" items="${goodsMap.endsc}">
		<div class="book">
			<a href="${contextPath}/goods/goodsDetail.do?movie_id=${item.movie_id }">
			<img class="link"  src="${contextPath}/resources/image/1px.gif"> 
			</a>

				<img width="171" height="214" src="${contextPath}/thumbnails.do?movie_id=${item.movie_id}&image_file_name=${item.movie_fileName}">

			<div class="title">${item.movie_title }</div>
			<!-- <div class="score">평점 0.0</div> -->
		</div>
  </c:forEach>
</div>
<br><br>
<img width="980" height="160" src="${contextPath}/resources/image/cine_event4.png">
</body>
</html>