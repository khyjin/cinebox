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
  table {
    width: 100%;
    border-top: 1px solid #444444;
    border-collapse: collapse;
  }
  tr td {
   border-bottom : 1px solid #444444;
    padding: 10px;
  }

</style>
<body>
<div>
	<hgroup>
		<h1>공지사항 등록</h1>
	</hgroup>
	<br><br>
	
<table>
<form action="${contextPath}/cscenter/noticeReg.do" method="get">
	<tbody>
		<tr>
			<td><select name="cscenter_type">
			<option value="공지">[공지]</option>
			<option value="이벤트">[이벤트]</option>
			<option value="기타">[기타]</option>
			</select></td>
			<td>제목</td>
			<td colspan="2"><input type="text" name="cscenter_title"></td>
			<input type="hidden" name="member_id" value="${memberInfo.member_id}">
		</tr>
		
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
</body>
</html>