<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="orderList" value="${orderMap.orderList}" />
<c:set var="deliveryInfo" value="${orderMap.deliveryInfo}" />
<c:set var="orderer" value="${orderMap.orderer}" />

<script type="text/javascript">
function fn_modify_order_state(order_id){
	var s_delivery_state=document.getElementById("s_delivery_state");
    var index = s_delivery_state.selectedIndex;   //선택한 옵션의 인덱스를 구합니다.
    var value = s_delivery_state[index].value;    //선택한 옵션의 값을 구합니다.
	console.log("value: " +value);
	$.ajax({
		type : "post",
		async : false, //false인 경우 동기식으로 처리한다.
		url : "${contextPath}/admin/order/modifyDeliveryState.do",
		data : {
			order_id:order_id,
			'delivery_state':value
		},
		success : function(data, textStatus) {
			if(data.trim()=='mod_success'){
				alert("주문 정보를 수정했습니다.");
				location.href="${contextPath}/admin/order/orderDetail.do?order_id="+order_id;
			}else if(data.trim()=='failed'){
				alert("다시 시도해 주세요.");	
			}
			
		},
		error : function(data, textStatus) {
			alert("에러가 발생했습니다."+data);
		},
		complete : function(data, textStatus) {
			//alert("작업을완료 했습니다");
			
		}
	}); //end ajax		
}

</script>
<style>
section.admin_mypage_main {
   width:800;
   height:800;
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
<form name="frm_delivery_list">
	<H1>1. 예매정보</H1>
	<table class="blueone">
		<tbody align=center>
			<tr>
				<td rowspan="5" class="goods_image">
				<img width="75" src="${contextPath}/thumbnails.do?goods_id=${item.goods_id}&fileName=${item.goods_fileName}">
				</td>
				<td>예매번호</td>
				<td>예매번호 불러올 자리</td>
			</tr>
			<tr>
				<td>영화명</td>
				<td>영화명 들어갈 자리</td>
			</tr>
			<tr>
				<td>상영관</td>
				<td>상영관 들어갈 자리</td>
			</tr>
			<tr>
				<td>일시</td>
				<td>날짜+시간</td>
			</tr>
			<tr>
				<td>인원</td>
				<td>일반 :- &emsp; 청소년 : -</td>
			</tr>
		</tbody>
	</table>
	<div class="clear"></div>
	<br><br>
	<h1>2.결제 정보</h1>
	<div>
	<table class="blueone">
		<tbody>
			<tr>
				<td rowspan="5">총결제금액</td>
				<td>일반</td>
				<td>12000*인원(최대8명?)</td>
			</tr>
			<tr>
				<td >청소년</td>
				<td>10000*인원</td>
			</tr>
			<tr>
				<td>할인 포인트</td>
				<td>사용된 포인트 출력</td>
			</tr>
			<tr>
				<td>최종결제금액</td>
				<td>일반+청소년-포인트</td>
			</tr>
			<tr>
				<td>결제수단</td>
				<td colspan="2">카드/카카오페이...</td>
			</tr>
			<tr>
				<td>적립포인트</td>
				<td colspan="2" style="text-align: center;">결제금액*0.1P</td>
			</tr>
		</tbody>
	</table>
	</div>
	
	<div class="clear"></div>
	<br> <br> <br>
	<h1>3.취소여부</h1>
	<div>
	<table class="blueone">
		<tbody>
			<tr>
				<td>취소여부</td>
				<td>Y/N</td>
				<td style="text-align: right;"><input type="button" value="예매취소하기" id="button0"/></td>
			</tr>
			<tr>
				<td>취소날짜</td>
				<td>---</TD>
			</tr>
		</tbody>
	</table>
	</div>
	<div class="clear"></div><br>
	</form>
	<div class="clear"></div>
		<center><brtton id="button1"><a href="${contextPath}/admin/order/adminOrderMain.do">목록가기</a></brtton></center>
	<div class="clear"></div>
</section>
</body>