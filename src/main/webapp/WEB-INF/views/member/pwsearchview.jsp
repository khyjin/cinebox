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

div.pwsearchForm select#hp1{
   height: 40px;
   padding: 10px;
   padding-left : 20;
   border: 1px solid darkgray;
   font-size: 12px;
   width: 99;
}
div.pwsearchForm input#hp {
   height: 40px;
   padding: 10px;
   padding-left : 20;
   border: 1px solid darkgray;
   font-size: 12px;
   width: 105;
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
      <select id="hp1" name="member_hp1">
	      <option>010</option>
	      <option>011</option>
	      <option>016</option>
	      <option>017</option>
	      <option>018</option>
	      <option>019</option>
      </select>&emsp;-&emsp;
      <input id="hp" name="member_hp2" type="text" size="3" />&emsp;-&emsp;
      <input id="hp" name="member_hp3" type="text" size="3" />                                        
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
	if(p.hp2.value=="" || p.hp3.value==""){
		alert("전화번호를 입력해주세요.");
		p.hp2.focus();
		return false;
	}
}
</script>

</body>
</html>