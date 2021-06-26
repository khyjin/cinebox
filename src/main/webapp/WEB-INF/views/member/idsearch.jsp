<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<H3>${member.member_name} 님의 아이디</H3>
	<DIV id="detail_table">
	<form action="${contextPath}/member/loginForm.do" method="post">
		<TABLE>
			<TBODY>
				<TR class="dot_line">
					<TD class="fixed_join">아이디</TD>
					<TD>${member.member_id}</TD>
				</TR>
			</TBODY>
		</TABLE>
		<Br><br>
		   <a href="${contextPath}/member/idsearchview.do">전화번호로 아이디 찾기</a>  | 
		   <a href="${contextPath}/member/idsearchview.do">이름으로 아이디 찾기</a>  | 
		   <a href="#">비밀번호 찾기</a> | 
		   <a href="${contextPath}/member/memberForm.do">회원가입</a>    | 
		   <a href="${contextPath}/main/loading.do">고객 센터</a>
	</form>	
	</DIV>	
</body>
</html>