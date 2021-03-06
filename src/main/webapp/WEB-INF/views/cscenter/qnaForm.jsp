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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
var str ="빠르고 정확한 답변을 위해 분실물에 대한 정보, 분실날짜, 분실시간(영화시간)등을 자세히 작성해주세요.";
function lostItem(){
	$("#textstr").text(str);
}

function otherast(){
	$("#textstr").empty();
}

</script>
<body>
<section class="admin_mypage_main">
<div>
	<hgroup>
		<h1>1:1문의</h1>
	</hgroup>
	<font size="2">
	자주찾는 질문에서 원하는 답변을 찾지 못하셨군요<br>
	불편사항이나 문의사항을 남겨주시면 최대한 신속하게 답변 드리겠습니다.<br>
	</font><br><br>
	
	
	
<form action="${contextPath }/cscenter/addQna.do" method="post">
<table class="blueone">
	<input type="hidden" name="member_id" value="${memberInfo.member_id}">
	<input type="hidden" name="cscenter_type" value="qna">
	
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
				<input type="radio" name="cscenter_headline" value="문의" onclick="otherast()">문의&emsp;
				<input type="radio" name="cscenter_headline" value="불만" onclick="otherast()">불만&emsp;
				<input type="radio" name="cscenter_headline" value="칭찬" onclick="otherast()">칭찬&emsp;
				<input type="radio" name="cscenter_headline" value="제안" onclick="otherast()">제안&emsp;
				<input type="radio" name="cscenter_headline" value="분실물" onclick="lostItem()">분실물&emsp;
				
			</td>
		</tr>
		<tr>
			<td>제목</td>
			<td colspan="3"><input type="text" name="cscenter_title" size="87"></td>
		</tr>
		<tr>
			<td>내용</td>
			<td colspan="3"><textarea rows="15" cols="80" name="cscenter_content" id="textstr"></textarea></td>
		</tr>
		
		<tr>
			<td></td><td></td><td></td>
			<td>
			<input type="reset" value="취소">
			<input type="submit" value="등록하기" size="20"></td>
		</tr>
	</tbody>

</table>
</form>
</div>
</section>
</body>
</html>