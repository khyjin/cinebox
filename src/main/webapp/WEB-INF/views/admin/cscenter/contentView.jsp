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
		<h1>1:1문의 답변 작성</h1>
	</hgroup>
	<br><br>
<table class="blueone">		
<form id="replyForm"  action="${contextPath}/admin/cscenter/replyWrite.do" method="post">
<input type="hidden" name="cscenter_number" value="${content_view.cscenter_number}">
<input type="hidden" name="member_id" value="${memberInfo.member_id}">
<input type="hidden" name="cscenter_type" value="qna_re">
<input type="hidden" name="cscenter_headline" value="답변">
<input type="hidden" name="cscenter_group" value="${content_view.cscenter_group}">
<input type="hidden" name="cscenter_step" value="${content_view.cscenter_step}">

	<tbody>
		<tr>
			<td>제목</td>
			<td class="btd" colspan="3"><input size="88" type="text" value="Re:${content_view.cscenter_title }" name="cscenter_title"> </td>
		</tr>
		<tr>
			<td>ID</td>
			<td colspan="3">${content_view.member_id}</td>
		</tr>
		<tr>
			<td>답변 작성</td>
			<td colspan="3">
		<pre><textarea rows="10" cols="80" name="cscenter_content">${content_view.cscenter_content}

-----답변-------------------------------------</textarea></pre>
			</td>
		</tr>
		<tr>
			<td colspan="2" style="text-align: center;"><input type="submit" value="답변하기">&emsp;
		</form>
				<button onclick="location.href='${contextPath}/admin/cscenter/deleteNotice.do?cscenter_number=${content_view.cscenter_number}'">삭제하기</button>
				<button style="float: right;" onclick="location.href='${contextPath}/admin/cscenter/qnaBoard.do'">목록가기</button></td>
		</tr>
	</tbody>
</table>		
<div class="clear"></div>


</div>
</section>
</body>
</html>