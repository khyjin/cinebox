<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

</style>
<body>
<section class="admin_mypage_main">
<div>
	<hgroup>
		<h1>분실물 문의</h1>
	</hgroup>
	<font size="2">
	분실물을 등록해주시면 확인 후 신속하게 답변 드리겠습니다.<br>
	빠르고 정확한 답변을 위해 분실물에 대한 정보를 자세히 작성해주세요.<br>
	단순 분실물 문의 외 문의나 불편사항은 이메일 문의로 작성 부탁드립니다.</font><br><br>
	
<table class="blueone">
<form>
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
			<td>분실날짜</td>
			<td><input type="date" name="lostDatd"></td>
			<td>분실시간(영화시간)</td>
			<td><input type="text" name="timeH" size="10">시 <input type="text" name="timeM" size="10">분</td>
		</tr>
		<tr>
			<td>분실물 종류</td>
			<td><select>
				<option>지갑</option>
				<option>핸드폰</option>
				<option>가방</option>
				<option>귀금속</option>
				<option>우산</option>
				<option>의류</option>
				<option>전자제품</option>
				<option>책</option>
				<option>기타</option>
			</select> </td>
			<td>분실물 색상</td>
			<td><input type="text" name="colorL"></td>
		</tr>
		<tr>
			<td>제목</td>
			<td colspan="3"><input type="text" name="title" size="87"></td>
		</tr>
		<tr>
			<td>내용</td>
			<td colspan="3"><textarea rows="15" cols="80"></textarea></td>
		</tr>
		
		<tr>
			<td></td><td></td><td></td>
			<td>
			<input type="reset" value="취소">
			<input id="button0" type="submit" value="등록하기" size="20"></td>
		</tr>
	</tbody>
</form>
</table>
</div>
</section>
</body>
</html>