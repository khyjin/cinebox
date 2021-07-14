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
	
#button0{ 
background-color: #168;
color: white;
border-radius: 50;
border-style: none;
width: 40;
height: 22;
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
.admin_bg{
	background-color: white;
}

body {
   background: #fff;
}

.movielist {
   border-collapse: collapse;
   width: 100%;
   font-size: small;
}

.movielist th {
   padding: 10px;
   color: #168;
   border-bottom: 3px solid #168;
   text-align: center;
}

.movielist td {
   color: #669;
   padding: 10px;
   border-bottom: 1px solid #ddd;
}

.movielist tr:hover td {
   color: #004;
}
.modia{
   color: #669;
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

function delete_check(deleteId) {
	if(confirm("삭제하시겠습니까?") == true){
		location.href="${contextPath}/admin/goods/deleteNewGoods.do?movie_id="+deleteId.value;
	}else{
		return;
	}
}



</script>
</head>


<body class="admin_bg">
<section class="admin_mypage_main">
	<br>
<div style="float: left; width: 60%;">
	<h1>영화 조회</h1>
	<form  method="get" action="${contextPath}/admin/goods/searchMovie.do">	
		<TABLE cellpadding="10" cellspacing="10">
			<TBODY>
				<tr>
				  <td style="text-align: left;">
				  	<select name="searchType">
				  		<option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>영화</option>
				  		<option value="d"<c:out value="${scri.searchType eq 'd' ? 'selected' : ''}"/>>감독</option>
				  		<option value="a"<c:out value="${scri.searchType eq 'a' ? 'selected' : ''}"/>>배우</option>
				  	</select>
					<input name="keyword" id="keywordInput" type="text"  size="30"/>  
					<input type="submit"  value="영화찾기"/>
				  </td>
				</tr>
			</TBODY>
		</TABLE>
	</form>
</div>
	

<DIV id="search" style="float: right; width: 30%; margin: 10; text-align: right;">
	<p>
	<form action="${contextPath}/admin/goods/addNewGoodsForm.do">
		<input type="submit" value="상품 등록하기">
	</form>
</DIV>
<br>
<TABLE class="movielist">
		<TBODY align=center >
			<tr>
				<th>영화번호</th>
				<th>영화</th>
				<th>장르</th>
				<th>개봉일</th>
				<th>종료일</th>
				<th>개봉상태</th>
				<th>삭제</th>
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
<form>
     <c:forEach var="item" items="${newGoodsList}" varStatus="status">
			 <TR>       
				<TD>
				  <strong>${item.movie_id}</strong>
				</TD>
				<TD >
				    <strong><a class="modia" href="${contextPath}/admin/goods/modifyGoodsForm.do?movie_id=${item.movie_id}">${item.movie_title}</a></strong>
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