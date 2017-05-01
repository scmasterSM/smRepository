<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="company is a free job board template">
    <meta name="keyword" content="html, css, bootstrap, job-board">
    <meta name="author" content="Ohidul">

<!-- Bootstrap Core CSS -->
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800'
	rel='stylesheet' type='text/css'>

<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
<link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
<link rel="icon" href="favicon.ico" type="image/x-icon">

<link rel="stylesheet" href="./resources/css/normalize.css">
<link rel="stylesheet" href="./resources/css/font-awesome.min.css">
<link rel="stylesheet" href="./resources/css/fontello.css">
<link rel="stylesheet" href="./resources/css/animate.css">
<link rel="stylesheet" href="./resources/css/bootstrap.css">
<link rel="stylesheet" href="./resources/css/owl.carousel.css">
<link rel="stylesheet" href="./resources/css/owl.theme.css">
<link rel="stylesheet" href="./resources/css/owl.transitions.css">
<link rel="stylesheet" href="./resources/css/style.css">
<link rel="stylesheet" href="./resources/css/responsive.css">
<!--Stylesheets-->
<link href="./resources/css/jquery.modal.css" type="text/css" rel="stylesheet" />
<script src="./resources/js/vendor/modernizr-2.6.2.min.js"></script>
<!-- Custom CSS -->
<link href="./resources/css/08bootstrap/css/bootstrap.css" rel="stylesheet">    
<link href="./resources/css/08bootstrap/css/blog-post.css" rel="stylesheet">
<!-- <script src="./resources/js/jquery-3.1.1.js"></script> -->
<script src="./resources/js/jquery.min.js"></script>
<%-- <script type="text/javascript"src="<c:url value="/resources/js/jquery-3.1.1.js"/>"></script> --%>
<!-- jQuery -->
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="./resources/js/jquery.modal.js"></script> 

  	
<link rel ="stylesheet" href ="./resources/css/08css.css"> 
 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>sc_08행사 상세 정보 화면</title>
<link rel ="stylesheet" href ="./resources/css/08css.css">
 
<script	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCW-Yin1kq0i_E_hqmkCdFXNWIaJLRoUN8"></script>
<script src="./resources/js/bootstrap.js"></script>
<script src="./resources/js/owl.carousel.min.js"></script>
<script src="./resources/js/wow.js"></script>
<script src="./resources/js/main.js"></script>

<style type="text/css">
html, body {
	overflow-x: hidden;
}
.modal-backdrop {
   z-index: 0;
}
</style>

  		
<script type="text/javascript">
function shuffle(array) {
	  var currentIndex = array.length, temporaryValue, randomIndex;

	  // While there remain elements to shuffle...
	  while (0 !== currentIndex) {

	    // Pick a remaining element...
	    randomIndex = Math.floor(Math.random() * currentIndex);
	    currentIndex -= 1;

	    // And swap it with the current element.
	    temporaryValue = array[currentIndex];
	    array[currentIndex] = array[randomIndex];
	    array[randomIndex] = temporaryValue;
	  }

	  return array;
	}



//정보수정 모달
$('#myModal_Edit').modal('show');

//로그아웃 버튼 클릭시 처리 함수 
function logout(){
	location.href = "logout";
};


window.onload=function(){
	l_Data();
	r_Data();
	f_Data()
    };
function pagingFormSubmit(currentPage) { //currentPage가 어디서 호출되어 온다
	var form=document.getElementById("pagingForm");
	var page=document.getElementById("page"); 
	page.value=currentPage; 
	paging(page.value);
};

var login_id='${sessionScope.user_id}';

var check = 0;
var inner = null;
var updatenum = 0;

function replyUpdateForm(REV_SQ, CONTENT_ID){
   
   if(check == 1 && REV_SQ == updatenum){
      document.getElementById(REV_SQ).innerHTML = inner;
      check=0;
      return;
   };
   
   if(updatenum != REV_SQ && updatenum != ''){
      document.getElementById(updatenum).innerHTML = inner;
   };
   
   
   updatenum = REV_SQ;
   inner = document.getElementById(REV_SQ).innerHTML;
   
   document.getElementById(REV_SQ).innerHTML =     
      "<textarea class='form-control' name='text' id='reply' rows='3'>"+inner+"</textarea>"
      +"<a href='#' class='btn btn-primary' onclick='replyUpdate("+REV_SQ+","+CONTENT_ID+"); return false'>수정</a>";
   check = 1;
};

function replyUpdate(REV_SQ, CONTENT_ID){
   
   text = $("#reply").val();
   console.log(text);
   $.ajax({
      
      type : "post",
      url : "updateReview",
      data : {
    	 REV_TXT : text,
         REV_SQ : REV_SQ,
         CONTENT_ID : CONTENT_ID
      },
      success : function(data){
         
         console.log(data);
          var html ="";
         
          $.each(data,function(index,item){
             console.log(item);
             
            html+= "<div class='media'>";
            html+= "<a class='pull-left' href='#'>";
            if(item.USER_SEX=='M'){
  	          html+= '<img class="media-object" src="./resources/img/icon/manicon.png" width=64 height=64 alt=""></a>';		        	  
  	          }else if(item.USER_SEX=='F'){
  	          html+= '<img class="media-object" src="./resources/img/icon/womanicon.png" width=64 height=64 alt=""></a>';
  	          }
            html+= '<div class="media-body">';
            html+= '<div class="media-heading"><h4>'+item.USER_ID;
            html+= '<small>'+item.UPD_YMD;
            if(login_id == item.USER_ID){
            html+= '<a href="javascript:replyUpdateForm('+item.REV_SQ+','+item.CONTENT_ID+')"> 수정 </a>';
            html+= '<a href="#none" onclick="deleteReply('+item.REV_SQ+','+item.CONTENT_ID+')"> 삭제 </a>';
            }
            html+= "</small></h4></div>";
            html+= "<pre>";
            html+= "<div id='"+item.REV_SQ+"'class='review_txt'>"+item.REV_TXT+"</div>"; 
			html+= "</pre></div></div>"; 
          });
          $("#review").html(html); 
             
      },
      error : function(e){
         console.log(e);
         }
   })   
   
   check=0;
   updatenum = 0;
};

function deleteReply(REV_SQ, CONTENT_ID){
	
	$.ajax({
		
		type : "post",
		url : "deleteReview",
		data : {
			REV_SQ : REV_SQ,
	        CONTENT_ID : CONTENT_ID
		},
		success : function(data){
			console.log(data);
			var html ="";
			var html2 ="";
				$.each(data.rList, function(index,item){
					   
	                  html+= "<div class='media'>";
	                  html+= "<a class='pull-left' href='#'>";
	                  if(item.USER_SEX=='M'){
	        	          html+= '<img class="media-object" src="./resources/img/icon/manicon.png" width=64 height=64 alt=""></a>';		        	  
	        	          }else if(item.USER_SEX=='F'){
	        	          html+= '<img class="media-object" src="./resources/img/icon/womanicon.png" width=64 height=64 alt=""></a>';
	        	          }
	                  html+= '<div class="media-body">';
	                  html+= '<div class="media-heading"><h4>'+item.USER_ID;
	                  html+= '<small>'+item.UPD_YMD; 
	                  if(login_id == item.USER_ID){
	                      html+= '<a href="javascript:replyUpdateForm('+item.REV_SQ+','+item.CONTENT_ID+')"> 수정 </a>';
	                      html+= '<a href="#none" onclick="deleteReply('+item.REV_SQ+','+item.CONTENT_ID+')"> 삭제 </a>';
	                      }
	                  html+= "</small></h4></div>";
	                  html+= "<pre>";
	                  html+= "<div id='"+item.REV_SQ+"'class='review_txt'>"+item.REV_TXT+"</div>"; 
	      			  html+= "</pre></div></div>";
	                });
	                  html2+='<div align="center">';
	                  var bigpageback=data.navi.currentPage - data.navi.pagePerGroup;
	                  html2+='<a href ="javascript:pagingFormSubmit('+bigpageback +')">◀◀ </a>';
	                  var onepageback=data.navi.currentPage -1
	                  html2+='<a href ="javascript:pagingFormSubmit('+onepageback+')">◀ </a>';
	                  var j=0;
	                  for( var i = data.navi.startPageGroup ; i <= data.navi.endPageGroup ; i++){
	                	  var counter=data.navi.startPageGroup+j;
	                      j=j+1;
	                      html2+='<a href="javascript:pagingFormSubmit('+counter+')">'+i+' </a>'; 
	                  } 
	                  html2+='<a href="javascript:pagingFormSubmit('+(data.navi.currentPage + 1)+')">▶ </a>';
	                  html2+='<a href="javascript:pagingFormSubmit('+(data.navi.currentPage + data.navi.pagePerGroup)+')">▶▶</a></div>';
	                  html2+='<form action="SC_08" method="get" id="pagingForm">';
	                  html2+='<input type="hidden" id="page" name="page">';
	                  html2+='<input type="hidden" id="CONTENT_ID" name="CONTENT_ID" value="${contentid}">';	                  
	                  html2+='</form></div>'; 
	                
	                $("#review").html(html);
	                $("#paging").html(html2);

			$("#replytable").html(html);
		},
		error : function(e){
			console.log(e);
		}
	});
		
};

 
var map;
var myLatLng;
var CONTENT_ID;
//var key = "fHPwwCqceBLnLCExz65uYIYEAdiAs6xOwv79o6FcLHh7x6iPmxITE9Wk7TqH1q%2F1%2FeSw9j%2FUxPbGiQYcnVa0zw%3D%3D";
var key = "2pTN6y%2BhCGaVQL97quhdeM%2FW9ezdUvBNytbkKoT323qbc%2Ff5ao8fYoW2C31AgwacBVhy7PYHqvuwcnzprU4%2BNw%3D%3D";	
    //장소바꿀때 전 단계에서 contentId를 받아와서 바꾸면 될듯
	
    var contentId=${contentid};
    var contentTypeId=15;
  	var areaCode;
  	var sigunguCode;
    var lat;
  	var lng;
  	
  	//행사 기본정보 가져오는 API
    var url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?ServiceKey="+key;
    url += "&mapX&mapY";
    url += "&contentTypeId=15&contentId="+contentId+"&areaCode&sigunguCode&cat1=&cat2=&cat3=&listYN=Y";
    url += "&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&transGuideYN=Y&_type=json";
	
    //행사 날짜 가져오는 API	
    var url2= "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailIntro?ServiceKey="+key;
    	url2 +=	"&contentTypeId=15&contentId="+contentId+"&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&introYN=Y&_type=json"; 
    	
    

function l_Data(){


    console.log(url);
    $.getJSON(url, function(data) {
    	myLatLng={
    			lat : parseFloat(data.response.body.items.item.mapy),
    			lng : parseFloat(data.response.body.items.item.mapx)
    	}
    	
    	var CONTENT_ID=data.response.body.items.item.title;
    	var areacode=data.response.body.items.item.areacode;
    	var sigungucode=data.response.body.items.item.sigungucode;
    	
    	initMap(myLatLng,data);
        console.log('success', data);
        /* for( var i = 0 ; i < data.response.body.totalCount ; i++){
            console.log( data.response.body.items.item[i] );
        }    */
        
        //행사 지역이름 추출
        var addr=data.response.body.items.item.addr1;
        var addr1=addr.split(" ",2);
        console.log(addr1[0]);
        console.log(addr1[1]);
        //var addr2 = addr1.split()
        
       if(addr1[0] == '서울특별시'){
    	    addr1[0] = 'SEOUL';
        	addr1[1] = '서울';
        	sigungucode = '%27%27';
        }else if(addr1[0] == '인천광역시'){
        	addr1[0] = 'INCHEON';
        	addr1[1] = '인천';
        	sigungucode = '%27%27';
        }else if(addr1[0] == '부산광역시'){
        	addr1[0] = 'BUSAN';
        	addr1[1] = '부산';
        	sigungucode = '%27%27';
        }else if(addr1[0] == '대전광역시'){
        	addr1[0] = 'DEAJOEN';
        	addr1[1] = '대전';
        	sigungucode = '%27%27';
        }else if(addr1[0] == '대구광역시'){
        	addr1[0] = 'DEAGU';
        	addr1[1] = '대구';
        	sigungucode = '%27%27';
        }else if(addr1[0] == '광주광역시'){
        	addr1[0] = 'GWANGJU';
        	addr1[1] = '광주';
        	sigungucode = '%27%27';
        }else if(addr1[0] == '울산광역시'){
        	addr1[0] = 'ULSAN';
        	addr1[1] = '울산';
        	sigungucode = '%27%27';
        }else if(addr1[0] == '제주특별자치도'){
        	addr1[0] = 'JEJUDO';
        	addr1[1] = '제주도';
        	sigungucode = '%27%27';
        }else if(addr1[0] == '세종특별자치시'){
        	addr1[0] = 'SEJONG';
        	addr1[1] = '세종시';
        	sigungucode = '%27%27';
        }
        
        
        
        
        console.log(data.response.body.items.item);
        $("#placeName").html(data.response.body.items.item.title);
        if (typeof (data.response.body.items.item.firstimage) !== "undefined") {
        $("#placeImg").html('<img src='+data.response.body.items.item.firstimage+'>');
        }else{
        	$("#placeImg").html('<img src="./resources/image/noimage.jpg">');	
        }
        $("#placeInfo").html(data.response.body.items.item.overview);
       
        $("#addr").html('<a href="sc_05?areacode='+areacode+'&sigungucode='+sigungucode+'&city_nm='+addr1[1]+'">'+addr1+'</a>'); //areacode드를 보내 주면 될듯       	
        
    });
        
	    var html ="";
	    $.getJSON(url2, function(data) {
	    	console.log('success', data);
	    	console.log(data.response.body.items.item.eventstartdate);
	    	if (typeof(data.response.body.items.item.playtime) !== "undefined") {
	   		html += "<h4>행사일정 : "+data.response.body.items.item.playtime+"</h4>";	   		
	    	}else if(typeof(data.response.body.items.item.eventstartdate)!=="undefined" ){
	    	html += "<h4>행사일정 : "+data.response.body.items.item.eventstartdate+"~"+data.response.body.items.item.eventenddate+"</h4>";
	    	}
	    	
	    	$("#eventDate").html(html);
	    }); 
    
};

//주변 관광지
function r_Data(){
		 $.getJSON(url, function(data) {
			areacode=data.response.body.items.item.areacode;
		    sigungucode=data.response.body.items.item.sigungucode;
			 
		 
		var cTypeId; 
		//console.log(areacode); 
		//console.log(sigungucode); 
		
		var url3= "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey="+key;
		url3 += "&contentTypeId=12&areaCode=" + areacode + "&sigunguCode=" + sigungucode + "&cat1=&cat2=&cat3=&listYN=Y";
		url3 += "&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=Q&numOfRows=100"; 
	    
		$.getJSON(url3, function(data) {
			var length=data.response.body.items.item.length
			//console.log('success', data);
			var j=0;
		    console.log( data.response.body.items.item.length);
		        var tempArray = []; //내가 넣은 것
		        var outputArray = [];
		        
		        for(var l=0; l < length; l++){       	
		        tempArray.push(data.response.body.items.item[l]);
		        //console.log(tempArray);
		        }
		        //console.log(tempArray);
		        tempArray = shuffle(tempArray);
		        console.log(tempArray);
		                
				for( var i = 0 ; i < 3 ; i++){
					var j=j+1;
					var con= tempArray[i].contentid;
		           	var conType=tempArray[i].contenttypeid;
		           /* 	var con= data.response.body.items.item[i].contentid; */
		           /* 	var conType=data.response.body.items.item[i].contenttypeid; */
		           	
		           	
		           	console.log(con);
		           	console.log(conType);
					if (typeof (tempArray[i].firstimage) !== "undefined") {
						$("#rplaceImg"+ j).html('<a href="SC_07place?CONTENT_ID='+con+'&CONTENT_TYPE_ID='+conType+'"><img src='+tempArray[i].firstimage+' width=60 height=60></a>');
		        		$("#rplacetitle"+ j).html('<a href="SC_07place?CONTENT_ID='+con+'&CONTENT_TYPE_ID='+conType+'">'+tempArray[i].title.split("(",1))+'</a>';
						$("#rplaceaddr"+ j).html(tempArray[i].addr1); 
					}else{
						$("#rplaceImg"+ j).html('<a href="SC_07place?CONTENT_ID='+con+'&CONTENT_TYPE_ID='+conType+'"><img src="./resources/image/noimage.jpg" width=60 height=60></a>');
		        		$("#rplacetitle"+ j).html('<a href="SC_07place?CONTENT_ID='+con+'&CONTENT_TYPE_ID='+conType+'">'+tempArray[i].title.split("(",1))+'</a>';
						$("#rplaceaddr"+ j).html(tempArray[i].addr1); 
					}
				}//for
		  })// joson
	    
		
		
		 });
};
//인근 음식점
function f_Data(){
	 $.getJSON(url, function(data) {
		areacode=data.response.body.items.item.areacode;
	    sigungucode=data.response.body.items.item.sigungucode;
		 
	 
	var cTypeId; 
	//console.log(areacode); 
	//console.log(sigungucode); 
	
	var url3= "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey="+key;
	url3 += "&contentTypeId=39&areaCode=" + areacode + "&sigunguCode=" + sigungucode + "&cat1=&cat2=&cat3=&listYN=Y";
	url3 += "&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=Q&numOfRows=100"; 
   
   
	$.getJSON(url3, function(data) {
		var length=data.response.body.items.item.length
		//console.log('success', data);
		var j=0;
	    console.log( data.response.body.items.item.length);
	        var tempArray = []; //내가 넣은 것
	        var outputArray = [];
	        
	        for(var l=0; l < length; l++){       	
	        tempArray.push(data.response.body.items.item[l]);
	        //console.log(tempArray);
	        }
	        //console.log(tempArray);
	        tempArray = shuffle(tempArray);
	        console.log(tempArray);
	                
			for( var i = 0 ; i < 3 ; i++){
				var j=j+1;
				var con= tempArray[i].contentid;
	           	var conType=tempArray[i].contenttypeid;
	           /* 	var con= data.response.body.items.item[i].contentid; */
	           /* 	var conType=data.response.body.items.item[i].contenttypeid; */
	           	console.log(con);
	           	console.log(conType);
				if (typeof (tempArray[i].firstimage) !== "undefined") {
					$("#resImg"+ j).html('<a href="SC_07place?CONTENT_ID='+con+'&CONTENT_TYPE_ID='+conType+'"><img src='+tempArray[i].firstimage+' width=60 height=60></a>');
	        		$("#restitle"+ j).html('<a href="SC_07place?CONTENT_ID='+con+'&CONTENT_TYPE_ID='+conType+'">'+tempArray[i].title.split("(",1))+'</a>';
					$("#resaddr"+ j).html(tempArray[i].addr1); 
				}else{
					$("#resImg"+ j).html('<a href="SC_07place?CONTENT_ID='+con+'&CONTENT_TYPE_ID='+conType+'"><img src="./resources/image/noimage.jpg" width=60 height=60></a>');
	        		$("#restitle"+ j).html('<a href="SC_07place?CONTENT_ID='+con+'&CONTENT_TYPE_ID='+conType+'">'+tempArray[i].title.split("(",1))+'</a>';
					$("#resaddr"+ j).html(tempArray[i].addr1); 
				}
			}//for
	  })// joson
	
	 });
}


	function initMap(myLatLng,data) {
  map = new google.maps.Map(document.getElementById('map'), {
    center: myLatLng,
    zoom: 15
  });
  showmaker(data)
} 
 function showmaker(data){
	 marker = new google.maps.Marker({
		    position: myLatLng,
		    map: map,  		   
		   	draggable: false,
	    	animation: google.maps.Animation.DROP 
		  }); 
 }
 
 $(function(){
		
	//정보수정
		
		$("#editForm").on("click", function() {

			var user_id2 = $("#user_id_ed").val();
			var password2 = $("#password1_ed").val();
			var password3 = $("#password2_ed").val();
			var email1 = $("#email_ed").val();
			var user_sex1 = $("#user_sex_ed").val();


			//alert(user_sex1);
			//$('#user_sex option:selected').val();
			//$('select[name=user_sex]').val();


			if (password2.length == 0) {
				alert('비밀번호를 입력해주세요');
				return false;
			}
			if (email1.length == 0) {
				alert('이메일을 입력해주세요');
				return false;
			}

			if (password2 != password3) {
				alert('비밀번호 확인 시 비밀번호가 일치하지 않습니다.');
				return false;
			}

			$.ajax({
				type : "post",
				url : "edit",
				data : {
					user_id : user_id2,
					password : password2,
					email : email1,
					//user_sex : user_sex1
				},
				dataType : 'text',

				success : function(data) {
					console.log(data);
					if (data == "success") {
						alert("회원 정보 수정 되었습니다.");
						$('#myModal').modal('hide');
						window.location.href = "./";
					} else {
						alert("정보 수정이 실패하였습니다.");
					}
				},
				error : function(e) {
					console(e);
				}
			})
		});
	 
	 $("#write").on("click",function(){ 

			$.getJSON(url, function(data) {
			console.log(data.response.body.items.item)
			var REV_TXT = $("#reviewWrite").val();
			var CONTENT_ID = data.response.body.items.item.contentid;
			
			if(CONTENT_ID.length ==0 || REV_TXT.length ==0) {
				alert("데이터를 입력해 주세요");
				return;
			} 
		 
			/* console.log(reviewData); */
			$.ajax({
				
				type : "post",
				url : "writeReview",
				data :{
					CONTENT_ID : CONTENT_ID
					,REV_TXT : REV_TXT	
				},
				
				success : function(data){
					
					console.log(data);
					 var html ="";
					 var html2 ="";
					 $.each(data.rList,function(index,item){
						  
						 html+= "<div class='media'>";
		                 html+= "<a class='pull-left' href='#'>";
		                 if(item.USER_SEX=='M'){
		       	          html+= '<img class="media-object" src="./resources/img/icon/manicon.png" width=64 height=64 alt=""></a>';		        	  
		       	          }else if(item.USER_SEX=='F'){
		       	          html+= '<img class="media-object" src="./resources/img/icon/womanicon.png" width=64 height=64 alt=""></a>';
		       	          }
		                 html+= '<div class="media-body">';
		                 html+= '<div class="media-heading"><h4>'+item.USER_ID;
		                 html+= '<small>'+item.UPD_YMD;
		                 if(login_id == item.USER_ID){
		                     html+= '<a href="javascript:replyUpdateForm('+item.REV_SQ+','+item.CONTENT_ID+')"> 수정 </a>';
		                     html+= '<a href="#none" onclick="deleteReply('+item.REV_SQ+','+item.CONTENT_ID+')"> 삭제 </a>';
		                     }
		                 html+= "</small></h4></div>";
		                 html+= "<pre>";
		                 html+= "<div id='"+item.REV_SQ+"'class='review_txt'>"+item.REV_TXT+"</div>"; 
		      			 html+= "</pre></div></div>";
					 });
						html2+='<div align="center">';
						var bigpageback=data.navi.currentPage - data.navi.pagePerGroup;
						html2+='<a href ="javascript:pagingFormSubmit('+bigpageback +')">◀◀</a>';
						var onepageback=data.navi.currentPage -1
						html2+='<a href ="javascript:pagingFormSubmit('+onepageback+')">◀</a>';
						var j=0;
						 for( var i = data.navi.startPageGroup ; i <= data.navi.endPageGroup ; i++){
							 var counter=data.navi.startPageGroup+j;
		                      j=j+1;
		                      html2+='<a href="javascript:pagingFormSubmit('+counter+')">'+i+' </a>'; 
						} 
						html2+='<a href="javascript:pagingFormSubmit('+(data.navi.currentPage + 1)+')">▶</a>';
						html2+='<a href="javascript:pagingFormSubmit('+(data.navi.currentPage + data.navi.pagePerGroup)+')">▶▶</a></div>';
						html2+='<form action="read_Review" method="post" id="pagingForm">';
						html2+='<input type="hidden" id="page" name="page">';
						html2+='<input type="hidden" id="CONTENT_ID" name="CONTENT_ID" value="${contentid}">';
						
						html2+='</form></div>';
					 
					 
					 
					 $("#review").html(html);
					 $("#paging").html(html2);
					 $('#reviewWrite').val('');		
				},
				error : function(e){
					console.log(e);
				}
				
			});

			});
		});
		
	});
$(function(){
		$("#clip").on("click",function(){
				console.log(contentId);
				var conID = contentId;
				var conTypeID=contentTypeId;
			$.ajax({
				type : "POST",
				url : "clipBoard",
				data :{
					CONTENT_ID : conID
					,CONTENT_TYPE_ID : conTypeID	
				},
				
				success : function(data){
					console.log(data);
					
			               if(data==1){
			               	modal({
			       				type: 'success',
			       				title: '클립성공',
			       				text: '클립보드에 저장되었습니다!',
			               	}); 
			               }else{
			            	   modal({
			       				type: 'error',
			       				title: '클립취소',
			       				text: '클립을 해제하였습니다!',
			       			});
			               }
					
				},
				error : function(e){
					console.log(e);
				}
					
				
			})			
		});
		
	});	

function locationObj(){
    var offset = $("#reviewWrite").offset();
    $('html, body').animate({scrollTop : offset.top}, 400);
}

function paging(page) { 
	$.ajax({ 
        type : "post",
        url : "read_Review",
        data :{
           CONTENT_ID : contentId,
           page : page
        },
        
        success : function(data){
           
           console.log(data);
            var html ="";
            var html2 ="";
            $.each(data.rList,function(index,item){
              console.log(item); 
              html+= "<div class='media'>";
              html+= "<a class='pull-left' href='#'>";
              if(item.USER_SEX=='M'){
    	          html+= '<img class="media-object" src="./resources/img/icon/manicon.png" width=64 height=64 alt=""></a>';		        	  
    	          }else if(item.USER_SEX=='F'){
    	          html+= '<img class="media-object" src="./resources/img/icon/womanicon.png" width=64 height=64 alt=""></a>';
    	          }
              html+= '<div class="media-body">';
              html+= '<div class="media-heading"><h4>'+item.USER_ID;
              html+= '<small>'+item.UPD_YMD;
              if(login_id == item.USER_ID){
                  html+= '<a href="javascript:replyUpdateForm('+item.REV_SQ+','+item.CONTENT_ID+')"> 수정 </a>';
                  html+= '<a href="#none" onclick="deleteReply('+item.REV_SQ+','+item.CONTENT_ID+')"> 삭제 </a>';
                  }
              html+= '</small></h4></div>';
              html+= '<pre>';
              html+= "<div id='"+item.REV_SQ+"'class='review_txt'>"+item.REV_TXT+"</div>"; 
  				html+= "</pre></div></div>";
            });
              html2+='<div align="center">';
              var bigpageback=data.navi.currentPage - data.navi.pagePerGroup;
              html2+='<a href ="javascript:pagingFormSubmit('+bigpageback +')">◀◀ </a>';
              var onepageback=data.navi.currentPage -1
              html2+='<a href ="javascript:pagingFormSubmit('+onepageback+')">◀ </a>';
              var j=0;
              for( var i = data.navi.startPageGroup ; i <= data.navi.endPageGroup ; i++){
            	  var counter=data.navi.startPageGroup+j;
                  j=j+1;
                  html2+='<a href="javascript:pagingFormSubmit('+counter+')">'+i+' </a>'; 
              } 
              html2+='<a href="javascript:pagingFormSubmit('+(data.navi.currentPage + 1)+')">▶ </a>';
              html2+='<a href="javascript:pagingFormSubmit('+(data.navi.currentPage + data.navi.pagePerGroup)+')">▶▶</a></div>';
              html2+='<form action="read_Review" method="post" id="pagingForm">';
              html2+='<input type="hidden" id="page" name="page">';
              html2+='<input type="hidden" id="CONTENT_ID" name="CONTENT_ID" value="${contentid}">';
              html2+='<input type="hidden" id="CONTENT_TYPE_ID" name="CONTENT_TYPE_ID" value="${contypeid}">';
              html2+='</form></div>'; 
            
            $("#review").html(html);
            $("#paging").html(html2);
            $('#reviewWrite').val('');      
        },
        error : function(e){
           console.log(e);
        }   
     });
};

$(function(){	

$.ajax({
    
    type : "post",
    url : "read_Review",
    data :{
       CONTENT_ID : contentId            
    },
    
    success : function(data){
       
       console.log(data);
        var html ="";
        var html2 ="";
        $.each(data.rList,function(index,item){
          console.log(item); 
          html+= "<div class='media'>";
          html+= "<a class='pull-left' href='#'>";
          if(item.USER_SEX=='M'){
	          html+= '<img class="media-object" src="./resources/img/icon/manicon.png" width=64 height=64 alt=""></a>';		        	  
	          }else if(item.USER_SEX=='F'){
	          html+= '<img class="media-object" src="./resources/img/icon/womanicon.png" width=64 height=64 alt=""></a>';
	          }
          html+= '<div class="media-body">';
          html+= '<div class="media-heading"><h4>'+item.USER_ID;
          html+= '<small>'+item.UPD_YMD;
          if(login_id == item.USER_ID){
              html+= '<a href="javascript:replyUpdateForm('+item.REV_SQ+','+item.CONTENT_ID+')"> 수정 </a>';
              html+= '<a href="#none" onclick="deleteReply('+item.REV_SQ+','+item.CONTENT_ID+')"> 삭제 </a>';
              }
          html+= '</small></h4></div>';
          html+= '<pre>';
          html+= "<div id='"+item.REV_SQ+"'class='review_txt'>"+item.REV_TXT+"</div>"; 
				html+= "</pre></div></div>";
        });
          html2+='<div align="center">';
          var bigpageback=data.navi.currentPage - data.navi.pagePerGroup;
          html2+='<a href ="javascript:pagingFormSubmit('+bigpageback +')">◀◀ </a>';
          var onepageback=data.navi.currentPage -1
          html2+='<a href ="javascript:pagingFormSubmit('+onepageback+')">◀ </a>';
          var j=0;
          for( var i = data.navi.startPageGroup ; i <= data.navi.endPageGroup ; i++){
        	  var counter=data.navi.startPageGroup+j;
              j=j+1;
              html2+='<a href="javascript:pagingFormSubmit('+counter+')">'+i+' </a>'; 
          } 
          html2+='<a href="javascript:pagingFormSubmit('+(data.navi.currentPage + 1)+')">▶ </a>';
          html2+='<a href="javascript:pagingFormSubmit('+(data.navi.currentPage + data.navi.pagePerGroup)+')">▶▶</a></div>';
          html2+='<form action="read_Review" method="post" id="pagingForm">';
          html2+='<input type="hidden" id="page" name="page">';
          html2+='<input type="hidden" id="CONTENT_ID" name="CONTENT_ID" value="${contentid}">';
          html2+='<input type="hidden" id="CONTENT_TYPE_ID" name="CONTENT_TYPE_ID" value="${contypeid}">';
          html2+='</form></div>'; 
        
        $("#review").html(html);
        $("#paging").html(html2);
        $('#reviewWrite').val('');      
    },
    error : function(e){
       console.log(e);
    }   
 });
});

</script>

</head>
<body>
 

 <!-- Navigation -->
<div id="preloader">
		<div id="status">&nbsp;</div>
	</div>
	<!-- Body content -->
	<div class="header-connect">
		<div class="container">
			<div class="row">
				<div class="col-md-5 col-sm-8 col-xs-8">
					<div class="header-half header-call"></div>
				</div>
				<div
					class="col-md-2 col-md-offset-5  col-sm-3 col-sm-offset-1  col-xs-3  col-xs-offset-1">
					<c:choose>
						<c:when test="${sessionScope.user_id == null }">
							<div class="header-half header-social">
								<!-- 	<ul class="list-inline">
							<li><a href="autoLogin">연습</a></li>
						</ul> -->
							</div>
						</c:when>
						<c:otherwise>
							<div class="header-half header-social">
								<ul class="list-inline">
									<li><img src="./resources/image/login_img.png">
										${sessionScope.user_id }</li>
								</ul>
							</div>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</div>

	<nav class="navbar navbar-default">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">

				<a href="home"><img src="./resources/image/logoicon.png" alt=""
					width="80px" height="80px"></a><img
					src="./resources/image/main_logo.png" alt="">

				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<!-- <a class="navbar-brand" href="#">
				</a> -->

			</div>
			<!-- 	<br> <br> -->
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<div class="button navbar-right">
					<c:choose>
						<c:when test="${sessionScope.user_id == null }">
							<button type="button" id="loginForm"
								class="navbar-btn nav-button wow bounceInRight login"
								data-toggle="modal" data-target="#myModal" id="loginForm"
								data-wow-delay="0.8s">Login</button>
							<button type="button"
								class="navbar-btn nav-button wow fadeInRight"
								data-toggle="modal" data-target="#myModal" id="joinForm"
								data-wow-delay="0.6s">Join</button>
						</c:when>
						<c:otherwise>
							<button type="button" id="Edit"
								class="navbar-btn nav-button wow bounceInRight login"
								data-toggle="modal" data-target="#myModal_Edit" id="editForm"
								data-wow-delay="0.8s">Edit</button>
							<button type="button"
								class="navbar-btn nav-button wow fadeInRight" id="logout"
								data-wow-delay="0.6s" onclick="logout()">logout</button>
						</c:otherwise>
					</c:choose>
					<!--정보수정 모달 시작  -->
					<div class="modal fade" id="myModal_Edit" tabindex="-1"
						role="dialog" aria-labelledby="myLargeModalLabel"
						aria-hidden="true">
						<div class="modal-dialog modal-lg editModal">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">×</button>

									<h4 class="modal-title" id="myModalLabel">Edit my
										information</h4>
								</div>
								<div class="modal-body">
									<div class="row">
										<div class="col-md-12"
											style="padding-right: 30px;">
											<!-- Nav tabs -->
											<ul class="nav nav-tabs headertabs">
												<li class="active"><a href="#Login" id="loginAtag"
													data-toggle="tab">Edit</a></li>
												<!-- <li><a href="#Registration" id="regAtag" data-toggle="tab">Join</a></li> -->
											</ul>
											<!-- Tab panes -->
											<div class="tab-content">
												<div class="tab-pane active" id="Edit">
													<form role="form" class="form-horizontal">
														<div class="form-group">
															<label for="email" class="col-sm-2 control-label">
																ID</label>
															<div class="col-sm-10">
																<div class="row">
																	<div class="col-md-3">
																		<select class="form-control" id="user_sex_ed" disabled="disabled">
																			<option value="">${sessionScope.user_sex}</option>
																		</select>
																	</div>
																	<div class="col-md-9">
																		<input type="text" class="form-control"
																			id="user_id_ed" name="user_id_ed" placeholder="ID" value="${sessionScope.user_id}" disabled="disabled" />
																	</div>
																</div>
															</div>
														</div>
														<div class="form-group">
															<label for="email" class="col-sm-2 control-label">
																Email</label>
															<div class="col-sm-10">
																<input type="email" class="form-control" id="email_ed"
																	placeholder="Email" />
															</div>
														</div>
														<div class="form-group">
															<label for="mobile" class="col-sm-2 control-label">
																Password</label>
															<div class="col-sm-10">
																<input type="password" class="form-control"
																	id="password1_ed" placeholder="Password" />
															</div>
														</div>
														<div class="form-group">
															<label for="password" class="col-sm-2 control-label">
															</label>
															<div class="col-sm-10">
																<input type="password" class="form-control"
																	id="password2_ed" placeholder="Password 확인" />
															</div>
														</div>
														<div class="row">
															<div class="col-sm-2"></div>
															<div class="col-sm-10">
																<button type="button" class="btn btn-primary btn-sm" id="editForm">
																	Edit</button>
																<input type="reset" class="btn btn-default btn-sm"
																	value="Reset" />
															</div>
														</div>
													</form>
												</div>
											</div>
											<!-- <div id="OR" class="hidden-xs">OR</div> -->
										</div>
										<!-- <div class="col-md-4">
											<div class="row text-center sign-with">
												<div class="col-md-12">
													<h3>Sign in with</h3>
												</div>
												<div class="col-md-12">
													<div class="btn-group btn-group-justified">
														<a href="#" class="btn btn-primary">Facebook</a> <a
															href="#" class="btn btn-danger"> Google</a>
													</div>
												</div>
											</div>
										</div> -->
									</div>
								</div>
							</div>
						</div>
					</div>

				</div>

				<c:choose>
					<c:when test="${sessionScope.user_id == null }">

						<ul class="main-nav nav navbar-nav navbar-right">
							<li class="wow fadeInDown" data-wow-delay="0s"><a
								class="active" href="#" onclick="checkId();">일정 만들기</a></li>
							<li class="wow fadeInDown" data-wow-delay="0.1s"><a href="#"
								onclick="checkId();">나의 일정 보기</a></li>
							<!-- 					<li class="wow fadeInDown" data-wow-delay="0.2s"><a href="#">My
							Own Schedule</a></li>
					<li class="wow fadeInDown" data-wow-delay="0.3s"><a href="#">City
							Information</a></li> -->
						</ul>
					</c:when>
					<c:otherwise>
						<ul class="main-nav nav navbar-nav navbar-right">
							<li class="wow fadeInDown" data-wow-delay="0s"><a
								class="active" href="SC_11">일정 만들기</a></li>
							<li class="wow fadeInDown" data-wow-delay="0.1s"><a
								href="SC_10">나의 일정 보기</a></li>
							<!-- <li class="wow fadeInDown" data-wow-delay="0.2s"><a href="#">나의 일정</a>
					</li> -->
							<!-- 					<li class="wow fadeInDown" data-wow-delay="0.2s"><a href="#">My
							Own Schedule</a></li>
					<li class="wow fadeInDown" data-wow-delay="0.3s"><a href="#">City
							Information</a></li> -->
						</ul>
					</c:otherwise>
				</c:choose>

			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>

    <!-- Page Content -->
    <div class="container">

        <div class="row">

            <!-- Blog Post Content Column -->
            <div class="col-body">
            <div class="col-lg-8">

                <!-- Blog Post -->

                <!-- Title -->
                <h1><div class="placeName" id="placeName" ></div></h1>

                <!-- Author -->
                <p class="lead">
                    <h4 id="telname"></h4>
                </p>

                <hr>

                <!-- Date/Time -->
                <div class="eventInfo" id="eventInfo">
                <div class="eventDate" id="eventDate"></div> 
                <div class="addr" id="addr"></div>
				</div>
                <hr>

                <!-- Preview Image -->
                <div class="img-responsive" id="placeImg"></div>

                <hr>

                <!-- Post Content -->
                <p class="lead" id="placeInfo"></p>

                <hr>

                <!-- Blog Comments -->

                <!-- Comments Form -->
                <div class="well">
                    <h4>Review</h4>
                    <form role="form">
                        <div class="form-group">
                            <textarea class="form-control" id="reviewWrite" rows="3"></textarea>
                        </div>
                        <a href="#"  onclick="return false" class="btn btn-primary" id="write">등록</a> 
                       <!--  <button type="submit" class="btn btn-primary">Submit</button> -->
                    </form>
                </div>

                <hr>

                <!-- Posted Comments -->

                <!-- Comment -->
                <div id="review">
                <%-- <c:forEach var="reply" items="${rList}">
                <div class="media">
                    <a class="pull-left" href="#">
                        <img class="media-object" src="http://placehold.it/64x64" alt="">
                    </a>
                    <div class="media-body">
                        <div class="media-heading"><h4>${reply.USER_ID}
                            <small>${reply.INP_YMD}</small>
                            <!-- 아이디 비교 -->
                            <c:if test="${ID == reply.USER_ID}">
                     <small><a href="javascript:replyUpdateForm('${reply.REV_SQ}','${reply.CONTENT_ID}')">수정</a>
                     		<a href="#none" onclick="deleteReply('${reply.REV_SQ}','${reply.CONTENT_ID}')">삭제</a></small>
                     </c:if>
                        </h4></div>
                       	<pre>
                        <div id="${reply.REV_SQ}" class="review_txt">${reply.REV_TXT}</div>
                        </pre>
                    </div>
                </div>
				</c:forEach> --%>
				</div>
				<div id="paging">
				
				<%-- <div align="center">
					<a href ="javascript:pagingFormSubmit(
						${navi.currentPage - navi.pagePerGroup})">◀◀</a>
						<a href ="javascript:pagingFormSubmit(${navi.currentPage -1})">◀</a>
					<c:if test="${rList.size() > 0}">	
					<c:forEach var="counter" begin="${navi.startPageGroup}" end="${navi.endPageGroup}">
						<a href="javascript:pagingFormSubmit(${counter})">${counter}</a>
			 		</c:forEach>
			 		</c:if>
			 		<c:if test="${rList.size() == 0}"><a href="#">1</a></c:if>
						<a href="javascript:pagingFormSubmit(${navi.currentPage + 1})">▶</a>
						<a href="javascript:pagingFormSubmit(
						${navi.currentPage + navi.pagePerGroup})">▶▶</a>
				</div>
				<form action="SC_08" method="get" id="pagingForm">
			 	<!--boardlist컨트롤러의 id(page)와 같은  값(page)에 보낸다  -->
				<input type="hidden" id="page" name="page">
				<input type="hidden" id="CONTENT_ID" name="CONTENT_ID" value="${contentid}">
				<input type="hidden" id="CONTENT_TYPE_ID" name="CONTENT_TYPE_ID" value="${contypeid}">
				
				</form>	 --%>			
				</div>
                <!-- Comment -->
            </div>
			</div>
            <!-- Blog Sidebar Widgets Column -->
            <div class="col-left">
            <div class="col-md-4" style="float: right;">

                <!-- Blog Search Well -->
                <div class="well">
                <div class="well-head">
                	<a href="#" onclick="locationObj(); return false"><img src="./resources/image/img07_08/review.png" alt="Review" width="40px" height="30px"></a>review&emsp;
					<a href="#" id="clip"><img src="./resources/image/img07_08/pin.png" alt="Clip" width="35px" height="30px"></a>clip
                    
                </div>    
                    <!-- /.input-group -->
                </div>

                <!-- Blog Categories Well -->
                <div class="well">
                    <div class = "map-position">
                    <div class="row">
                     <div class="map" id="map"></div>
                    </div>
                    </div>
                    <!-- /.row -->
                </div>

                <!-- Side Widget Well -->
                <div class="well">
                	<h4>주변 관광지</h4> 
                    <div class="rplace1" id ="rplace1">
					<div class="rplaceImg1" id ="rplaceImg1"></div>
					<div class="rplacetitle1" id ="rplacetitle1"></div>
					<div class="rplaceaddr1" id ="rplaceaddr1"></div>
					</div>
                    
                    <div class="rplace2" id ="rplace2">
					<div class="rplaceImg2" id ="rplaceImg2"></div>
					<div class="rplacetitle2" id ="rplacetitle2"></div>
					<div class="rplaceaddr2" id ="rplaceaddr2"></div>
					</div>
                    
                    <div class="rplace3" id ="rplace3">
					<div class="rplaceImg3" id ="rplaceImg3"></div>
					<div class="rplacetitle3" id ="rplacetitle3"></div>
					<div class="rplaceaddr3" id ="rplaceaddr3"></div>
					</div>
                </div>
                
                <div class="well">
                	<h4>주변 음식점</h4> 
                    <div class="rplace1" id ="rplace1">
					<div class="rplaceImg1" id ="resImg1"></div>
					<div class="rplacetitle1" id ="restitle1"></div>
					<div class="rplaceaddr1" id ="resaddr1"></div>
					</div>
                    
                    <div class="rplace2" id ="rplace2">
					<div class="rplaceImg2" id ="resImg2"></div>
					<div class="rplacetitle2" id ="restitle2"></div>
					<div class="rplaceaddr2" id ="resaddr2"></div>
					</div>
                    
                    <div class="rplace3" id ="rplace3">
					<div class="rplaceImg3" id ="resImg3"></div>
					<div class="rplacetitle3" id ="restitle3"></div>
					<div class="rplaceaddr3" id ="resaddr3"></div>
					</div>
                </div>

            </div>

        </div>
        <!-- /.row -->

        <!-- Footer -->
        <footer>
       
            <div class="row">
                <div class="col-lg-12">
                <hr>
                    <p>Copyright &copy; NikoNikoNi 2017</p>
                </div>
            </div>
            <!-- /.row -->
        </footer>

    </div>

</body>
</html>