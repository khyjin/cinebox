<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"	isELIgnored="false"
	%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
  request.setCharacterEncoding("UTF-8");
%>  

<div class="main_book">
   <c:set  var="goods_count" value="0" />
	<h3>예매율 순위</h3><button style="float: right;">
		<a href="${contextPath}/goods/movieopen.do" id="more">더 보기<img width="23" height="15" src="${contextPath}/resources/image/more.png"></a>
	</button><br>
	<c:forEach var="item" items="${goodsMap.screening}">
	   <c:set  var="goods_count" value="${goods_count+1 }" />
		<div class="book">
			<a href="${contextPath}/goods/goodsDetail.do?movie_id=${item.movie_id }">
			<img class="link"  src="${contextPath}/resources/image/1px.gif"> 
			</a>
				<img width="171" height="204" src="${contextPath}/thumbnails.do?movie_id=${item.movie_id}&image_file_name=${item.movie_fileName}">

			<div class="title">${item.movie_title }</div>
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


<div class="clear"></div>

<div class="clear"></div>
<div class="main_book">
<c:set  var="goods_count" value="0" />
	<h3>상영 예정작</h3>
	<button style="float: right;">
		<a href="${contextPath}/goods/moviescheduled.do" id="more">더 보기 <img width="23" height="15" src="${contextPath}/resources/image/more.png"></a>
	</button><br>
	<c:forEach var="item" items="${goodsMap.readysc}" >
	   <c:set  var="goods_count" value="${goods_count+1 }" />
		<div class="book">
		  <a href="${contextPath}/goods/goodsDetail.do?movie_id=${item.movie_id}">
	       <img class="link"  src="${contextPath}/resources/image/1px.gif"> 
	      </a>
		 <img width="171" height="204" 
				src="${contextPath}/thumbnails.do?movie_id=${item.movie_id}&image_file_name=${item.movie_fileName}">
		<div class="title">${item.movie_title }</div>
		<div class="price">
		    예매버튼
		  </div>
	</div>
	 <c:if test="${goods_count==15}">
   </c:if>
	</c:forEach>
</div>
<div class="clear"></div>
<div id="ad_main_banner">
	<ul class="bjqs">	 	
	  <li><img width="775" height="145" src="${contextPath}/resources/image/cine_event.png"></li>
		<li><img width="775" height="145" src="${contextPath}/resources/image/cine_event2.png"></li>
		<li><img width="775" height="145" src="${contextPath}/resources/image/cine_event3.png"></li> 
	</ul>
</div>





   
   