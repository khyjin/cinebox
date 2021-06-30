<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<style>
section.idcontent {
	 height: 600px;
     width : 500px;
}
div.idsearch {
	text-align: left;
	font-weight : bold;
	font-size : 30;
	font-family : "gothic";
	padding : 30;
	padding-left : 150;
}

div.idsearchForm {
	padding-left : 60;
}
div.idsearchForm input#name{
   height: 40px;
   padding: 10px;
   padding-left : 20;
   border: 1px solid darkgray;
   font-size: 12px;
   width: 400;
}

div.idsearchForm select#hp1{
   height: 40px;
   padding: 10px;
   padding-left : 20;
   border: 1px solid darkgray;
   font-size: 12px;
   width: 99;
}
div.idsearchForm input#hp {
   height: 40px;
   padding: 10px;
   padding-left : 20;
   border: 1px solid darkgray;
   font-size: 12px;
   width: 105;
}

div.idsearchForm input#submit{
   height: 50px;
   padding: 10px;
   padding-left : 20;
   border: 1px solid #193a3e;
   background : #193a3e;
   font-size: 15px;
   color: ghostwhite;
   width: 197;
}
div.idsearchForm input#reset {
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
<section class="idcontent">
<div class="idsearch">
<img src="${contextPath}/resources/image/lock.png" width="40" height="40"/>
아이디 찾기
</div>


<div class="idsearchForm">       
	<form action="${contextPath}/member/idsearch.do" method="post" onsubmit="return IdSearchCheck()" name="f">
      <input id="name" type="text" name="member_name" size="50" title="이름" placeholder="이름을 입력하세요"><br><br>
      <select id="hp1" name="hp1">
	      <option>010</option>
	      <option>011</option>
	      <option>016</option>
	      <option>017</option>
	      <option>018</option>
	      <option>019</option>
      </select>&emsp;-&emsp;
      <input id="hp" name="hp2" type="text" size="3" />&emsp;-&emsp;
      <input id="hp" name="hp3" type="text" size="3" />                                        
      <br><br>
      <input id="submit" type="submit" value="찾기">  
      <input id="reset" type="button" onclick="location.href='loginForm.do'" value="취소">     	 
   </form>      
</div>
</section>

<script>
function IdSearchCheck(){
	if (f.member_name.value==""){
		alert("이름을 입력해주세요.");
		f.member_name.focus();
		return false;
	}
	if (f.hp2.value==""||f.hp3.value==""){
		alert("전화번호를 입력해주세요.");
		f.hp2.focus();
		return false;
	}
		
}
</script>
</body>
</html>