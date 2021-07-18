<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"	isELIgnored="false" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<style type="text/css">
/*datepicer 버튼 롤오버 시 손가락 모양 표시*/
.ui-datepicker-trigger{cursor: pointer;}
/*datepicer input 롤오버 시 손가락 모양 표시*/
.hasDatepicker{cursor: pointer;}

section.admin_mypage_main {
   width:800;
   height:800;
   float:right;
   margin-top : -190;
   }
.tab_content, h1{
	background: #fff;
}
#button0{ 
background-color: #168;
color: white;
border-radius: 50;
border-style: none;
width: 40;
height: 22;
}
table {
   border-collapse: collapse;
   width: 100%;
   font-size: small;
   background: #fff;
}

table th {
   padding: 10px;
   color: #168;
   border-bottom: 3px solid #168;
   text-align: left;
}

table td {
   color: #669;
   padding: 10px;
   border-bottom: 1px solid #ddd;
}

table tr:hover td {
   color: #004;
}

.cal_top{
    text-align: center;
    font-size: 30px;
}
.cal{
    text-align: center;    
}
table.calendar{
    border: 1px solid black;
    display: inline-table;
    text-align: left;
}
table.calendar td{
    vertical-align: top;
    border: 1px solid skyblue;
    width: 100px;
}
body {
   background: #fff;
}
#right-align{
	float: right;
}
</style>

<script type="text/javascript">

function addRow(){
	
	var table = document.getElementsByTagName('table')[0],
	  rows = table.getElementsByTagName('tr'),
	  text = 'textContent' in document ? 'textContent' : 'innerText';
	
	for (var i = 0, len = rows.length; i < len; i++) {
	  rows[i].children[0][text] = i;
	
	}
	
	var objRow; 
	objRow= document.all("scheduledata").insertRow();
	
	var cell_no = objRow.insertCell();
	cell_no.innerHTML = i;
	
	var cell_date = objRow.insertCell();
	cell_date.innerHTML = '<input type="date" name="schedule_date">';
 	
	var cell_title = objRow.insertCell();
	cell_title.innerHTML =  '<select name="room_number" >'
							+'<option value="none">==선택==</option>'
							+'<option value="1">1관</option>'
							+'<option value="2">2관</option>'
							+'<option value="3">3관</option>'
							+'</select>';
												

	var cell_number = objRow.insertCell();
	cell_number.innerHTML = '<c:if test="${!empty goodslist}" >'
							+'<select name="movie_title" style="width:80px;" class="select_02">'
							+'<option value="none">==선택==</option>'
							+'<c:forEach  var="goodslist" items="${goodslist}">'
							+'<option value="${goodslist.movie_title}">${goodslist.movie_title}</option>'
							+'</c:forEach>'
							+'</select>'
							+'</c:if>';
							
	var cell_start = objRow.insertCell();
	cell_start.innerHTML = '<select name="schedule_start_time" >'
							+'<option value="none">==선택==</option>'
							+'<option value="11:00">11:00</option>'
							+'<option value="14:00">14:00</option>'
							+'<option value="17:00">17:00</option>'
							+'</select>';
							
}
	
function deleteRow(rownum) {
	  // table element 찾기
	  const table = document.getElementById('scheduleTable');
		  // 행(Row) 삭제
	  const newRow = table.deleteRow(rownum);
	  
}
	
function delete_check(deleteSchedule) {
	if(confirm("정말 삭제하시겠습니까?") == true){
		location.href="${contextPath}/schedule/deleteSchedule.do?schedule_id="+deleteSchedule.value;
	}else{
		return;
	}
}	
<!-- 달력 --> 
    var today = null;
    var year = null;
    var month = null;
    var firstDay = null;
    var lastDay = null;
    var $tdDay = null;
    var $tdSche = null;
 
    $(document).ready(function() {
        drawCalendar();
        initDate();
        drawDays();
        $("#movePrevMonth").on("click", function(){movePrevMonth();});
        $("#moveNextMonth").on("click", function(){moveNextMonth();});
    });
    
    //calendar 그리기
    function drawCalendar(){
        var setTableHTML = "";
        setTableHTML+='<table class="calendar">';
        setTableHTML+='<tr><th>SUN</th><th>MON</th><th>TUE</th><th>WED</th><th>THU</th><th>FRI</th><th>SAT</th></tr>';
        for(var i=0;i<6;i++){
            setTableHTML+='<tr height="100">';
            for(var j=0;j<7;j++){
                setTableHTML+='<td style="text-overflow:ellipsis;overflow:hidden;white-space:nowrap">';
                setTableHTML+='    <div class="cal-day"></div>';
                setTableHTML+='    <div class="cal-schedule"></div>';
                setTableHTML+='</td>';
            }
            setTableHTML+='</tr>';
        }
        setTableHTML+='</table>';
        $("#cal_tab").html(setTableHTML);
    }
 
    //날짜 초기화
    function initDate(){
        $tdDay = $("td div.cal-day")
        $tdSche = $("td div.cal-schedule")
        dayCount = 0;
        today = new Date();
        year = today.getFullYear();
        month = today.getMonth()+1;
        firstDay = new Date(year,month-1,1);
        lastDay = new Date(year,month,0);
    }
    
    //calendar 날짜표시
    function drawDays(){
        $("#cal_top_year").text(year);
        $("#cal_top_month").text(month);
        for(var i=firstDay.getDay();i<firstDay.getDay()+lastDay.getDate();i++){
            $tdDay.eq(i).text(++dayCount);
        }
        for(var i=0;i<42;i+=7){
            $tdDay.eq(i).css("color","red");
        }
        for(var i=6;i<42;i+=7){
            $tdDay.eq(i).css("color","blue");
        }
    }
 
    //calendar 월 이동
    function movePrevMonth(){
        month--;
        if(month<=0){
            month=12;
            year--;
        }
        if(month<10){
            month=String("0"+month);
        }
        getNewInfo();
        }
    
    function moveNextMonth(){
        month++;
        if(month>12){
            month=1;
            year++;
        }
        if(month<10){
            month=String("0"+month);
        }
        getNewInfo();
    }

    
    function getNewInfo(){
        for(var i=0;i<42;i++){
            $tdDay.eq(i).text("");
        }
        dayCount=0;
        firstDay = new Date(year,month-1,1);
        lastDay = new Date(year,month,0);
        drawDays();
    }
</script>

</head>
<body> 
<section class="admin_mypage_main">
<h1>영화 상영 스케줄 관리</h1>

<div id="container">
	<ul class="tabs">
	
		<li><a href="#tab1">일정 관리</a></li>
		<li><a href="#tab2">상영 일정</a></li>
	</ul>

	<div class="tab_content" id="tab1">		
<!-- 출력 -->	
<form>
	<table>
		<thead>
		<tr>
			<th>ID</th>
			<th>상영날짜</th>
			<th>상영관</th>
			<th>영화명</th>
			<th>시작시간</th>
			<th>종료시간</th>
			<th><button id="button0"><a href ="${contextPath}/schedule/modifyScheduleForm.do">수정</a></button></th>
		</tr>
		</thead>	
	<tbody>
		<c:forEach var="list" items="${list}" varStatus="status">
		<tr>
			<td>${list.schedule_id}</td>
			<td>${list.schedule_date}</td>
			<td>${list.room_number}</td>
			<td>${list.movie_title}</td>
			<td>${list.schedule_start_time}</td>
			<td>${list.schedule_end_time}</td>
			<td>
				 <input type="hidden" value="${list.schedule_id}" name="deleteSchedule${status.index}">
				 <input type="button" id="button0" onclick="delete_check(deleteSchedule${status.index})" value="삭제">
			</td>	
		</tr>
		</c:forEach>
	</tbody>
</table>	
</form>	

<br/>
<!-- 입력 -->	
<h1>상영시간표 추가</h1>
<form action="${contextPath}/schedule/addSchedule.do" method="post">
			<table id = "scheduleTable">
				<thead>
				<tr>
					<th>NO.</th>
					<th>상영날짜</th>
					<th>상영관</th>
					<th>영화명</th>
					<th>시작시간</th>
				</tr>
				</thead>
			 <tbody id="scheduledata"/> 
			</table>	

		<div class="clear"></div>
		<br>
		<div id="right-align">
		<input type="button" id="button0" id="addBtn" value="행추가" onclick="addRow()" style="width:80px">
		<input type="button" id="button0"value="맨 끝행삭제" onclick="deleteRow('-1')" style="width:80px">
		<input type="button" id="button0"value="앞 행삭제" onclick="deleteRow('1')" style="width:80px">
		<input type="submit"id="button0" value="입력하기" style="width:80px">
		</div>
		</form>
	</div>
<!-- 일정 -->	
	<div class="tab_content" id="tab2">
		<div class="cal_top">
        <a href="#" id="movePrevMonth"><span id="prevMonth" class="cal_tit">&lt;</span></a>
        <span id="cal_top_year"></span>
        <span id="cal_top_month"></span>
        <a href="#" id="moveNextMonth"><span id="nextMonth" class="cal_tit">&gt;</span></a>
    	</div>
    <div id="cal_tab" class="cal">
    </div>
	</div>
	</div>
</section>
</body>
</html>