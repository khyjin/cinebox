<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
section.admin_mypage_main {
   width:780;
   height:800;
   float:right;
   margin-top : -280;
   }

.btitle1 {
	color: silver;
}

.btitle2 {
	color: black;
}

.idxn {
	list-style: none;
	float: left;
	padding: 10px;
}

.paging {
	color: black;
}

.paging1 {
	color: blue;
	text-decoration: underline;
}

.paging2 {
	color: black;
}

.page {
	margin-left: 40%;
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

</head>
<body>
<section class="admin_mypage_main">
	<div>
		<table class="blueone">
			<thead>
				<tr>
					<th>글번호</th>
					<th>제목</th>
					<th>등록자</th>
					<th>등록일</th>
				</tr>
			</thead>
			<tbody>

				<c:forEach items="${list}" var="list">
					<tr>
						<td>${list.cscenter_number}</td>
						<c:choose>
							<c:when test="${list.cscenter_type=='qna_re'}">
								<td><a class="btitle1"
									href="${contextPath}/admin/cscenter/contentView.do?cscenter_number=${list.cscenter_number}">
										<img width="20" height="20"
										src="${contextPath}/resources/image/reply.png">
										[${list.cscenter_headline}] &nbsp; ${list.cscenter_title}
								</a></td>
							</c:when>
							<c:otherwise>
								<td><a class="btitle2"
									href="${contextPath}/admin/cscenter/contentView.do?cscenter_number=${list.cscenter_number}">
										[${list.cscenter_headline}] &nbsp; ${list.cscenter_title}</a></td>
							</c:otherwise>
						</c:choose>
						<td>${list.member_id}</td>
						<td><fmt:formatDate value="${list.cscenter_reg_date}"
								pattern="yyyy/MM/dd HH:mm:ss" /></td>
					</tr>
				</c:forEach>

			</tbody>
		</table>
		<br>
		<br>
		<div class="page">
			<ul>
				<!-- 페이지 블럭 -->
				<c:if test="${pageMaker.prev}">
					<li class="idxn"><a class="paging"
						href="${pageMaker.makeQuery(pageMaker.startPage - 1)}"> << 이전
					</a></li>
				</c:if>

				<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}"
					var="idx">
					<c:choose>
						<c:when test="${pageMaker.cri.page==idx}">
							<font size=+1>
								<li class="idxn"><a class="paging1"
									href="${pageMaker.makeQuery(idx)}">${idx}</a></li>
							</font>
						</c:when>
						<c:otherwise>
							<li class="idxn"><a class="paging2"
								href="${pageMaker.makeQuery(idx)}">${idx}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					<li class="idxn"><a class="paging"
						href="${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음 >></a></li>
				</c:if>
			</ul>
		</div>

	</div>
	</section>
</body>
</html>