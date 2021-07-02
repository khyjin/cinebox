<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>

<title>비밀번호 찾기 결과</title>
</head>
<body>
<section class="idresult">
	<div class="idresult2">아이디가 ${member.member_id}인 ${member.member_name}님의 정보와 일치하는 비밀번호입니다.</div>
	<div class="idresultform" ><img src="${contextPath}/resources/image/checkbox.png" width="25" height="25"/>
	&emsp;${member.member_pw}</div>
	
	<input id="pwsearchForm" type="button" onclick="location.href='idsearchview.do'" value="아이디 찾기">  
    <input id="LoginForm" type="button" onclick="location.href='loginForm.do'" value="로그인"> 
</section>
</body>
</html>