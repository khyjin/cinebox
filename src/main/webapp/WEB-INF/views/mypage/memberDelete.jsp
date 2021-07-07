<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
<script>
	$(document).ready(function(){
		$("#memDel_btn").click(function(){
			document.form1.action = "${contextPath}/mypage/memberDelete.do";
			document.form1.submit();			
		});		
	});


</script>
</head>
<body>
회원탈퇴<br>

<form name="form1" method="post">
아이디 ${memberInfo.member_id} <p>
정말 탈퇴하시겠습니까? YES <input type="checkbox" name="member_del_yn"  value="y" /><p>
탈퇴일 : ${member_del_date} <p>


<input type="button" value="탈퇴하기" id="memDel_btn">
</form>
</body>
</html>