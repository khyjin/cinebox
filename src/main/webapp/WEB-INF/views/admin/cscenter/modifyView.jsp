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
   margin-top : -280;
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
	<c:when test="${ulist.cscenter_type=='faq'}">
		<h1>자주찾는 질문 수정</h1>
	</c:when>
	<c:otherwise>
		<h1>공지사항 수정</h1>
	</c:otherwise>
</c:choose>

	<br><br>
<form action="${contextPath}/admin/cscenter/modifyNotice.do" method="get">	
<table class="blueone">
	<input type="hidden" name="cscenter_number" value="${ulist.cscenter_number}"/>
	<input type="hidden" name="member_id" value="${memberInfo.member_id}"/>
	<input type="hidden" name="cscenter_type" value="${ulist.cscenter_type}"/>
	<tbody>
		<tr>
		<c:choose>
			<c:when test="${ulist.cscenter_type=='faq'}">
			<td>
				<select name="cscenter_headline">
				<option value="영화관 이용">[영화관 이용]</option>
				<option value="에매/매표">[예매/매표]</option>
				<option value="홈페이지">[홈페이지]</option>
				<option value="결제수단">[결제수단]</option>
				<option value="기타">[기타]</option>
				</select>
			</td>
			</c:when>
			<c:otherwise>
				<td><select name="cscenter_headline">
				<option value="공지" selected="selected">[공지]</option>
				<option value="이벤트">[이벤트]</option>
				<option value="기타">[기타]</option>
				</select></td>				
			</c:otherwise>
		</c:choose>

			<td>제목</td>
			<td colspan="2"><input type="text" name="cscenter_title" value="${ulist.cscenter_title}">
			</td>		
		</tr>
		
		<tr>
			<td>내용</td>
			<td colspan="3"><textarea rows="15" cols="80" name="cscenter_content">${ulist.cscenter_content}</textarea></td>
		</tr>
		
		<tr>
			<td></td><td></td><td></td>
			<td>
			<br><br>
			<input type="reset" value="취소">
			<input type="submit" value="수정하기" size="20"></td>
		</tr>
	</tbody>
</table>
</form>
</div>
</section>
</body>
</html>