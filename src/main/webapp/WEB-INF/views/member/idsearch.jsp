<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>

<title>아이디 찾기 결과</title>

</head>
<body>
<section class="idresult">
	<div class="idresult2">${member.member_name}님의 정보와 일치하는 아이디입니다.</div>
	<div class="idresultform" ><img src="${contextPath}/resources/image/checkbox.png" width="25" height="25"/>
	&emsp;${member.member_id}</div>
	
	<input id="pwsearchForm" type="button" onclick="location.href='pwsearchview.do'" value="비밀번호 찾기">  
    <input id="LoginForm" type="button" onclick="location.href='loginForm.do'" value="로그인"> 
	</section>
</body>
</html>