<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function fn_check(){
	var rental_form = document.rental_form;
	var name = rental_form.member_name.value;
	var phone = rental_form.phone.value;
	var email = rental_form.email.value;
	var r_day = rental_form.content1.value;
	var count = rental_form.content2.value;
	var content = rental_form.content3.value;
	
	if(name==""){
		alert("이름을 입력해주세요");
		rental_form.member_name.select();
		return false;
	} else if(phone=="" && email==""){
		alert("연락가능한 휴대전화번호 혹은 이메일을 입력해주세요");
		rental_form.phone.select();
		return false;
	} else if(r_day==""){
		rental_form.content1.select();
		alert("대관희망일을 입력해주세요");
		return false;
	} else if(count==""){
		alert("희망인원수를 입력해주세요");
		rental_form.content2.select();
		return false;
	} else if(content==""){
		alert("문의사항을 입력해주세요");
		rental_form.content3.select();
		return false;
	}
	
	rental_form.submit();	
}
</script>
</head>
<style>
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
section.admin_mypage_main {
   width:780;
   height:800;
   float:right;
   margin-top : -280;
   }

</style>
<body>
<section class="admin_mypage_main">
<div>
		<h1>대관문의</h1>
		<br>
	<font size="2">
	개인이나 단체를 위한 대관서비스로 CINEBOX의 넓고 쾌적한 극장에서 즐거운 추억을 만드실 수 있습니다.<br>
	단체/대관 문의 외 문의나 불편사항은 이메일 문의로 작성 부탁드립니다.</font><br><br>
<form name="rental_form" action="${contextPath}/cscenter/sendRental.do" method="post">

<table class="blueone">
	<tbody>
		<tr>
			<td>관람희망일</td>
			<td><input type="date" name="content1"></td>
			<td>희망인원</td>
			<td><input type="text" size="20" name="content2"></td>
		</tr>
		<tr>
			<td>내용</td>
			<td colspan="3"><textarea rows="15" cols="80" name="content3" 
			placeholder="※정확한 행사내용과 통화가능시간을 남겨주시면 더욱빠른 답변이 가능합니다.&#13;&#10;※문의 내용 내에 개인정보(신용카드번호, 계좌번호, 주민번호 등)가 포함되지 않도록 유의하시기 바랍니다."></textarea></td>
		</tr>
		<c:choose>
			<c:when test="${memberInfo!=null}">
				<tr>
					<td>문의자명</td>
					<td><input type="text" name="member_name" value="${memberInfo.member_name}"></td>
						<input type="hidden" name="member_id" value="${memberInfo.member_name}">
					<td>연락처</td>
					<td><input type="text" name="phone" value="${memberInfo.member_hp1}${memberInfo.member_hp2}${memberInfo.member_hp3}"></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="text" name="email" value="${memberInfo.member_email1}@${memberInfo.member_email2}">
						<p><font size="1">※남겨주신 이메일 또는 연락처로 답변드립니다.</font></td>
				</tr>
			</c:when>
			<c:otherwise>
				<tr>
					<td>문의자명</td>
					<td><input type="text" name="member_name"></td>
						<input type="hidden" name="member_id">
					<td>연락처</td>
					<td><input type="text" name="phone"></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="text" name="email">
					<br><br><font size="1">※남겨주신 이메일 또는 연락처로 답변드립니다.</font></td>
				</tr>			
			</c:otherwise>
		</c:choose>
		
		
		<tr>
			<td></td><td></td><td></td>
			<td>
			<input type="reset" value="취소">
			<input id="button0" type="button" value="등록하기" size="20" onclick="fn_check()"></td>
		</tr>
	</tbody>
</table>
</form>
</div>
</section>
</body>
</html>