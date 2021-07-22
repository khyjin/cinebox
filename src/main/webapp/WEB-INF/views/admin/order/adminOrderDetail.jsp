<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
function fn_check_cancel(){
	if (confirm("예매를 취소하시겠습니까?") == true) {
		location.href = '${contextPath}/admin/order/cancelTicket.do?ticket_number=${list.ticket_number}&member_id=${list.member_id}&ticket_adult=${list.ticket_adult}&ticket_child=${list.ticket_child}&ticket_used_point=${list.ticket_used_point}';
	} else {
		return;
	}
}
</script>
<style>
section.admin_mypage_main {
   width:800;
   height:900;
   float:right;
   margin-top : -190;
   font-family: "맑은고딕";
   }
	
#button0{ 
background-color: #168;
color: white;
border-radius: 50;
border-style: none;
width: 90;
height: 30;
}
.blueone {
	border-collapse: collapse;
	width: 100%;
}

.blueone td {
	padding: 10px;
	border-bottom: 1px solid #ddd;
}

#button1{
	background-color: #193a3e;
	color: white;
	border: none;
	padding: 6px 6px;
}
</style>

</head>
<body>
<section class="admin_mypage_main">
<form name="ticketForm" action="${contextPath}/admin/order/modifyReservation.do" method="post">
	<input type="hidden" name="member_id" value="${list.member_id}">
	<input type="hidden" name="ticket_number" value="${list.ticket_number}">
	<input type="hidden" name="ticket_used_point" value="${list.ticket_used_point}"/>
	<H1>1. 예매정보</H1>
	<table class="blueone">
		<tbody align=center>
			<tr>
				<td rowspan="6" class="goods_image">
				<img width="171" height="204" src="${contextPath}/thumbnails.do?movie_id=${list.movie_id}&image_file_name=${list.image_file_name}">
				</td>
				<td>예매번호</td>
				<td>${list.ticket_number}</td>
			</tr>
			<tr>
				<td>예매자ID</td>
				<td>${list.member_id}</td>
			</tr>
			<tr>
				<td>영화명</td>
				<td>${list.movie_title}</td>
			</tr>
			<tr>
				<td>상영관/좌석</td>
				<td>${list.room_number}관&emsp; ${list.seat_number }</td>
			</tr>
			<tr>
				<td>일시</td>
				<td>${list.ticket_movie_day}&emsp;${list.ticket_start_time}</td>
			</tr>
			<tr>
				<td>인원</td>
				<td>일반 : ${list.ticket_adult}&nbsp;청소년 : ${list.ticket_child}</td>
			</tr>
		</tbody>
	</table>
	<div class="clear"></div>
	<br>
		<h1>2.결제 정보</h1>
		<div>
		<table class="blueone">
			<tbody>
				<tr>
					<td>예매날짜</td>
					<td colspan="3">${list.ticket_payment_date }</td>
				</tr>
				<tr>
					<td rowspan="5">총결제금액</td>
					<td>일반</td>
					<td><c:set value="${list.ticket_adult*12000 }" var="price"/>
						<fmt:formatNumber value="${price}" pattern="#,###"/>
					</td>
					<td>${list.ticket_adult}</td>
				</tr>
				<tr>
					<td >청소년</td>
					<td><c:set value="${list.ticket_child*10000 }" var="priceChild"/>
						<fmt:formatNumber value="${priceChild}" pattern="#,###"/></td>
					<td>${list.ticket_child}</td>
				</tr>
				<tr>
					<td>사용 포인트</td>
					<td colspan="3"><fmt:formatNumber value="${list.ticket_used_point}" pattern="#,###"/></td>
				</tr>
				<tr>
					<td>최종결제금액</td>
					<td><fmt:formatNumber value="${list.ticket_total_price}"/></td>
				</tr>
				<tr>
					<td>결제수단</td>
					<td colspan="2">${list.ticket_pay_method}</td>
				</tr>
				<tr>
					<td>적립포인트</td>
					<c:set var="point" value="${(list.ticket_adult*12000+list.ticket_child*10000)*0.05}"/>
					<td colspan="2" style="text-align: center;"><fmt:formatNumber value="${point}" pattern="#,###"/> 
					</td>
				</tr>
			</tbody>
		</table>
		</div>
		<div class="clear"></div>
		<br><br><br>
	<c:choose>
		<c:when test="${list.ticket_cancle_yn=='N'}">

		<h1>3.취소여부</h1>
		<div>
		<table class="blueone">
			<tbody>
				<tr>
					<td>취소여부</td>
					<td>-</td>
					<td style="text-align: right;">
						<input type="button" value="예매취소하기" id="button0" onclick="fn_check_cancel()"/>
					</td>
				</tr>
				<tr>
					<td colspan="2">취소날짜</td>
					<td>${list.ticket_cancle_date}</TD>
				</tr>
			</tbody>
		</table>
		</div>	
		</c:when>
		<c:otherwise>
		<h1>3.취소여부</h1>
		<div>
		<table class="blueone">
			<tbody>
				<tr>
					<td>취소여부</td>
					<td>취소완료</td>
					<td style="text-align: right;"></td>
				</tr>
				<tr>
					<td>취소날짜</td>
					<td colspan="2">${list.ticket_cancle_date}</TD>
				</tr>
			</tbody>
		</table>
		</div>			
		</c:otherwise>
	</c:choose>
	<div class="clear"></div><br>
	</form>
	<div class="clear"></div>
		<center><brtton id="button1"><a href="${contextPath}/admin/order/adminOrderMain.do">목록가기</a></brtton></center>
	<div class="clear"></div>
</section>
</body>