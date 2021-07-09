<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
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
.imgtb {
	padding-left: 50px;
	text-align: center;
	font-size: small;
}

table .notice1 {
	border-top: 1px solid #444444;
	border-collapse: collapse;
}

.notice2 .notice3 {
	font-size: xx-small;
	padding: 10px;
}

.na {
	color: black;
}

.csimg {
	margin: 10px;
}
</style>
<body>
<section class="admin_mypage_main">
<div>
	<hgroup>
		<h1>고객센터</h1>
	</hgroup>
	
	<table class="imgtb">
		<tr>
			<td><a class="na" href="${contextPath}/cscenter/faqBoard.do">
			<img class="csimg" src="${contextPath}/resources/image/faqicon.png" width="200" height="200"><br>
			자주찾는 질문<br></a></td>
			<td><a class="na" href="javascript:fn_send_qna()">
			<img class="csimg" src="${contextPath}/resources/image/qnaicon.png" width="200" height="200"><br>
			1:1문의하기<br></a></td>
			<td>
			<a class="na" href="javascript:fn_send_rental()">
			<img class="csimg" src="${contextPath}/resources/image/people.png" width="200" height="200"><br>
			단체관람/대관문의<br></a></td>
		</tr>
	</table>
	
	<div class="clear"></div>
	
	<div style="float: left; width: 45%">
		<hgroup>
			<h1>공지사항</h1>
		</hgroup>
	
		<table class="notice1">
		<tbody>
			<c:forEach items="${main.notice}" var="notice">
				<tr class="notice2">
					<td class="notice3"><a class="na" href="${contextPath}/cscenter/noticeView.do?cscenter_number=${notice.cscenter_number}">
					[${notice.cscenter_headline}] ${notice.cscenter_title}</a></td>
					<td class="notice3">
					<fmt:formatDate value="${notice.cscenter_reg_date}" pattern="yyyy/MM/dd"/></td>
				</tr>
			</c:forEach>
		</tbody>
		</table>
	</div>

	
	<div style="float: right; width: 45%;">
	<hgroup>
		<h1>자주찾는 질문 best5</h1>
	</hgroup>
		<table>
			<tbody class="notice1">
				<c:forEach items="${main.faq}" var="faq">
				<tr class="notice2">
					<td class="notice3"><a class="na" href="${contextPath}/cscenter/noticeView.do?cscenter_number=${notice.cscenter_number}">
					[${faq.cscenter_headline}] ${faq.cscenter_title}</a></td>
					<td class="notice3"><fmt:formatDate value="${faq.cscenter_reg_date}" pattern="yyyy/MM/dd"/></td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
</div>
</section>
</body>
<script type="text/javascript">
function fn_send_qna() {
	var _isLogOn = document.getElementById("isLogOn");
	var isLogOn = _isLogOn.value;
	
	if(isLogOn =="false"||isLogOn ==''){
		alert("1:1문의는 로그인 후 가능합니다.");
		location.href='${contextPath}/member/loginForm.do';
	}
	else {
		location.href='${contextPath}/cscenter/qnaForm.do'
	}	
}

function fn_send_rental(){
	var _isLogOn = document.getElementById("isLogOn");
	var isLogOn = _isLogOn.value();
	
	if(isLogOn=="false"||isLogOn==''){
		alert("로그인 후 대관 문의가 가능합니다.");
		location.href='${contextPath}/member/loginForm.do'
	}
	else {
		location.href='${contextPath}/cscenter/rentalForm.do';
	}
}
</script>
</html>