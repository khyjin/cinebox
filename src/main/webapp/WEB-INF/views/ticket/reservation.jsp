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
<title>영화 예매</title>
 <style>
 section.admin_mypage_main {
   width:800;
   height:800;
   float:right;
  
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
<h1>상영시간표</h1>
<br/>
<div style="overflow:auto; width:300px; height:300px; padding:10px;">	
<table>
	<thead>
		<tr>
			<th>영화명</th>
		</tr>
	</thead>
	
	<tbody>
	
		<c:forEach var="list" items="${list}">
		<tr>
		 <td>${list.movie_title}</td>
		</tr>
		</c:forEach>
		
	</tbody>
</table>	
</div>
</section>
</body>
</html>