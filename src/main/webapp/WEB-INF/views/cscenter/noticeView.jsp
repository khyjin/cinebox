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
		<h1>공지사항</h1>
	</hgroup>
	<br><br>
	
<table>
	<tbody>
		<tr>
			<td colspan="3">[${viewList.cscenter_type}]&nbsp;${viewList.cscenter_title }</td>
			<td>등록일 ${viewList.cscenter_reg_date}&emsp; 조회수 ${viewList.cscenter_hit}</td>
		</tr>
		
		<tr height="150">
			<td colspan="4">${viewList.cscenter_content}</td>
		</tr>
		
		<tr>
			<td></td><td></td><td></td>
			<td>
			<button onclick="location.href='${contextPath}/cscenter/modifyView.do?cscenter_number=${viewList.cscenter_number}'">수정하기</button>&emsp;
			<button onclick="location.href='deleteNotice.do'">삭제하기</button>
			</td>
		</tr>
	</tbody>

</table>
</div>
</body>
</html>