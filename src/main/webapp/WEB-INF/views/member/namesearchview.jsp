<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>이름으로 ID 찾기</h3>
<DIV id="detail_table">
<form action="${contextPath}/member/namesearch.do" method="post">
      <TABLE>
         <TBODY>
            <TR class="dot_line">
               <TD class="fixed_join">이름</TD>               
            </TR>
            <TR class="solid_line">
               <TD>
               <input name="member_name" type="text" size="10" />       
               </TD>
            </TR>
         </TBODY>
      </TABLE>
      <br><br>
      <INPUT   type="submit" value="아이디 찾기"> 
      <INPUT type="button" value="초기화">      
      <Br><br>
         <a href="${contextPath}/member/psearchv.do">비밀번호 찾기</a> 
         <a href="${contextPath}/member/memberForm.do">회원가입</a>    
         <a href="${contextPath}/main/customer.do">고객 센터</a>                  
   </form>      
</DIV>
</body>
</html>