<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
  
  .atitle{
    color:black;
}

</style>

</head>
<body>

<div>
<table>
	<thead>
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>등록자</th>
			<th>등록일</th>
			<th>조회수</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach items="${noticeList}" var="item">
		<tr>
			<td>${item.cscenter_number}</td>
			<td><a class="atitle" href="noticeView.do?cscenter_number=${item.cscenter_number}">
			[${item.cscenter_type}] &nbsp; ${item.cscenter_title}</a></td>
			<td>${item.member_id}</td>
			<td>${item.cscenter_reg_date}</td>		
			<td>${item.cscenter_hit}</td>
		</tr>
	</c:forEach>
	</tbody>
</table>
<c:if test="${isLogOn==true and memberInfo.member_id =='admin'}">
	<button onclick="location.href='noticeRegForm.do'">글작성하기</button>
</c:if>
</div>
</body>
</html>