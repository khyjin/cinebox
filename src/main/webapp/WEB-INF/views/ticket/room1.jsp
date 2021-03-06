<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js" type="text/javascript"></script>
<style type="text/css">
#pay_table {
   width: 490px; font-size: 0.75em; padding-top: 20px; margin: 10px 0px 0px; padding-left:190px;

}
#pay_table table td.fixed_join{
   width: 110px; font-weight: bold; color: #ffffff; background:#193a3e; text-align: center; 
}

#pay_table table tr.dot_line {
   border-bottom-color: rgb(102, 102, 102); border-bottom-width: 1px; border-bottom-style: dotted; font-size:small;
}

#pay_table td {
   padding: 20px; 
}
#seat_table {
   width: 615px; font-size: 0.75em; padding-top: 40px; margin: 10px 0px 0px; padding-left:190px;
}
#seat_table table {
   text-align: center; width: 100%; border-right-color: #193a3e; border-top-color: #193a3e; border-bottom-color: #193a3e; border-top-width: 1px; border-bottom-width: 1px; border-top-style: solid; border-bottom-style: solid; border-collapse: collapse; margin-bottom:50px; font-family:"맑은 고딕"; margin-left:auto; margin-right:auto;
}
#seat_table .reserve_table {   
   text-align: center; width: 250; height : 200;float : right;
   font-family:"맑은 고딕";
   border-bottom-color: #193a3e; border-top-width: 1px; 
   border-bottom-width: 1px; border-top-style: solid; 
   border-bottom-style: solid; border-collapse: collapse; 

}
.dot_line select {
    width: 120px;
    height: 25px;
    padding-left: 5px;
    font-size: 15px;
    color:#193a3e;
    border: 1px solid #193a3e;
    border-radius: 3px;
  }
#seat_table td {
   padding: 20px; 
}

#seat_table table td.fixed_join{
   width: 110px; font-weight: bold; color: #ffffff; background:#193a3e; text-align: center; font-size:15px;
}

#seat_table table tr.dot_line {
   border-bottom-color: rgb(102, 102, 102); border-bottom-width: 1px; border-bottom-style: dotted; font-size:small;
}


#screen{
	text-align:center;
	font-size:xx-large;
}

body {
    font-family: "맑은 고딕";
}

.seat {
    width: 31px;
    height: 31px;
    margin-right: 1px;
    margin-top: 1px;
}

button {
    width: 40px;
    height: 40px;
    margin-right:-2px;
    font-family: "맑은 고딕";
}

.seat:hover {
	background-color: #193a3e;
	color:#ffffff;
}
        
.clicked {
    background-color: #193a3e;
    color: white;
}
.seat-wrapper {
	text-align:center; 
    font-size:small;
}
.pay {
	height: 50px; font-size: 1rem; font-weight: bold; background-color: #d5e5e8; border: 1px solid #d5e5e8; color: #193a3e; width: 530px; margin-bottom:30px; margin-left:30px;
}
.seatt{
    width: 30px;
    height: 30px;
    margin-right: 2px;
    margin-top: 2px;
    background-color: gray;
    text-align: center;
}
#rated_alarm{
	z-index: 3;
	position: fixed;
	top: 200;
	width: 800px;
	height: 250px;
	background-color:white;
	border: 2px solid ;
	font-size: medium;
	padding: 10px;
	left: 300;
}

</style>
<script type="text/javascript">
function checkForm(){
	var num1 = $("#select1").val();
	var num2 = $("#select2").val();
	const value = Number(num1)+Number(num2);
	var seat = selectedSeats;

	if(seat.length==0||seat==null||seat.length<value||seat.length!=value){
		alert("좌석을 선택해주세요");
		return;
	} else{
		orderForm.submit();
	}
}

function countClick(calc, age){
	var num1 = $('#select1').val();
	var num2 = $('#select2').val();
	
	if(Number(num1)+Number(num2)==8&&calc=='plus'){
		alert("예매는 최대8매까지 가능합니다.");
		return;
	}
	
	if(calc=='plus'&&age=='adult'){
		num1++;
		$('#select1').val(num1);
	} else if(calc=='minus'&&age=='adult'&&num1>0){
		num1--;
		$('#select1').val(num1);
	} else if(calc=='plus'&&age=='child'){
		num2++;
		$('#select2').val(num2);
	} else if(calc=='minus'&&age=='child'&&num2>0){
		num2--;
		$('#select2').val(num2);
	}
	
	const adultpay = Number(num1)*12000;
	const childpay = Number(num2)*10000;
	const totalpay = adultpay+childpay;
	const value = Number(num1)+Number(num2);
	
	document.getElementById('result').innerText = value+"명";
	document.getElementById('total_pay').innerText = totalpay+"원";
	var tp = totalpay;
    $('#total_payA').val(tp);
	
}
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${empty memberInfo.member_id}">
	<script type="text/javascript">
		alert('로그인 후 예매 가능합니다')
		location.href = "${contextPath}/member/loginForm.do";
	</script>
</c:if>
<h1>상영관 1관</h1>
<br><br>
<div id="seat_table">
<form action="${contextPath}/order/orderMovie.do" method="get" name="orderForm">
<table>
<tr class="dot_line">
	<td  class="fixed_join">인원 체크</td>
	<td>
		일반<br><a href="javascript:countClick('minus','adult')" style="color: black; font-size: 25">-</a>
		<input size="3" type="text" id="select1" name="ticket_adult" value="0" style="text-align: center;" readonly="readonly">
		<a href="javascript:countClick('plus','adult')" style="color: black; font-size: 20">+</a>
	</td>
	<td id="test01">
		청소년<br><a href="javascript:countClick('minus','child')" style="color: black; font-size: 25">-</a>
		<input size="3" type="text" id="select2" name="ticket_child" value="0" style="text-align: center;" readonly="readonly">
		<a href="javascript:countClick('plus','child')" style="color: black; font-size: 20">+</a> 
	</td>
</tr>
<tr class="dot_line">
	<td  class="fixed_join">총 인원 수</td>
	<td colspan='2' style="font-size:15px; font-weight: bold;"><div id="result" style="display:inline;"></div></td>
</tr>
</table>
<br><br>
<div id="screen">SCREEN</div>
<br><br>
<div class="seat-wrapper"></div>
<br><br><br><br>
<script type="text/javascript">
function imagepopUp(){
	$('#rated_r').attr('style', 'visibility:hidden');
}
</script>
<c:if test="${movie_age_grade=='19세이상관람가'}">
<div id="rated_r" style="visibility: visible;">		
	<div id="rated_alarm" >
		<h1 style="text-align: center;">관람등급 안내</h1>
		<div style="width: 25%; margin-top: 30; float: left; margin-left: 30">
			<img src="${contextPath}/resources/image/19img.png" width="130" height="130">
		</div>

		<div style="width: 75%; float:left; margin-left: -30">
			<br>
			본 영화는 청소년 관람불가 영화입니다.<br>
			관람시 신분증을 꼭 지참해주세요<br>
			 ※신분증 : 주민등록증/ 운전면허증/ 여권<br>
			 		(신분증 사진 및 PASS 모바일 인증 불가)<br>
			만 18세 미만(영, 유야 포함)은 보호자가 있어도 관람하실 수 없으며,<br>
			만 18세 이상이더라도 「초중등교육법」에 따라 재학중인 학생은 입장이 제한됩니다.<br><br>
			<a href="javascript:imagepopUp()"><img style="margin-left: 100" src="${contextPath}/resources/image/agprbtn.png" width="120" height="40" ></a>
		</div>
	</div>
</div>
</c:if>

<script>
    let test = [];
    let selectedSeats = new Array();
    let selectedSeatsMap = [];
    const seatWrapper = document.querySelector(".seat-wrapper");
    let clicked = "";
    let div = "";
    
    var seatList = new Array();
    <c:forEach items="${seatt}" var="seatt">
    seatList.push("${seatt.seat_number}");
    </c:forEach>    

    for (let seat_number1 = 1; seat_number1 <= 10; seat_number1++) {
        div = document.createElement("div");
        seatWrapper.append(div);
        for (let seat_number2 = 1; seat_number2 <= 19; seat_number2++) {
            const input = document.createElement('input');
            input.type = "button";
            input.name = "seats"
            input.classList = "seat";
            //3중포문을 사용하지 않기위해 
            mapping(input, seat_number1, seat_number2);

			if(seatList.length>0){
				for(var i=0;i<seatList.length;i++){
	            	if(input.value!=(seatList[i])){
	            		div.append(input);
	            	}else{
	            		input.type="text";
	            		input.disabled=true;
	            		input.classList = "seatt"
	            		div.append(input);
	            	}
	            }
			} else{
				div.append(input);
			}   
            
            input.addEventListener('click', function(e) {
                console.log(e.target.value);
                //중복방지 함수
                selectedSeats = selectedSeats.filter((element, index) => selectedSeats.indexOf(element) != index);

                var ss = selectedSeats;
                //click class가 존재할때(제거해주는 toggle)
                if (input.classList.contains("clicked")) {
                	input.classList.remove("clicked");
                    clicked = document.querySelectorAll(".clicked");
                    selectedSeats.splice(selectedSeats.indexOf(e.target.value), 1);
                    clicked.forEach((data) => {
                        selectedSeats.push(data.value);
                    });
                    document.getElementById('seat').innerText = selectedSeats+'\u00A0';
                    
                    //click class가 존재하지 않을때 (추가해주는 toggle)
                } else {
                	input.classList.add("clicked");
                    clicked = document.querySelectorAll(".clicked");
                    clicked.forEach((data) => {
                        selectedSeats.push(data.value);
                    })
                    document.getElementById('seat').innerText = selectedSeats+'\u00A0'; // 클릭된 좌석값 쌓이게 하기
                }
                	
                    $('#seatA').val(ss);
                   
//                console.log(selectedSeats);
//                console.log(selectedSeats.length); // 클릭될 때의 추가되는 좌석 배열의 길이
                
                var num1 = $("#select1").val();
            	var num2 = $("#select2").val();
            	const value = Number(num1)+Number(num2);
            	var count = 0;
            	
            	if(selectedSeats.length==1&&value==0) {
                	alert("인원 체크 후 좌석 선택 가능합니다.");
                	input.classList.remove("clicked");
                	selectedSeats.pop(); // 좌석 이름 안 뜨게 하기
                    document.getElementById('seat').innerText = selectedSeats+'\u00A0';
                    $('#seatA').val(ss);
                    return;
            	}
            	else if(selectedSeats.length>value) {
                    alert("이미 좌석을 모두 선택하셨습니다.");
                    selectedSeats.pop(); // 좌석 이름 안 뜨게 하기
                    document.getElementById('seat').innerText = selectedSeats+'\u00A0';
                    input.classList.remove("clicked");
                    $('#seatA').val(ss);
                    return;
                }
            	
            })
        	
            $(document).ready(function() {
                $( 'h3' ).click( function() {
                	input.classList.remove("clicked");
                	selectedSeats.splice(0, selectedSeats.length);
                	console.log(selectedSeats);
                     $( '#seat' ).empty();
                   });
            });
        
        }
    }
  
    //좌석 폼  
    function mapping(input, seat_number1, seat_number2) {
        if (seat_number1 === 1) {
        	input.value = "A" + seat_number2;
        } else if (seat_number1 === 2) {
        	input.value = "B" + seat_number2;
        } else if (seat_number1 === 3) {
        	input.value = "C" + seat_number2;
        } else if (seat_number1 === 4) {
        	input.value = "D" + seat_number2;
        } else if (seat_number1 === 5) {
        	input.value = "E" + seat_number2;
        } else if (seat_number1 === 6) {
        	input.value = "F" + seat_number2;
        } else if (seat_number1 === 7) {
        	input.value = "G" + seat_number2;
        } else if (seat_number1 === 8) {
        	input.value = "H" + seat_number2;
        } else if (seat_number1 === 9) {
        	input.value = "I" + seat_number2;
        } else if (seat_number1 === 10) {
        	input.value = "J" + seat_number2;
        } else if (seat_number1 === 11) {
        	input.value = "K" + seat_number2;
        } else if (seat_number1 === 12) {
        	input.value = "L" + seat_number2;
        }
    }
</script>

<div>
<img src = "${contextPath}/resources/image/grayseat.PNG" style="width:20px; height:20px;"> 예매불가
</div>
<br/>

<table>
<tr class="dot_line">
   <td  class="fixed_join">영화 제목</td>
   <td style="font-size:15px; font-weight: bold;">${list.movie_title}
   <input type="hidden" value="${list.movie_title}" name="movie_title">
   <input type="hidden" value="${list.movie_id}" name="movie_id">
   </td>
</tr>
<tr class="dot_line">
   <td  class="fixed_join">상영관</td>
   <td style="font-size:15px; font-weight: bold;">${list.room_number}관
   <input type="hidden" value="${list.room_number}" name="room_number">
   </td>
</tr>
<tr class="dot_line">
   <td  class="fixed_join">상영일자</td>
    <td style="font-size:15px; font-weight: bold;"> ${list.schedule_date}
    <input type="hidden" value="${list.schedule_date}" name="ticket_movie_day">
    </td>
</tr>
<tr class="dot_line">
   <td  class="fixed_join">상영시간</td>
   <td style="font-size:15px; font-weight: bold;">${list.schedule_start_time} ~ ${list.schedule_end_time}
   <input type="hidden" value="${list.schedule_start_time}" name="ticket_start_time">
   <input type="hidden" value="${list.schedule_end_time}" name="ticket_end_time">
   </td>
</tr>
<tr class="dot_line">
	<td  class="fixed_join">총 결제 금액</td>
	<td colspan='2' style="font-size:15px; font-weight: bold;"><div id="total_pay" style="display:inline;"></div>
	<input type="hidden" id="total_payA" name="ticket_total_price">
	</td>	
</tr>
<tr class="dot_line">
	<td  class="fixed_join">선택 좌석</td>
	<td colspan='2' style="font-size:15px; font-weight: bold;"><div id="seat" style="display:inline;"></div>
	<input type="hidden" id="seatA" name="seat_number">
	<h3 style="float:right; color:black;">X</h3></td>
</tr>
</table>
<div id="ticket_btn"><input type="button" class="pay" name="ticket_save" value="결제하기" onclick="checkForm()"></div>
</form>
</div>
</body>
<br><br><br>
</html>