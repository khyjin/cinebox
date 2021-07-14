<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"	isELIgnored="false" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>상영시간표</title>
 <style>
 section.admin_mypage_main {
   width:800;
   height:800;
   float:right;
   margin-top : -190;
   }
 
body {
   background: #fff;
}

table {
   border-collapse: collapse;
   width: 100%;
   font-size: small;
}

table th {
   padding: 10px;
   color: #168;
   border-bottom: 3px solid #168;
   text-align: left;
}

table td {
   color: #669;
   padding: 10px;
   border-bottom: 1px solid #ddd;
}

table tr:hover td {
   color: #004;
}
</style>
</head>
<body>
<section class="admin_mypage_main">
<h1>상영시간표 상세수정</h1>
<br/>

<table>
	<thead>
		<tr>
			<th>ID</th>
			<th>상영날짜</th>
			<th>상영관</th>
			<th>영화명</th>
			<th>시작시간</th>
		</tr>
	</thead>
		
	<tbody>
		<c:forEach var="list" items="${list}">
		<form action="${contextPath}/schedule/modifySchedule.do" method="post">
		<tr>
			<td>
				<input type="hidden" name="schedule_id" value="${list.schedule_id}">
				${list.schedule_id}
			</td>
			<td>
				<fmt:parseDate value="${list.schedule_date}" var="sdate" pattern="yy/mm/dd"/>
				<fmt:formatDate value="${sdate}" var="date" pattern="yyyy-mm-dd"/>
				<input type="date" name="schedule_date" value="${date}">
			</td>
			<td>
				<select name="room_number" >
				<option value="${list.room_number}">${list.room_number}관(선택)</option>
					<option value="1">1관</option>
					<option value="2">2관</option>
					<option value="3">3관</option>
				</select>
			</td>
			<td>
			<c:if test="${!empty goodslist}" >
				<select name="movie_title" style="width:200px;" class="select_02">
				<option value="${list.movie_title}">${list.movie_title}(선택)</option>
				<c:forEach  var="goodslist" items="${goodslist}">
				<option value="${goodslist.movie_title}">${goodslist.movie_title}</option>
				</c:forEach>
				</select>
			</c:if>
			</td>
			<td>
				<select name="schedule_start_time" >
				<option value="${list.schedule_start_time}">${list.schedule_start_time}(선택)</option>
					<option value="11:00">11:00</option>
					<option value="14:00">14:00</option>
					<option value="17:00">17:00</option>
				</select>
			</td>
		 	<td><input type="submit" value="완료"></td>
		</tr>
		</form>
		</c:forEach>
	</tbody>
</table>	
</section>
</body>
</html>

							