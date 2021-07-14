<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	isELIgnored="false" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script>
function search_member(search_period){	
	temp=calcPeriod(search_period);
	var date=temp.split(",");
	beginDate=date[0];
	endDate=date[1];
	//alert("beginDate:"+beginDate+",endDate:"+endDate);
	//return ;
	
	var formObj=document.createElement("form");
    
	var formObj=document.createElement("form");
	var i_beginDate = document.createElement("input"); 
	var i_endDate = document.createElement("input");
    
	i_beginDate.name="beginDate";
	i_beginDate.value=beginDate;
	i_endDate.name="endDate";
	i_endDate.value=endDate;
	
    formObj.appendChild(i_beginDate);
    formObj.appendChild(i_endDate);
    document.body.appendChild(formObj); 
    formObj.method="get";
    formObj.action="/bookshop01/admin/member/adminMemberMain.do";
    formObj.submit();
}


function  calcPeriod(search_period){
	var dt = new Date();
	var beginYear,endYear;
	var beginMonth,endMonth;
	var beginDay,endDay;
	var beginDate,endDate;
	
	endYear = dt.getFullYear();
	endMonth = dt.getMonth()+1;
	endDay = dt.getDate();
	if(search_period=='today'){
		beginYear=endYear;
		beginMonth=endMonth;
		beginDay=endDay;
	}else if(search_period=='one_week'){
		beginYear=dt.getFullYear();
		if(endDay-7<1){
			beginMonth=dt.getMonth();	
		}else{
			beginMonth=dt.getMonth()+1;
		}
		
		dt.setDate(endDay-7);
		beginDay=dt.getDate();
		
	}else if(search_period=='two_week'){
		beginYear = dt.getFullYear();
		if(endDay-14<1){
			beginMonth=dt.getMonth();	
		}else{
			beginMonth=dt.getMonth()+1;
		}
		dt.setDate(endDay-14);
		beginDay=dt.getDate();
	}else if(search_period=='one_month'){
		beginYear = dt.getFullYear();
		dt.setMonth(endMonth-1);
		beginMonth = dt.getMonth();
		beginDay = dt.getDate();
	}else if(search_period=='two_month'){
		beginYear = dt.getFullYear();
		dt.setMonth(endMonth-2);
		beginMonth = dt.getMonth();
		beginDay = dt.getDate();
	}else if(search_period=='three_month'){
		beginYear = dt.getFullYear();
		dt.setMonth(endMonth-3);
		beginMonth = dt.getMonth();
		beginDay = dt.getDate();
	}else if(search_period=='four_month'){
		beginYear = dt.getFullYear();
		dt.setMonth(endMonth-4);
		beginMonth = dt.getMonth();
		beginDay = dt.getDate();
	}
	
	if(beginMonth <10){
		beginMonth='0'+beginMonth;
		if(beginDay<10){
			beginDay='0'+beginDay;
		}
	}
	if(endMonth <10){
		endMonth='0'+endMonth;
		if(endDay<10){
			endDay='0'+endDay;
		}
	}
	endDate=endYear+'-'+endMonth +'-'+endDay;
	beginDate=beginYear+'-'+beginMonth +'-'+beginDay;
	//alert(beginDate+","+endDate);
	return beginDate+","+endDate;
}



function fn_member_detail(order_id){
	//alert(order_id);
	var frm_delivery_list=document.frm_delivery_list;
	

	var formObj=document.createElement("form");
	var i_order_id = document.createElement("input");
	
	i_order_id.name="order_id";
	i_order_id.value=order_id;
	
    formObj.appendChild(i_order_id);
    document.body.appendChild(formObj); 
    formObj.method="post";
    formObj.action="/bookshop01/admin/member/memberDetail.do";
    formObj.submit();
	
}


function fn_enable_detail_search(r_search){
	var frm_delivery_list=document.frm_delivery_list;
	t_beginYear=frm_delivery_list.beginYear;
	t_beginMonth=frm_delivery_list.beginMonth;
	t_beginDay=frm_delivery_list.beginDay;
	t_endYear=frm_delivery_list.endYear;
	t_endMonth=frm_delivery_list.endMonth;
	t_endDay=frm_delivery_list.endDay;
	s_search_type=frm_delivery_list.s_search_type;
	t_search_word=frm_delivery_list.t_search_word;
	btn_search=frm_delivery_list.btn_search;
	
	if(r_search.value=='detail_search'){
		//alert(r_search.value);
		t_beginYear.disabled=false;
		t_beginMonth.disabled=false;
		t_beginDay.disabled=false;
		t_endYear.disabled=false;
		t_endMonth.disabled=false;
		t_endDay.disabled=false;
		
		s_search_type.disabled=false;
		t_search_word.disabled=false;
		btn_search.disabled=false;
	}else{
		t_beginYear.disabled=true;
		t_beginMonth.disabled=true;
		t_beginDay.disabled=true;
		t_endYear.disabled=true;
		t_endMonth.disabled=true;
		t_endDay.disabled=true;
		
		s_search_type.disabled=true;
		t_search_word.disabled=true;
		btn_search.disabled=true;
	}
		
}

//상세조회 버튼 클릭 시 수행
function fn_detail_search(){
	var frm_delivery_list=document.frm_delivery_list;
	
	beginYear=frm_delivery_list.beginYear.value;
	beginMonth=frm_delivery_list.beginMonth.value;
	beginDay=frm_delivery_list.beginDay.value;
	endYear=frm_delivery_list.endYear.value;
	endMonth=frm_delivery_list.endMonth.value;
	endDay=frm_delivery_list.endDay.value;
	search_type=frm_delivery_list.s_search_type.value;
	search_word=frm_delivery_list.t_search_word.value;

	var formObj=document.createElement("form");
	var i_command = document.createElement("input");
	var i_beginDate = document.createElement("input"); 
	var i_endDate = document.createElement("input");
	var i_search_type = document.createElement("input");
	var i_search_word = document.createElement("input");
    
	
    i_command.name="command";
    i_beginDate.name="beginDate";
    i_endDate.name="endDate";
    i_search_type.name="search_type";
    i_search_word.name="search_word";
    
    i_command.value="list_detail_order_goods";
	i_beginDate.value=beginYear+"-"+beginMonth+"-"+beginDay;
    i_endDate.value=endYear+"-"+endMonth+"-"+endDay;
    i_search_type.value=search_type;
    i_search_word.value=search_word;
	
    formObj.appendChild(i_command);
    formObj.appendChild(i_beginDate);
    formObj.appendChild(i_endDate);
    formObj.appendChild(i_search_type);
    formObj.appendChild(i_search_word);
    document.body.appendChild(formObj); 
    formObj.method="post";
    formObj.action="/bookshop01/admin/member/memberDetail.do";
    formObj.submit();
	
}

function delete_check() {
	   return confirm("회원이 영구적으로 삭제됩니다. \n정말 삭제하시겠습니까?");
	   
	}
</script>
<style>
section.admin_mypage_main {
   width:800;
   height:800;
   float:right;
   margin-top : -190;
   }
body {
   background: #fff;
}
.list_view {
   border-collapse: collapse;
   width: 100%;
   font-size: small;
}

.list_view th {
   padding: 10px;
   color: #168;
   border-bottom: 3px solid #168;
   text-align: center;
}

.list_view td {
   color: #669;
   padding: 10px;
   border-bottom: 1px solid #ddd;
}

.list_view tr:hover td {
   color: #004;
}
#button0{ background-color:#193a3e;}
</style>
</head>
<body>
<section class="admin_mypage_main">

	<H1>회원 조회</H1>
	
		<form  method="get" action="${contextPath}/admin/member/searchMember.do">	
<div style="float: right; width: 40%">
	<form  method="post">	
		<TABLE cellpadding="10" cellspacing="10">
			<TBODY>
				<tr>
				  <td>
					
				  </td>
				</tr>
			</TBODY>
		</TABLE>
	</form>
</div>
	
	<form name="frm_delivery_list" >	
		<table cellpadding="10" cellspacing="10"  >
			<tbody>
				<tr>
				  <td>
				    <select name="s_search_type" >
						<option value="all" checked>전체</option>
						<option value="member_name">회원이름</option>
						<option value="member_id">회원아이디</option>
						<option value="member_hp_num">회원휴대폰번호</option>
						<option value="member_addr">회원주소</option>
					</select>
					<input name="keyword" id="keywordInput" type="text"  size="30"/>  
					<input type="submit"  value="영화찾기"/>
				  </td>
				</tr>				
			</tbody>
		</table>
		<div class="clear">
	</div>
	
<div class="clear"></div>
<table class="list_view">
		<tbody align=center >
			<tr>
				<th class="fixed" >ID</th>
				<th class="fixed">이름</th>
				<th>휴대폰번호</th>
				<th>주소</th>
				<th>가입일</th>
				<th>탈퇴여부</th>
				<th>비고</th>
			</tr>
   <c:choose>
     <c:when test="${empty member_list}">			
			<tr>
		       <td colspan=5 class="fixed">
				  <strong>조회된 회원이 없습니다.</strong>
			   </td>
		     </tr>
	 </c:when>
	 <c:otherwise>
	     <c:forEach var="item" items="${member_list}" varStatus="item_num">
	            <tr>       
					<td width=5%>
					  <a href="${pageContext.request.contextPath}/admin/member/memberDetail.do?member_id=${item.member_id}">
					     <strong>${item.member_id}</strong>
					  </a>
					</td>
					<td width=5%>
					  <strong>${item.member_name}</strong><br>
					</td>
					<td width=15% >
					  <strong>${item.member_hp1}-${item.member_hp2}-${item.member_hp3}</strong><br>
					</td>
					<td width=40%>
					  <strong>${item.member_roadaddress}</strong><br>
					  <strong>${item.member_jibunaddress}</strong><br>
					  <strong>${item.member_namujiaddress}</strong><br>
					</td>
					<td width=15%>
					   <c:set var="join_date" value="${item.member_joindate}" />
					   <c:set var="arr" value="${fn:split(join_date,' ')}" />
					   <strong><c:out value="${arr[0]}" /></strong>
				    </td>
				    <td width=10%>
				       <c:choose>
				         <c:when test="${item.member_del_yn=='N' }">
				           <strong>활동중</strong>  
				         </c:when>
				         <c:otherwise>
				           <strong>탈퇴</strong>
				         </c:otherwise>
				       </c:choose>
				    </td>
				    
				    <td width=10%>
				    <button id="button0"><a href="${pageContext.request.contextPath}/admin/member/memberDetail.do?member_id=${item.member_id}">수정</a></button>
				    <button id="button0"><a href="${pageContext.request.contextPath}/admin/member/realdelmember.do?member_id=${item.member_id}" onclick="return delete_check()">삭제</a></button>
				    </td>
				</tr>
		</c:forEach>
	</c:otherwise>
  </c:choose>	
         <tr>
             <td colspan=8 class="fixed">
                 <c:forEach   var="page" begin="1" end="10" step="1" >
		         <c:if test="${section >1 && page==1 }">
		          <a href="${pageContext.request.contextPath}/admin/member/adminMemberMain.do?section=${section-1}&pageNum=${(section-1)*10 +1 }">&nbsp;pre &nbsp;</a>
		         </c:if>
		          <a href="${pageContext.request.contextPath}/admin/member/adminMemberMain.do?section=${section}&pageNum=${page}">${(section-1)*10 +page } </a>
		         <c:if test="${page ==10 }">
		          <a href="${pageContext.request.contextPath}/admin/member/adminMemberMain.do?section=${section+1}&pageNum=${section*10+1}">&nbsp; next</a>
		         </c:if> 
		         
	      		</c:forEach> 
           </td>
        </tr>  		   
		</tbody>
	</table>
  </form>   	
	<div class="clear"></div>
<c:choose>
 <c:when test="${not empty order_goods_list }">	
   <DIV id="page_wrap">
		 <c:forEach   var="page" begin="1" end="10" step="1" >
		         <c:if test="${section >1 && page==1 }">
		          <a href="${pageContext.request.contextPath}/admin/member/adminMemberMain.do?section=${section-1}&pageNum=${(section-1)*10 +1 }">&nbsp;pre &nbsp;</a>
		         </c:if>
		          <a href="${pageContext.request.contextPath}/admin/member/adminMemberMain.do?section=${section}&pageNum=${page}">${(section-1)*10 +page } </a>
		         <c:if test="${page ==10 }">
		          <a href="${pageContext.request.contextPath}/admin/member/adminMemberMain.do?section=${section+1}&pageNum=${section*10+1}">&nbsp; next</a>
		         </c:if> 
	      </c:forEach> 
	</DIV>	
 </c:when>
</c:choose>
</section>
</body>
</html>

