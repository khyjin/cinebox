<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
section.admin_mypage_main {
   width:780;
   height:800;
   float:right;
   margin-top : -280;
   }
.btd {

	font-size: large;
}

.btd2 {
	text-align: right;
}

.replyWriteBtn {
	size: 10px;
}

body {
	background: #fff;
}

.blueone {
	border-collapse: collapse;
	width: 100%;
	font-size: small;
}

.blueone th {
	padding: 10px;
	color: #168;
	border-bottom: 3px solid #168;
	text-align: left;
}

.blueone td {
	color: #669;
	padding: 10px;
	border-bottom: 1px solid #ddd;
}

.blueone tr:hover td {
	color: #004;
}
</style>

<body>
<section class="admin_mypage_main">
<div>
	<hgroup>
		<h1>대관문의 확인</h1>
	</hgroup>
	<br><br>
<table class="blueone">		
	<tbody>
		<tr>
			<td>제목</td>
			<td class="btd" colspan="3">${content_view.cscenter_title }</td>
		</tr>
		<tr>
			<td>ID</td>
			<td colspan="3">${content_view.member_id}</td>
		</tr>
		<tr>
			<td>내용</td>
			<td colspan="3">
			<c:set var="word" value="${content_view.cscenter_content}"/>
			<c:forEach var="item" items="${fn:split(word, ',')}">
				${item}<p>
			</c:forEach>
			</td>
		</tr>
		<tr>
			<td colspan="2" style="text-align: center;">
				<button style="float: right;" onclick="location.href='${contextPath}/admin/cscenter/rentalBoard.do'">목록가기</button>
			</td>
		</tr>
	</tbody>
</table>		
<div class="clear"></div>


</div>
</section>
</body>
</html>