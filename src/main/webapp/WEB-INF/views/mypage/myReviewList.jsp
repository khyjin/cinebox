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
<div class="myInfo">내 후기평</div>
<table class="list_view">
      <tbody align=center >
         <tr style=background:#e8e8e8 >  
            <td><strong>영화</strong></td>          
            <td><strong>평점</strong></td>
            <td><strong>한줄평</strong></td>
            <td><strong>작성일자</strong></td> 
            <td><strong>삭제</strong></td>
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
         <c:forEach var="item" items="${myReviewList}">
         <script type="text/javascript">
			function delete_review() {
				if (confirm("정말 삭제하시겠습니까?") == true) {
					location.href = '${contextPath}/mypage/deletemyReview.do?review_number=${item.review_number}';
				} else {
					return;
				}
			}
		</script>
            <tr>  
             <td> <!-- 1.영화 -->    
               <span> ${item.movie_title} </span>
             </td>       
                
             <td> <!-- 2.평점 -->
             <span>${item.review_score}</span>
           </td>   
                
             <td align="left"> <!-- 3.한줄평 -->
                <span>${item.review_content}</span>
             </td>
                                   
           <td> <!-- 5.작성일자 -->
               <span>${item.review_reg_date} </span>
             </td>
             
           <td> <!-- 6.삭제 -->  
               <button onclick="delete_review()">삭제</button>
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