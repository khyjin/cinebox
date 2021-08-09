<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"
    isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:set var="list" value="${list}"/>
<head>
<meta charset="UTF-8">
<style>
section.admin_mypage_main {
   width:800;
   height:800;
   float:right;
   }

.pay {
	border:2px solid #168;
   border-collapse: collapse;
   width: 250;
   text-align: center;
   
}

.pay th {
   padding: 10px;
   color: #168;
   border-bottom: 1px solid #168;
   background-color: #168;
   color:#fff;
}

.pay td {
   background-color: #fff;
   color:#168;
   padding: 10px;
   
}

.pay tr:hover td {
   color: #004;
}   

#list td{
	text-align: left; 
	font-size: 13px;
}

#buttons{
	font-size:20px;
	border-radius:10px; 
	border:0;
	padding: 15px 32px;
}
   
#layer {
   z-index: 2;
   position: absolute;
   top: 0px;
   left: 0px;
   width: 100%;
   /* background-color:rgba(0,0,0,0.8); */
}

#popup_order_detail {
   z-index: 3;
   position: fixed;
   text-align: center;
   left: 10%;
   top: 0%;
   width: 60%;
   height: 100%;
   background-color:#ccff99;
   border: 2px solid  #0000ff;
}

#close {
   z-index: 4;
   float: right;
}
</style>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js" type="text/javascript"></script>
<script>
function fn_pay(){	
   var e_card=document.getElementById("tr_pay_card");
   var e_phone=document.getElementById("tr_pay_phone");
   var e_account=document.getElementById("tr_pay_account");
   e_card.style.visibility="hidden";
   e_phone.style.visibility="hidden";
   e_account.style.visibility="hidden";
}

function fn_pay_phone(){	
   var e_card=document.getElementById("tr_pay_card");
   var e_phone=document.getElementById("tr_pay_phone");
   var e_account=document.getElementById("tr_pay_account");
   e_card.style.visibility="hidden";
   e_phone.style.visibility="visible";
   e_account.style.visibility="hidden";
}

function fn_pay_card(){	
   var e_card=document.getElementById("tr_pay_card");
   var e_phone=document.getElementById("tr_pay_phone");
   var e_account=document.getElementById("tr_pay_account");
   e_card.style.visibility="visible";
   e_phone.style.visibility="hidden";
   e_account.style.visibility="hidden";
}

function fn_pay_account(){	
   var e_card=document.getElementById("tr_pay_card");
   var e_phone=document.getElementById("tr_pay_phone");
   var e_account=document.getElementById("tr_pay_account");
   e_card.style.visibility="hidden";
   e_phone.style.visibility="hidden";
   e_account.style.visibility="visible";
}
</script>
<script>
function myFunction() {
	
	var x = document.getElementById("usedPoint").value; //쓴 포인트
	document.getElementById("result").innerText = x;
	
	var ticket = document.getElementById("origin"); //티켓 값 저장				
	const point = document.getElementById("point"); //보유 포인트	
	var finalPayment=ticket; //최종결제금액
	
	if(Number(point.innerText) >= Number(x)){	
		
		finalPayment=ticket.innerText-x; 	
	    $('#ticket_total_price').val(finalPayment);
	    document.getElementById("result2").innerText =document.getElementById("ticket_total_price").value;   
	
	}else{
    	alert("보유 포인트 이상 입력하였습니다.");
    	document.getElementById("result").innerText =0;
    	document.getElementById("result2").innerText =ticket.innerText;//최후금액도 초기화
    	$('#usedPoint').val(0);
    }
	
	
}

$(document).ready(function(){ //포인트 모두 사용 체크시
    $("#checkBoxId").change(function(){
        if($("#checkBoxId").is(":checked")){
        	
        	if((document.getElementById("origin").innerText-point.innerText)<0){
	  			document.getElementById("result").innerText =document.getElementById("origin").innerText;
	  	        document.getElementById("result2").innerText =0;        	
	  	        $('#usedPoint').val(document.getElementById("origin").innerText);
    	    }else{
	        	document.getElementById("result").innerText =point.innerText;
	        	document.getElementById("result2").innerText =document.getElementById("origin").innerText-point.innerText;        	
	        	$('#usedPoint').val(point.innerText);
    	    }
        }else{
        	document.getElementById("result").innerText =0;
        	$('#usedPoint').val(0);
        }
    });
});

window.history.forward(); //뒤로가기 방지
function noBack() {
	window.history.forward();
}

 function check() { //카드 및 휴대폰번호 선택시 입력확인
	 
	if($('input[name=ticket_pay_method]:checked').val()== "신용카드"){			
	   if($("#ticket_card_company").val() == "N") {
	       alert('결제카드를 선택해주세요.');
	       return false;
	   }			
	   if($("#ticket_card_month").val() == "N") {
	       alert('할부개월을 선택해주세요.');
	       return false;
	   }
	   
	}else if($('input[name=ticket_pay_method]:checked').val()=="휴대폰결제"){
   		if($("#ticket_phone_number1").val() == "" || $("#ticket_phone_number2").val() == "" || $("#ticket_phone_number3").val() == "") {
 	       alert('결제 휴대폰번호를 입력해주세요.');
 	       return false;	
 	       
 	}else{
  	 return confirm('최종 결제하기');
   		}
	
	}
}
</script>
</head>
<body> 

<form  name="form_order" action="${contextPath}/order/payToOrderGoods.do" method="post" onsubmit="return check();">
 <div style='float:left'>
   <br>
  
   <table class="pay">
    <tr align=center class="fixed">
     <th>총 상품금액</th>
     </tr>
     <tr>
        <td>
            <font size="5"><span id="origin">${list.ticket_total_price}</span>원</font>
            <input type="hidden" id="ticket_total_price" name="ticket_total_price" value="${list.ticket_total_price}" />
        </td>
	</tr>
     </table><br>  
     <table class="pay">
    <tr align=center class="fixed"> 
     <th>총 할인 금액</th>
     </tr>
     <tr>
       <td>
       <font size="5"><span id="result">0</span>원</font>
       </td>
       </tr>
    </table><br> 
    <table class="pay">
    <tr align=center class="fixed">
        <th>최종 결제금액</th>
        </tr>
        <tr>
        <td>
           <font size="8"><span id="result2">${list.ticket_total_price}</span>원</font>
       	</td>
     	</tr>
   	</table>
   </div>
<div style='float:right'>
   <H1>1.최종 예매내역</H1>
   
   <table class="list_view" id="list">
      <tbody align=center>
     	 <tr>
    	 <td rowspan="6" class="goods_image" style="padding-right:60px; padding-left:30px;">
             <img width="160" height="200" src="${contextPath}/thumbnails.do?movie_id=${img.movie_id}&image_file_name=${img.image_file_name}">
             <input type="hidden" id="movie_id" name="movie_id" value="${list.movie_id}" />
             <input type="hidden" id="member_id" name="member_id" value="${list.member_id}" />
		</td>
         <td>
            <input type="hidden" id="movie_title" name="movie_title" value="${list.movie_title}" />
            예매 영화 : ${list.movie_title} 
          </td>
         </tr>
         <tr>
         <td>
         	상영관 : ${list.room_number}관
            <input type="hidden" id="room_number" name="room_number" value="${list.room_number}" />
          </td>
          </tr>
         <tr>
         <td> 
         	상영날짜 : ${list.ticket_movie_day}
            <input type="hidden" id="ticket_movie_day" name="ticket_movie_day" value="${list.ticket_movie_day}" />   
         </td>
          </tr>
          <tr>
          <td>
           	상영시간 : ${list.ticket_start_time}
            <input type="hidden" id="ticket_start_time" name="ticket_start_time" value="${list.ticket_start_time}" />
            <input type="hidden" id="ticket_end_time" name="ticket_end_time" value="${list.ticket_end_time}" />
          </td>
          </tr>
          <tr>
          <td>
          	예매인원 : 성인 ${list.ticket_adult}명
            <input   type="hidden" id="ticket_adult" name="ticket_adult" value="${list.ticket_adult}" />
         	 / 청소년 ${list.ticket_child}명
          <input type="hidden" id="ticket_child" name="ticket_child" value="${list.ticket_child}" />
          </td>
          </tr>
          <tr>
          <td>
          	예매좌석 : ${list.seat_number}
            <input type="hidden" id="seat_number" name="seat_number" value="${list.seat_number}" />
          </td>
          </tr>
      </tbody>
   </table>
   <div class="clear"></div>

   <br>
   <br> 
   <H1>2.포인트 사용</H1>
   <br>
      <table>
         <tbody>
            <tr class="dot_line">
                              
               <td cellpadding="5">
               사용할 포인트 : <input name="ticket_used_point" value="0" type="text" size="10" id="usedPoint" onchange="myFunction()"/>&nbsp;&nbsp;
              &nbsp; 
               <input type="checkbox" id="checkBoxId"/> 모두사용
               </td>
                </tr>
               <tr cellpadding="5"></tr>
             <tr >
               <td style="padding-top:8px"><fmt:formatNumber value="${list.ticket_total_price*0.05}" var="earnPoint" pattern="#"/> 
               ( 보유포인트 : <span id="point">${point}</span>원 / 적립예정 포인트 : ${earnPoint}원
               <input type="hidden" name="plus_point" value="${earnPoint}" />)         
               </td>
            </tr>
         </tbody>
      </table>
   
   <div class="clear"></div>
   <br>
   <br>
   <h1>3.결제정보</h1>
    <br>
      <table>
         <tbody>
            <tr>
               <td>
                  <input type="radio" id="ticket_pay_method" name="ticket_pay_method" value="신용카드"   onClick="fn_pay_card()" checked>신용 카드 &nbsp;&nbsp;&nbsp; 
                  <input type="radio" id="ticket_pay_method" name="ticket_pay_method" value="실시간계좌이체" onClick="fn_pay()">실시간 계좌이체 &nbsp;&nbsp;&nbsp;
                  <input type="radio" id="ticket_pay_method" name="ticket_pay_method" value="휴대폰결제" onClick="fn_pay_phone()">휴대폰 결제 &nbsp;&nbsp;&nbsp;
                  <input type="radio" id="ticket_pay_method" name="ticket_pay_method" value="카카오페이" onClick="fn_pay()">카카오 페이 &nbsp;&nbsp;&nbsp; 
                  <input type="radio" id="ticket_pay_method" name="ticket_pay_method" value="무통장입금" onClick="fn_pay_account()">무통장 입금 &nbsp;&nbsp;&nbsp;
                  
               </td>
            </tr> 
            <tr>
               <td style="padding-top:8px; padding-bottom:15px">      
               </td>
            </tr>
            <tr id="tr_pay_card">
               <td>
                 <strong>카드 선택</strong>&nbsp;&nbsp;
                 <select id="ticket_card_company" name="ticket_card_company">
                	 <option value="N">==선택==</option>
                     <option value="삼성">삼성</option>
                     <option value="하나SK">하나SK</option>
                     <option value="현대">현대</option>
                     <option value="KB">KB</option>
                     <option value="신한">신한</option>
                     <option value="롯데">롯데</option>
                     <option value="BC">BC</option>
                     <option value="시티">시티</option>
                     <option value="NH농협">NH농협</option>
               </select>
               &nbsp;&nbsp; / &nbsp;&nbsp;
               <strong>할부 기간</strong>&nbsp;&nbsp;
               <select id="ticket_card_month" name="ticket_card_month">
               		 <option value="N">==선택==</option>
                     <option value="일시불">일시불</option>
                     <option value="2개월">2개월</option>
                     <option value="3개월">3개월</option>
                     <option value="4개월">4개월</option>
                     <option value="5개월">5개월</option>
                     <option value="6개월">6개월</option>
               </select>
               </td>
            </tr>
            <tr id="tr_pay_phone" style="visibility:hidden">
              <td>
              <strong>휴대폰 번호 입력: </strong>  
                        <input  type="text" size="5" id="ticket_phone_number1" name="ticket_phone_number1" /> -
                       <input  type="text" size="5" id="ticket_phone_number2" name="ticket_phone_number2" /> -
                       <input  type="text" size="5" id="ticket_phone_number3" name="ticket_phone_number3" />
              </td>
            </tr>
            <tr id="tr_pay_account" style="visibility:hidden">
            <td>
              <strong>입금 계좌: 조은은행 63290102 - 123456 </strong>  
              </td>
            </tr>
         </tbody>
      </table>
	</div>

   <div class="clear"></div>
   <br>
 		<input type="button" onclick="javascript:history.back();" id="buttons" style="background-color: #555555; color:white;" value="이전으로">
   		<input type="submit" value="결제하기" id="buttons" style="background-color: #f44336; color:white;"  >
      </form>
   
      <br>
      <br>
      
<div class="clear"></div>      
  
</body>
              