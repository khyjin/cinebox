<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    isELIgnored="false"
    %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<nav>
<ul>
<c:choose>
<c:when test="${side_menu=='admin_mode' }">
   <li class="sidemenu">
     <H3>주요기능</H3>
		<ul id="sidemenu">

			<li><a href="${contextPath}/admin/goods/searchMovie.do">영화조회</a></li>
			<li><a href="${contextPath}/admin/order/adminOrderMain.do">예매관리</a></li>
			<li><a href="${contextPath}/admin/member/searchMember.do">회원관리</a></li>
			<li><a href="${contextPath}/schedule/addNewScheduleForm.do">영화스케줄</a></li>
		</ul>
	</li>
</c:when>



<c:when test="${side_menu=='my_page' }">
	<li class=sidemenu>
		<a href="${contextPath}/mypage/myPageMain.do"><h3>나의 예매 내역</h3></a>		
	</li>
	<li id="sidemenu">
		<h3>회원 정보</h3>
		<ul>
			<li><a href="${contextPath}/mypage/myDetailInfo.do">나의 정보 수정</a></li>
			<li><a href="${contextPath}/mypage/myPoint.do">잔여 포인트 확인</a></li>	
			<li><a href="${contextPath}/mypage/myReviewList.do">나의 관람평</a></li>
		</ul>
	</li>	
	<li class="sidemenu">
		<h3>나의 문의 내역</h3>
		<ul>
			<li><a href="${contextPath}/mypage/myQnaList.do">1:1 문의</a></li>
		</ul>
	</li>
</c:when>

<c:when test="${side_menu=='cscenter'}">
<c:choose>
	<c:when test="${isLogOn==true and memberInfo.member_id =='admin' }">
	<li>
	<H3>고객센터</H3>
		<ul>
			<li><a href="${contextPath}/cscenter/cscenterMain.do">고객센터 메인</a></li>
			<li><a href="${contextPath}/cscenter/cscenterNotice.do">공지사항/알림</a></li>
			<li><a href="${contextPath}/cscenter/faqBoard.do">자주하는 질문</a></li>
			<li><a href="${contextPath}/admin/cscenter/qnaBoard.do">1:1 문의확인</a></li>
			<br>
			<li>
				<img width="150" height="90" src="${contextPath}/resources/image/call_center_logo.jpg">
			</li>
		</ul>
	</li>	
	</c:when>
	<c:otherwise>
	<li>
	<H3>고객센터</H3>
		<ul>
			<li><a href="${contextPath}/cscenter/cscenterMain.do">고객센터 메인</a></li>
			<li><a href="${contextPath}/cscenter/cscenterNotice.do">공지사항</a></li>
			<li><a href="${contextPath}/cscenter/faqBoard.do">자주하는 질문</a></li>
			<li><a href="javascript:fn_send_qna()">1:1 문의하기</a></li>
			<br>
			<li>
				<img width="150" height="90" src="${contextPath}/resources/image/call_center_logo.jpg">
			</li>
		</ul>
	</li>	
	</c:otherwise>
	</c:choose>
</c:when>

</c:choose>
</ul>
</nav>

<!-- 고객센터 적용 -->
<script type="text/javascript">

function fn_send_qna() {
	var _isLogOn = document.getElementById("isLogOn");
	var isLogOn = _isLogOn.value;
	
	if(isLogOn =="false"||isLogOn ==''){
		alert("1:1문의는 로그인 후 가능합니다.");
		location.href='${contextPath}/member/loginForm.do';
	}
	else {
		location.href='${contextPath}/cscenter/qnaForm.do'
	}	
}

function fn_send_rental(){
	var _isLogOn = document.getElementById("isLogOn");
	var isLogOn = _isLogOn.value();
	
	if(isLogOn=="false"||isLogOn==''){
		alert("로그인 후 대관 문의가 가능합니다.");
		location.href='${contextPath}/member/loginForm.do'
	}
	else {
		location.href='${contextPath}/cscenter/rentalForm.do';
	}
}
</script>
<input type="hidden" name="isLogOn" id="isLogOn" value="${isLogOn}"/>
</html>