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
            <td>영화명</td>                      
            <td>한줄평</td>
            <td>평점</td>
            <td>작성일자</td> 
            <td>삭제</td>
         </tr>
         <c:choose>
         	<c:when test="${ empty myReviewList  }">
        <tr>
          <td colspan=5 class="fixed">
              <strong>${memberInfo.member_id}님의 후기평이 존재하지 않습니다.</strong>
          </td>
        </tr>
        	</c:when>
        <c:otherwise>
         <c:forEach var="item" items="${myReviewList }"  varStatus="i">
            <tr>  
             <td> <!-- 1.영화 -->
               <span> ${item.movie_title} </span>
             </td>                                   
                
             <td align="left"> <!-- 2.한줄평 -->
                ${item.review_content}
             </td>
             
              <td> <!-- 3.평점 -->
             <span>${item.review_score}점</span>
             </td>      
                             
           <td> <!-- 5.작성일자 -->
               <span>${item.review_reg_date} </span>
             </td>
             
           <td> <!-- 6.삭제 -->           
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