<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:if test='${not empty message }'>
<script>
window.onload=function()
{
  findPw();
}

function findPw(){
   alert("아이디를 다시 확인해주세요.");
}
</script>
</c:if>
<title>비밀번호 찾기</title>
<style>
section.pwcontent {
	 height: 600px;
     width : 500px;
}
div.pwsearch {
	text-align: left;
	font-weight : bold;
	font-size : 30;
	font-family : "gothic";
	padding : 30;
	padding-left : 150;
}

div.pwsearchForm {
	padding-left : 80;
}

div.pwsearchForm input#member_id{
   height: 40px;
   padding: 10px;
   padding-left : 20;
   border: 1px solid darkgray;
   font-size: 12px;
   width: 400;
}

div.pwsearchForm input#name{
   height: 40px;
   padding: 10px;
   padding-left : 20;
   border: 1px solid darkgray;
   font-size: 12px;
   width: 400;
}

div.pwsearchForm input#email1{
   height: 40px;
   padding: 10px;
   padding-left : 20;
   border: 1px solid darkgray;
   font-size: 12px;
   width: 189;
}
div.pwsearchForm select#email2 {
   height: 40px;
   padding: 10px;
   padding-left : 20;
   border: 1px solid darkgray;
   font-size: 12px;
   width: 188;
}

div.pwsearchForm input#submit{
   height: 50px;
   padding: 10px;
   padding-left : 20;
   border: 1px solid #193a3e;
   background : #193a3e;
   font-size: 15px;
   color: ghostwhite;
   width: 197;
}
div.pwsearchForm input#reset {
	height: 50px;
	padding: 10px;
	border : #e3e3e3;
	background : #e3e3e3;
	font-size : 15px;
	color : #193a3e;
	width : 198;
}
</style>
</head>
<body>
<section class="pwcontent">
<div class="pwsearch">
<img src="${contextPath}/resources/image/lock.png" width="40" height="40"/>
비밀번호 찾기
</div>
<div class="pwsearchForm">       
	<form action="${contextPath}/member/pwsearch.do" method="post" onsubmit="return PwSearchCheck()" name="p">
	  <input id="member_id" type="text" name="member_id" size="50" title="아이디" placeholder="아이디를 입력하세요"><br><br>
      <input id="name" type="text" name="member_name" size="50" title="이름" placeholder="이름을 입력하세요"><br><br>      
      <input id="email1" type="text" name="member_email1" size="23"  title="이메일" placeholder="이메일을 입력하세요"/> @
      <select id="email2" name="member_email2" onChange="" title="직접입력">
	      <option value="non">직접입력</option>
	      <option value="hanmail.net">hanmail.net</option>
	      <option value="naver.com">naver.com</option>
	      <option value="nate.com">nate.com</option>
	      <option value="google.com">google.com</option>
	      <option value="gmail.com">gmail.com</option>
	      <option value="empal.com">empal.com</option>
	      <option value="korea.com">korea.com</option>
	      <option value="freechal.com">freechal.com</option>
      </select> 
                                            
      <br><br>
      <input id="submit" type="submit" value="찾기">  
      <input id="reset" type="button" onclick="location.href='loginForm.do'" value="취소">     	 
   </form>      
</div>
</section>
<script>

function PwSearchCheck() {
	if(p.member_id.value==""){
		alert("아이디를 입력해주세요.");
		p.member_id.focus();
		return false;
	}
	if(p.member_name.value==""){
		alert("이름을 입력해주세요.");
		p.member_name.focus();
		return false;
	}
	if(p.email1.value=="" || p.email2.value==""){
		alert("이메일을 입력해주세요.");
		p.email1.focus();
		return false;
	}
}
</script>

</body>
</html>