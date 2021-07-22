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
<style>
section.OrderPage{
	width:800;
	height:1000;
	float:right;
	margin-top : -280;
}
.myorderDetail{
	font-family : "맑은 고딕";	
	font-weight : bold;
	font-size : 20;
}
a{
color:black;
}
.myorderDetail img{
width:60;
height:60;
}
.movie_notice {
font-family : "맑은 고딕";
font-size : 13;
color: #1a5733;
}
.movie_notice img{
width:20;
height:20;
padding:5;
}
input#button{
   height: 35px;   
   border: 1px solid #193a3e;
   background : #193a3e;
   font-size: 13px;
   color: ghostwhite;
   width: 100;
}

button{
   height: 35px;   
   border: 1px solid #193a3e;
   background : #193a3e;
   font-size: 13px;
   font-color: ghostwhite;
   width: 100;
}
button a {
	color:ghostwhite;
}
</style>

<script>
function fn_cancel_order((){
	if (confirm("예매를 취소하시겠습니까?") == true) {
		location.href = '${contextPath}/mypage/cancelMyOrder.do?ticket_number=${myOrderList.ticket_number}&member_id=${myOrderList.member_id}&ticket_total_price=${myOrderList.ticket_total_price}&ticket_used_point=${myOrderList.ticket_used_point}';
	} else {
		return;
	}
}
</script>
</head>
<body>
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yy/MM/dd" var="today" />
<section class="OrderPage">
	<div class="myorderDetail"><img src="${contextPath}/resources/image/ticket_logo.png">예매 내역</div>
	<table class="list_view">
		<tbody align=center>
			<tr>
				 <td style="background: #e8e8e8" width="250">예매영화</td>
				 <td>${myOrderList.movie_title }</td>				 
			</tr>
			
			<tr>
				 <td style="background: #e8e8e8">예매번호</td> 
				 <td>${myOrderList.ticket_number }</td>				 
			</tr>
			
			<tr>
				 <td style="background: #e8e8e8">관람일</td> 
				 <td>${myOrderList.ticket_movie_day } ${myOrderList.ticket_start_time}</td>				 
			</tr>
				 				 
			<tr>
				 <td style="background: #e8e8e8">관람 인원</td> 
				 <td>성인:${myOrderList.ticket_adult }매 / 청소년:${myOrderList.ticket_child }매</td>				 
			</tr>
			
			
			<tr>
				 <td style="background: #e8e8e8">상영관</td>
				 <td>${myOrderList.room_number}관</td>
			</tr>
			
			<tr>
				 <td style="background: #e8e8e8">좌석</td>
				 <td>${myOrderList.seat_number}</td>
			</tr>
			
	</tbody>
</table>
	
	<div class="clear"></div>
	<input type="hidden" name="member_id" value="${myOrderList.member_id}">
	<input type="hidden" name="ticket_number" value="${myOrderList.ticket_number}">
	<input type="hidden" name="ticket_used_point" value="${myOrderList.ticket_used_point}"/>
	
	<div class="clear"></div>
	<br>
	<br>
	<br>
	<div class="myorderDetail"><img src="${contextPath}/resources/image/ticket_logo.png">결제 정보</div>
		<table class="list_view">
			<tbody align=center>
				<tr class="dot_line">
					<td class="fixed_join" style="background: #e8e8e8" width="250">결제일</td>
					<td>
					   ${myOrderList.ticket_payment_date}
				    </td>
				</tr>
			
				<tr class="dot_line">
					<td class="fixed_join" style="background: #e8e8e8">결제수단</td>
					<td>
					<c:choose>
						<c:when test="${myOrderList.ticket_pay_method=='신용카드'}">
						   ${myOrderList.ticket_pay_method}(${myOrderList.ticket_card_company})
						</c:when> 
						<c:otherwise>
						   ${myOrderList.ticket_pay_method}
						</c:otherwise> 
				    </c:choose>
				    </td>
				</tr>
				
				<tr>
					<td class="fixed_join" style="background: #e8e8e8">사용 포인트</td>
					<td>
						<fmt:formatNumber value="${myOrderList.ticket_used_point}" pattern="#,###"/>점
				    </td>
				</tr>
				
				<tr class="dot_line">
					<td class="fixed_join" style="background: #e8e8e8">적립포인트</td>
					<c:set var="point" value="${myOrderList.ticket_total_price*0.05}"/>
					<td colspan="2" style="text-align: center;"><fmt:formatNumber value="${point}" pattern="#,###"/>점
					</td>
				</tr>
				
				<tr class="dot_line">
					<td class="fixed_join" style="background: #e8e8e8">결제금액</td>
					<td>
						<fmt:formatNumber value="${myOrderList.ticket_total_price}" pattern="#,###"/>원					  
				    </td>
				</tr>			
			</tbody>
		</table>

	<br><br><br>
	<div class="movie_notice"><img src="${contextPath}/resources/image/warning_logo.png"><strong>당일 예매취소는 불가능한 점 유의바랍니다.</strong></div>
	<div class="movie_notice"><img src="${contextPath}/resources/image/warning_logo.png"><strong>쾌적한 관람 환경을 위해 상영시간 이전에 입장 부탁드립니다.</strong></div>	
	<div class="movie_notice"><img src="${contextPath}/resources/image/warning_logo.png"><strong>지연입장에 의한 관람불편을 최소화하고자 본 영화는 10분 후 시작됩니다.</strong></div>	
    <div class="clear"></div>
	<br>
	<br>
	<br>
		<br>
		<br> 
		<button><a href="${contextPath}/main/main.do">메인</a></button>
		
		<c:choose>
			<c:when test="${myOrderList.ticket_movie_day gt today}"> <!-- 상영일이 현재날짜보다 더 크면 취소가능 -->
			   <input id="button" type="button" onClick()="fn_cancel_order('${myOrderList.ticket_number}')" value="예매취소"  />
			</c:when>
			<c:otherwise>
			   <input id="button" type="button" onClick()="fn_cancel_order('${myOrderList.ticket_number}')" value="예매취소" disabled />
			</c:otherwise>
		</c:choose>
<div class="clear"></div>
</section>
</body>
</html>	