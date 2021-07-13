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
   width: 110px; font-weight: bold; color: #ffffff; background:#193a3e; text-align: center; 
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
    width: 40px;
    height: 40px;
    margin-right: 4px;
    margin-top: 4px;
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
}
.pay {
	height: 50px; font-size: 1rem; font-weight: bold; background-color: #d5e5e8; border: 1px solid #d5e5e8; color: #193a3e; width: 530px; margin-bottom:30px; margin-left:30px;
}
</style>
<script type="text/javascript">


function selectOnChange(e) {
	
	// 총 예매 인원수 표시
	var num1 = $("#select_box1").val();
	var num2 = $("#select_box2").val();
	const value = Number(num1)+Number(num2);
	
	// 총 결제 금액 표시
	const adultpay = Number(num1)*12000;
	const childpay = Number(num2)*10000;
	const totalpay = adultpay+childpay;
	
	if(value>4) {
		alert("관람 인원 4명 초과 시 예매 불가 입니다.");
		window.location.href = "http://localhost:8282/bookshop01/ticket/seat.do";
	}
	
	if(Number(num1)==0&&Number(num2)==0) {
		alert("관람 인원은 1명 이상부터 예매 가능합니다.")
	}
	
	document.getElementById('result').innerText = value;
	
	document.getElementById('total_pay').innerText = totalpay;
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
<h1>좌석 선택</h1>
<br><br><br><br>
<div id="screen">SCREEN</div>
<br><br>
<div class="seat-wrapper"></div>
<br><br> 
<div id="pay_table">
<table style="float: left;">
<tr class="dot_line" style=" font-size: xx-small; color: red;">
	<th class="fixed_join">일반:</th><td style="font-weight: bold;">12000원</td>
	<th class="fixed_join">청소년:</th><td style="font-weight: bold;">10000원</td>
	<th class="fixed_join">최대 인원 제한 수:</th><td style="font-weight: bold;">4명</td>
</tr>
</table>
</div>
<div id="seat_table">
<script>
    let test = [];
    let selectedSeats = new Array();
    let selectedSeatsMap = [];
    const seatWrapper = document.querySelector(".seat-wrapper");
    let clicked = "";
    let div = "";

    for (let seat_number1 = 1; seat_number1 < 8; seat_number1++) {
        div = document.createElement("div");
        seatWrapper.append(div);
        for (let seat_number2 = 1; seat_number2 < 15; seat_number2++) {
            const input = document.createElement('input');
            input.type = "button";
            input.name = "seats"
            input.classList = "seat";
            //3중포문을 사용하지 않기위해 
            mapping(input, seat_number1, seat_number2);
            div.append(input);
            input.addEventListener('click', function(e) {
                console.log(e.target.value);
                //중복방지 함수
                selectedSeats = selectedSeats.filter((element, index) => selectedSeats.indexOf(element) != index);

                //click class가 존재할때(제거해주는 toggle)
                if (input.classList.contains("clicked")) {
                    input.classList.remove("clicked");
                    clicked = document.querySelectorAll(".clicked");
                    selectedSeats.splice(selectedSeats.indexOf(e.target.value), 1);
                    clicked.forEach((data) => {
                        selectedSeats.push(data.value);
                    });
                    //click class가 존재하지 않을때 (추가해주는 toggle)
                } else {
                    input.classList.add("clicked");
                    clicked = document.querySelectorAll(".clicked");
                    clicked.forEach((data) => {
                        selectedSeats.push(data.value);
                    })
                    document.getElementById('seat').innerText += input.value+'\u00A0'; // 클릭된 좌석값 쌓이게 하기
                    
                }
                console.log(selectedSeats);
                
                if(input.click) {
                	var num1 = $("#select_box1").val();
                	var num2 = $("#select_box2").val();
                	const value = Number(num1)+Number(num2);
                	var count = 0;
                	
                	count++;
                    
                    if(value<count) {
                    	alert("인원 체크 후 좌석 선택 가능합니다.");
                    	location.href = "${contextPath}/ticket/seat.do";
                    	return;
                    }
                 }
            })
        }
    }

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
        }
    }
</script>
<form action="" method="get">
<table>
<tr class="dot_line">
	<td  class="fixed_join">인원 체크</td>
	<td>일반&emsp;<select name="ticket_adult" id="select_box1" onchange="selectOnChange(this)">
    	                       <option value="0">0</option>
        	                   <option value="1">1</option>
            	               <option value="2">2</option>
                	           <option value="3">3</option>
                    	       <option value="4">4</option>
                    	 </select></td>
	<td>청소년&emsp;<select name="ticket_child" id="select_box2" onchange="selectOnChange(this)">
    	                       <option value="0">0</option>
        	                   <option value="1">1</option>
            	               <option value="2">2</option>
                	           <option value="3">3</option>
                    	       <option value="4">4</option>
                     	</select></td>
</tr>
<tr class="dot_line">
	<td  class="fixed_join">총 인원 수</td>
	<td colspan='2' style="font-size:15px; font-weight: bold;"><div id="result" style="display:inline;"></div>명</td>
</tr>
<tr class="dot_line">
	<td  class="fixed_join">총 결제 금액</td>
	<td colspan='2' style="font-size:15px; font-weight: bold;"><div id="total_pay" style="display:inline;"></div>원</td>
</tr>
<tr class="dot_line">
	<td  class="fixed_join">선택 좌석</td>
	<td colspan='2' style="font-size:15px; font-weight: bold;"><div id="seat" style="display:inline;"></div></td>
</tr>
</table>
<table class="reserve_table" border="1">
<tr>
   <td>${movie_title}</td>
</tr>
<tr>
   <td>${room_number}관</td>
</tr>
<tr>
   <td>${ticket_movie_day}</td>
</tr>
<tr>
   <td>${ticket_start_time}~${ticket_end_time}</td>
</tr>
<tr>

   <td>      
         <div id="seat" style="display:inline;"></div>
   </td>
</tr>
</table>
<div id="ticket_btn"><input type="submit" class="pay" name="ticket_save" value="결제하기"></div>
</form>
</div>
</body>
<br><br><br>
</html>