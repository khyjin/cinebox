<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	isELIgnored="false" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
  <c:set var="titleList" value="${titleList}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<style>
/*datepicer 버튼 롤오버 시 손가락 모양 표시*/
.ui-datepicker-trigger{cursor: pointer;}
/*datepicer input 롤오버 시 손가락 모양 표시*/
.hasDatepicker{cursor: pointer;}
</style>
</head>
<body>
    일자: <input type="text" id="datepicker">
 
    <script>
        $(function() {
            //input을 datepicker로 선언
            $("#datepicker").datepicker({
                dateFormat: 'yy-mm-dd' //Input Display Format 변경
                ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
                ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
                ,changeYear: true //콤보박스에서 년 선택 가능
                ,changeMonth: true //콤보박스에서 월 선택 가능                
                ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
                ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
                ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
                ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
                ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
                ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
                ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
                ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
                ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
                ,minDate: "-1M" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
                ,maxDate: "+1M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                
            });                    
            
            //초기값을 오늘 날짜로 설정
            $('#datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)            
        });
    </script>
   
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
	cell_no.innerHTML = '<input name="movie_id" type="text" size="10" value=""/>';
	
   
 	var cell_date = objRow.insertCell();
	cell_date.innerHTML = '<input name="schedule_date" type="date" value=""/>';
	
	var cell_title = objRow.insertCell();
	cell_title.innerHTML =  '<select name="room_number">'
							+'<option value="none">==선택==</option>'
							+'<option value="1">1</option>'
							+'<option value="2">2</option>'
							+'<option value="3">3</option>'
							+'</select>';
												

	var cell_number = objRow.insertCell();
	cell_number.innerHTML = '<select name="movie_title" id="selectBox" style="width:80px;" class="select_02">'
							+'<c:forEach var="titleList" items="${titleList}" varStatus="i">'
							+'<option value="${titleList.movie_title}">${titleList.movie_title}</option>'
							+'</c:forEach>'
							+'</select>';
						
							
	var cell_start = objRow.insertCell();
	cell_start.innerHTML = '<select name="schedule_start_time">'
							+'<option value="none">==선택==</option>'
							+'<option value="11:00">11:00</option>'
							+'<option value="14:00">14:00</option>'
							+'<option value="17:00">17:00</option>'
							+'</select>';
	

}

function deleteRow(rownum){
	  
	}
</script>

<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<style type="text/css">
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
</style>

<script type="text/javascript">  
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
 <style>
 <!--테이블 스타일-->
 table {
  border-collapse: separate;
  border-spacing: 1px;
  text-align: left;
  line-height: 1.5;
  border-top: 1px solid #ccc;
  margin: 20px 10px;
}
table th {
  width: 150px;
  padding: 10px;
  font-weight: bold;
  vertical-align: top;
  border-bottom: 1px solid #ccc;
  background: #efefef;
}
table td {
  width: 350px;
  padding: 10px;
  vertical-align: top;
  border-bottom: 1px solid #ccc;
}
 </style>
<h1>영화 상영 스케줄</h1>

<div id="container">
	<ul class="tabs">
		<li><a href="#tab1">입력하기</a></li>
		<li><a href="#tab2">상영시간표</a></li>
	</ul>
	<div class="tab_container" id="container">
	<div class="tab_content" id="tab1">
	<div class="writer">상영시간표 생성하기</div>//영화 아이디 hidden, 상영종료시간은 입력할 때 런타임 계산해서 넣기 
		<form action="${contextPath}/schedule/addSchedule.do" method="get">
			<table>
				<thead>
				<tr>
					<th>movie_id</th>
					<th>상영날짜</th>
					<th>상영관</th>
					<th>영화명</th>
					<th>시작시간</th>
				</tr>
				</thead>
			<tbody id="scheduledata"/>

			</table>	

		<div class="clear"></div>
		
		<input type="button" id="addBtn" value="행추가" onclick="addRow()">
		<input type="button" value="맨 끝행삭제" onclick="deleteRow('-1')">
		<input type="button" value="앞 행삭제" onclick="deleteRow('0')">
		<input type="submit" value="등록하기">
		</form>
	</div>
	
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
</div>
</body>
</html>