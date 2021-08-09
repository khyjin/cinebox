<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<html>
<head>
<style type="text/css">
a {
color:black;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<section class="mypage_main">
<div class="myInfo">나의 1:1 문의내역</div>
<table class="list_view">
      <tbody align=center >
         <tr style=background:#e8e8e8 >  
            <td><strong>문의유형</strong></td>
            <td><strong>제목</strong></td>     
            <td><strong>작성일자</strong></td>
            <td><strong>삭제</strong></td> 
         </tr>
         <c:choose>
         	<c:when test="${ empty myQnaList  }">
        <tr>
          <td colspan=5 class="fixed">
              <strong>${memberInfo.member_id}님의 1:1 문의내역이 존재하지 않습니다.</strong>
          </td>
        </tr>
        	</c:when>
        <c:otherwise>
         <c:forEach var="item" items="${myQnaList}">
         <script type="text/javascript">
			function delete_qna(cscenter_number) {
				if (confirm("문의 내역을 삭제하시겠습니까?") == true) {
					location.href = '${contextPath}/mypage/deletemyQna.do?cscenter_number='+cscenter_number+'';
				} else {
					return;
				}
			}
		</script>
            <tr>  
             <td> <!-- 1.문의 타입 -->    
               <span> ${item.cscenter_headline} </span>
             </td>       
                
             <td> <!-- 2.제목 -->
             <c:choose>
             	<c:when test="${item.cscenter_type=='qna_re'}">
             		<a href="${contextPath}/mypage/myQnaModifyview.do?cscenter_number=${item.cscenter_number}">
             		<img width="20" height="20"	src="${contextPath}/resources/image/reply.png">${item.cscenter_title}</a>
             	</c:when>
             	<c:otherwise>
             	<span><strong><a href="${contextPath}/mypage/myQnaModifyview.do?cscenter_number=${item.cscenter_number}">${item.cscenter_title}</a></strong></span>
             	</c:otherwise>
             </c:choose>
           </td>   
                                  
           <td> <!-- 3.작성일자 -->
               <span>${item.cscenter_reg_date} </span>
           </td>
             
             <td> <!-- 4.삭제 -->  
               <button onclick="delete_qna('${item.cscenter_number}')">삭제</button>                 
         </tr> 
      </c:forEach>
     </c:otherwise> 
     </c:choose>     
</tbody>
</table>
</section>
</body>
</html>