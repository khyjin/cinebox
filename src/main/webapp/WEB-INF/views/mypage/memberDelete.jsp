<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
</head>
<body>
회원탈퇴<p>
비밀번호 확인<p>
고객님의 개인정보 보호를 위한 절차이오니, 로그인 시 사용하는 비밀번호를 입력해 주세요.<p>
<form action="${contextPath}/mypage/memberDelete.do" method="post">
아이디 ${memberInfo.member_id} <p>
비밀번호 <input type="password" name="member_pw"><p>
<input type="submit" value="확인">
<input id="reset" type="button" onclick="location.href='myPageMain.do'" value="취소">
</form>
</body>
</html>