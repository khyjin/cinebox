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
   <li id="sidemenu">
		<H3>주요기능</H3>
		<ul id="sidemenu">
			<li><a href="${contextPath}/admin/goods/adminGoodsMain.do">영화</a></li>
			<li><a href="${contextPath}/admin/order/adminOrderMain.do">예매</a></li>
			<li><a href="${contextPath}/admin/member/adminMemberMain.do">회원관리</a></li>
			<li><a href="#">배송관리</a></li>
			<li><a href="#">게시판관리</a></li>
		</ul>
	</li>
</c:when>
<c:when test="${side_menu=='my_page' }">
	<li id="sidemenu">
		<h3><a href="#" class="ticket">나의 예매 내역</a></h3>
	</li>
	<li id="sidemenu">
		<h3>회원 정보</h3>
		<ul>
			<li><a href="${contextPath}/mypage/myDetailInfo.do">나의 정보 수정</a></li>
			<li><a href="#">잔여 포인트 확인</a></li>
			<li><a href="#">나의 후기평</a></li>
			<li><a href="#">회원 탈퇴</a></li>
		</ul>
	</li>
	<li id="sidemenu">
		<h3>나의 문의 내역</h3>
		<ul>
			<li><a href="${contextPath}/mypage/myDetailInfo.do">1:1 문의</a></li>
		</ul>
	</li>
</c:when>
</c:choose>
</ul>
</nav>
</html>