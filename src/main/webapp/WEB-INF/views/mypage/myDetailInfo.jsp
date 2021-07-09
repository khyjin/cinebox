<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html >
<html>
<head>
<style type="text/css">
section.mydetail_main {
	width:800;
	height:1200;
	float:right;
	margin-top : -280;
}
#detail_table table {
width:100%;
}
</style>
<meta charset="utf-8">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
 <script>
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zipcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('roadAddress').value = fullRoadAddr;
                document.getElementById('jibunAddress').value = data.jibunAddress;

                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

                } else {
                    document.getElementById('guide').innerHTML = '';
                }
            }
        }).open();
    }

   
   window.onload=function()
    {
      selectBoxInit();
    }

    function selectBoxInit(){
    
     var hp1='${memberInfo.member_hp1}';
     var selHp1 = document.getElementById('member_hp1');
     var optionHp1 = selHp1.options;
     var val;
     
     for(var i=0; i<optionHp1.length;i++){
         val = optionHp1[i].value;
         if(hp1 == val){
        	 optionHp1[i].selected= true;
          break;
         }
       } 
     
   }


function fn_modify_member_info(attribute){
	var value;
	// alert(member_id);
	// alert("mod_type:"+mod_type);
		var frm_mod_member=document.frm_mod_member;
		if(attribute=='member_pw'){
			value=frm_mod_member.member_pw.value;
			//alert("member_pw:"+value);
		}else if(attribute=='member_gender'){
			var gender=frm_mod_member.member_gender;
			for(var i=0; gender.length;i++){
			 	if(gender[i].checked){
					value=gender[i].value;
					break;
				} 
			}			
		}else if(attribute=='del'){
			var del_yn=frm_mod_member.member_del_yn;
			value_del_yn=del_yn.checked;
			value=value_del_yn;
		}else if(attribute=='member_birth'){
			var birth_y=frm_mod_member.member_birth_y;
			var birth_m=frm_mod_member.member_birth_m;
			var birth_d=frm_mod_member.member_birth_d;
			
			for(var i=0; birth_y.length;i++){
			 	if(birth_y[i].selected){
					value_y=birth_y[i].value;
					break;
				} 
			}
			for(var i=0; birth_m.length;i++){
			 	if(birth_m[i].selected){
					value_m=birth_m[i].value;
					break;
				} 
			}
			
			for(var i=0; birth_d.length;i++){
			 	if(birth_d[i].selected){
					value_d=birth_d[i].value;
					break;
				} 
			}
			value=+value_y+","+value_m+","+value_d;
		}else if(attribute=='hp'){
			var hp1=frm_mod_member.member_hp1;
			var hp2=frm_mod_member.member_hp2;
			var hp3=frm_mod_member.member_hp3;
			
			for(var i=0; hp1.length;i++){
			 	if(hp1[i].selected){
					value_hp1=hp1[i].value;
					break;
				} 
			}
			value_hp2=hp2.value;
			value_hp3=hp3.value;
			value=value_hp1+","+value_hp2+", "+value_hp3;
		}else if(attribute=='email'){
			var email1=frm_mod_member.member_email1;
			var email2=frm_mod_member.member_email2;
			var email_yn=frm_mod_member.member_email_yn;
			
			value_email1=email1.value;
			value_email2=email2.value;
			value_email_yn=email_yn.checked;
			value=value_email1+","+value_email2+","+value_email_yn;
			//alert(value);
		}else if(attribute=='address'){
			var zipcode=frm_mod_member.member_zip;
			var roadaddress=frm_mod_member.member_roadaddress;
			var jibunaddress=frm_mod_member.member_jibunaddress;
			var namujiaddress=frm_mod_member.member_namujiaddress;
			
			value_zipcode=zipcode.value;
			value_roadaddress=roadaddress.value;
			value_jibunaddress=jibunaddress.value;
			value_namujiaddress=namujiaddress.value;
			value=value_zipcode+","+value_roadaddress+","+value_jibunaddress+","+value_namujiaddress;
		}
		console.log(attribute);
	 
		$.ajax({
			type : "post",
			async : false, //false인 경우 동기식으로 처리한다.
			url : "${contextPath}/mypage/modifyMyInfo.do",
			data : {
				attribute:attribute,
				value:value,
			},
			success : function(data, textStatus) {
				if(data.trim()=='mod_success'){
					alert("회원 정보를 수정했습니다.");
				}else if(data.trim()=='failed'){
					alert("다시 시도해 주세요.");	
				}
				
			},
			error : function(data, textStatus) {
				alert("에러가 발생했습니다."+data);
			},
			complete : function(data, textStatus) {
				window.location.href = "myDetailInfo.do";
				
			}
		}); //end ajax
}


</script>
</head>

<body>
<section class="mydetail_main">
	<div class="detailinfo">
	<img src="${contextPath}/resources/image/modify_icon.png" width="40" height="40"/> 기본 정보
	</div>
<form name="frm_mod_member" class="mod_member">	
	<div id="detail_table">
		<table>
			<tbody>
				<tr class="dot_line">
					<td class="fixed_join">아이디</td>
					<td class="member_input">
						<input name="member_id" type="text" size="20" value="${memberInfo.member_id }"  disabled/>
					</td>
					 <td>
					</td>
				</tr>
				<tr class="dot_line">
					<td class="fixed_join">비밀번호</td>
					<td class="member_input">
					  <input name="member_pw" type="password" size="20" value="${memberInfo.member_pw }" />
					</td>
					<td>
					  <input type="button" value="변경하기" size="10" onClick="fn_modify_member_info('member_pw')" />
					</td>
				</tr>
				<tr class="dot_line">
					<td class="fixed_join">이름</td>
					<td class="member_input">
					  <input name="member_name" type="text" size="20" value="${memberInfo.member_name }"  disabled />
					 </td>
					 <td>
					</td>
				</tr>
				<tr class="dot_line">
					<td class="fixed_join">성별</td>
					<td class="member_input">
					  <c:choose >
					    <c:when test="${memberInfo.member_gender =='여성' }">
					      <input type="radio" name="member_gender" value="여성" checked />
						  여성 <span style="padding-left:30px"></span>
					   <input type="radio" name="member_gender" value="남성"  />남성
					    </c:when>
					    <c:otherwise>
					      <input type="radio" name="member_gender" value="여성"   />
						   여성 <span style="padding-left:30px"></span>
					      <input type="radio" name="member_gender" value="남성" checked />남성
					   </c:otherwise>
					   </c:choose>
					</td>
					<td>
					  <input type="button" value="변경하기" onClick="fn_modify_member_info('member_gender')" />
					</td>
				</tr>
				<tr class="dot_line">
					<td class="fixed_join">생년월일</td>
					<td class="member_input">
					   <select name="member_birth_y">
					     <c:forEach var="i" begin="1" end="100">
					       <c:choose>
					         <c:when test="${memberInfo.member_birth_y==1920+i }">
							   <option value="${ 1920+i}" selected>${ 1920+i} </option>
							</c:when>
							<c:otherwise>
							  <option value="${ 1920+i}" >${ 1920+i} </option>
							</c:otherwise>
							</c:choose>
					   	</c:forEach>
					</select>년 
					<select name="member_birth_m" >
						<c:forEach var="i" begin="1" end="12">
					       <c:choose>
					         <c:when test="${memberInfo.member_birth_m==i }">
							   <option value="${i }" selected>${i }</option>
							</c:when>
							<c:otherwise>
							  <option value="${i }">${i }</option>
							</c:otherwise>
							</c:choose>
					   	</c:forEach>
					</select>월 
					
					<select name="member_birth_d">
							<c:forEach var="i" begin="1" end="31">
					       <c:choose>
					         <c:when test="${memberInfo.member_birth_d==i }">
							   <option value="${i }" selected>${i }</option>
							</c:when>
							<c:otherwise>
							  <option value="${i }">${i }</option>
							</c:otherwise>
							</c:choose>
					   	</c:forEach>
					</select>일 <span style="padding-left:50px"></span>
					</td>
					<td>
					  <input type="button" value="변경하기" onClick="fn_modify_member_info('member_birth')" />
					</td>
				</tr>
				<tr class="dot_line">
					<td class="fixed_join">휴대폰번호</td>
					<td class="member_input">
					   <select name="member_hp1" id="member_hp1">
							<option>없음</option>
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="018">018</option>
							<option value="019">019</option>
					</select> 
					 - <input type="text" name="member_hp2" size=4 value="${memberInfo.member_hp2 }"> 
					 - <input type="text"name="member_hp3"  size=4 value="${memberInfo.member_hp3 }"><br>
				    </td>
					<td>
					  <input type="button" value="변경하기" onClick="fn_modify_member_info('hp')" />
					</td>	
				</tr>
				<tr class="dot_line">
					<td class="fixed_join">이메일<br>(e-mail)</td>
					<td class="member_input">
					   <input type="text" name="member_email1" size=10 value="${memberInfo.member_email1 }" /> @
					    <input type="text" name="member_email2" size=10 value="${memberInfo.member_email2 }"><Br><br> 
					<c:choose> 
					   <c:when test="${memberInfo.member_email_yn=='true' }">
					   <input type="checkbox" name="member_email_yn"  value="Y"  /> cinebox에서 발송하는 e-mail을 수신합니다.
						</c:when>
						<c:otherwise>
					     <input type="checkbox" name="member_email_yn"  value="N" checked /> cinebox에서 발송하는 e-mail을 수신합니다.
						</c:otherwise>
					 </c:choose>
					</td>
					<td>
					  <input type="button" value="변경하기" onClick="fn_modify_member_info('email')" />
					</td>
				</tr>
				<tr class="dot_line">
					<td class="fixed_join">주소</td>
					<td class="member_input">
					   <input type="text" id="zipcode" name="member_zip" size=5 value="${memberInfo.member_zip }" > <a href="javascript:execDaumPostcode()" id="zip">우편번호검색</a>
					  <br><br>
					  <p> 
					   도로명 주소:<br><input type="text" id="roadAddress"  name="member_roadaddress" size="50" value="${memberInfo.member_roadaddress }"><br><br>
					  지번 주소: <input type="text" id="jibunAddress" name="member_jibunaddress" size="50" value="${memberInfo.member_jibunaddress }"><br><br>
					  나머지 주소: <input type="text"  name="member_namujiaddress" size="50" value="${memberInfo.member_namujiaddress }" />
					   </p>
					</td>
					<td>
					  <input type="button" value="변경하기" onClick="fn_modify_member_info('address')" />
					</td>
				</tr>
				<tr class="dot_line">
					<td class="fixed_join">포인트</td>
					<td class="member_input">
					   <input type="text" id="point" name="member_point" size=5 value="${memberInfo.member_point }" disabled> 원
					  <br>	  
					</td>
					<td></td>
				</tr>
				<tr class="dot_line">
					<td class="fixed_join">가입 날짜</td>
					<td class="member_input">					
					   ${memberInfo.member_joindate}
					  <br>					  
					</td>
					<td></td>
				</tr>
				<tr class="dot_line">
					<td class="fixed_join">탈퇴</td>
					<td class="member_input">										  
					  <c:choose> 
					   <c:when test="${memberInfo.member_del_yn=='true'}">
					     <input type="checkbox" name="member_del_yn"  value="Y"/> 체크하면 탈퇴됩니다.
						</c:when>
						<c:otherwise>
						  <input type="checkbox" name="member_del_yn"  value="N" /> 체크하면 탈퇴됩니다.
						</c:otherwise>
					 </c:choose>					  <br>					  
					</td>
					<td>
						<label><input type="button" value="탈퇴하기" onClick="fn_modify_member_info('del')" />	</label>				
					</td>
				</tr>				
			</tbody>
		</table>
		</div>
		<div class="clear">
				<input type="button" value="뒤로가기" onclick="history.back()" class="back">
	</div>
</form>
</section>
</body>
</html>
