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
   width: 130%;
   font-size: small;
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

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
function fn_pay_phone(){

   var e_card=document.getElementById("tr_pay_card");
   var e_phone=document.getElementById("tr_pay_phone");
   e_card.style.visibility="hidden";
   e_phone.style.visibility="visible";
}

function fn_pay_card(){
   var e_card=document.getElementById("tr_pay_card");
   var e_phone=document.getElementById("tr_pay_phone");
   e_card.style.visibility="visible";
   e_phone.style.visibility="hidden";
}

function imagePopup(type) {
   if (type == 'open') {
      // 팝업창을 연다.
      jQuery('#layer').attr('style', 'visibility:visible');

      // 페이지를 가리기위한 레이어 영역의 높이를 페이지 전체의 높이와 같게 한다.
      jQuery('#layer').height(jQuery(document).height());
   }

   else if (type == 'close') {

      // 팝업창을 닫는다.
      jQuery('#layer').attr('style', 'visibility:hidden');
   }
}

var movie_id="";
var movie_id_title="";
var movie_id_fileName="";

var each_movie_id_price;
var total_order_movie_id_price;
var hp1;
var hp2;
var hp3;

var pay_method;
var card_com_name;
var card_pay_month;
var pay_orderer_hp_num;

function fn_show_order_detail(){ //결제버튼 누를시 처음 실행
   movie_id="";
   movie_title="";
   
   var frm=document.form_order;
   var movie_id=frm.movie_id;
   var movie_title=frm.movie_title;
   var movie_fileName=frm.movie_fileName;
   var total_sales_price=document.getElementById("ticket_total_price");
 
   total_order_movie_price=total_sales_price.value;
   
     var r_pay_method  =  frm.ticket_pay_method;
   
   for(var i=0; i<r_pay_method.length;i++){
     if(r_pay_method[i].checked==true){
        pay_method=r_pay_method[i].value
        if(pay_method=="신용카드"){
         var i_card_com_name=document.getElementById("ticket_card_company");
         var i_card_pay_month=document.getElementById("ticket_card_month");
         card_com_name=i_card_com_name.value;
         card_pay_month=i_card_pay_month.value;
         pay_method+="<Br>"+
                   "카드사:"+card_com_name+"<br>"+
                   "할부개월수:"+card_pay_month;
         pay_orderer_hp_num="해당없음";
         
        }else if(pay_method=="휴대폰결제"){
         var i_pay_order_tel1=document.getElementById("ticket_phone_number1");
         var i_pay_order_tel2=document.getElementById("ticket_phone_number2");
         var i_pay_order_tel3=document.getElementById("ticket_phone_number3");
         pay_orderer_hp_num=i_pay_order_tel1.value+"-"+
                            i_pay_order_tel2.value+"-"+
                         i_pay_order_tel3.value;
         pay_method+="<Br>"+"결제휴대폰번호:"+pay_orderer_hp_num;
         card_com_name="해당없음";
         card_pay_month="해당없음";
        } //end if
       break;
     }// end for
   }
   
   var i_hp1=document.getElementById("ticket_phone_number1");
   var i_hp2=document.getElementById("ticket_phone_number2");
   var i_hp3=document.getElementById("ticket_phone_number3");
  

//   alert("총주문 금액:"+total_order_goods_price);
   //order_total_price=h_order_total_price.value;
   /*
   orderer_name=h_orderer_name.value;
   receiver_name=i_receiver_name.value;
   hp1=i_hp1.value;
   hp2=i_hp2.value;
   hp3=i_hp3.value;*/
 
   
   receiver_hp_num=hp1+"-"+hp2+"-"+hp3;
  
   var p_order_movie_id=document.getElementById("movie_id");
   var p_order_movie_title=document.getElementById("movie_title");
   var p_total_order_movie_price=document.getElementById("ticket_total_price");
   var p_pay_method=document.getElementById("ticket_pay_method");
   
   p_order_movie_id.innerHTML=movie_id;
   p_order_movie_title.innerHTML=movie_title;
   p_total_order_movie_price.innerHTML=ticket_total_price+"원";
   p_pay_method.innerHTML=ticket_pay_method;
   imagePopup('open');
}

function fn_process_pay_order(){
   
   alert("최종 결제하기");
   var formObj=document.createElement("form");
    var i_receiver_name=document.createElement("input");
    
    var i_receiver_hp1=document.createElement("input");
    var i_receiver_hp2=document.createElement("input");
    var i_receiver_hp3=document.createElement("input");
    
    var i_pay_method=document.createElement("input");
    var i_card_com_name=document.createElement("input");
    var i_card_pay_month=document.createElement("input");
    var i_pay_orderer_hp_num=document.createElement("input");
   
   
    i_pay_method.name="ticket_pay_method";
    i_card_com_name.name="ticket_card_company";
    i_card_pay_month.name="ticket_card_month";
  
    i_card_com_name.value=ticket_card_company;
    i_card_pay_month.value=ticket_card_month;
    
    formObj.appendChild(i_pay_method);
    formObj.appendChild(i_card_com_name);
    formObj.appendChild(i_card_pay_month);
    formObj.appendChild(i_pay_orderer_hp_num);
    

    document.body.appendChild(formObj); 
    formObj.method="post";
    formObj.action="${contextPath}/order/payToOrderGoods.do"; //결과 페이지로
    formObj.submit();
   imagePopup('close');
}
</script>

</head>
<body> 
<form  name="form_order" action="${contextPath}/order/payToOrderGoods.do" method="post">
 <div style='float:left'>
   <br>
  
   <table class="pay">
    <tr align=center class="fixed">
     <th>총 상품금액</th>
     </tr>
     <tr>
        <td>
            <p id="p_totalPrice">${list.ticket_total_price}원</p>
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
       		<p id="p_totalSalesPrice">원</p>  
       </td>
       </tr>
    </table><br> 
    <table class="pay">
    <tr align=center class="fixed">
        <th>최종 결제금액</th>
        </tr>
        <tr>
        <td><p id="p_final_totalPrice">
           <font size="15"> 2500원</font>
       		</p> 
       	</td>
     	</tr>
   	</table>
   </div>
<div style='float:right'>
   <H1>1.최종 예매내역</H1>
   
   <table class="list_view">
      <tbody align=center>
     	 <tr>
    	 <td class="goods_image">
             <img width="75" alt=""  src="${contextPath}/thumbnails.do?movie_id=${list.movie_id}&fileName=${item.movie_fileName}">
             <input type="hidden" id="movie_id" name="movie_id" value="${list.movie_id}" />
              <input type="hidden" id="member_id" name="member_id" value="${list.member_id}" />${list.member_id}
		</td>
       	</tr>
         <tr>
         <td>
            <input type="hidden" id="movie_title" name="movie_title" value="${list.movie_title}" />
                   예매 영화 : ${list.movie_title} ,${orderer.member_id}
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
          </td>
          </tr>
          <tr>
          <td>
          예매인원 : 성인 -> ${list.ticket_adult}
               <input   type="hidden" id="ticket_adult" name="ticket_adult" value="${list.ticket_adult}" />
          / 청소년 ->${list.ticket_child}
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
               <td>보유포인트 : ${orderer.member_point}원 </td>
               <td cellpadding="5">
                / 사용할 포인트 : <input name="ticket_used_point" type="text"size="10" /> 원 &nbsp;&nbsp;&nbsp; 
               <input type="checkbox" /> 모두사용
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
                  <input type="radio" id="ticket_pay_method" name="ticket_pay_method" value="신용카드"   onClick="fn_pay_card()" checked>신용카드 &nbsp;&nbsp;&nbsp; 
                  <input type="radio" id="ticket_pay_method" name="ticket_pay_method" value="제휴 신용카드"  >제휴 신용카드 &nbsp;&nbsp;&nbsp; 
                  <input type="radio" id="ticket_pay_method" name="ticket_pay_method" value="휴대폰결제" onClick="fn_pay_phone()">휴대폰 결제 &nbsp;&nbsp;&nbsp;
                  <input type="radio" id="ticket_pay_method" name="ticket_pay_method" value="카카오페이(간편결제)">카카오페이(간편결제) &nbsp;&nbsp;&nbsp; 
                  <input type="radio" id="ticket_pay_method" name="ticket_pay_method" value="직접입금">직접입금&nbsp;&nbsp;&nbsp;
               </td>
            </tr>
            <tr >
               <td> 
           		 <input type="radio" id="ticket_pay_method" name="ticket_pay_method" value="무통장 입금">무통장 입금 &nbsp;&nbsp;&nbsp;
                 <input type="radio" id="ticket_pay_method" name="ticket_pay_method" value="실시간 계좌이체">실시간 계좌이체 &nbsp;&nbsp;&nbsp;
               </td>
            </tr>
            <tr id="tr_pay_card">
               <td>
                 <strong>카드 선택</strong>:&nbsp;&nbsp;&nbsp;
                 <select id="ticket_card_company" name="ticket_card_company">
                     <option value="삼성" selected>삼성</option>
                     <option value="하나SK">하나SK</option>
                     <option value="현대">현대</option>
                     <option value="KB">KB</option>
                     <option value="신한">신한</option>
                     <option value="롯데">롯데</option>
                     <option value="BC">BC</option>
                     <option value="시티">시티</option>
                     <option value="NH농협">NH농협</option>
               </select>
               <br><Br>
               <strong>할부 기간:</strong>  &nbsp;&nbsp;&nbsp;
               <select id="ticket_card_month" name="ticket_card_month">
                     <option value="일시불" selected>일시불</option>
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
                        <input  type="text" size="5" value="010"  id="ticket_phone_number1" name="ticket_phone_number1" />-
                       <input  type="text" size="5" value="111" id="ticket_phone_number2" name="ticket_phone_number2" />-
                       <input  type="text" size="5" value="123" id="ticket_phone_number3" name="ticket_phone_number3" />
              </td>
            </tr>
         </tbody>
      </table>
	</div>
	 <input type="submit" value="전송">
</form>
   <div class="clear"></div>
   <br>
  
   <center>
      <br>
      <br> 
      <button style="background-color: #f44336; color:white; font-size:20px; border-radius:10px; border:0; padding: 15px 32px;" >
      <a href="javascript:fn_show_order_detail();">
       결제하기</a></button>
      
       <a href="${contextPath}/main/main.do"> 
         <img width="75" alt="" src="${contextPath}/resources/image/btn_shoping_continue.jpg">
      </a>
    </center>
<div class="clear"></div>      
   <div id="layer" style="visibility:hidden">
      <!-- visibility:hidden 으로 설정하여 해당 div안의 모든것들을 가려둔다. -->
      <div id="popup_order_detail">
         <!-- 팝업창 닫기 버튼 -->
         <a href="javascript:" onClick="javascript:imagePopup('close', '.layer01');">
          <img  src="${contextPath}/resources/image/close.png" id="close" />
         </a> 
         <br/> 
           <div class="detail_table">
           <h1>최종 주문 사항</h1>
         <table>
            <tbody align=left>
                <tr>
                 <td width=200px>
                     주문상품번호:
                </td>
                <td>
                   <p id="p_order_movie_id"> 주문번호 </p>    
                </td>
               </tr>
               <tr>
                 <td width=200px>
                     주문상품명:
                </td>
                <td>
                    <p id="p_order_movie_title"> 영화명 </p>    
                </td>
               </tr>
               <tr>
                 <td width=200px>
                    주문금액합계:
                </td>
                <td >
                     <p id="p_total_order_goods_price">주문금액합계</p>
                </td>
               </tr>
               <tr>
                 <td width=200px>
                    주문자:
                </td>
                <td>
                     <p id="p_orderer_name"> 주문자 이름</p>
                </td>
               </tr>
               <tr>
                 <td width=200px>
                    결제방법:
                </td>
                <td align=left>
                     <p id="p_pay_method">결제방법</p>
                </td>
               </tr>
               <tr>
                <td colspan=2 align=center>
                <input  name="btn_process_pay_order" type="button" onClick="fn_process_pay_order()" value="최종결제하기">
                </td>
               </tr>
            </tbody>
            </table>
          </div>
         </div>
        </div>
         <div class="clear"></div>   
         <br> 
 </body>
              