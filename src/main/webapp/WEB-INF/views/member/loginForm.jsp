<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"
    isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<script>
    $(function(){
        var responseMessage = "<c:out value="${message}" />";
        if(responseMessage != ""){
            alert(responseMessage)
        }
    }) 
</script>


</head>
<body>
   <section class="LoginContent">
   <nav></nav>
   <div class="memberLoginContainer">
      <div class="loginButtonContainer">
         <button class="loginbtn">로그인</button>
      </div>

      <div class="loginFormDiv">         
         <form action="${contextPath}/member/login.do" class="loginForm" method="post" onsubmit="return LoginCheck()" name="l">
         <!--  <label for="member_id" class="lbl">아이디</label>-->
            <input type="text" name="member_id" size="50" title="아이디" placeholder="아이디"><br><br>
         <!--  <label for="member_pw" class="lbl">비밀번호</label>   -->
            <input type="password" name="member_pw" size="50" title="비밀번호" placeholder="비밀번호"> 
            <input id="submit" type="submit" size="50" value="로그인"><p>
         
      
      <div class="searchDiv">         
         <a href="${contextPath }/member/idsearchview.do" class="serchDivItem">아이디 찾기</a>  | 

         <a href="${contextPath }/member/pwsearchview.do" class="serchDivItem">비밀번호 찾기</a> | 

         <a href="${contextPath}/member/memberForm.do" class="serchDivItem">회원가입</a>
      </div>
      </form>
      </div> 
    </div>  
</section>
<script>
function LoginCheck(){
	if (l.member_id.value==""){
		alert("아이디를 입력해주세요.");
		l.member_id.focus();
		return false;
	}
	if (l.member_pw.value==""){
		alert("비밀번호를 입력해주세요.");
		l.member_pw.focus();
		return false;
	}
		
}
</script>
</body>
</html>