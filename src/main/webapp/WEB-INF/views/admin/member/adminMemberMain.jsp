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
    formObj.action="${contextPath}/admin/member/adminMemberMain.do";
    formObj.submit();
}

function delete_check(deleteId) {
	if(confirm("회원이 영구적으로 삭제됩니다. \n정말 삭제하시겠습니까?") == true){
		location.href="${pageContext.request.contextPath}/admin/member/realdelmember.do?member_id="+deleteId.value;
	}else{
		return;
	}
}
</script>
<style>
.sidemenu{
   padding: 10px 5px; 
   font-size: 13; 
   font-family:"맑은 고딕";
   float: left; 
}
</style>
</head>
<body class="admin_bg">
<section class="admin_mypage_main">
	<br>
<div style="float: left; width: 60%;">
	<h1>회원 조회</h1>
	<form  method="get" action="${contextPath}/admin/member/searchMember.do">	
		<TABLE cellpadding="10" cellspacing="10">
			<TBODY>
				<tr>
				  <td style="text-align: left;">
				  	<select name="searchType">
				  		<option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>아이디</option>
				  		<option value="d"<c:out value="${scri.searchType eq 'd' ? 'selected' : ''}"/>>이름</option>
				  		<option value="a"<c:out value="${scri.searchType eq 'a' ? 'selected' : ''}"/>>휴대폰</option>
				  	</select>
					<input name="keyword" id="keywordInput" type="text"  size="30"/>  
					<input type="submit"  value="회원찾기"/>
				  </td>
				</tr>
			</TBODY>
		</TABLE>
	</form>
</div>
	
<br>
<TABLE class="movielist">
		<TBODY align=center >
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
	 <form>
	     <c:forEach var="item" items="${member_list}" varStatus="status">
	            <tr>       
					<td width=5%>
					  <!-- <a href="${pageContext.request.contextPath}/admin/member/memberDetail.do?member_id=${item.member_id}"> -->
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
					<input type="hidden" value="${item.member_id}" name="deleteId${status.index}">
					<input type="button" id="button0" onclick="delete_check(deleteId${status.index})" value="삭제">				
					</td>
				</tr>
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