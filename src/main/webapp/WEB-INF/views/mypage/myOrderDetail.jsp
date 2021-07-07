<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	isELIgnored="false"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<c:if test="${message=='cancel_order'}">
<script>
	window.onload=function()
	{
	  init();
	}
	
	function init(){
		alert("예매를 취소했습니다.");
	}
</script>
</c:if>
<script>
function fn_cancel_order(order_id){
	var answer=confirm("예매를 취소하시겠습니까?");
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
	<h1>예매 상세정보</h1>
	<h2>예매 내역</h2>
	<table class="list_view">
		<tbody align=center>			
			<tr> 
				 <td style="background: #e8e8e8">결제일 </td>
				 <td> ${item.ticket_reservation_day}</td> 
			</tr>
			
			<tr>
				 <td style="background: #e8e8e8"class="fixed">예매영화</td>
				 <td class="goods_image" ><a href="${contextPath}/goods/goodsDetail.do?goods_id=${item.goods_id }">${item.goods_title }</a></td>	
				 <td  rowspan=2 ><a href="${contextPath}/goods/goodsDetail.do?goods_id=${item.goods_id }"><IMG width="75" alt=""  src="${contextPath}/thumbnails.do?goods_id=${item.goods_id}&fileName=${item.goods_fileName}"></a></td>			 			 
			</tr>
			
			<tr>
				 <td style="background: #e8e8e8">예매번호</td> 
				 <td>${item.ticket_number }개</td>				 
			</tr>
			
			<tr>
				 <td style="background: #e8e8e8">관람일</td> 
				 <td>${item.ticket_movie_day }개</td>				 
			</tr>
				 				 
			<tr>
				 <td style="background: #e8e8e8">관람 인원</td> 
				 <td>${item.ticket_adult/child }개 <!-- foreach써서 성일/청소년 구분 --></td>				 
			</tr>
			
			<!-- <tr>
				 <td style="background: #e8e8e8">주문금액</td>
				 <td>
				 	  <h2>${item.order_goods_qty *item.goods_sales_price}원 (10% 할인)</h2>
				 </td>
			</tr> -->
			
			<tr>
				 <td style="background: #e8e8e8">상영관</td>
				 <td>${item.room_number}관</td>
			</tr>
			
			<tr>
				 <td style="background: #e8e8e8">좌석</td>
				 <td>${item.seat_number1 }열 ${item.seat_number2 } <!-- foreach써서 좌석 여러개 표시 --></td>
			</tr>
			
			<tr>
				 <td style="background: #e8e8e8">주문금액합계</td>
				 <td>${item.pay_total_price}원</td>
			</tr>
	</tbody>
</table>
	
	<div class="clear"></div>
<form name="form_order">
	<br>
	<br>	
	<div >
	  <br><br>
	   <h2>주문고객</h2>
		 <table >
		   <TBODY>
			 <tr class="dot_line">
				<td style="background: #e8e8e8"><h2>이름</h2></td>
				<td>
				 <input  type="text" value="${orderer.member_name}" size="15" disabled />
				</td>
			  </tr>
			  <tr class="dot_line">
				<td style="background: #e8e8e8"><h2>핸드폰</h2></td>
				<td>
				 <input  type="text" value="${orderer.member_hp1}-${orderer.member_hp2}-${orderer.member_hp3}" size="15" disabled />
				</td>
			  </tr>
			  <tr class="dot_line">
				<td style="background: #e8e8e8"><h2>이메일</h2></td>
				<td>
				   <input  type="text" value="${orderer.member_email1}@${orderer.member_email2}" size="15" disabled />
				</td>
			  </tr>
		   </tbody>
		</table>
	</div>
	<div class="clear"></div>
	<br>
	<br>
	<br>
	<h2>결제정보</h2>
	<DIV class="detail_table">
		<table>
			<tbody>
				<tr class="dot_line">
					<td class="fixed_join" style="background: #e8e8e8">결제일</td>
					<td>
					   ${ticket_reservation_day}
				    </td>
				</tr>
			
				<tr class="dot_line">
					<td class="fixed_join" style="background: #e8e8e8">결제수단</td>
					<td>
					   ${pay_method }
				    </td>
				</tr>
				
				<tr class="dot_line">
					<td class="fixed_join" style="background: #e8e8e8">결제금액</td>
					<td>
					   ${pay_total_price }
				    </td>
				</tr>				
			</tbody>
		</table>
	</div>
</form>
    <div class="clear"></div>
	<br>
	<br>
	<br>
		<br>
		<br> 
		<a href="${contextPath}/main/main.do"> 
		   <IMG width="75" alt="" src="${contextPath}/resources/image/btn_shoping_continue.jpg">
		</a>
		
		<c:choose>
			<c:when test="${item.ticket_movie_day>'sysdate'}"><!-- 상영일이 현재날짜보다 더 크면 취소가능 -->
			   <input  type="button" onClick="fn_cancel_order('${item.order_id}')" value="주문취소"  />
			</c:when>
			<c:otherwise>
			   <input  type="button" onClick="fn_cancel_order('${item.order_id}')" value="주문취소" disabled />
			</c:otherwise>
		</c:choose>
<div class="clear"></div>		
	
			
			
			