<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<section class="mypage_main">
<table class="list_view">
      <tbody align=center >
         <tr style=background:#e8e8e8 >  
            <td>영화</td>          
            <td>평점</td>
            <td>한줄평</td>
            <td>작성자</td>
            <td>작성일자</td> 
            <td>취소</td>
         </tr>
         <c:choose>
         	<c:when test="${ empty myReviewList  }">
        <tr>
          <td colspan=5 class="fixed">
              <strong>고객님의 후기평이 존재하지 않습니다.</strong>
          </td>
        </tr>
        	</c:when>
        <c:otherwise>
         <c:forEach var="item" items="${myReviewList }"  varStatus="i">
            <tr>  
             <td> <!-- 1.영화 -->
           <!-- <span>${item.pay_order_time }</span></td> bookshop 주문일자 -->            
               <span><!-- ${item.ticket_reservation_day} --> ${item.movie_id} </span>
             </td>       
                
             <td> <!-- 2.평점 -->
             <span>${item.review_score}</span>
           </td>   
                
             <td align="left"> <!-- 3.한줄평 -->
                ${item.review_content}
             </td>
             
             <td> <!-- 4.작성자 -->
             ${item.member_id}
             </td>
                                   
           <td> <!-- 5.작성일자 -->
               <span>${item.review_reg_date} </span>
             </td>
             
           <td> <!-- 6.취소 -->           
           </td>  
                                   
         </tr>
      </c:forEach>
     </c:otherwise> 
     </c:choose>     
</tbody>
</table>
</section>
</body>
</html>