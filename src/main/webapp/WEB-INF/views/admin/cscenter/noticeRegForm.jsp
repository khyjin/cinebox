<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
section.admin_mypage_main {
   width:780;
   height:800;
   float:right;
   margin-top : -280; : -190;
   }
body {
	background: #fff;
}

.blueone {
	border-collapse: collapse;
	width: 100%;
}

.blueone th {
	padding: 10px;
	color: #168;
	border-bottom: 3px solid #168;
	font-size: small;
	text-align: left;
}

.blueone td {
	padding: 10px;
	border-bottom: 1px solid #ddd;
}

.blueone tr:hover td {
	color: #004;
}

#button0 {
	background-color: #193a3e;
	color: white;
	border: none;
	padding: 6px 6px;
}

</style>
<body>
<section class="admin_mypage_main">
<div>
<c:choose>
<c:when test="${reg_form=='faq' }">
	<hgroup>
		<h1>자주찾는 질문 등록</h1>
	</hgroup>
	<br><br>
</c:when>
<c:otherwise>
	<hgroup>
		<h1>공지사항 등록</h1>
	</hgroup>
	<br><br>
</c:otherwise>
</c:choose>

<table class="blueone">
	<tbody>
	<c:choose>
	<c:when test="${reg_form=='faq' }">
	<form action="${contextPath}/admin/cscenter/noticeReg.do" method="get">
		<tr>
			<input type="hidden" value="faq" name="cscenter_type">
			<td>
				<select name="cscenter_headline">
				<option value="영화관 이용">[영화관 이용]</option>
				<option value="에매/매표">[예매/매표]</option>
				<option value="홈페이지">[홈페이지]</option>
				<option value="결제수단">[결제수단]</option>
				<option value="기타">[기타]</option>
				</select>
			</td>
			<td>제목</td>
			<td colspan="2"><input type="text" name="cscenter_title"></td>
			<input type="hidden" name="member_id" value="${memberInfo.member_id}">
		</tr>		
	</c:when>
	<c:otherwise>
	<form action="${contextPath}/admin/cscenter/noticeReg.do" method="get">
		<tr>
			<input type="hidden" value="notice" name="cscenter_type">
			<td>
				<select name="cscenter_headline">
				<option value="공지">[공지]</option>
				<option value="이벤트">[이벤트]</option>
				<option value="기타">[기타]</option>
				</select>
			</td>
			<td>제목</td>
			<td colspan="2"><input type="text" name="cscenter_title"></td>
			<input type="hidden" name="member_id" value="${memberInfo.member_id}">
		</tr>	
	</c:otherwise>
	</c:choose>			
		
		<tr>
			<td>내용</td>
			<td colspan="3"><textarea rows="15" cols="80" name="cscenter_content"></textarea></td>
		</tr>
		
		<tr>
			<td></td><td></td><td></td>
			<td>
			<br><br>
			<input type="reset" value="취소">
			<input type="submit" value="등록하기" size="20"></td>
		</tr>
	</tbody>
</form>
</table>
</div>
</section>
</body>
</html>