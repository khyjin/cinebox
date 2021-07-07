<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" 	isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:set var="movie"  value="${goodsMap.goodsVO}"  />
<c:set var="imageList"  value="${goodsMap.imageList }"  />
 <%
     //치환 변수 선언합니다.
      //pageContext.setAttribute("crcn", "\r\n"); //개행문자
      pageContext.setAttribute("crcn" , "\n"); //Ajax로 변경 시 개행 문자 
      pageContext.setAttribute("br", "<br/>"); //br 태그
%>  
<html>
<head>
<style>
#layer {
	z-index: 2;
	position: absolute;
	top: 0px;
	left: 0px;
	width: 100%;
}

#popup {
	z-index: 3;
	position: fixed;
	text-align: center;
	left: 50%;
	top: 45%;
	width: 300px;
	height: 200px;
	background-color: #ccffff;
	border: 3px solid #87cb42;
}

#close {
	z-index: 4;
	float: right;
}
</style>
<script type="text/javascript">
	function add_cart(goods_id) {
		$.ajax({
			type : "post",
			async : false, //false인 경우 동기식으로 처리한다.
			url : "${contextPath}/cart/addGoodsInCart.do",
			data : {
				goods_id:goods_id
				
			},
			success : function(data, textStatus) {
				//alert(data);
			//	$('#message').append(data);
				if(data.trim()=='add_success'){
					imagePopup('open', '.layer01');	
				}else if(data.trim()=='already_existed'){
					alert("이미 카트에 등록된 상품입니다.");	
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

	function imagePopup(type) {
		if (type == 'open') {
			// 팝업창을 연다.
			jQuery('#layer').attr('style', 'visibility:visible');

			// 페이지를 가리기위한 레이어 영역의 높이를 페이지 전체의 높이와 같게 한다.
			jQuery('#layer').height(jQuery(document).height());
		}

		else if (type == 'close') {

			// 팝업창을 닫는다.
			jQuery('#layer').attr('style', 'visibility:hidden');
		}
	}
	
	function fn_order_each_goods(goods_id,goods_title,goods_sales_price,fileName){
		var _isLogOn=document.getElementById("isLogOn");
		var isLogOn=_isLogOn.value;
		
		 if(isLogOn=="false" || isLogOn=='' ){
			alert("로그인 후 예매가 가능합니다!!!");
		} 
	}	
</script>

<!-- 스틸컷 제이쿼리 시작 -->
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<link href='https://fonts.googleapis.com/css?family=Anton' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Neucha' rel='stylesheet' type='text/css'>

<style>/*GLOBALS*/
	*{margin:0; padding:0; list-style:none;}
	a{text-decoration:none; color:#666;}
	a:hover{color:#1bc1a3;}
	body, hmtl{ font-family: 'Anton', sans-serif;}
	
	#wrapper{
	  width:600px;
	  margin:50px auto;
	  height:400px;
	  position:relative;
	  color:#fff;
	  text-shadow:rgba(0,0,0,0.1) 2px 2px 0px;  
	}
	
	#slider-wrap{
	  width:600px;
	  height:400px;
	  position:relative;
	  overflow:hidden;
	}
	
	#slider-wrap ul#slider{
	  width:100%;
	  height:100%;
	  
	  position:absolute;
	  top:0;
	  left:0;   
	}
	
	#slider-wrap ul#slider li{
	  float:left;
	  position:relative;
	  width:600px;
	  height:400px; 
	}
	
	#slider-wrap ul#slider li > div{
	  position:absolute;
	  top:20px;
	  left:35px;  
	}
	
	#slider-wrap ul#slider li > div h3{
	  font-size:36px;
	  text-transform:uppercase; 
	}
	
	#slider-wrap ul#slider li > div span{
	  font-family: Neucha, Arial, sans serif;
	  font-size:21px;
	}
	
	#slider-wrap ul#slider li img{
	  display:block;
	  width:100%;
	  height: 100%;
	}
	
	/*btns*/
	.btns{
	  position:absolute;
	  width:50px;
	  height:60px;
	  top:50%;
	  margin-top:-25px;
	  line-height:57px;
	  text-align:center;
	  cursor:pointer; 
	  background:rgba(0,0,0,0.1);
	  z-index:100;
	  
	  
	  -webkit-user-select: none;  
	  -moz-user-select: none; 
	  -khtml-user-select: none; 
	  -ms-user-select: none;
	  
	  -webkit-transition: all 0.1s ease;
	  -moz-transition: all 0.1s ease;
	  -o-transition: all 0.1s ease;
	  -ms-transition: all 0.1s ease;
	  transition: all 0.1s ease;
	}
	
	.btns:hover{
	  background:rgba(0,0,0,0.3); 
	}
	
	#next{right:-50px; border-radius:7px 0px 0px 7px;}
	#previous{left:-50px; border-radius:0px 7px 7px 7px;}
	#counter{
	  top: 30px; 
	  right:35px; 
	  width:auto;
	  position:absolute;
	}
	
	#slider-wrap.active #next{right:0px;}
	#slider-wrap.active #previous{left:0px;}

	/*bar*/
	#pagination-wrap{
	  min-width:20px;
	  margin-top:350px;
	  margin-left: auto; 
	  margin-right: auto;
	  height:15px;
	  position:relative;
	  text-align:center;
	}
	
	#pagination-wrap ul {
	  width:100%;
	}
	
	#pagination-wrap ul li{
	  margin: 0 4px;
	  display: inline-block;
	  width:5px;
	  height:5px;
	  border-radius:50%;
	  background:#fff;
	  opacity:0.5;
	  position:relative;
	  top:0;  
	}
	
	#pagination-wrap ul li.active{
	  width:12px;
	  height:12px;
	  top:3px;
	  opacity:1;
	  box-shadow:rgba(0,0,0,0.1) 1px 1px 0px; 
	}
	
	/*Header*/
	h1, h2{text-shadow:none; text-align:center;}
	h1{ color: #666; text-transform:uppercase;  font-size:36px;}
	h2{ color: #7f8c8d; font-family: Neucha, Arial, sans serif; font-size:18px; margin-bottom:30px;} 
	
	/*ANIMATION*/
	#slider-wrap ul, #pagination-wrap ul li{
	  -webkit-transition: all 0.3s cubic-bezier(1,.01,.32,1);
	  -moz-transition: all 0.3s cubic-bezier(1,.01,.32,1);
	  -o-transition: all 0.3s cubic-bezier(1,.01,.32,1);
	  -ms-transition: all 0.3s cubic-bezier(1,.01,.32,1);
	  transition: all 0.3s cubic-bezier(1,.01,.32,1); 
	}</style>
	   <script>//current position
	   var pos = 0;
	 //number of slides
	 var totalSlides = $('#slider-wrap ul li').length;
	 //get the slide width
	 var sliderWidth = $('#slider-wrap').width();


 $(document).ready(function(){
   
   /*****************
    BUILD THE SLIDER
   *****************/
   //set width to be 'x' times the number of slides
   $('#slider-wrap ul#slider').width(sliderWidth*totalSlides);
   
     //next slide  
   $('#next').click(function(){
     slideRight();
   });
   
   //previous slide
   $('#previous').click(function(){
     slideLeft();
   });
   
   /*************************
    //*> OPTIONAL SETTINGS
   ************************/
   //automatic slider
   var autoSlider = setInterval(slideRight, 3000);
   
   //for each slide 
   $.each($('#slider-wrap ul li'), function() { 

    //create a pagination
      var li = document.createElement('li');
      $('#pagination-wrap ul').append(li);    
   });
   
   //counter
   countSlides();
   
   //pagination
   pagination();
   
   //hide/show controls/btns when hover
   //pause automatic slide when hover
   $('#slider-wrap').hover(
     function(){ $(this).addClass('active'); clearInterval(autoSlider); }, 
     function(){ $(this).removeClass('active'); autoSlider = setInterval(slideRight, 3000); }
   );
 });//DOCUMENT READY
   
 /***********
  SLIDE LEFT
 ************/
 function slideLeft(){
   pos--;
   if(pos==-1){ pos = totalSlides-1; }
   $('#slider-wrap ul#slider').css('left', -(sliderWidth*pos));  
   
   //*> optional
   countSlides();
   pagination();
 }

 /************
  SLIDE RIGHT
 *************/
 function slideRight(){
   pos++;
   if(pos==totalSlides){ pos = 0; }
   $('#slider-wrap ul#slider').css('left', -(sliderWidth*pos)); 
   
   //*> optional 
   countSlides();
   pagination();
 }
 
 /************************
  //*> OPTIONAL SETTINGS
 ************************/
 function countSlides(){
   $('#counter').html(pos+1 + ' / ' + totalSlides);
 }

 function pagination(){
   $('#pagination-wrap ul li').removeClass('active');
   $('#pagination-wrap ul li:eq('+pos+')').addClass('active');
 }
 </script>
</head>
<body>
	<hgroup>
		<h1>영화상세</h1>
			
	</hgroup>
	<div id="goods_image">
		<figure>
			<img alt="HTML5 &amp; CSS3" 
				src="${contextPath}/thumbnails.do?movie_id=${movie.movie_id}&image_file_name=${movie.movie_fileName}">
		</figure>
		
	</div>
	<div id="detail_table2">
		<table>
			<tbody>
				<tr>
					<td class="fixed">${movie.movie_title}</td><td><ul>
	
			<li><a class="buy" href="javascript:fn_order_each_goods('${goods.goods_id }','${goods.goods_title }','${goods.goods_sales_price}','${goods.goods_fileName}');">예매</a></li>
		</ul></td><tr class="dot_line">
				</tr>
				<tr>
					<td colspan="2" class="fixed">예매율 : 0.0%</td><tr class="dot_line">
				</tr>
				<tr>
					<td class="fixed">감독 : ${movie.movie_director}</td>
					<td class="fixed">배우 : ${movie.movie_actor}</td>
				</tr> 
				<tr>
					<td class="fixed">장르 :  ${movie.movie_sort}</td>
				
					<td class="fixed">등급 : ${movie.movie_age_grade}</td>
				</tr>
				<tr>
					<td class="fixed">런타임 : ${movie.movie_runningtime}분</td>
				
					<td class="fixed">국가 :  ${movie.movie_country}</td>
				</tr>
			</tbody>
		</table>
		
	</div>
	<div class="clear"></div>
	<!-- 내용 들어 가는 곳 -->
	<strong>줄거리</strong>
	<hr>
	<h4>${movie.movie_content}</h4>
	<hr>
	<p>
	<div class="clear">
	<strong>스틸컷</strong>
	<div id="wrapper">
      <div id="slider-wrap">
         <ul id="slider">
             <c:forEach var="image" items="${imageList}">
            	<li>
                <div>
                    <span>Steal CUt #1</span>
                </div> 
            
					<img width="300" height="250" 
						src="${contextPath}/download.do?movie_id=${movie.movie_id}&image_file_name=${image.image_file_name}">
				  </li>
				 </c:forEach>
          </ul>
       
           <!--controls-->
          <div class="btns" id="next"><i class="fa fa-arrow-right"></i></div>
          <div class="btns" id="previous"><i class="fa fa-arrow-left"></i></div>
          <div id="counter"></div>
          
          <div id="pagination-wrap">
            <ul>
            </ul>
          </div>
      		</div>
  	 	</div>			
	</div>
	<hr>
	<div class="clear">
	<strong>리뷰</strong>
	
	<style>

/* 별점 css  레이아웃 외곽 너비 400px 제한*/
.wrap{
    max-width: 480px;
    margin: 0 auto; /* 화면 가운데로 */
    background-color: #fff;
    height: 50%;
    padding: 20px;
    box-sizing: border-box;

}
.reviewform textarea{
    width: 100%;
    padding: 10px;
    box-sizing: border-box;
}
.rating .rate_radio {
    position: relative;
    display: inline-block;
    z-index: 20;
    opacity: 0.001;
    width: 60px;
    height: 60px;
    background-color: #fff;
    cursor: pointer;
    vertical-align: top;
    display: none;
}
.rating .rate_radio + label {
    position: relative;
    display: inline-block;
    margin-left: -4px;
    z-index: 10;
    width: 60px;
    height: 60px;
    background-image: url('${contextPath}/resources/image/starrate.png');
    background-repeat: no-repeat;
    background-size: 60px 60px;
    cursor: pointer;
    background-color:#f0f0f0;
}
.rating .rate_radio:checked + label {
    background-color:  #ff1493;
}

.warning_msg {
    display: none;
    position: relative;
    text-align: center;
    background: #ffffff;
    line-height: 26px;
    width: 100%;
    color: red;
    padding: 10px;
    box-sizing: border-box;
    border: 1px solid #e0e0e0;
}
</style>
<script>
//별점 마킹 모듈 프로토타입으로 생성
function Rating(){};
Rating.prototype.rate = 0;
Rating.prototype.setRate = function(newrate){
    //별점 마킹 - 클릭한 별 이하 모든 별 체크 처리
    this.rate = newrate;
    let items = document.querySelectorAll('.rate_radio');
    items.forEach(function(item, idx){
        if(idx < newrate){
            item.checked = true;
        }else{
            item.checked = false;
        }
    });
}
let rating = new Rating();//별점 인스턴스 생성
</script>
<div class="wrap">
    <h1>후기</h1>
    <form name="reviewform" class="reviewform" method="post" action="/save">
        <input type="hidden" name="rate" id="rate" value="0"/>
        <p class="title_star">별점과 리뷰를 남겨주세요.</p>
 
        <div class="review_rating">
            <div class="warning_msg">별점을 선택해 주세요.</div>
            <div class="rating">
                <!-- 해당 별점을 클릭하면 해당 별과 그 왼쪽의 모든 별의 체크박스에 checked 적용 -->
                <input type="checkbox" name="rating" id="rating1" value="1" class="rate_radio" title="1점">
                <label for="rating1"></label>
                <input type="checkbox" name="rating" id="rating2" value="2" class="rate_radio" title="2점">
                <label for="rating2"></label>
                <input type="checkbox" name="rating" id="rating3" value="3" class="rate_radio" title="3점" >
                <label for="rating3"></label>
                <input type="checkbox" name="rating" id="rating4" value="4" class="rate_radio" title="4점">
                <label for="rating4"></label>
                <input type="checkbox" name="rating" id="rating5" value="5" class="rate_radio" title="5점">
                <label for="rating5"></label>
            </div>
        </div>
        <div class="review_contents">
            <div class="warning_msg">5자 이상으로 작성해 주세요.</div>
            <textarea rows="10" class="review_textarea"></textarea>
        </div>   
        <div class="cmd">
            <button><input type="submit" name="save" id="save" value="등록"></button>
        </div>
    </form>
</div>
	
	</div>	
</body>
</html>
<input type="hidden" name="isLogOn" id="isLogOn" value="${isLogOn}"/>