<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(".hover").mouseleave(
		  function() {
		    $(this).removeClass("hover");
		  }
		);
</script>
<style>
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

.btitle {
	color: black;
}

.idxn {
	list-style: none;
	float: left;
	padding: 10px;
}

.paging {
	color: #004;
}

.paging1 {
	color: #004;
	text-decoration: underline;
}

.paging2 {
	color: black;
}

.page {
	margin-right: 50%;
	float: right;
}

#button0 {
	background-color: #193a3e;
	color: white;
	border: none;
	padding: 6px 6px;
}
</style>

</head>
<body>
	<h1>공지사항</h1>
<div>
<table class="blueone">
	<thead>
		<tr>
			<th>제목</th>
			<th>등록자</th>
			<th>등록일</th>
			<th>조회수</th>
		</tr>
	</thead>
	<tbody>
	
	<c:forEach items="${boardList}" var="item">
		<tr>
			<td><a class="btitle" href="noticeView.do?cscenter_number=${item.cscenter_number}">
			[${item.cscenter_headline}] &nbsp; ${item.cscenter_title}</a></td>
			<td>${item.member_id}</td>
			<td>${item.cscenter_reg_date}</td>		
			<td>${item.cscenter_hit}</td>
		</tr>	
	</c:forEach>

	</tbody>
</table>
<br>
<div style="float: left;width: 20%;">
<c:if test="${isLogOn==true and memberInfo.member_id =='admin'}">
	<button id="button0" onclick="location.href='${contextPath}/admin/cscenter/noticeRegForm.do'">글작성하기</button>
</c:if>
</div>
<div class="page">
  <ul>
    <c:if test="${pageMaker.prev}">
    	<li class="idxn"><a class="paging" href="${pageMaker.makeQuery(pageMaker.startPage - 1)}"> << 이전 </a></li>
    </c:if> 

    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
    	<c:choose>
    		<c:when test="${pageMaker.cri.page==idx}">
    			<font size=+1>
    			<li class="idxn"><a class="paging1" href="${pageMaker.makeQuery(idx)}">${idx}</a></li></font>
    		</c:when>
    		<c:otherwise>
    			<li class="idxn"><a class="paging2" href="${pageMaker.makeQuery(idx)}">${idx}</a></li>
    		</c:otherwise>
    	</c:choose>
    </c:forEach>

    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
    	<li class="idxn"><a class="paging" href="${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음 >></a></li>
    </c:if> 
  </ul>
</div>
</div>
</body>
</html>