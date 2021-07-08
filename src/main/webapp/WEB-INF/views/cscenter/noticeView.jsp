<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
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
	<c:when test="${viewList.cscenter_type=='faq'}">
		<hgroup>
			<h1>자주찾는 질문</h1>
		</hgroup>
		<br> <br>	
	</c:when>
	<c:otherwise>

		<hgroup>
			<h1>공지사항</h1>
		</hgroup>
		<br> <br>	
	</c:otherwise>
</c:choose>

		<table class="blueone">
			<tbody>
				<tr>
					<th colspan="3">[${viewList.cscenter_headline}]&nbsp;${viewList.cscenter_title }</th>
					<th>등록일 ${viewList.cscenter_reg_date}&emsp; 조회수
						${viewList.cscenter_hit}</th>
				</tr>

				<tr height="150">
					<td colspan="4"><pre>${viewList.cscenter_content}</pre></td>
				</tr>

				<tr>
					<td colspan="3" style="text-align: center;"><c:choose>
						<c:when test="${viewList.cscenter_type=='faq'}">
								<button id="button0"
									onclick="location.href='${contextPath}/cscenter/faqBoard.do'">목록보기</button>
								&emsp;
							</c:when> <c:otherwise>
								<button id="button0"
									onclick="location.href='${contextPath}/cscenter/cscenterNotice.do'">목록보기</button>
								&emsp;
							</c:otherwise>
					</c:choose></td>
					<td style="float: right;">
					<c:if test="${isLogOn==true and memberInfo.member_id =='admin'}">
						<button
							onclick="location.href='${contextPath}/admin/cscenter/modifyView.do?cscenter_number=${viewList.cscenter_number}'">수정하기</button>
						&nbsp;
						<button onclick="delete_check()">삭제하기</button>
					</c:if></td>
					<!--	<input type="button" value="삭제하기" id="delete_check"> -->
					
				</tr>
			</tbody>
		</table>
	</div>

	<script type="text/javascript">
		function delete_check() {
			if (confirm("삭제하시겠습니까?") == true) {
				location.href = '${contextPath}/admin/cscenter/deleteNotice.do?cscenter_number=${viewList.cscenter_number}';
			} else {
				return;
			}
		}
	</script>
	</section>
</body>
</html>