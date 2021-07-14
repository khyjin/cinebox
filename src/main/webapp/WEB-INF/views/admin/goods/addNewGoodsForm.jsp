<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>

<meta charset="utf-8">
<head>
<script type="text/javascript">
	var cnt = 0;
	function fn_addFile() {
		if (cnt == 0) {
			$("#d_file")
					.append(
							"<br>"
									+ "<input  type='file' name='poster' id='f_main_image' />");
		} else {
			$("#d_file").append(
					"<br>" + "<input  type='file' name='sc"+cnt+"' />");
		}
		cnt++;
	}
	function fn_add_new_goods(obj) {
		fileName = $('#f_main_image').val();
		if (fileName != null && fileName != undefined) {
			obj.submit();
		} else {
			alert("메인 이미지는 반드시 첨부해야 합니다.");
			return;
		}
	}
</script>

</head>
<style>
section.admin_mypage_main {
	width: 800;
	height: 800;
	float: right;
	margin-top: -190;
}
.admin_bg {
	background-color: white;
}
</style>
<BODY class="admin_bg">
</head>
<BODY>
	<section class="admin_mypage_main">

		<form action="${contextPath}/admin/goods/addNewGoods.do" method="post"
			enctype="multipart/form-data">
			<input type="hidden" name="movie_admin_id"
				value="${memberInfo.member_id}">
			<h1>새상품 등록창</h1>
			<br>
			<div class="tab_container">
				<!-- 내용 들어 가는 곳 -->

				<table>
					<tr>
						<td>장르</td>
						<td>
							<label><input name="movie_sort" type="checkbox" value="SF" />SF</label> 
							<label><input type="checkbox" value="공포" name="movie_sort">공포</label>			
							<label><input type="checkbox" value="코미디" name="movie_sort">코미디</label>					
							<label><input type="checkbox" value="로맨스" name="movie_sort">로맨스</label>					
							<label><input type="checkbox" value="판타지" name="movie_sort">판타지</label>					
							<label><input type="checkbox" value="액션" name="movie_sort">액션</label>					
							<label><input type="checkbox" value="미스테리" name="movie_sort">미스테리</label>					
							<p>
							<label><input type="checkbox" value="애니메이션" name="movie_sort">애니메이션</label>
							<label><input type="checkbox" value="드라마" name="movie_sort">드라마</label>					
							<label><input type="checkbox" value="전쟁" name="movie_sort">전쟁</label>
							<label><input type="checkbox" value="멜로" name="movie_sort">멜로</label>				
							<label><input type="checkbox" value="스릴러" name="movie_sort">스릴러</label>				
							<label><input type="checkbox" value="범죄" name="movie_sort">범죄</label>
						</td>
					</tr>
					<tr>
						<td>영화이름</td>
						<td><input name="movie_title" type="text" size="40" /></td>
					</tr>
					<tr>
						<td>감독</td>
						<td><input name="movie_director" type="text" size="40" /></td>
					</tr>
					<tr>
						<td>출연배우</td>
						<td><input name="movie_actor" type="text" size="40" /></td>
					</tr>
					<tr>
						<td width=200>연령등급</td>
						<td width=500><select name="movie_age_grade">
								<option value="전체관람가" selected>전체관람</option>
								<option value="12세관람">12세 관람가</option>
								<option value="15세관람">15세 관람가</option>
								<option value="19세관람">19세 관람가</option>
						</select></td>
					</tr>

					<tr>
						<td>제작나라</td>
						<td><input name="movie_country" type="text" size="40" /></td>
					</tr>
					<tr>
						<td>런타임</td>
						<td><input name="movie_runningtime" type="text" size="40" /></td>
					</tr>
					<tr>
						<td>줄거리</td>
						<td><textarea rows="10" cols="60" name="movie_content"></textarea></td>
					</tr>
					<tr>
						<td>상영상태</td>
						<td><input type="radio" name="movie_status" value="readysc"	checked="checked">상영예정 
						<input type="radio"	name="movie_status" value="screening">상영중 
						<input type="radio" name="movie_status" value="endsc">상영종료 
						<input type="radio" name="movie_status" value="undecided">예정미정</td>
					</tr>

					<tr>
						<td>개봉일</td>
						<td><input name="movie_open_date" type="date" size="40" /></td>
					</tr>
					<tr>
						<td>상영종료일</td>
						<td><input name="movie_close_date" type="date" size="40" /></td>
					</tr>

					<tr>
						<td>이미지파일 첨부</td>
						<td><input type="button" value="파일 추가" onClick="fn_addFile()" />
							<div id="d_file"></div></td>
					</tr>

					<tr>
						<td><br></td>
					</tr>
					<tr>
						<td align=center colspan="2"><input type="button"
							value="상품 등록하기" onClick="fn_add_new_goods(this.form)"></td>
					</tr>
				</table>
			</div>

		</form>
	</section>
</BODY>
</body>