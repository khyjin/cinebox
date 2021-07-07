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
	padding: 5px 5px 45px;
	text-align: center;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<section class="openContent">
<div class="main_book" >
<h3>상영 예정인 영화</h3>
<c:set  var="goods_count" value="0" />
<div class="movietabcontainer" id="moviecontainer">
		<ul class="movietabs">
        <li><a href="${contextPath}/goods/movieopen.do">현재 상영 중인 영화</a></li>
         <li><a href="${contextPath}/goods/moviescheduled.do">상영 예정인 영화</a></li>
        <li><a href="${contextPath}/goods/movieclosed.do">상영 종료된 영화</a></li>
        </ul>
      </div>
	<c:forEach var="item" items="${goodsMap.readysc}">
	   <c:set  var="goods_count" value="${goods_count+1 }" />
		<div class="book">
			<a href="${contextPath}/goods/goodsDetail.do?movie_id=${item.movie_id }">
			<img class="link"  src="${contextPath}/resources/image/1px.gif"> 
			</a>

				<img width="171" height="204" src="${contextPath}/thumbnails.do?movie_id=${item.movie_id}&image_file_name=${item.movie_fileName}">

			<div class="title">${item.movie_title }</div>
			<div class="date">개봉일&emsp;<fmt:formatDate value="${item.movie_open_date}" pattern="yy-MM-dd"/></div>
			<div class="price">
		  	   예매버튼추가예정
			</div>
		</div>
	   <c:if test="${goods_count==8}">
         <div class="book">
           <font size=20> <a href="#">more</a></font>
         </div>
     </c:if>
  </c:forEach>
</div>
</section>
</body>
</html>