<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"	isELIgnored="false" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>영화 예매</title>
 <style>

h1{
	padding: 15px;
   color: #168;
   text-align: center;
}
table {
   width: 100%;
   font-size: large;
   font-family: "맑은 고딕";
}
table th {
   padding: 15px;
   color: #168;
   text-align: left;
}
table td {
   padding: 15px;
   text-align: center;
}
#checkA{
	color: black;
}

#choiceA:hover{
  	border-color:#193a3e;
  	border-style: solid;
  	border-width: 6px;
	
}
#button0 {
	background-color: #193a3e;
	color: white;
	border: none;
	padding: 6px 6px;
	width: 150px;
	height: 40px;
}
#reserTable{

	height: 250px;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	function movieCheck(movie_id, movie_title){		
		$("#date").empty();
		$("#time").empty();
		$("#checkedDate").empty();
		$("#checkedTime").empty();
		$("#submit_btn").empty();
	$.ajax({
		type : "post",
		async : false,
		url : "${contextPath}/ticket/makeTicket.do",
		data : {
			movie_id:movie_id,
			movie_title:movie_title
		},
		success : function(data) {
				$("#checkedTitle").html(movie_title);
				var send_title = "<input type='hidden' name='movie_title' value='"+movie_title+"'>";
				var send_id = "<input type='hidden' name='movie_id' value='"+movie_id+"'>";
				$("#checkedTitle").append(send_title);				
				$("#checkedTitle").append(send_id);
				
				for(var i=0;i<data.data.length;i++){

//		        	var tag ="<tr>"+"<td>"+"<input type='radio' id='checkDate' name='s_date' value='"+data.data[i].schedule_date+"'/>"+data.data[i].schedule_date+"</td>"+"</tr>";
		        	var tag ="<tr>"+"<td id='choiceA'>"+"<a href=javascript:checkDate('"+data.data[i].schedule_date+"','"+data.data[i].movie_id+"') id='checkA'>"+data.data[i].schedule_date+"</a>"+"</td>"+"</tr>";	
		        	$("#date").append(tag);

		        }	
		}, error : function(data) {
			alert("에러가 발생했습니다."+data);
		}
	}); //end ajax		
	}
	
	function checkDate(schedule_date, movie_id){
		$("#time").empty();
		$("#checkedTime").empty();
		$("#submit_btn").empty();
		
		$.ajax({
			type : "post",
			async : false,
			url : "${contextPath}/ticket/makeTicketDate.do",
			data : {
				movie_id:movie_id,
				schedule_date:schedule_date
			},
			success : function(data) {
					$("#checkedDate").html(schedule_date);
					var send_date = "<input type='hidden' name='schedule_date' value='"+schedule_date+"'>";
					$("#checkedDate").append(send_date);

					for(var i=0;i<data.time.length;i++){
			        	var tag ="<tr>"+"<td id='choiceA'>"+"<a id='checkA' href=javascript:checkTime('"+data.time[i].schedule_start_time+"','"+data.time[i].room_number+"')>"+data.time[i].room_number+"관 "+data.time[i].schedule_start_time+"</a>"+"</td>"+"</tr>";	
			        	$("#time").append(tag);
			        }	
			}, error : function(data) {
				alert("에러가 발생했습니다."+data);
			}
		}); //end ajax		
	}
	
	function checkTime(schedule_start_time, room_number){
		
		$("#submit_btn").empty();
		var send_time = "<input type='hidden' name='schedule_start_time' value='"+schedule_start_time+"'>";
		var send_room = "<input type='hidden' name='room_number' value='"+room_number+"'>";
		var bnt_submit = "<input id='button0' type='submit' value='좌석선택'>";
		
		$("#checkedDate").append(send_time);
		$("#checkedDate").append(send_room);
		$("#checkedTime").empty();
		$("#checkedTime").html(room_number+"관 "+schedule_start_time);
		$("#submit_btn").append(bnt_submit);
		
	}
	

</script>
</head>
<body>
<h1>상영시간표</h1>

<br/>
<div style="overflow:auto; width:30%; float: left;">	
<h1>영화</h1>
<table>
	<tbody>
		<c:forEach var="list" items="${list}">
		<tr>
		 <td id="choiceA"><a id="checkA" href="javascript:movieCheck('${list.movie_id}','${list.movie_title}')">${list.movie_title}</a></td>
		</tr>
		</c:forEach>
	</tbody>
</table>
</div>

<div style="width: 20%; float: left; overflow:auto;">
<h1>날짜</h1>
<table>
	<tbody id="date">
	</tbody>
</table>	
</div>
<div style="width: 25%; float: left;">
<h1>시간</h1>
<table>
	<tbody id="time">	
	</tbody>
</table>	
</div>

<div style="width: 25%; float: left; background-color: silver;">
<form action="${contextPath}/ticket/seat.do" method="get">
<h1>예매내용</h1>
<table id="reserTable">
	<tbody>
		<tr><td id="checkedTitle"></td></tr>
		<tr><td id="checkedDate"></td></tr>
		<tr><td id="checkedTime"></td></tr>
		<tr><td id="submit_btn"></td></tr>
	</tbody>
</table>
</form>
</div>

</body>
</html>