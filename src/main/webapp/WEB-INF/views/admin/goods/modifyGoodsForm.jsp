<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="euc-kr"
	isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:set var="goods"  value="${goodsMap.goods}"  />
<c:set var="imageFileList"  value="${goodsMap.imageFileList}"  />

<head>
<style>
section.admin_mypage_main {
	width: 800;
	height: auto;
	float: right;
	margin-top: -190;
}
</style>
<script type="text/javascript">

function fn_modify_goods(movie_id, attribute){
	var frm_mod_goods=document.frm_mod_goods;
	var value="";
	var sort_value=[];
	
	if(attribute=='title'){
		value=frm_mod_goods.movie_title.value;
	}else if(attribute=='movie_title'){
		value=frm_mod_goods.movie_title.value;
	}else if(attribute=='movie_director'){
		value=frm_mod_goods.movie_director.value;   
	}else if(attribute=='movie_actor'){
		value=frm_mod_goods.movie_actor.value;
	}else if(attribute=='movie_runningtime'){
		value=frm_mod_goods.movie_runningtime.value;
	}else if(attribute=='movie_age_grade'){
		value=frm_mod_goods.movie_age_grade.value;
	}else if(attribute=='movie_country'){
		value=frm_mod_goods.movie_country.value;
	}else if(attribute=='movie_content'){
		value=frm_mod_goods.movie_content.value;
	}else if(attribute=='movie_status'){
		value=frm_mod_goods.movie_status.value;
	}else if(attribute=='movie_open_date'){
		value=frm_mod_goods.movie_open_date.value;
	}else if(attribute=='movie_close_date'){
		value=frm_mod_goods.movie_close_date.value;
	}else if(attribute=='movie_sort'){
		value=frm_mod_goods.movie_sort.value;
	}

	$.ajax({
		type : "post",
		async : false, //false인 경우 동기식으로 처리한다.
		url : "${contextPath}/admin/goods/modifyGoodsInfo.do",
		data : {
			movie_id:movie_id,
			attribute:attribute,
			value:value
		},
		success : function(data, textStatus) {
			if(data.trim()=='mod_success'){
				alert("영화 정보를 수정했습니다.");
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
}

function readURL(input,preview) {
//	alert(preview);
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            $('#'+preview).attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
    }
  }  

  var cnt =1;
  function fn_addFile(){
	  $("#d_file").append("<br>"+"<input  type='file' name='still"+cnt+"' id='still"+cnt+"'  onchange=readURL(this,'previewImage"+cnt+"') />");
	  $("#d_file").append("<img  id='previewImage"+cnt+"'   width=200 height=200  />");
	  $("#d_file").append("<input  type='button' value='추가'  onClick='addNewImageFile('still"+cnt+"','${imageFileList[0].movie_id}','still')'  />");
	  cnt++;
  }

  function modifyImageFile(fileId, movie_id, image_number, image_file_sort){
    // alert(fileId);
	  var form = $('#FILE_FORM')[0];
      var formData = new FormData(form);
      formData.append("image_file_name", $('#'+fileId)[0].files[0]);
      formData.append("movie_id", movie_id);
      formData.append("image_number", image_number);
      formData.append("image_file_sort", image_file_sort);
      
      $.ajax({
        url: '${contextPath}/admin/goods/modifyGoodsImageInfo.do',
        processData: false,
        contentType: false,
        data: formData,
        type: 'POST',
	      success: function(result){
	         alert("이미지를 수정했습니다!");
	       }
 	});
 }
  function addNewImageFile(fileId, movie_id, image_File_sort){
	     alert(fileId);
		  var form = $('#FILE_FORM')[0];
	      var formData = new FormData(form);
	      formData.append("uploadFile", $('#'+fileId)[0].files[0]);
	      formData.append("movie_id", movie_id);
	      formData.append("image_file_sort", image_file_sort);
	      
	      $.ajax({
	          url: '${contextPath}/admin/goods/addNewGoodsImage.do',
	          processData: false,
	          contentType: false,
	          data: formData,
	          type: 'POST',
	          	success: function(result){
	            	alert("이미지를 수정했습니다!");
	              }
	       });
	  }
 
 function deleteImageFile(movie_id,image_number,image_file_name,trId){
	var tr = document.getElementById(trId);

     	$.ajax({
   		type : "post",
   		async : true, //false인 경우 동기식으로 처리한다.
   		url : "${contextPath}/admin/goods/removeGoodsImage.do",
   		data: {	movie_id:movie_id,
    	         image_number:image_number,
    	         image_file_name:image_file_name},
   		success : function(data, textStatus) {
   			alert("이미지를 삭제했습니다!!");
               tr.style.display = 'none';
   		},
   		error : function(data, textStatus) {
   			alert("에러가 발생했습니다."+textStatus);
   		},
   		complete : function(data, textStatus) {
   			//alert("작업을완료 했습니다");
   			
   		}
   	}); //end ajax	
 }
</script>
</head>
<BODY>
<section class="admin_mypage_main">
<form  name="frm_mod_goods"  method=post >
	<div id="container">
	<ul class="tabs">
			<li><A href="#tab1">영화정보</A></li>
			<li><A href="#tab2">영화이미지</A></li>
	</ul>
	</div>
	<div class="tab_container" id="container">
	<div class="tab_content" id="tab1">
		<table>
			<tbody>
				<tr>
					<td>장르</td>
					<td>
					<c:set value="${goods.movie_sort}" var="sort"/>
					<c:choose>
						<c:when test="${fn:contains(sort,'SF')}"><input type="checkbox" value="SF" name="movie_sort" checked="checked">SF</c:when>
						<c:otherwise><input type="checkbox" value="SF" name="movie_sort">SF</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${fn:contains(sort,'공포')}"><input type="checkbox" value="공포" name="movie_sort" checked="checked">공포</c:when>
						<c:otherwise><input type="checkbox" value="공포" name="movie_sort">공포</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${fn:contains(sort,'코미디')}"><input type="checkbox" value="코미디" name="movie_sort" checked="checked">코미디</c:when>
						<c:otherwise><input type="checkbox" value="코미디" name="movie_sort">코미디</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${fn:contains(sort,'로맨스')}"><input type="checkbox" value="로맨스" name="movie_sort" checked="checked">로맨스</c:when>
						<c:otherwise><input type="checkbox" value="로맨스" name="movie_sort">로맨스</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${fn:contains(sort,'판타지')}"><input type="checkbox" value="판타지" name="movie_sort" checked="checked">판타지</c:when>
						<c:otherwise><input type="checkbox" value="판타지" name="movie_sort">판타지</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${fn:contains(sort,'액션')}"><input type="checkbox" value="액션" name="movie_sort" checked="checked">액션</c:when>
						<c:otherwise><input type="checkbox" value="액션" name="movie_sort">액션</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${fn:contains(sort,'미스테리')}"><input type="checkbox" value="미스테리" name="movie_sort" checked="checked">미스테리</c:when>
						<c:otherwise><input type="checkbox" value="미스테리" name="movie_sort">미스테리</c:otherwise>
					</c:choose>
					<p>
					<c:choose>
						<c:when test="${fn:contains(sort,'애니메이션')}"><input type="checkbox" value="애니메이션" name="movie_sort" checked="checked">애니메이션</c:when>
						<c:otherwise><input type="checkbox" value="애니메이션" name="movie_sort">애니메이션</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${fn:contains(sort,'드라마')}"><input type="checkbox" value="드라마" name="movie_sort" checked="checked">드라마</c:when>
						<c:otherwise><input type="checkbox" value="드라마" name="movie_sort">드라마</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${fn:contains(sort,'전쟁')}"><input type="checkbox" value="전쟁" name="movie_sort" checked="checked">전쟁</c:when>
						<c:otherwise><input type="checkbox" value="전쟁" name="movie_sort">전쟁</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${fn:contains(sort,'멜로')}"><input type="checkbox" value="멜로" name="movie_sort" checked="checked">멜로</c:when>
						<c:otherwise><input type="checkbox" value="멜로" name="movie_sort">멜로</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${fn:contains(sort,'스릴러')}"><input type="checkbox" value="스릴러" name="movie_sort" checked="checked">스릴러</c:when>
						<c:otherwise><input type="checkbox" value="스릴러" name="movie_sort">스릴러</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${fn:contains(sort,'범죄')}"><input type="checkbox" value="범죄" name="movie_sort" checked="checked">범죄</c:when>
						<c:otherwise><input type="checkbox" value="범죄" name="movie_sort">범죄</c:otherwise>
					</c:choose>
					</td>
					<td><input type="button" value="수정반영"></td>
				</tr>
				<tr>
					<td>영화이름</td>
					<td><input type="text" value="${goods.movie_title}" name="movie_title" size="40"></td>
					<td><input type="button" value="수정반영" onclick="fn_modify_goods('${goods.movie_id}','movie_title')"></td>
				</tr>
				<tr>
					<td>감독</td>
					<td><input type="text" value="${goods.movie_director}" name="movie_director" size="40"></td>
					<td><input type="button" value="수정반영" onclick="fn_modify_goods('${goods.movie_id}','movie_director')"></td>
				</tr>
				<tr>
					<td>출연배우</td>
					<td><input type="text" value="${goods.movie_actor}" name="movie_actor" size="40"></td>
					<td><input type="button" value="수정반영" onclick="fn_modify_goods('${goods.movie_id}','movie_actor')"></td>
				</tr>
				<tr>
					<td>연령등급</td>
					<td>
						<select name="movie_age_grade">
							<option value="전체관람가">전체관람가</option>
							<option value="12세이상관람가">12세이상관람가</option>
							<option value="15세이상관람가">15세이상관람가</option>
							<option value="19세이상관람가">19세이상관람가</option>
						</select>
						<input type="hidden" name="h_movie_age_grade" value="${goods.movie_age_grade}">
					</td>
					<td><input type="button" value="수정반영" onclick="fn_modify_goods('${goods.movie_id}','movie_age_grade')"></td>
				</tr>
				<tr>
					<td>제작나라</td>
					<td><input type="text" value="${goods.movie_country}" name="movie_country" size="40"></td>
					<td><input type="button" value="수정반영" onclick="fn_modify_goods('${goods.movie_id}','movie_country')"></td>
				</tr>				
				<tr>
					<td>상영시간</td>
					<td><input type="text" value="${goods.movie_runningtime}" name="movie_runningtime" size="40"></td>
					<td><input type="button" value="수정반영" onclick="fn_modify_goods('${goods.movie_id}','movie_runningtime')"></td>
				</tr>
				<tr>
					<td>줄거리</td>
					<td>
					<pre><textarea rows="10" cols="60" name="movie_content">${goods.movie_content}</textarea></pre>
					</td>
					<td><input type="button" value="수정반영" onclick="fn_modify_goods('${goods.movie_id}','movie_content')"></td>
				</tr>
				<tr>
					<td>상영상태</td>
					<td>
					<c:choose>
						<c:when test="${goods.movie_status=='readysc'}">
						<input type="radio" name="movie_status" value="readysc" checked="checked">상영예정
						<input type="radio" name="movie_status" value="screening">상영중
						<input type="radio" name="movie_status" value="endsc">상영종료
						<input type="radio" name="movie_status" value="undecided">미정
						</c:when>
						<c:when test="${goods.movie_status=='screening'}">
						<input type="radio" name="movie_status" value="readysc">상영예정
						<input type="radio" name="movie_status" value="screening" checked="checked">상영중
						<input type="radio" name="movie_status" value="endsc">상영종료
						<input type="radio" name="movie_status" value="undecided">미정
						</c:when>
						<c:when test="${goods.movie_status=='endsc'}">
						<input type="radio" name="movie_status" value="readysc">상영예정
						<input type="radio" name="movie_status" value="screening">상영중
						<input type="radio" name="movie_status" value="endsc" checked="checked">상영종료
						<input type="radio" name="movie_status" value="undecided">미정
						</c:when>
						<c:when test="${goods.movie_status=='undecided'}">
						<input type="radio" name="movie_status" value="readysc">상영예정
						<input type="radio" name="movie_status" value="screening">상영중
						<input type="radio" name="movie_status" value="endsc">상영종료
						<input type="radio" name="movie_status" value="undecided" checked="checked">미정
						</c:when>
					</c:choose>
					</td>
					<td><input type="button" value="수정반영" onclick="fn_modify_goods('${goods.movie_id}','movie_status')"></td>
				</tr>
				<tr>
					<td>상영시작일</td>
					<td><input type="date" value="${goods.movie_open_date}" name="movie_open_date" size="40"></td>
					<td><input type="button" value="수정반영" onclick="fn_modify_goods('${goods.movie_id}','movie_open_date')"></td>
				</tr>
				<tr>
					<td>상영종료일</td>
					<td><input type="date" value="${goods.movie_close_date}" name="movie_close_date" size="40"></td>
					<td><input type="button" value="수정반영" onclick="fn_modify_goods('${goods.movie_id}','movie_close_date')"></td>
				</tr>
			</tbody>
		</table>
	</div>
	
	<div class="tab_content" id="tab2">
	<form id="FILE_FORM" method="post" enctype="multipart/form-data">
	<table>
		<tr>
			<c:forEach var="item" items="${imageFileList}" varStatus="itemNum">
			<c:choose>
				<c:when test="${item.image_file_sort=='poster'}">
				<tr>
					<td>포스터</td>
					<td><input type="file" id="poster" name="poster" onchange="readURL(this,'preview${itemNum.count}');" />
						<input type="hidden" name="image_number" value="${item.image_number}" /> <br>
					</td>
					<td><img id="preview${itemNum.count}" width=200 height=200 src="${contextPath}/download.do?movie_id=${item.movie_id}&image_file_name=${item.image_file_name}" />
					</td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td><input type="button" value="수정" onClick="modifyImageFile('poster','${item.movie_id}','${item.image_number}','${item.image_file_sort}')" /></td>
				</tr>
				<tr>
					<td><br></td>
				</tr>
				</c:when>

			<c:otherwise>
				<tr id="${itemNum.count-1}">
					<td>상세 이미지${itemNum.count-1 }</td>
					<td><input type="file" name="still" id="still" onchange="readURL(this,'preview${itemNum.count}');" />
						<input type="hidden" name="image_number" value="${item.image_number}" /> <br></td>
					<td><img id="preview${itemNum.count}" width=200 height=200	src="${contextPath}/download.do?movie_id=${item.movie_id}&image_file_name=${item.image_file_name}"></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td>
						<input type="button" value="수정" onClick="modifyImageFile('still','${item.movie_id}','${item.image_number}','${item.image_file_sort}')" />
						<input type="button" value="삭제" onClick="deleteImageFile('${item.movie_id}','${item.image_number}','${item.image_file_sort}','${itemNum.count-1}')" />
					</td>
				</tr>
				<tr>
					<td><br></td>
				</tr>
			</c:otherwise>
			</c:choose>	
			</c:forEach>
				<tr align="center">
					<td colspan="3">
						<div id="d_file">
						</div>
					</td>
				</tr>
				<tr>
					<td align=center colspan=2><input type="button"	value="이미지파일추가하기" onClick="fn_addFile()" /></td>
				</tr>
		</table>
		</form>
	</DIV>
</div>

</form>
</section>
</BODY>