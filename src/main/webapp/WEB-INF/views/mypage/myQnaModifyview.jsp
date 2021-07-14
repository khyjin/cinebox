<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
section.mydetail_main {
	width:800;
	height:1200;
	float:right;
	margin-top : -280;
}
table {
	width: 100%;
	border-top: 1px solid #444444;
	border-collapse: collapse;
}

tr td {
	border-bottom: 1px solid #444444;
	padding: 10px;
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
<section class="mydetail_main">
<div>
	<hgroup>
		<h1>1:1문의</h1>
	</hgroup>
	
	
<form action="${contextPath }/mypage/myQnaModify.do" method="get">
<table class="blueone">
			<c:forEach var="item" items="${myQnaList}">
	<input type="hidden" name="cscenter_number" value="${item.cscenter_number}">
	<input type="hidden" name="cscenter_type" value="${item.cscenter_type}">
	<tbody>
		<tr>
			<td>이름</td>
			<td colspan="3">${memberInfo.member_name}</td>
		</tr>
		<tr>
			<td>휴대전화</td>
			<td>${memberInfo.member_hp1}-${memberInfo.member_hp2}-${memberInfo.member_hp3}</td>
			<td>이메일</td>
			<td>${memberInfo.member_email1}@${memberInfo.member_email2}</td>
		</tr>
		<tr>
			<td>문의유형</td>
			<td colspan="3">
				<c:choose >
					    <c:when test="${item.cscenter_headline =='문의' }">
					      <input type="radio" name="cscenter_headline" value="문의" checked />
						  문의&emsp;
					   <input type="radio" name="cscenter_headline" value="불만">불만&emsp;
						<input type="radio" name="cscenter_headline" value="칭찬">칭찬&emsp;
						<input type="radio" name="cscenter_headline" value="제안">제안&emsp;
					    </c:when>
					    
					    <c:when test="${item.cscenter_headline =='불만' }">
					      <input type="radio" name="cscenter_headline" value="문의"/>문의&emsp;
					   <input type="radio" name="cscenter_headline" value="불만" checked>
						  불만&emsp;
						<input type="radio" name="cscenter_headline" value="칭찬">칭찬&emsp;
						<input type="radio" name="cscenter_headline" value="제안">제안&emsp;
					    </c:when>
					    
					    <c:when test="${item.cscenter_headline =='칭찬' }">
					      <input type="radio" name="cscenter_headline" value="문의"/>문의&emsp;
					   <input type="radio" name="cscenter_headline" value="불만">불만&emsp;
						<input type="radio" name="cscenter_headline" value="칭찬" checked>
						  칭찬&emsp;
						<input type="radio" name="cscenter_headline" value="제안">제안&emsp;
					    </c:when>
					    
					    <c:when test="${item.cscenter_headline =='제안' }">
					      <input type="radio" name="cscenter_headline" value="문의"/>문의&emsp;
					   <input type="radio" name="cscenter_headline" value="불만">불만&emsp;
						<input type="radio" name="cscenter_headline" value="칭찬">칭찬&emsp;
						<input type="radio" name="cscenter_headline" value="제안" checked>
						제안&emsp; 
					    </c:when>
					   </c:choose>
				
			</td>
		</tr>
		<tr>
			<td>제목</td>
			<td colspan="3"><input type="text" value="${item.cscenter_title}" name="cscenter_title" size="87"></td>
		</tr>
		<tr>
			<td>내용</td>
			<td colspan="3"><textarea rows="15" cols="80" name="cscenter_content">${item.cscenter_content}</textarea></td>
		</tr>
		
		<tr>
			<td></td><td></td><td></td>
			<td>
			<input type="reset" value="취소">
			<input type="submit" value="수정하기" size="20"></td>
		</tr>
		</c:forEach>
	</tbody>
</table>
</form>
</div>
</section>
</body>
</html>