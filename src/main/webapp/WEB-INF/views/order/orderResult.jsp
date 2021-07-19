<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	isELIgnored="false"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<style>
#list td{
	text-align: left; 
	font-size:14px;
	
}

h1{
	text-align:center;
}

#buttons{
	font-size:20px;
	border-radius:10px; 
	border:0;
	padding: 15px 32px;
	background-color: #555555;
	color:white;
}

</style>
</head>
<BODY>
	<H1>결제가 완료되었습니다.</H1>
	<table class="list_view" id="list" >
      <tbody align=center>
     	 <tr><br>
    	 <td rowspan="6" class="goods_image" style="padding-right:50px; padding-left:250px;">
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
	
	<br>
	
	<DIV class="detail_table" style="padding-left:250px; width:45%;">
		<table>
			<TBODY>
				<TR class="dot_line">
					<TD class="fixed_join">결제금액</TD>
					<TD>
					  <fmt:formatNumber var="ticket_total_price" value="${list.ticket_total_price}" pattern="#,##0원"/> ${ticket_total_price}
				    </TD>
				</TR>
				<TR class="dot_line">
					<TD class="fixed_join">사용포인트</TD>
					<TD>
					  <fmt:formatNumber var="ticket_used_point" value="${list.ticket_used_point}" pattern="#,##0원"/> ${ticket_used_point}
				    </TD>
				</TR>
				<TR class="dot_line">
					<TD class="fixed_join">결제방법</TD>
					<TD>
					   ${list.ticket_pay_method}
				    </TD>
				</TR>
				<TR class="dot_line">
					<TD class="fixed_join">결제카드</TD>
					<TD>
					   ${list.ticket_card_company}
				    </TD>
				</TR>
				<TR class="dot_line">
					<TD class="fixed_join">할부기간</TD>
					<TD>
					   ${list.ticket_card_month }
				    </TD>
				</TR>
			</TBODY>
		</table>
	</DIV>

    <DIV class="clear"></DIV>
	<br>
	<br>
	<br>
		<center>
		<br>
		<br> 
		<a href="${contextPath}/main/main.do">
		<button id="buttons">홈으로</button>
		</a>
		<br>
		<br>
<DIV class="clear"></DIV>		
	
			
			
			