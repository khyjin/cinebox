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
	
	var x = document.getElementById("usedPoint").value; //??? ?????????
	document.getElementById("result").innerText = x;
	
	var ticket = document.getElementById("origin"); //?????? ??? ??????				
	const point = document.getElementById("point"); //?????? ?????????	
	var finalPayment=ticket; //??????????????????
	
	if(Number(point.innerText) >= Number(x)){	
		
		finalPayment=ticket.innerText-x; 	
	    $('#ticket_total_price').val(finalPayment);
	    document.getElementById("result2").innerText =document.getElementById("ticket_total_price").value;   
	
	}else{
    	alert("?????? ????????? ?????? ?????????????????????.");
    	document.getElementById("result").innerText =0;
    	document.getElementById("result2").innerText =ticket.innerText;//??????????????? ?????????
    	$('#usedPoint').val(0);
    }
	
	
}

$(document).ready(function(){ //????????? ?????? ?????? ?????????
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

window.history.forward(); //???????????? ??????
function noBack() {
	window.history.forward();
}

 function check() { //?????? ??? ??????????????? ????????? ????????????
	 
	if($('input[name=ticket_pay_method]:checked').val()== "????????????"){			
	   if($("#ticket_card_company").val() == "N") {
	       alert('??????????????? ??????????????????.');
	       return false;
	   }			
	   if($("#ticket_card_month").val() == "N") {
	       alert('??????????????? ??????????????????.');
	       return false;
	   }
	   
	}else if($('input[name=ticket_pay_method]:checked').val()=="???????????????"){
   		if($("#ticket_phone_number1").val() == "" || $("#ticket_phone_number2").val() == "" || $("#ticket_phone_number3").val() == "") {
 	       alert('?????? ?????????????????? ??????????????????.');
 	       return false;	
 	       
 	}else{
  	 return confirm('?????? ????????????');
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
     <th>??? ????????????</th>
     </tr>
     <tr>
        <td>
            <font size="5"><span id="origin">${list.ticket_total_price}</span>???</font>
            <input type="hidden" id="ticket_total_price" name="ticket_total_price" value="${list.ticket_total_price}" />
        </td>
	</tr>
     </table><br>  
     <table class="pay">
    <tr align=center class="fixed"> 
     <th>??? ?????? ??????</th>
     </tr>
     <tr>
       <td>
       <font size="5"><span id="result">0</span>???</font>
       </td>
       </tr>
    </table><br> 
    <table class="pay">
    <tr align=center class="fixed">
        <th>?????? ????????????</th>
        </tr>
        <tr>
        <td>
           <font size="8"><span id="result2">${list.ticket_total_price}</span>???</font>
       	</td>
     	</tr>
   	</table>
   </div>
<div style='float:right'>
   <H1>1.?????? ????????????</H1>
   
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
            ?????? ?????? : ${list.movie_title} 
          </td>
         </tr>
         <tr>
         <td>
         	????????? : ${list.room_number}???
            <input type="hidden" id="room_number" name="room_number" value="${list.room_number}" />
          </td>
          </tr>
         <tr>
         <td> 
         	???????????? : ${list.ticket_movie_day}
            <input type="hidden" id="ticket_movie_day" name="ticket_movie_day" value="${list.ticket_movie_day}" />   
         </td>
          </tr>
          <tr>
          <td>
           	???????????? : ${list.ticket_start_time}
            <input type="hidden" id="ticket_start_time" name="ticket_start_time" value="${list.ticket_start_time}" />
            <input type="hidden" id="ticket_end_time" name="ticket_end_time" value="${list.ticket_end_time}" />
          </td>
          </tr>
          <tr>
          <td>
          	???????????? : ?????? ${list.ticket_adult}???
            <input   type="hidden" id="ticket_adult" name="ticket_adult" value="${list.ticket_adult}" />
         	 / ????????? ${list.ticket_child}???
          <input type="hidden" id="ticket_child" name="ticket_child" value="${list.ticket_child}" />
          </td>
          </tr>
          <tr>
          <td>
          	???????????? : ${list.seat_number}
            <input type="hidden" id="seat_number" name="seat_number" value="${list.seat_number}" />
          </td>
          </tr>
      </tbody>
   </table>
   <div class="clear"></div>

   <br>
   <br> 
   <H1>2.????????? ??????</H1>
   <br>
      <table>
         <tbody>
            <tr class="dot_line">
                              
               <td cellpadding="5">
               ????????? ????????? : <input name="ticket_used_point" value="0" type="text" size="10" id="usedPoint" onchange="myFunction()"/>&nbsp;&nbsp;
              &nbsp; 
               <input type="checkbox" id="checkBoxId"/> ????????????
               </td>
                </tr>
               <tr cellpadding="5"></tr>
             <tr >
               <td style="padding-top:8px"><fmt:formatNumber value="${list.ticket_total_price*0.05}" var="earnPoint" pattern="#"/> 
               ( ??????????????? : <span id="point">${point}</span>??? / ???????????? ????????? : ${earnPoint}???
               <input type="hidden" name="plus_point" value="${earnPoint}" />)         
               </td>
            </tr>
         </tbody>
      </table>
   
   <div class="clear"></div>
   <br>
   <br>
   <h1>3.????????????</h1>
    <br>
      <table>
         <tbody>
            <tr>
               <td>
                  <input type="radio" id="ticket_pay_method" name="ticket_pay_method" value="????????????"   onClick="fn_pay_card()" checked>?????? ?????? &nbsp;&nbsp;&nbsp; 
                  <input type="radio" id="ticket_pay_method" name="ticket_pay_method" value="?????????????????????" onClick="fn_pay()">????????? ???????????? &nbsp;&nbsp;&nbsp;
                  <input type="radio" id="ticket_pay_method" name="ticket_pay_method" value="???????????????" onClick="fn_pay_phone()">????????? ?????? &nbsp;&nbsp;&nbsp;
                  <input type="radio" id="ticket_pay_method" name="ticket_pay_method" value="???????????????" onClick="fn_pay()">????????? ?????? &nbsp;&nbsp;&nbsp; 
                  <input type="radio" id="ticket_pay_method" name="ticket_pay_method" value="???????????????" onClick="fn_pay_account()">????????? ?????? &nbsp;&nbsp;&nbsp;
                  
               </td>
            </tr> 
            <tr>
               <td style="padding-top:8px; padding-bottom:15px">      
               </td>
            </tr>
            <tr id="tr_pay_card">
               <td>
                 <strong>?????? ??????</strong>&nbsp;&nbsp;
                 <select id="ticket_card_company" name="ticket_card_company">
                	 <option value="N">==??????==</option>
                     <option value="??????">??????</option>
                     <option value="??????SK">??????SK</option>
                     <option value="??????">??????</option>
                     <option value="KB">KB</option>
                     <option value="??????">??????</option>
                     <option value="??????">??????</option>
                     <option value="BC">BC</option>
                     <option value="??????">??????</option>
                     <option value="NH??????">NH??????</option>
               </select>
               &nbsp;&nbsp; / &nbsp;&nbsp;
               <strong>?????? ??????</strong>&nbsp;&nbsp;
               <select id="ticket_card_month" name="ticket_card_month">
               		 <option value="N">==??????==</option>
                     <option value="?????????">?????????</option>
                     <option value="2??????">2??????</option>
                     <option value="3??????">3??????</option>
                     <option value="4??????">4??????</option>
                     <option value="5??????">5??????</option>
                     <option value="6??????">6??????</option>
               </select>
               </td>
            </tr>
            <tr id="tr_pay_phone" style="visibility:hidden">
              <td>
              <strong>????????? ?????? ??????: </strong>  
                        <input  type="text" size="5" id="ticket_phone_number1" name="ticket_phone_number1" /> -
                       <input  type="text" size="5" id="ticket_phone_number2" name="ticket_phone_number2" /> -
                       <input  type="text" size="5" id="ticket_phone_number3" name="ticket_phone_number3" />
              </td>
            </tr>
            <tr id="tr_pay_account" style="visibility:hidden">
            <td>
              <strong>?????? ??????: ???????????? 63290102 - 123456 </strong>  
              </td>
            </tr>
         </tbody>
      </table>
	</div>

   <div class="clear"></div>
   <br>
 		<input type="button" onclick="javascript:history.back();" id="buttons" style="background-color: #555555; color:white;" value="????????????">
   		<input type="submit" value="????????????" id="buttons" style="background-color: #f44336; color:white;"  >
      </form>
   
      <br>
      <br>
      
<div class="clear"></div>      
  
</body>
              