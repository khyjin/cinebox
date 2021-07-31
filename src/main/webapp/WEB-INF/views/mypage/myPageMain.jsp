<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    isELIgnored="false"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<style type="text/css">
a {
color : black;
}

.info_view td {
	font-family : "맑은 고딕";
}

</style>
</head>

<body>
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yy/MM/dd" var="today" />
<section class="mypage_main">
<div class="myInfo">예매 내역</div>
<div style="overflow: auto; height: 40%;">
<table class="list_view">
      <tbody align=center >
         <tr style=background:#e8e8e8 >  
            <td><strong>예매번호</strong></td> <!-- ticket_number -->
            <td><strong>영화제목</strong></td> <!-- movie_title -->
            <td><strong>좌석번호</strong></td> <!-- ticket_adult/child -->
            <td><strong>관람일</strong></td> <!-- ticket_movie_day -->
            <td><strong>결제일</strong></td>
         </tr>
         
        <c:choose>
         <c:when test="${empty myOrderList }"> 
        <tr>
          <td colspan=5 class="fixed">
              <strong>${memberInfo.member_id }님의 예매내역이 존재하지 않습니다.</strong>
          </td>
        </tr>
        </c:when> 
       
        <c:otherwise>
         <c:forEach var="item" items="${myOrderList }">  
          <c:if test="${item.ticket_movie_day ge today}">       
            <tr>             
	             <td> <!-- 1.예매번호 -->
	             	<strong><a href="${contextPath}/mypage/myOrderDetail.do?ticket_number=${item.ticket_number}&movie_id=${item.movie_id}">
	             	<span>${item.ticket_number}</span></a></strong>
	             </td>                  
	              <td align="center"> <!-- 2.제목 -->
	                ${item.movie_title }
	             </td>
	             
	             
	             <td> <!-- 3.좌석번호--> 
	             	 ${item.seat_number}
	             </td> 	             	            
	             
	                                   
	             <td> <!-- 4.관람일 -->
	                <span>${item.ticket_movie_day} </span> 
	             </td> 
	             
	             
	             <td> <!-- 5.결제일 -->
	               <span>${item.ticket_payment_date} </span> 
	             </td> 
	                                                     
            </tr> 
            </c:if>        
      </c:forEach>
     </c:otherwise>   
    </c:choose> 
           
</tbody>
</table>
</div>

<br><br><br>   



<div class="myInfo">나의 정보
    <a href="${contextPath}/mypage/myDetailInfo.do"> <img width="20" height="20" src="${contextPath}/resources/image/more5.png" />  </a>
</div>
<table class="info_view" border="0" width=100% cellpadding=50 cellspacing=20>
   <tr>
       <td>이름</td>
       <td><strong>${memberInfo.member_name }</strong></td>
   </tr>
  
   <tr>
       <td>아이디</td>
       <td><strong>${memberInfo.member_id }</strong></td>
   </tr>
   
   <tr>
       <td>이메일</td>
       <td><strong>${memberInfo.member_email1 }@${memberInfo.member_email2 }</strong></td>
   </tr>
   
   <tr>
       <td>전화번호</td>
       <td><strong>${memberInfo.member_hp1 }-${memberInfo.member_hp2}-${memberInfo.member_hp3 }</strong></td>
   </tr>

</table>
</section>
</body>
</html>