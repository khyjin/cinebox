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
		async : false, //false�� ��� ��������� ó���Ѵ�.
		url : "${contextPath}/admin/goods/modifyGoodsInfo.do",
		data : {
			movie_id:movie_id,
			attribute:attribute,
			value:value
		},
		success : function(data, textStatus) {
			if(data.trim()=='mod_success'){
				alert("��ȭ ������ �����߽��ϴ�.");
			}else if(data.trim()=='failed'){
				alert("�ٽ� �õ��� �ּ���.");	
			}
			
		},
		error : function(data, textStatus) {
			alert("������ �߻��߽��ϴ�."+data);
		},
		complete : function(data, textStatus) {
			//alert("�۾����Ϸ� �߽��ϴ�");
			
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
	  $("#d_file").append("<input  type='button' value='�߰�'  onClick='addNewImageFile('still"+cnt+"','${imageFileList[0].movie_id}','still')'  />");
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
	         alert("�̹����� �����߽��ϴ�!");
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
	            	alert("�̹����� �����߽��ϴ�!");
	              }
	       });
	  }
 
 function deleteImageFile(movie_id,image_number,image_file_name,trId){
	var tr = document.getElementById(trId);

     	$.ajax({
   		type : "post",
   		async : true, //false�� ��� ��������� ó���Ѵ�.
   		url : "${contextPath}/admin/goods/removeGoodsImage.do",
   		data: {	movie_id:movie_id,
    	         image_number:image_number,
    	         image_file_name:image_file_name},
   		success : function(data, textStatus) {
   			alert("�̹����� �����߽��ϴ�!!");
               tr.style.display = 'none';
   		},
   		error : function(data, textStatus) {
   			alert("������ �߻��߽��ϴ�."+textStatus);
   		},
   		complete : function(data, textStatus) {
   			//alert("�۾����Ϸ� �߽��ϴ�");
   			
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
			<li><A href="#tab1">��ȭ����</A></li>
			<li><A href="#tab2">��ȭ�̹���</A></li>
	</ul>
	</div>
	<div class="tab_container" id="container">
	<div class="tab_content" id="tab1">
		<table>
			<tbody>
				<tr>
					<td>�帣</td>
					<td>
					<c:set value="${goods.movie_sort}" var="sort"/>
					<c:choose>
						<c:when test="${fn:contains(sort,'SF')}"><input type="checkbox" value="SF" name="movie_sort" checked="checked">SF</c:when>
						<c:otherwise><input type="checkbox" value="SF" name="movie_sort">SF</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${fn:contains(sort,'����')}"><input type="checkbox" value="����" name="movie_sort" checked="checked">����</c:when>
						<c:otherwise><input type="checkbox" value="����" name="movie_sort">����</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${fn:contains(sort,'�ڹ̵�')}"><input type="checkbox" value="�ڹ̵�" name="movie_sort" checked="checked">�ڹ̵�</c:when>
						<c:otherwise><input type="checkbox" value="�ڹ̵�" name="movie_sort">�ڹ̵�</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${fn:contains(sort,'�θǽ�')}"><input type="checkbox" value="�θǽ�" name="movie_sort" checked="checked">�θǽ�</c:when>
						<c:otherwise><input type="checkbox" value="�θǽ�" name="movie_sort">�θǽ�</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${fn:contains(sort,'��Ÿ��')}"><input type="checkbox" value="��Ÿ��" name="movie_sort" checked="checked">��Ÿ��</c:when>
						<c:otherwise><input type="checkbox" value="��Ÿ��" name="movie_sort">��Ÿ��</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${fn:contains(sort,'�׼�')}"><input type="checkbox" value="�׼�" name="movie_sort" checked="checked">�׼�</c:when>
						<c:otherwise><input type="checkbox" value="�׼�" name="movie_sort">�׼�</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${fn:contains(sort,'�̽��׸�')}"><input type="checkbox" value="�̽��׸�" name="movie_sort" checked="checked">�̽��׸�</c:when>
						<c:otherwise><input type="checkbox" value="�̽��׸�" name="movie_sort">�̽��׸�</c:otherwise>
					</c:choose>
					<p>
					<c:choose>
						<c:when test="${fn:contains(sort,'�ִϸ��̼�')}"><input type="checkbox" value="�ִϸ��̼�" name="movie_sort" checked="checked">�ִϸ��̼�</c:when>
						<c:otherwise><input type="checkbox" value="�ִϸ��̼�" name="movie_sort">�ִϸ��̼�</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${fn:contains(sort,'���')}"><input type="checkbox" value="���" name="movie_sort" checked="checked">���</c:when>
						<c:otherwise><input type="checkbox" value="���" name="movie_sort">���</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${fn:contains(sort,'����')}"><input type="checkbox" value="����" name="movie_sort" checked="checked">����</c:when>
						<c:otherwise><input type="checkbox" value="����" name="movie_sort">����</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${fn:contains(sort,'���')}"><input type="checkbox" value="���" name="movie_sort" checked="checked">���</c:when>
						<c:otherwise><input type="checkbox" value="���" name="movie_sort">���</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${fn:contains(sort,'������')}"><input type="checkbox" value="������" name="movie_sort" checked="checked">������</c:when>
						<c:otherwise><input type="checkbox" value="������" name="movie_sort">������</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${fn:contains(sort,'����')}"><input type="checkbox" value="����" name="movie_sort" checked="checked">����</c:when>
						<c:otherwise><input type="checkbox" value="����" name="movie_sort">����</c:otherwise>
					</c:choose>
					</td>
					<td><input type="button" value="�����ݿ�"></td>
				</tr>
				<tr>
					<td>��ȭ�̸�</td>
					<td><input type="text" value="${goods.movie_title}" name="movie_title" size="40"></td>
					<td><input type="button" value="�����ݿ�" onclick="fn_modify_goods('${goods.movie_id}','movie_title')"></td>
				</tr>
				<tr>
					<td>����</td>
					<td><input type="text" value="${goods.movie_director}" name="movie_director" size="40"></td>
					<td><input type="button" value="�����ݿ�" onclick="fn_modify_goods('${goods.movie_id}','movie_director')"></td>
				</tr>
				<tr>
					<td>�⿬���</td>
					<td><input type="text" value="${goods.movie_actor}" name="movie_actor" size="40"></td>
					<td><input type="button" value="�����ݿ�" onclick="fn_modify_goods('${goods.movie_id}','movie_actor')"></td>
				</tr>
				<tr>
					<td>���ɵ��</td>
					<td>
						<select name="movie_age_grade">
							<option value="��ü������">��ü������</option>
							<option value="12���̻������">12���̻������</option>
							<option value="15���̻������">15���̻������</option>
							<option value="19���̻������">19���̻������</option>
						</select>
						<input type="hidden" name="h_movie_age_grade" value="${goods.movie_age_grade}">
					</td>
					<td><input type="button" value="�����ݿ�" onclick="fn_modify_goods('${goods.movie_id}','movie_age_grade')"></td>
				</tr>
				<tr>
					<td>���۳���</td>
					<td><input type="text" value="${goods.movie_country}" name="movie_country" size="40"></td>
					<td><input type="button" value="�����ݿ�" onclick="fn_modify_goods('${goods.movie_id}','movie_country')"></td>
				</tr>				
				<tr>
					<td>�󿵽ð�</td>
					<td><input type="text" value="${goods.movie_runningtime}" name="movie_runningtime" size="40"></td>
					<td><input type="button" value="�����ݿ�" onclick="fn_modify_goods('${goods.movie_id}','movie_runningtime')"></td>
				</tr>
				<tr>
					<td>�ٰŸ�</td>
					<td>
					<pre><textarea rows="10" cols="60" name="movie_content">${goods.movie_content}</textarea></pre>
					</td>
					<td><input type="button" value="�����ݿ�" onclick="fn_modify_goods('${goods.movie_id}','movie_content')"></td>
				</tr>
				<tr>
					<td>�󿵻���</td>
					<td>
					<c:choose>
						<c:when test="${goods.movie_status=='readysc'}">
						<input type="radio" name="movie_status" value="readysc" checked="checked">�󿵿���
						<input type="radio" name="movie_status" value="screening">����
						<input type="radio" name="movie_status" value="endsc">������
						<input type="radio" name="movie_status" value="undecided">����
						</c:when>
						<c:when test="${goods.movie_status=='screening'}">
						<input type="radio" name="movie_status" value="readysc">�󿵿���
						<input type="radio" name="movie_status" value="screening" checked="checked">����
						<input type="radio" name="movie_status" value="endsc">������
						<input type="radio" name="movie_status" value="undecided">����
						</c:when>
						<c:when test="${goods.movie_status=='endsc'}">
						<input type="radio" name="movie_status" value="readysc">�󿵿���
						<input type="radio" name="movie_status" value="screening">����
						<input type="radio" name="movie_status" value="endsc" checked="checked">������
						<input type="radio" name="movie_status" value="undecided">����
						</c:when>
						<c:when test="${goods.movie_status=='undecided'}">
						<input type="radio" name="movie_status" value="readysc">�󿵿���
						<input type="radio" name="movie_status" value="screening">����
						<input type="radio" name="movie_status" value="endsc">������
						<input type="radio" name="movie_status" value="undecided" checked="checked">����
						</c:when>
					</c:choose>
					</td>
					<td><input type="button" value="�����ݿ�" onclick="fn_modify_goods('${goods.movie_id}','movie_status')"></td>
				</tr>
				<tr>
					<td>�󿵽�����</td>
					<td><input type="date" value="${goods.movie_open_date}" name="movie_open_date" size="40"></td>
					<td><input type="button" value="�����ݿ�" onclick="fn_modify_goods('${goods.movie_id}','movie_open_date')"></td>
				</tr>
				<tr>
					<td>��������</td>
					<td><input type="date" value="${goods.movie_close_date}" name="movie_close_date" size="40"></td>
					<td><input type="button" value="�����ݿ�" onclick="fn_modify_goods('${goods.movie_id}','movie_close_date')"></td>
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
					<td>������</td>
					<td><input type="file" id="poster" name="poster" onchange="readURL(this,'preview${itemNum.count}');" />
						<input type="hidden" name="image_number" value="${item.image_number}" /> <br>
					</td>
					<td><img id="preview${itemNum.count}" width=200 height=200 src="${contextPath}/download.do?movie_id=${item.movie_id}&image_file_name=${item.image_file_name}" />
					</td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td><input type="button" value="����" onClick="modifyImageFile('poster','${item.movie_id}','${item.image_number}','${item.image_file_sort}')" /></td>
				</tr>
				<tr>
					<td><br></td>
				</tr>
				</c:when>

			<c:otherwise>
				<tr id="${itemNum.count-1}">
					<td>�� �̹���${itemNum.count-1 }</td>
					<td><input type="file" name="still" id="still" onchange="readURL(this,'preview${itemNum.count}');" />
						<input type="hidden" name="image_number" value="${item.image_number}" /> <br></td>
					<td><img id="preview${itemNum.count}" width=200 height=200	src="${contextPath}/download.do?movie_id=${item.movie_id}&image_file_name=${item.image_file_name}"></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td>
						<input type="button" value="����" onClick="modifyImageFile('still','${item.movie_id}','${item.image_number}','${item.image_file_sort}')" />
						<input type="button" value="����" onClick="deleteImageFile('${item.movie_id}','${item.image_number}','${item.image_file_sort}','${itemNum.count-1}')" />
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
					<td align=center colspan=2><input type="button"	value="�̹��������߰��ϱ�" onClick="fn_addFile()" /></td>
				</tr>
		</table>
		</form>
	</DIV>
</div>

</form>
</section>
</BODY>