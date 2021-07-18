<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<!DOCTYPE html >
<html>
<head>
<meta charset="utf-8">
<style type="text/css">
section.admin_mypage_main {
   width:800;
   height:800;
   float:right;
   margin-top : -190;
   background-color: white;
   }
	
#button0{ 
background-color: #168;
color: white;
border-radius: 50;
border-style: none;
width: 95;
height: 25;
}
.idx{
color: black;
}
.idxn{
	list-style: none; 
	float: left; 
	padding: 10px;
}
.paging{
	color: black;
}
.paging1{
	color: blue;
	text-decoration: underline;
}
.paging2{
	color: black;
}
body {
   background: #fff;
}
.ticketList {
   border-collapse: collapse;
   width: 100%;
   font-size: small;
}
.ticketList th {
   padding: 10px;
   color: #168;
   border-bottom: 3px solid #168;
   text-align: center;
}
.ticketList td {
   color: #669;
   padding: 10px;
   border-bottom: 1px solid #ddd;
}
.ticketList tr:hover td {
   color: #004;
}
.modia{
   color: #669;
}
</style>

<script>
function cancel_check(ticket_number) {
	if(confirm("삭제하시겠습니까?") == true){
		location.href="${contextPath}/admin/order/ticketCancel.do?ticket_number_code="+ticket_number;
	}else{
		return;
	}
}

function fn_modify_order_state(order_id,select_id){
	var s_delivery_state=document.getElementById(select_id);
    var index = s_delivery_state.selectedIndex;
    var value = s_delivery_state[index].value;
    //console.log("value: "+value );
	 
	$.ajax({
		type : "post",
		async : false,
		url : "${contextPath}/admin/order/modifyDeliveryState.do",
		data : {
			order_id:order_id,
			"delivery_state":value
		},
		success : function(data, textStatus) {
			if(data.trim()=='mod_success'){
				alert("주문 정보를 수정했습니다.");
				location.href="${contextPath}/admin/order/adminOrderMain.do";
			}else if(data.trim()=='failed'){
				alert("다시 시도해 주세요.");	
			}
			
		},
		error : function(data, textStatus) {
			alert("에러가 발생했습니다."+data);
		},
		complete : function(data, textStatus) {
			//alert("작업을완료 했습니다");
			
		}
	}); //end ajax	
</script>
</head>


<body class="admin_bg">
<section class="admin_mypage_main">

<div>
	<h1>예매 관리</h1>
	<br>
	<form  method="get" action="${contextPath}/admin/order/adminOrderMain.do">	
		<TABLE cellpadding="10" cellspacing="10">
			<TBODY>
				<tr>
				  <td>
				  	<select name="searchType">
				  		<option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>예매번호</option>
				  		<option value="d"<c:out value="${scri.searchType eq 'd' ? 'selected' : ''}"/>>예매자ID</option>
				  		<option value="a"<c:out value="${scri.searchType eq 'a' ? 'selected' : ''}"/>>영화</option>
				  	</select>
					<input name="keyword" id="keywordInput" type="text"  size="30"/>  
					<input type="submit"  value="예매내역 검색"/>
				  </td>
				</tr>
			</TBODY>
		</TABLE>
	</form>
</div>

<br>
<TABLE class="ticketList">
		<TBODY align=center >
			<tr>
				<th>예매번호</th>
				<th>상영일자</th>
				<th>영화명</th>
				<th>예매일자</th>
				<th>예매자ID</th>
				<th>취소여부</th>				
				<th></th>
			</tr>
   <c:choose>
     <c:when test="${empty ticketList }">			
			<TR>
		       <TD colspan=8 class="fixed">
				  <strong>조회된 예매내역이 없습니다.</strong>
			   </TD>
		     </TR>
	 </c:when>
	 <c:otherwise>
<form>
     <c:forEach var="item" items="${ticketList}">
			 <TR>       
				<TD>
				  <strong>${item.ticket_number}</strong>
				</TD>				
				<TD>
				   <strong>${item.ticket_movie_day}</strong> 
				</TD>
				<TD >
				    <strong>${item.movie_title}</strong>
				</TD>
				<td>
				<strong>${item.ticket_payment_date}</strong>
				</td>
				<td>
				  <strong>${item.member_id}</strong>
				</td>
				<td>
				 <strong>${item.ticket_cancle_yn}</strong> 
				</td>
				<td>
					<input type="button" id="button0" value="상세내역보기" onclick="location.href='${contextPath}/admin/order/orderDetail.do?ticket_number=${item.ticket_number}'">
				</td>
			</TR>
	</c:forEach></form>
	</c:otherwise>
  </c:choose>
           <tr>
             <td colspan=8 class="fixed">
  <ul>
  <!-- 페이지 블럭 -->
    <c:if test="${pageMaker.prev}">
    	<li class="idxn"><a class="paging" href="${pageMaker.makeSearch(pageMaker.startPage - 1)}"> << 이전 </a></li>
    </c:if> 

    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
    	<c:choose>
    		<c:when test="${pageMaker.cri.page==idx}">
    			<font size=+1>
    			<li class="idxn"><a class="paging1" href="${pageMaker.makeSearch(idx)}">${idx}</a></li></font>
    		</c:when>
    		<c:otherwise>
    			<li class="idxn"><a class="paging2" href="${pageMaker.makeSearch(idx)}">${idx}</a></li>
    		</c:otherwise>
    	</c:choose>
    </c:forEach>
    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
    	<li class="idxn"><a class="paging" href="${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음 >></a></li>
    </c:if> 
  </ul>
     
</TBODY>
</TABLE>
	<DIV class="clear"></DIV>
	<br><br><br>
</section>
</body>
</html>