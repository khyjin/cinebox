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
<h1>상영시간표</h1>
<br/>
<table>
	<thead>
		<tr>
			<th>상영날짜</th>
			<th>상영관</th>
			<th>영화명</th>
			<th>시작시간</th>
			<th>종료시간</th>
		</tr>
	</thead>
		
	<tbody>
		<c:forEach var="list" items="${list}">
		<tr>
		 <td>${list.schedule_date}</td>
		 <td>${list.room_number}</td>
		 <td>${list.movie_title}</td>
		 <td>${list.schedule_start_time}</td>
		 <td>${list.schedule_start_time}</td>
		</tr>
		</c:forEach>
	</tbody>
</table>	
</section>
</body>
</html>