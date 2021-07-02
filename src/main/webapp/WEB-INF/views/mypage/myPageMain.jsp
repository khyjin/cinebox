<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    isELIgnored="false"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<style>

</style>


<c:if test="${message=='cancel_order'}">
	<script>
	window.onload=function()
	{
	  init();
	}
	
	function init(){
		alert("주문을 취소했습니다.");
	}
	</script>
</c:if>
<script>
function fn_cancel_order(order_id){
	var answer=confirm("주문을 취소하시겠습니까?");
	if(answer==true){
		var formObj=document.createElement("form");
		var i_order_id = document.createElement("input"); 
	    
	    i_order_id.name="order_id";
	    i_order_id.value=order_id;
		
	    formObj.appendChild(i_order_id);
	    document.body.appendChild(formObj); 
	    formObj.method="post";
	    formObj.action="${contextPath}/mypage/cancelMyOrder.do";
	    formObj.submit();	
	}
}
</script>
</head>

<body>
<section class="mypage_main">
<div class="myInfo">예매 내역
<a href="${contextPath}/order/orderResult.do"> <img src="${contextPath}/resources/image/btn_more_see.jpg" /></a>
</div>
<table class="list_view">
		<tbody align=center >
			<tr style=background:#e8e8e8 >				
				<td>예매번호</td> <!-- ticket_number -->
				<td>제목</td> <!-- movie_title -->
				<td>매수</td> <!-- ticket_adult/child -->
				<td>관람일</td> <!-- ticket_movie_day -->
				<td>결제일</td> <!-- ticket_reservation_day -->
				<td>취소</td>
			</tr>
      <c:choose>
         <c:when test="${ empty myOrderList  }">
		  <tr>
		    <td colspan=5 class="fixed">
				  <strong>고객님의 예매내역이 존재하지 않습니다.</strong>
		    </td>
		  </tr>
        </c:when>
        
        
        <c:otherwise>
	      <c:forEach var="item" items="${myOrderList }"  varStatus="i">
	      
	       <c:choose> 
              <c:when test="${ pre_order_id != item.order_id}">
                <c:choose>
	              <c:when test="${item.delivery_state=='delivery_prepared' }">
	                <tr  bgcolor="lightgreen">    
	              </c:when>
	              <c:when test="${item.delivery_state=='finished_delivering' }">
	                <tr  bgcolor="lightgray">    
	              </c:when>
	              <c:otherwise>
	                <tr  bgcolor="orange">   
	              </c:otherwise>
	            </c:choose> 
            <tr>  
            
             <td> <!-- 1.결제일 -->
           <!-- <span>${item.pay_order_time }</span></td> bookshop 주문일자 -->            
            	<span>${item.ticket_reservation_day} </span>
             </td>       
                
             <td> <!-- 2.예매번호 -->
		       <a href="${contextPath}/mypage/myOrderDetail.do?order_id=${item.order_id }"><span>${item.ticket_number }</span>  </a>
		     </td>   
                
             <td align="left"> <!-- 3.제목 -->
             	<strong>
			      <c:forEach var="item2" items="${myOrderList}" varStatus="j">
			          <c:if  test="${item.order_id ==item2.order_id}" >
			           ${item2.movie_title }<br>
			         </c:if>   
				 </c:forEach>
				</strong>
             </td>
             
             <td> <!-- 4.매수 -->
             </td>
                        		     
		     <td> <!-- 5.관람일 -->
            	<span>${item.ticket_movie_day} </span>
             </td>
             
             <td> <!-- 6.취소 -->
			  <c:choose>
			   <c:when test="${item.delivery_state=='delivery_prepared'}">
			       <input  type="button" onClick="fn_cancel_order('${item.order_id}')" value="주문취소"  />
			   </c:when>
			   <c:otherwise>
			      <input  type="button" onClick="fn_cancel_order('${item.order_id}')" value="주문취소" disabled />
			   </c:otherwise>
			  </c:choose>
			 </td>
             
		<!-- <td align="left">  bookshop 주문상품 
			   <strong>
			      <c:forEach var="item2" items="${myOrderList}" varStatus="j">
			          <c:if  test="${item.order_id ==item2.order_id}" >
			            <a href="${contextPath}/goods/goodsDetail.do?goods_id=${item2.goods_id }">${item2.goods_title }/${item.order_goods_qty }개</a><br>
			         </c:if>   
				 </c:forEach>
				</strong>
			 </td>-->
			 
			 
			
			 
			</tr>
			
          <c:set  var="pre_order_id" value="${item.order_id}" />
           </c:when>
      </c:choose>
	   </c:forEach>
	  </c:otherwise>
    </c:choose> 	    
</tbody>
</table>

<br><br><br>	



<div class="myInfo">나의 정보
    <a href="${contextPath}/mypage/myDetailInfo.do"> <img src="${contextPath}/resources/image/btn_more_see.jpg" />  </a>
</div>
<table border="0" width=100% cellpadding=50 cellspacing=20 font-family="맑은 고딕">
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
