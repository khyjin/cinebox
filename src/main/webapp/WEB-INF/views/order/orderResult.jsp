<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	isELIgnored="false"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
</head>
<BODY>

	<H1>1.최종 예매 내역</H1>
	<table class="list_view">
      <tbody align=center>
     	 <tr>
    	 <td class="goods_image">
			 <strong>결제가 완료되었습니다.</strong><br>
             <img width="75" alt=""  src="${contextPath}/thumbnails.do?movie_id=${list.movie_id}&fileName=${item.movie_fileName}">
             <input type="hidden" id="movie_id" name="movie_id" value="${list.movie_id}" />
              <input type="hidden" id="member_id" name="member_id" value="${list.member_id}" />
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
	
	<br>
	<H1>2.결제정보</H1>
	<DIV class="detail_table">
		<table>
			<TBODY>
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
</form>
    <DIV class="clear"></DIV>
	<br>
	<br>
	<br>
	<center>
		<br>
		<br> 
		<a href="${contextPath}/main/main.do"> 
		  홈으로
		</a>
<DIV class="clear"></DIV>		
	
			
			
			