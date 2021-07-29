<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"    isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:set var="movie"  value="${goodsMap.goodsVO}"  />
<c:set var="imageList"  value="${goodsMap.imageList }"  />
<c:set var="rate" value="${goodsMap.rate}"/>
 <%
     //치환 변수 선언합니다.
      //pageContext.setAttribute("crcn", "\r\n"); //개행문자
      pageContext.setAttribute("crcn" , "\n"); //Ajax로 변경 시 개행 문자 
      pageContext.setAttribute("br", "<br/>"); //br 태그
%>  
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<head>
<style>
body, hmtl{background: #ecf0f1;}

pre {
font-family : "맑은 고딕";
padding : 5;
}

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
#slide {
  position: relative;
  overflow: hidden;
  width: 500px;
  height: 400px;
  margin :auto;
}
#slide .cnt > li {
  position: absolute;
  top: 0;
  left: 500px;
  width: 500px;
  height: 400px;
  text-align: center;
  font-size: 30px;
  line-height: 300px;
  color: #fff;
}
#slide .btn > button {
  position: absolute;
  top: 50%;
  transform: translateY(-50%);
  border: 0;
  padding: 5px;
  background-color: #fff;
}
/*GLOBALS*/
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

#slide .btn .prev {
  left: 5px;
}

#slide .btn .next {
  right: 5px;
}

#slide .auto > button {
  display: none;
  position: absolute;
  bottom: 5px;
  right: 5px;
  border: 0;
  padding: 5px;
  background-color: #fff;
}

#slide .indi {
  position: absolute;
  bottom: 10px;
  left: 50%;
  transform: translateX(-50%);
}

#slide .indi:after {
  content: "";
  display: block;
  clear: both;
}

#slide .indi > li {
  float: left;
  margin-left: 5px;
  border-radius: 50%;
  width: 12px;
  height: 12px;
  cursor: pointer;
  opacity: 0.5;
  background-color: #fff;
}

#slide .indi > li.on {
  opacity: 1;
}

#slide .indi > li:first-child {
  margin-left: 0;
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

/* 별점 css*/
.wrap{
    width: 800px;
    margin: 0 auto; /* 화면 가운데로 */
    background-color: #ECF0F1;
    height: 60%;
    padding: 30px;
    box-sizing: border-box;

}
.reviewform {
	width : 700;
	height : 260;
	border:1px solid gray;
	border-radius: 5px;
	padding : 40;	
	font-family : "맑은 고딕";
	
	
}
.reviewform input{
    width: 700;
    padding: 10px;
    height: 50px;
	border: 1px solid gray;
	font-size: 15px;
	margin-top : 20;
	font-family : "맑은 고딕";
	
}

.reviewform p {
	font-family : "맑은 고딕";
	font-size : 16;
}

.reg input {
   height: 35px;
   font-size: 1rem;
   background-color: #d5e5e8;
   border: 1px solid #d5e5e8;
   width: 80;   
   padding : 10;
   font-family : "맑은 고딕";
   float : right;
}
.rating {
	text-align : center;
	padding-right : 20;
}
.rating .rate_radio {
    position: relative;
    display: inline-block;
    z-index: 20;
    opacity: 0.001;
    width: 30px;
    height: 30px;
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
    background-image: url('${contextPath}/resources/image/hh.png');
    background-repeat: no-repeat;
    background-size: 60px 60px;
    cursor: pointer;
    background-color:#fff;
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
.review_contents strong {
	font-size : 20;
	font-family : "맑은 고딕";
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
         //   $('#message').append(data);
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
   
   window.addEventListener("load", function () {
	     var MOVEING_PX = 4,
	       AUTO_TIME = 2000,
	       slide = document.getElementById("slide"),
	       indi = document.createElement("ul"),
	       slideCnt = slide.getElementsByClassName("cnt"),
	       slideCntItem = slideCnt[0].getElementsByTagName("li"),
	       prevBtn = slide.getElementsByClassName("prev"),
	       nextBtn = slide.getElementsByClassName("next"),
	       playBtn = slide.getElementsByClassName("play"),
	       stopBtn = slide.getElementsByClassName("stop"),
	       playSet = null,
	       before = 0,
	       after = 0,
	       moveIng = false;

	     // init
	     slideCntItem[0].style.left = 0;
	     playBtn[0].style.display = "block";
	     var indi = document.createElement("ul");
	     for (var i = 0; i < slideCntItem.length; i++) {
	       indi.innerHTML += "<li></li>";
	     }
	     indi.classList.add("indi");
	     indi.children[0].classList.add("on");
	     slide.append(indi);

	     for (var j = 0; j < indi.children.length; j++) {
	       indiClick(j);
	     }

	     // initEvnet
	     nextBtn[0].addEventListener("click", function (e) {
	       if (!moveIng) {
	         after++;
	         if (after >= slideCntItem.length) {
	           after = 0;
	         }
	         move(after, before, "next");
	         before = after;
	       }
	     });

	     prevBtn[0].addEventListener("click", function (e) {
	       if (!moveIng) {
	         after--;
	         if (after < 0) {
	           after = slideCntItem.length - 1;
	         }
	         move(after, before);
	         before = after;
	       }
	     });

	     playBtn[0].addEventListener("click", function () {
	       playBtn[0].style.display = "none";
	       stopBtn[0].style.display = "block";
	       playSet = setInterval(function () {
	         if (!moveIng) {
	           after++;
	           if (after >= slideCntItem.length) {
	             after = 0;
	           }
	           move(after, before, "next");
	           before = after;
	         }
	       }, AUTO_TIME);
	     });

	     stopBtn[0].addEventListener("click", function () {
	       playBtn[0].style.display = "block";
	       stopBtn[0].style.display = "none";
	       clearInterval(playSet);
	     });

	     function indiClick(target) {
	       indi.children[target].addEventListener("click", function () {
	         if (!moveIng) {
	           after = target;
	           if (after > before) {
	             move(after, before, "next");
	           } else if (after < before) {
	             move(after, before);
	           }
	           before = after;
	         }
	       });
	     }

	     function move(after, before, type) {
	       var nextX = type === "next" ? slide.offsetWidth : slide.offsetWidth * -1,
	         prevX = 0,
	         set = null;
	       set = setInterval(function () {
	         moveIng = true;
	         if (type === "next") {
	           nextX -= MOVEING_PX;
	           slideCntItem[after].style.left = nextX + "px";
	           if (nextX <= 0) {
	             clearInterval(set);
	             nextX = slide.offsetWidth;
	             moveIng = false;
	           }
	           prevX -= MOVEING_PX;
	         } else {
	           nextX += MOVEING_PX;
	           slideCntItem[after].style.left = nextX + "px";
	           if (nextX >= 0) {
	             clearInterval(set);
	             nextX = slide.offsetWidth * -1;
	             moveIng = false;
	           }
	           prevX += MOVEING_PX;
	         }
	         slideCntItem[before].style.left = prevX + "px";
	       });
	       indi.children[before].classList.remove("on");
	       indi.children[after].classList.add("on");
	     }
	   });
	   
	//별점 마킹 모듈 프로토타입으로 생성
	function Rating(){};
	Rating.prototype.rate = 0;
	Rating.prototype.setRate = function(newrate){
	    //별점 마킹 - 클릭한 별 이하 모든 별 체크 처리
	    this.rate = newrate;
	    let items = document.querySelectorAll('.rate_radio');
	    items.forEach(function(item, idx){
	        if(idx <= newrate){
	            item.checked = true;
	        }else{
	            item.checked = false;
	        }
	    });
	}
	let rating = new Rating();//별점 인스턴스 생성
		
//로그인 시 글등록 가능 	
	function reg_review(){
	      var _isLogOn=document.getElementById("isLogOn");
	      var isLogOn=_isLogOn.value;
	      var reviewform = document.reviewform;
	      
	       if(isLogOn=="false" || isLogOn=='' ){
	         alert("로그인 후 작성이 가능합니다.");	
	      	return;
	       }
	       else {
	    	   reviewform.submit();
	       }
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
               <td class="fixed"><strong>${movie.movie_title}</strong></td><td><ul>
   
         <li><a class="buy" href="${contextPath}/ticket/reservation.do">예매</a></li>
      </ul></td><tr class="dot_line">
            </tr>
            <tr>
               <td colspan="2" class="fixed">예매율 : <fmt:formatNumber value="${rate}" pattern="##.##"/>%</td><tr class="dot_line">
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
   <h4><pre>${movie.movie_content}</pre></h4>
   <hr>
   <p>
   <div class="clear"></div>
   <strong>스틸컷</strong>
   <div>
   
   </div>
    <div id="slide">
  <ul class="cnt"><c:forEach var="image" items="${imageList}">
   <li><img class="slide1" width="500" height="320" src="${contextPath}/download.do?movie_id=${movie.movie_id}&image_file_name=${image.image_file_name}"/>
    </li></c:forEach>
  </ul>
  <div class="btn">
    <button type="button" class="prev">prev</button>
    <button type="button" class="next">next</button>
  </div>
  <div class="auto">
    <button type="button" class="stop">stop</button>
    <button type="button" class="play">play</button>
  </div>
</div>
       
   <hr>
   <div class="clear">
   <strong>실관람평</strong>
<div class="wrap">
    <br>
    <form name="reviewform" class="reviewform" method="post" action="${contextPath}/goods/myReview.do">
        <input type="hidden" name="rate" id="rate" value="0"/>
        <p>${movie.movie_title}&emsp;재미있게 보셨나요? 영화의 어떤 점이 좋았는지 이야기해주세요.<br><br> 
        <div class="review_rating">
            <div class="rating">
                <!-- 해당 별점을 클릭하면 해당 별과 그 왼쪽의 모든 별의 체크박스에 checked 적용 -->
                <input type="checkbox" name="review_score" id="rating1" value="1" class="rate_radio" title="1점">
                <label for="rating1"></label>
                <input type="checkbox" name="review_score" id="rating2" value="1" class="rate_radio" title="2점">
                <label for="rating2"></label>
                <input type="checkbox" name="review_score" id="rating3" value="1" class="rate_radio" title="3점" >
                <label for="rating3"></label>
                <input type="checkbox" name="review_score" id="rating4" value="1" class="rate_radio" title="4점">
                <label for="rating4"></label>
                <input type="checkbox" name="review_score" id="rating5" value="1" class="rate_radio" title="5점">
                <label for="rating5"></label>
            </div>
        </div>
 
        
        <div class="review_contents">      
        <input type="hidden" name="member_id" value="${memberInfo.member_id}"/><p>
        <input type="hidden" name="movie_title" value="${movie.movie_title}"/><p>     
			<input type="text" name="review_content" size="100" title="관람평" placeholder="5자 이상 작성해 주세요.">&emsp;
        </div>   
            <div class="reg"><input type="button" value="등록" onClick="reg_review()"></div>
                          
    </form>
</div>
   
   </div>   
</body>
</html>
 <input type="hidden" name="isLogOn" id="isLogOn" value="${isLogOn}"/> 