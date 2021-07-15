<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"
    isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!-- 주문자 휴대폰 번호 -->
<c:set  var="orderer_hp" value=""/>
<!-- 최종 결제 금액 -->
<c:set var="final_total_order_price" value="0" />

<!-- 총주문 금액 -->
<c:set var="total_order_price" value="0" />
<!-- 총 상품수 -->
<c:set var="total_order_goods_qty" value="0" />
<!-- 총할인금액 -->
<c:set var="total_discount_price" value="0" />
<!-- 총 배송비 -->
<c:set var="total_delivery_price" value="0" />

<head>
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
<!--  function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zipcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('roadAddress').value = fullRoadAddr;
                document.getElementById('jibunAddress').value = data.jibunAddress;

                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

                } else {
                    document.getElementById('guide').innerHTML = '';
                }
            }
        }).open();
    }-->
    
  window.onload=function()
  {
    init();
  }

  function init(){
     var form_order=document.form_order;
     var h_tel1=form_order.h_tel1;
     var h_hp1=form_order.h_hp1;
     var tel1=h_tel1.value;
     var hp1=h_hp1.value;
     var select_tel1=form_order.tel1;
     var select_hp1=form_order.hp1;
     select_tel1.value=tel1;
     select_hp1.value=hp1;
  }    
    
   function reset_all() {
      var e_receiver_name = document.getElementById("receiver_name");
      var e_hp1 = document.getElementById("hp1");
      var e_hp2 = document.getElementById("hp2");
      var e_hp3 = document.getElementById("hp3");

      var e_tel1 = document.getElementById("tel1");
      var e_tel2 = document.getElementById("tel2");
      var e_tel3 = document.getElementById("tel3");

      var e_zipcode = document.getElementById("zipcode");
      var e_roadAddress = document.getElementById("roadAddress");
      var e_jibunAddress = document.getElementById("jibunAddress");
      var e_namujiAddress = document.getElementById("namujiAddress");

      e_receiver_name.value = "";
      e_hp1.value = 0;
      e_hp2.value = "";
      e_hp3.value = "";
      e_tel1.value = "";
      e_tel2.value = "";
      e_tel3.value = "";
      e_zipcode.value = "";
      e_roadAddress.value = "";
      e_jibunAddress.value = "";
      e_namujiAddress.value = "";
   }

   function restore_all() {
      var e_receiver_name = document.getElementById("receiver_name");
      var e_hp1 = document.getElementById("hp1");
      var e_hp2 = document.getElementById("hp2");
      var e_hp3 = document.getElementById("hp3");

      var e_tel1 = document.getElementById("tel1");
      var e_tel2 = document.getElementById("tel2");
      var e_tel3 = document.getElementById("tel3");

      var e_zipcode = document.getElementById("zipcode");
      var e_roadAddress = document.getElementById("roadAddress");
      var e_jibunAddress = document.getElementById("jibunAddress");
      var e_namujiAddress = document.getElementById("namujiAddress");

      var h_receiver_name = document.getElementById("h_receiver_name");
      var h_hp1 = document.getElementById("h_hp1");
      var h_hp2 = document.getElementById("h_hp2");
      var h_hp3 = document.getElementById("h_hp3");

      var h_tel1 = document.getElementById("h_tel1");
      var h_tel2 = document.getElementById("h_tel2");
      var h_tel3 = document.getElementById("h_tel3");

      var h_zipcode = document.getElementById("h_zipcode");
      var h_roadAddress = document.getElementById("h_roadAddress");
      var h_jibunAddress = document.getElementById("h_jibunAddress");
      var h_namujiAddress = document.getElementById("h_namujiAddress");
      //alert(e_receiver_name.value);
      e_receiver_name.value = h_receiver_name.value;
      e_hp1.value = h_hp1.value;
      e_hp2.value = h_hp2.value;
      e_hp3.value = h_hp3.value;

      e_tel1.value = h_tel1.value;
      e_tel2.value = h_tel2.value;
      e_tel3.value = h_tel3.value;
      e_zipcode.value = h_zipcode.value;
      e_roadAddress.value = h_roadAddress.value;
      e_jibunAddress.value = h_jibunAddress.value;
      e_namujiAddress.value = h_namujiAddress.value;

   }
   
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

var goods_id="";
var goods_title="";
var goods_fileName="";

var order_goods_qty
var each_goods_price;
var total_order_goods_price;
var total_order_goods_qty;
var orderer_name
var receiver_name
var hp1;
var hp2;
var hp3;

var tel1;
var tel2;
var tel3;

var receiver_hp_num;
var receiver_tel_num;
var delivery_address;
var delivery_message;
var delivery_method;
var gift_wrapping;
var pay_method;
var card_com_name;
var card_pay_month;
var pay_orderer_hp_num;

function fn_show_order_detail(){ //결제버튼 누를시 처음 실행
   goods_id="";
   goods_title="";
   
   var frm=document.form_order;
   var h_goods_id=frm.h_goods_id;
   var h_goods_title=frm.h_goods_title;
   var h_goods_fileName=frm.h_goods_fileName;
   //var r_delivery_method  =  frm.delivery_method;
   //var h_order_goods_qty=document.getElementById("h_order_goods_qty");
   //var h_total_order_goods_qty=document.getElementById("h_total_order_goods_qty");
   var h_total_sales_price=document.getElementById("h_total_sales_price");
   var h_final_total_Price=document.getElementById("h_final_total_Price");
   //var h_orderer_name=document.getElementById("h_orderer_name");
  // var i_receiver_name=document.getElementById("receiver_name");
   
   
   if(h_goods_id.length <2 ||h_goods_id.length==null){
      goods_id+=h_goods_id.value;
   }else{
      for(var i=0; i<h_goods_id.length;i++){
         goods_id+=h_goods_id[i].value+"<br>";
         
      }   
   }
   
   if(h_goods_title.length <2 ||h_goods_title.length==null){
      goods_title+=h_goods_title.value;
   }else{
      for(var i=0; i<h_goods_title.length;i++){
         goods_title+=h_goods_title[i].value+"<br>";
         
      }   
   }
   
   
   if(h_goods_fileName.length <2 ||h_goods_fileName.length==null){
      goods_fileName+=h_goods_fileName.value;
   }else{
      for(var i=0; i<h_goods_fileName.length;i++){
         goods_fileName+=h_goods_fileName[i].value+"<br>";
         
      }   
   }
   
   
   total_order_goods_price=h_final_total_Price.value;
   total_order_goods_qty=h_total_order_goods_qty.value;
   
   for(var i=0; i<r_delivery_method.length;i++){
     if(r_delivery_method[i].checked==true){
       delivery_method=r_delivery_method[i].value
       break;
     }
   } 
      
   var r_gift_wrapping  =  frm.gift_wrapping;
   
   
   for(var i=0; i<r_gift_wrapping.length;i++){
     if(r_gift_wrapping[i].checked==true){
        gift_wrapping=r_gift_wrapping[i].value
       break;
     }
   } 
   
   var r_pay_method  =  frm.pay_method;
   
   for(var i=0; i<r_pay_method.length;i++){
     if(r_pay_method[i].checked==true){
        pay_method=r_pay_method[i].value
        if(pay_method=="신용카드"){
         var i_card_com_name=document.getElementById("card_com_name");
         var i_card_pay_month=document.getElementById("card_pay_month");
         card_com_name=i_card_com_name.value;
         card_pay_month=i_card_pay_month.value;
         pay_method+="<Br>"+
                   "카드사:"+card_com_name+"<br>"+
                   "할부개월수:"+card_pay_month;
         pay_orderer_hp_num="해당없음";
         
        }else if(pay_method=="휴대폰결제"){
         var i_pay_order_tel1=document.getElementById("pay_order_tel1");
         var i_pay_order_tel2=document.getElementById("pay_order_tel2");
         var i_pay_order_tel3=document.getElementById("pay_order_tel3");
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
   
   var i_hp1=document.getElementById("hp1");
   var i_hp2=document.getElementById("hp2");
   var i_hp3=document.getElementById("hp3");
   
   var i_tel1=document.getElementById("tel1");
   var i_tel2=document.getElementById("tel2");
   var i_tel3=document.getElementById("tel3");
   
   var i_zipcode=document.getElementById("zipcode");
   var i_roadAddress=document.getElementById("roadAddress");
   var i_jibunAddress=document.getElementById("jibunAddress");
   var i_namujiAddress=document.getElementById("namujiAddress");
   var i_delivery_message=document.getElementById("delivery_message");
   var i_pay_method=document.getElementById("pay_method");

//   alert("총주문 금액:"+total_order_goods_price);
   order_goods_qty=h_order_goods_qty.value;
   //order_total_price=h_order_total_price.value;
   
   orderer_name=h_orderer_name.value;
   receiver_name=i_receiver_name.value;
   hp1=i_hp1.value;
   hp2=i_hp2.value;
   hp3=i_hp3.value;
   
   tel1=i_tel1.value;
   tel2=i_tel2.value;
   tel3=i_tel3.value;
   
   receiver_hp_num=hp1+"-"+hp2+"-"+hp3;
   receiver_tel_num=tel1+"-"+tel2+"-"+tel3;
   
   delivery_address="우편번호:"+i_zipcode.value+"<br>"+
                  "도로명 주소:"+i_roadAddress.value+"<br>"+
                  "[지번 주소:"+i_jibunAddress.value+"]<br>"+
                          i_namujiAddress.value;
   
   delivery_message=i_delivery_message.value;
   
   var p_order_goods_id=document.getElementById("p_order_goods_id");
   var p_order_goods_title=document.getElementById("p_order_goods_title");
   var p_order_goods_qty=document.getElementById("p_order_goods_qty");
   var p_total_order_goods_qty=document.getElementById("p_total_order_goods_qty");
   var p_total_order_goods_price=document.getElementById("p_total_order_goods_price");
   var p_orderer_name=document.getElementById("p_orderer_name");
   var p_receiver_name=document.getElementById("p_receiver_name");
   var p_delivery_method=document.getElementById("p_delivery_method");
   var p_receiver_hp_num=document.getElementById("p_receiver_hp_num");
   var p_receiver_tel_num=document.getElementById("p_receiver_tel_num");
   var p_delivery_address=document.getElementById("p_delivery_address");
   var p_delivery_message=document.getElementById("p_delivery_message");
   var p_gift_wrapping=document.getElementById("p_gift_wrapping");   
   var p_pay_method=document.getElementById("p_pay_method");
   
   p_order_goods_id.innerHTML=goods_id;
   p_order_goods_title.innerHTML=goods_title;
   p_total_order_goods_qty.innerHTML=total_order_goods_qty+"개";
   p_total_order_goods_price.innerHTML=total_order_goods_price+"원";
   p_orderer_name.innerHTML=orderer_name;
   p_receiver_name.innerHTML=receiver_name;
   p_delivery_method.innerHTML=delivery_method;
   p_receiver_hp_num.innerHTML=receiver_hp_num;
   p_receiver_tel_num.innerHTML=receiver_tel_num;
   p_delivery_address.innerHTML=delivery_address;
   p_delivery_message.innerHTML=delivery_message;
   p_gift_wrapping.innerHTML=gift_wrapping;
   p_pay_method.innerHTML=pay_method;
   imagePopup('open');
}

function fn_process_pay_order(){
   
   alert("최종 결제하기");
   var formObj=document.createElement("form");
    var i_receiver_name=document.createElement("input");
    
    var i_receiver_hp1=document.createElement("input");
    var i_receiver_hp2=document.createElement("input");
    var i_receiver_hp3=document.createElement("input");
   
    var i_receiver_tel1=document.createElement("input");
    var i_receiver_tel2=document.createElement("input");
    var i_receiver_tel3=document.createElement("input");
    
    var i_delivery_address=document.createElement("input");
    var i_delivery_message=document.createElement("input");
    var i_delivery_method=document.createElement("input");
    var i_gift_wrapping=document.createElement("input");
    var i_pay_method=document.createElement("input");
    var i_card_com_name=document.createElement("input");
    var i_card_pay_month=document.createElement("input");
    var i_pay_orderer_hp_num=document.createElement("input");
   
    i_receiver_name.name="receiver_name";
    i_receiver_hp1.name="receiver_hp1";
    i_receiver_hp2.name="receiver_hp2";
    i_receiver_hp3.name="receiver_hp3";
   
    i_receiver_tel1.name="receiver_tel1";
    i_receiver_tel2.name="receiver_tel2";
    i_receiver_tel3.name="receiver_tel3";
   
    i_delivery_address.name="delivery_address";
    i_delivery_message.name="delivery_message";
    i_delivery_method.name="delivery_method";
    i_gift_wrapping.name="gift_wrapping";
    i_pay_method.name="pay_method";
    i_card_com_name.name="card_com_name";
    i_card_pay_month.name="card_pay_month";
    i_pay_orderer_hp_num.name="pay_orderer_hp_num";
  
    i_receiver_name.value=receiver_name;
    i_receiver_hp1.value=hp1;
    i_receiver_hp2.value=hp2;
    i_receiver_hp3.value=hp3;
    
    i_receiver_tel1.value=tel1;
    i_receiver_tel2.value=tel2;
    i_receiver_tel3.value=tel3;
    ;
    i_delivery_address.value=delivery_address;
    i_delivery_message.value=delivery_message;
    i_delivery_method.value=delivery_method;
    i_gift_wrapping.value=gift_wrapping;
    i_pay_method.value=pay_method;
    i_card_com_name.value=card_com_name;
    i_card_pay_month.value=card_pay_month;
    i_pay_orderer_hp_num.value=pay_orderer_hp_num;
    
    formObj.appendChild(i_receiver_name);
    formObj.appendChild(i_receiver_hp1);
    formObj.appendChild(i_receiver_hp2);
    formObj.appendChild(i_receiver_hp3);
    formObj.appendChild(i_receiver_tel1);
    formObj.appendChild(i_receiver_tel2);
    formObj.appendChild(i_receiver_tel3);

    formObj.appendChild(i_delivery_address);
    formObj.appendChild(i_delivery_message);
    formObj.appendChild(i_delivery_method);
    formObj.appendChild(i_gift_wrapping);
    
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
 <div style='float:left'>
   <br>
   <table class="pay">
    <tr align=center class="fixed">
     <th>총 상품금액</th>
     </tr>
     <tr>
        <td>
            <p id="p_totalPrice">${total_order_price}원</p> 
            <input id="h_totalPrice" type="hidden" value="${total_order_price}" />
        </td>
	</tr>
     </table><br>  
     <table class="pay">
    <tr align=center class="fixed"> 
     <th>총 할인 금액</th>
     </tr>
     <tr>
       <td>
       		<p id="p_totalSalesPrice">${1500 *item.order_goods_qty}원</p> 
            <input id="h_total_sales_price" type="hidden" value="${1500 *item.order_goods_qty}원" />
       </td>
    </table><br> 
    <table class="pay">
    <tr align=center class="fixed">
        <th>최종 결제금액</th>
        </tr>
        <tr>
        <td><p id="p_final_totalPrice">
           <font size="15"> <fmt:formatNumber value="${final_total_order_price+2500}" type="number"/>원</font>
       		</p><input id="h_final_total_Price" type="hidden" value="${final_total_order_price+2500}" />
     	</td>
     	</tr>
   	</table>
   </div>
<div style='float:right'>
   <H1>1.최종 예매내역</H1>
<form  name="form_order">   
   <table class="list_view">
      <tbody align=center>
         <tr>
            <td colspan=2 class="fixed">주문상품명</td>
            <td>수량</td>
            <td>주문금액</td>
            <td>배송비</td>
            <td>예상적립금</td>
            <td>주문금액합계</td>
         </tr>
         <tr>
            <c:forEach var="item" items="${myOrderList }">
               <td class="goods_image">
                 <a href="${contextPath}/goods/goodsDetail.do?goods_id=${item.goods_id }">
                   <img width="75" alt=""  src="${contextPath}/thumbnails.do?goods_id=${item.goods_id}&fileName=${item.goods_fileName}">
                   <input   type="hidden" id="h_goods_id" name="h_goods_id" value="${item.goods_id }" />
                   <input   type="hidden" id="h_goods_fileName" name="h_goods_fileName" value="${item.goods_fileName }" />
                 </a>
               </td>
               <td>
                 <h2>
                    <a href="${pageContext.request.contextPath}/goods/goods.do?command=goods_detail&goods_id=${item.goods_id }">${item.goods_title }</A>
                     <input   type="hidden" id="h_goods_title" name="h_goods_title" value="${item.goods_title }" />
                 </h2>
               </td>
               <td>
                 <h2>${item.order_goods_qty }개<h2>
                   <input   type="hidden" id="h_order_goods_qty" name="h_order_goods_qty" value="${item.order_goods_qty}" />
               </td>
               <td><h2><fmt:formatNumber value="${item.goods_sales_price}" type="number" />원 (10%할인)</h2></td>
               <td><h2><fmt:formatNumber value="2500" type="number" />원</h2></h2></td>
               <td><h2><fmt:formatNumber value="${1500 *item.order_goods_qty}" type="number"/>원</h2></td>
               <td>
               <h2><fmt:formatNumber value="${item.goods_sales_price * item.order_goods_qty+2500}" type="number"/>원</h2>
                 <input  type="hidden" id="h_each_goods_price"  name="h_each_goods_price" value="${item.goods_sales_price * item.order_goods_qty+2500}" />
               </td>
         </tr>
         <c:set var="final_total_order_price"
            value="${final_total_order_price+ item.goods_sales_price* item.order_goods_qty*0.9}" />
         <c:set var="total_order_price"
            value="${total_order_price+ item.goods_sales_price* item.order_goods_qty*0.9}" />
         <c:set var="total_order_goods_qty"
            value="${total_order_goods_qty+item.order_goods_qty }" />
         </c:forEach>
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
               <td>보유포인트 : 원 </td>
               <td cellpadding="5">
                / 사용할 포인트 : <input name="discount_point" type="text"size="10" /> 원 &nbsp;&nbsp;&nbsp; 
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
            <tr >
               <td>
                  <input type="radio" id="pay_method" name="pay_method" value="신용카드"   onClick="fn_pay_card()" checked>신용카드 &nbsp;&nbsp;&nbsp; 
                  <input type="radio" id="pay_method" name="pay_method" value="제휴 신용카드"  >제휴 신용카드 &nbsp;&nbsp;&nbsp; 
                  <input type="radio" id="pay_method" name="pay_method" value="휴대폰결제" onClick="fn_pay_phone()">휴대폰 결제 &nbsp;&nbsp;&nbsp;
                  <input type="radio" id="pay_method" name="pay_method" value="카카오페이(간편결제)">카카오페이(간편결제) &nbsp;&nbsp;&nbsp; 
                  <input type="radio"  id="pay_method" name="pay_method" value="직접입금">직접입금&nbsp;&nbsp;&nbsp;
               </td>
            </tr>
            <tr >
               <td> 
           		 <input type="radio" id="pay_method" name="pay_method" value="무통장 입금">무통장 입금 &nbsp;&nbsp;&nbsp;
                 <input type="radio" id="pay_method" name="pay_method" value="실시간 계좌이체">실시간 계좌이체 &nbsp;&nbsp;&nbsp;
               </td>
            </tr>
            <tr id="tr_pay_card">
               <td>
                 <strong>카드 선택</strong>:&nbsp;&nbsp;&nbsp;
                 <select id="card_com_name" name="card_com_name">
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
               <select id="card_pay_month" name="card_pay_month">
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
                        <input  type="text" size="5" value=""  id="pay_order_tel1" name="pay_order_tel1" />-
                       <input  type="text" size="5" value="" id="pay_order_tel2" name="pay_order_tel2" />-
                       <input  type="text" size="5" value="" id="pay_order_tel3" name="pay_order_tel3" />
              </td>
            </tr>
         </tbody>
      </table>
   
</form>
</div>
   <div class="clear"></div>

   <br>
  
   <center>
      <br>
      <br> 
      <button style="background-color: #f44336; color:white; font-size:20px; border-radius:10px; border:0; padding: 15px 32px;" >
      <a href="javascript:fn_show_order_detail();">
       결제하기</a></button>
      <!--<img width="125" height="90" alt="" src="${contextPath}/resources/image/btn_gulje.jpg">-->
      
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
                   <p id="p_order_goods_id"> 주문번호 </p>    
                </td>
               </tr>
               <tr>
                 <td width=200px>
                     주문상품명:
                </td>
                <td>
                    <p id="p_order_goods_title"> 주문 상품명 </p>    
                </td>
               </tr>
               <tr>
                 <td width=200px>
                     주문상품개수:
                </td>
                <td>
                    <p id="p_total_order_goods_qty"> 주문 상품개수 </p>    
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
                    받는사람:
                </td>
                <td>
                     <p id="p_receiver_name">받는사람이름</p>
                </td>
               </tr>
               <tr>
                 <td width=200px>
                    배송방법:
                </td>
                <td>
                     <p id="p_delivery_method">배송방법</p>
                </td>
               </tr>
               <tr>
                 <td width=200px>
                    받는사람 휴대폰번호:
                </td>
                <td>
                     <p id="p_receiver_hp_num"></p>
                </td>
               </tr>
               <tr>
                 <td width=200px>
                    받는사람 유선번화번호:
                </td>
                <td>
                     <p id="p_receiver_tel_num">배송방법</p>
                </td>
               </tr>
               <tr>
                 <td width=200px>
                    배송주소:
                </td>
                <td align=left>
                     <p id="p_delivery_address">배송주소</p>
                </td>
               </tr>
                <tr>
                 <td width=200px>
                    배송메시지:
                </td>
                <td align=left>
                     <p id="p_delivery_message">배송메시지</p>
                </td>
               </tr>
               <tr>
                 <td width=200px>
                    선물포장 여부:
                </td>
                <td align=left>
                     <p id="p_gift_wrapping">선물포장</p>
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
         </div></div></div>
         <div class="clear"></div>   
         <br> 
         
         
         
         