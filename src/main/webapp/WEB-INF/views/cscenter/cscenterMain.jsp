<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
  table .notice1 {
    width: 100%;
    border-top: 1px solid #444444;
    border-collapse: collapse;
  }
  .notice2 .notice3 {
   
    padding: 10px;
  }
  
  #td1 {
  	
  }

</style>
<body>
<div>
	<hgroup>
		<h1>고객센터</h1>
	</hgroup>
	
	<table>
		<tr>
			<td id="td1"><a href="#">
			<img  src="${contextPath}/resources/image/faq.jpg" width="200" height="200"><br></br>
			자주찾는 질문</a></td>
			<td><a href="#">
			<img  src="${contextPath}/resources/image/qna.jpg" width="200" height="200"><br></br>
			질문하기</a></td>
			<td>단체관람/대관문의</td>
		</tr>
	</table>
	
	<div class="clear"></div>
	
	<div style="float: right; width: 45%">
		<hgroup>
			<h1>공지사항</h1>
		</hgroup>
	
		<table class="notice1">
		<tbody>
			<c:set var="count" value="${count+1}"/>
			<c:forEach begin="1" end="5" step="1">
				<tr class="notice2">
					<td class="notice3">구분</td>
					<td class="notice3">공지사항 제목</td>
					<td class="notice3">등록날짜</td>
				</tr>
				</c:forEach>
		</tbody>
		</table>
	</div>

	
	<div style="float: left; width: 45%;">
	<hgroup>
		<h1>자주하는 질문 best5</h1>
	</hgroup>
		<table>
			<tbody class="notice1">
				<c:forEach begin="1" end="5" step="1">
				<tr class="notice2">
					<td class="notice3">구분</td>
					<td class="notice3">질문 제목</td>
					<td class="notice3">등록날짜</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	
	</div>
	
</div>
</body>
</html>