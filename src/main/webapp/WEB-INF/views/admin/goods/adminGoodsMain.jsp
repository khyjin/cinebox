<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	}
#button0{ background-color:#193a3e;}

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

</style>

<script>
function search_goods_list(fixeSearchPeriod){
	var formObj=document.createElement("form");
	var i_fixedSearch_period = document.createElement("input");
	i_fixedSearch_period.name="fixedSearchPeriod";
	i_fixedSearch_period.value=searchPeriod;
    formObj.appendChild(i_fixedSearch_period);
    document.body.appendChild(formObj); 
    formObj.method="get";
    formObj.action="${contextPath}/admin/goods/adminGoodsMain.do";
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
		beginMonth=dt.getMonth()+1;
		dt.setDate(endDay-7);
		beginDay=dt.getDate();
		
	}else if(search_period=='two_week'){
		beginYear = dt.getFullYear();
		beginMonth = dt.getMonth()+1;
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


function delete_check(deleteId) {
	if(confirm("삭제하시겠습니까?") == true){
		location.href="${contextPath}/admin/goods/deleteNewGoods.do?movie_id="+deleteId.value;
	}else{
		return;
	}
}

</script>
</head>
<body>
<section class="admin_mypage_main">
	<H3>영화 조회</H3>
	<form  method="post">	
		<TABLE cellpadding="10" cellspacing="10"  >
			<TBODY>
				<!-- <TR >
					<TD>
						<input type="radio" name="r_search"  checked/> 등록일로조회 &nbsp;&nbsp;&nbsp;
						<input type="radio" name="r_search" />상세조회 &nbsp;&nbsp;&nbsp;
					</TD>
				</TR> -->
				<TR >
					<TD>
				개봉일  <select name="curYear">
					    <c:forEach   var="i" begin="0" end="5">
					      <c:choose>
					        <c:when test="${endYear==endYear-i}">
					          <option value="${endYear}" selected>${endYear}</option>
					        </c:when>
					        <c:otherwise>
					          <option value="${endYear-i }">${endYear-i }</option>
					        </c:otherwise>
					      </c:choose>
					    </c:forEach>
					</select>년 <select name="curMonth" >
						 <c:forEach   var="i" begin="1" end="12">
					      <c:choose>
					        <c:when test="${endMonth==i }">
					          <option value="${i }"  selected>${i }</option>
					        </c:when>
					        <c:otherwise>
					          <option value="${i }">${i }</option>
					        </c:otherwise>
					      </c:choose>
					    </c:forEach>					
					</select>월
					
					 <select name="curDay">
					  <c:forEach   var="i" begin="1" end="31">
					      <c:choose>
					        <c:when test="${endDay==i}">
					          <option value="${i }"  selected>${i }</option>
					        </c:when>
					        <c:otherwise>
					          <option value="${i }">${i }</option>
					        </c:otherwise>
					      </c:choose>
					    </c:forEach>	
					</select>일  &nbsp;이전&nbsp;&nbsp;&nbsp;&nbsp; 
					<a href="javascript:search_goods_list('today')">
					   <img   src="${contextPath}/resources/image/btn_search_one_day.jpg">
					</a>
					<a href="javascript:search_goods_list('one_week')">
					   <img   src="${contextPath}/resources/image/btn_search_1_week.jpg">
					</a>
					<a href="javascript:search_goods_list('two_week')">
					   <img   src="${contextPath}/resources/image/btn_search_2_week.jpg">
					</a>
					<a href="javascript:search_goods_list('one_month')">
					   <img   src="${pageContext.request.contextPath}/resources/image/btn_search_1_month.jpg">
					</a>
					<a href="javascript:search_goods_list('two_month')">
					   <img   src="${contextPath}/resources/image/btn_search_2_month.jpg">
					</a>
					<a href="javascript:search_goods_list('three_month')">
					   <img   src="${contextPath}/resources/image/btn_search_3_month.jpg">
					</a>
					<a href="javascript:search_goods_list('four_month')">
					   <img   src="${contextPath}/resources/image/btn_search_4_month.jpg">
					</a>
					&nbsp;까지 조회
					</TD>
				</TR>
				<tr>
				  <td>
<!-- 				    <select name="search_condition">
						<option value="" checked>전체</option>
						<option value="제품번호">상품번호</option>
						<option value="제품이름">상품이름</option>
						<option value="제조사">제조사</option>
					</select> -->
					<input  type="text"  size="30"/>  
					<input   type="button"  value="조회"/>
				  </td>
				</tr>
<!-- 			<tr>
				  <td>
					조회한 기간:<input  type="text"  size="4" value="${beginYear}" />년
							<input  type="text"  size="4" value="${beginMonth}"/>월	
							 <input  type="text"  size="4" value="${beginDay}"/>일	
							 &nbsp; ~
							<input  type="text"  size="4" value="${endYear }" />년 
							<input  type="text"  size="4" value="${endMonth }"/>월	
							 <input  type="text"  size="4" value="${endDay }"/>일							 
				  </td>
				</tr> -->
			</TBODY>
		</TABLE>
		<DIV class="clear">
	</DIV>
</form>	
<DIV class="clear"></DIV>
<TABLE class="list_view">
		<TBODY align=center >
			<tr style="background:#33ff00" >
				<td>영화번호</td>
				<td>영화</td>
				<td>감독</td>
				<td>장르</td>
				<td>개봉일</td>
				<td>종료일</td>
				<td>개봉상태</td>
				<td>삭제</td>
				<td>수정</td>
			</tr>
   <c:choose>
     <c:when test="${empty newGoodsList }">			
			<TR>
		       <TD colspan=8 class="fixed">
				  <strong>조회된 상품이 없습니다.</strong>
			   </TD>
		     </TR>
	 </c:when>
	 <c:otherwise>
	 <form method="get">
     <c:forEach var="item" items="${newGoodsList}" varStatus="status">
			 <TR>       
				<TD>
				  <strong>${item.movie_id}</strong>
				</TD>
				<TD >
				    <strong>${item.movie_title } </strong>
				 </a> 
				</TD>
				<TD>
				<strong>${item.movie_director}</strong> 
				</TD>
				<TD>
				   <strong>${item.movie_sort}</strong> 
				</TD>
				<td>
				  <strong>${item.movie_open_date }</strong>
				</td>
				<td>
				 <strong>${item.movie_close_date }</strong> 
				</td>
				<c:choose>
					<c:when test="${item.movie_status=='readysc'}"><td>상영예정</td></c:when>
					<c:when test="${item.movie_status=='screening'}"><td>상영중</td></c:when>
					<c:otherwise><td>상영종료</td></c:otherwise>
				</c:choose>
				<td>
					<input type="hidden" value="${item.movie_id}" name="deleteId${status.index}">
					<input type="button" id="button0" onclick="delete_check(deleteId${status.index})" value="삭제">
				</form>
				</td>
				<td>

					<button id="button0">
						<a href="${contextPath}/admin/goods/modifyGoodsForm.do?movie_id=${item.movie_id}">수정</a>

				    <c:set var="pub_date" value="${item.goods_published_date}" />
					  <c:set var="arr" value="${fn:split(pub_date,' ')}" />
					<strong>
					   <c:out value="${arr[0]}" />
					</strong>
				</td>
				<td>
					<button>
						<a href="${pageContext.request.contextPath}/admin/goods/deleteNewGoods.do?goods_id=${item.goods_id}">삭제</a>
					</button>
				</td>
				<td>
					<button>
						<a href="${pageContext.request.contextPath}/admin/goods/modifyGoodsForm.do?goods_id=${item.goods_id}">수정</a>
					</button>
				</td>
			</TR>
	</c:forEach>
	</c:otherwise>
  </c:choose>
           <tr>
             <td colspan=8 class="fixed">
  <ul>
  <!-- 페이지 블럭 -->
    <c:if test="${pageMaker.prev}">
    	<li class="idxn"><a class="paging" href="${pageMaker.makeQuery(pageMaker.startPage - 1)}"> << 이전 </a></li>
    </c:if> 

    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
    	<c:choose>
    		<c:when test="${pageMaker.cri.page==idx}">
    			<font size=+1>
    			<li class="idxn"><a class="paging1" href="${pageMaker.makeQuery(idx)}">${idx}</a></li></font>
    		</c:when>
    		<c:otherwise>
    			<li class="idxn"><a class="paging2" href="${pageMaker.makeQuery(idx)}">${idx}</a></li>
    		</c:otherwise>
    	</c:choose>
    </c:forEach>
    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
    	<li class="idxn"><a class="paging" href="${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음 >></a></li>
    </c:if> 
  </ul>
     
</TBODY>
</TABLE>
	<DIV class="clear"></DIV>
	<br><br><br>
<H3>상품등록하기</H3>
<DIV id="search">
	<form action="${contextPath}/admin/goods/addNewGoodsForm.do">
		<input type="submit" value="상품 등록하기">
	</form>
</DIV>
</section>
</body>
</html>