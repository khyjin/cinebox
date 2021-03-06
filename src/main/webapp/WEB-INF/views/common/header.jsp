<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    isELIgnored="false"
    %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath"  value="${pageContext.request.contextPath}" />

<script type="text/javascript">
	var loopSearch=true;
	function keywordSearch(){
		if(loopSearch==false)
			return;
	 var value=document.frmSearch.searchWord.value;
		$.ajax({
			type : "get",
			async : true, //false인 경우 동기식으로 처리한다.
			url : "${contextPath}/goods/keywordSearch.do",
			data : {keyword:value},
			success : function(data, textStatus) {
			    var jsonInfo = JSON.parse(data);
				displayResult(jsonInfo);
			},
			error : function(data, textStatus) {
				alert("에러가 발생했습니다."+data);
			},
			complete : function(data, textStatus) {
				//alert("작업을완료 했습니다");
				
			}
		}); //end ajax	
	}
	
	function displayResult(jsonInfo){
		var count = jsonInfo.keyword.length;
		if(count > 0) {
		    var html = '';
		    for(var i in jsonInfo.keyword){
			   html += "<a href=\"javascript:select('"+jsonInfo.keyword[i]+"')\">"+jsonInfo.keyword[i]+"</a><br/>";
		    }
		    var listView = document.getElementById("suggestList");
		    listView.innerHTML = html;
		    show('suggest');
		}else{
		    hide('suggest');
		} 
	}
	
	function select(selectedKeyword) {
		 document.frmSearch.searchWord.value=selectedKeyword;
		 loopSearch = false;
		 hide('suggest');
	}
		
	function show(elementId) {
		 var element = document.getElementById(elementId);
		 if(element) {
		  element.style.display = 'block';
		 }
		}
	
	function hide(elementId){
	   var element = document.getElementById(elementId);
	   if(element){
		  element.style.display = 'none';
	   }
	}

</script>
<body>
<div id="head_link">
		<ul>
		   <c:choose>
		     <c:when test="${isLogOn==true and not empty memberInfo }">
			   <li><a href="${contextPath}/member/logout.do">로그아웃</a></li>
			   <li><a href="${contextPath}/cscenter/cscenterMain.do">고객센터</a></li>
			   <li><a href="${contextPath}/mypage/myPageMain.do">마이페이지</a></li>
			 </c:when>
			 <c:otherwise>
			   <li><a href="${contextPath}/member/loginForm.do">로그인</a></li>
			   <li><a href="${contextPath}/member/memberForm.do">회원가입</a></li>
			   <li><a href="${contextPath}/cscenter/cscenterMain.do">고객센터</a></li>
			 </c:otherwise>
			</c:choose>
      <c:if test="${isLogOn==true and memberInfo.member_id =='admin' }">  
	   	   <li class="no_line"><a href="${contextPath}/admin/goods/searchMovie.do">관리페이지</a></li>
	    </c:if>
			  
		</ul>
	</div>
<nav>
<div id="logo">
	<a href="${contextPath}/goods/movieopen.do">영화</a>&emsp;&emsp;&emsp;&emsp;&emsp;
	<a href="${contextPath}/ticket/reservation.do">예매</a>&emsp;&emsp;&emsp;&emsp;&emsp;
	<a href="${contextPath}/main/main.do"><img width="110" height="135" alt="booktopia" src="${contextPath}/resources/image/cinelogo.jpg"></a>&emsp;&emsp;&emsp;&emsp;&emsp;
	<a href="${contextPath}/map/map.do">영화관</a>&emsp;&emsp;&emsp;&emsp;&emsp;
	<a href="${contextPath}/schedule/selectSchedule.do">상영시간표</a>&emsp;&emsp;&emsp;&emsp;&emsp;
</div>
</nav>
	
	<br>
   <div id="suggest">
        <div id="suggestList"></div>
   </div>
</body>
</html>