<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="company is a free job board template">
    <meta name="keyword" content="html, css, bootstrap, job-board">
    <meta name="author" content="Ohidul">

    <title>Blog Post - Start Bootstrap Template</title>

    <!-- Bootstrap Core CSS -->
      <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800' rel='stylesheet' type='text/css'>

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
        <script src="./resources/js/vendor/modernizr-2.6.2.min.js"></script>
        <script type="text/javascript"src="<c:url value="/resources/js/jquery-3.1.1.js"/>"></script>
        
    <link href="./resources/css/08bootstrap/css/bootstrap.css" rel="stylesheet">    
	
    <!-- Custom CSS -->
    <link href="./resources/css/08bootstrap/css/blog-post.css" rel="stylesheet">
<link rel ="stylesheet" href ="./resources/css/07css.css">
 
<head>
<script type="text/javascript"src="<c:url value="/resources/js/jquery-3.1.1.js"/>"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>장소화면</title>

<script	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCW-Yin1kq0i_E_hqmkCdFXNWIaJLRoUN8&callback=initMap"
		async defer></script>
<script type="text/javascript">
function pagingFormSubmit(currentPage) { //currentPage가 어디서 호출되어 온다
	var form=document.getElementById("pagingForm");
	var page=document.getElementById("page"); 
	page.value=currentPage; 
	form.submit();
}

var map;
var myLatLng;
var CONTENT_ID;
    var key = "fHPwwCqceBLnLCExz65uYIYEAdiAs6xOwv79o6FcLHh7x6iPmxITE9Wk7TqH1q%2F1%2FeSw9j%2FUxPbGiQYcnVa0zw%3D%3D";
	
    //장소바꿀때 전 단계에서 contentId를 받아와서 바꾸면 될듯
    var contentTypeId = ${contypeid};
    var contentId = ${contentid};
    
  	var lat;
  	var lng;
  	
  	//선택된 장소의 이름, 대표 사진, 장소 설명, 좌표 불러오는API
    var url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?ServiceKey="+key;
    url += "&mapX&mapY";
    url += "&contentTypeId="+contentTypeId+"&contentId="+contentId;
    url += "&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&transGuideYN=Y&_type=json";
	
    var url2= "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailIntro?ServiceKey="+key;
		url2 +=	"&contentTypeId="+contentTypeId+"&contentId="+contentId+"&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&introYN=Y&_type=json";
    
    window.onload=function(){
    	l_Data();
    	r_Data();
    	f_Data();
}

function l_Data(){
	var html ="";//선택된 장소의 이름과 대표 사진 장소 설명 불러오기
    console.log(url);
    $.getJSON(url, function(data) {
    	myLatLng={
    			lat : parseFloat(data.response.body.items.item.mapy),
    			lng : parseFloat(data.response.body.items.item.mapx)
    	}
    	
    	var CONTENT_ID=data.response.body.items.item.title;
    	var areacode=data.response.body.items.item.areacode;
    	console.log(CONTENT_ID); 
    	console.log(contentTypeId); 
    	
    	 var addr=data.response.body.items.item.addr1;
         var addr1=addr.split(" ",1);
    	
    	initMap(myLatLng,data);
        console.log('sucess', data);
        /* for( var i = 0 ; i < data.response.body.totalCount ; i++){
            console.log( data.response.body.items.item[i] );
        }    */
        

        console.log(data.response.body.items.item);
        $("#placeName").html(data.response.body.items.item.title);
        if (typeof (data.response.body.items.item.firstimage) !== "undefined") {
        $("#placeImg").html('<img src='+data.response.body.items.item.firstimage+'>');        	
        }else{
        $("#placeImg").html('<img src="./resources/image/noimage.jpg">');	
        }
        $("#placeInfo").html(data.response.body.items.item.overview);
        $("#addr").html('<a href="sc_05?areacode='+areacode+'">'+addr1+'</a>');
   		html += "주소 : "+ data.response.body.items.item.addr1+"<br>";
   		if (typeof (data.response.body.items.item.tel) !== "undefined") {
        html += "전화번호 : " + data.response.body.items.item.tel;
   		}
        $("#pInfo").html(html);
        html="";
    });
    
   
    $.getJSON(url2, function(data) {
    	
   	console.log('success', data);
   	console.log(data.response.body.items.item.treatmenu);
   	console.log(typeof(data.response.body.items.item.treatmenu));
   	
   if (typeof (data.response.body.items.item.treatmenu) !== "undefined") {
  		html += "영업 시간 : " + data.response.body.items.item.opentimefood+"<br>";
  		html += "메뉴 : " + data.response.body.items.item.treatmenu.split("<br />",4);
  		
  	}else if(typeof (data.response.body.items.item.usetime) !== "undefined"){
  		html += "이용 시간 : "+ data.response.body.items.item.usetime+"<br>";
  	}else if(typeof (data.response.body.items.item.restdate) !== "undefined"){
  		html += "쉬는 날 : "+ data.response.body.items.item.restdate+"<br>";
  	}else if(typeof (data.response.body.items.item.expguide) !== "undefined" && data.response.body.items.item.expguide!==null){
  		html += data.response.body.items.item.expguide+"<br>";
  	}else if(typeof (data.response.body.items.item.infocenter) !== "undefined"){
  		html += "문의 및 안내 : "+ data.response.body.items.item.infocenter+"<br>";
  	}else if(typeof (data.response.body.items.item.playtime) !== "undefined"){
  		html += "축제기간 : "+ data.response.body.items.item.playtime+"<br>";
  	}
  		$("#pInfo2").html(html);
  		html="";
   }); 
    
}

//주변 관광지
function r_Data(){
		 $.getJSON(url, function(data) {
			areacode=data.response.body.items.item.areacode;
		    sigungucode=data.response.body.items.item.sigungucode;
			 
		 
		var cTypeId; 
		console.log(areacode); 
		console.log(sigungucode); 
		
		var url3= "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey="+key;
		url3 += "&contentTypeId=12&areaCode=" + areacode + "&sigunguCode=" + sigungucode + "&cat1=&cat2=&cat3=&listYN=Y";
		url3 += "&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=Q&numOfRows=100"; 
	    
	    
		$.getJSON(url3, function(data) {
			var length=data.response.body.items.item.length
			console.log('success', data);
			var j=0;
			
			
           		for( var i = 0 ; i < 3 ; i++){
				var j=j+1;
		         	console.log( data.response.body.items.item.length);
		           	var val = Math.floor( Math.random()*length);
		           	var con=data.response.body.items.item[val].contentid;
 		           	console.log(con);
					console.log(val);
					console.log( data.response.body.items.item[val].title);
					var contypeid=data.response.body.items.item[val].contenttypeid;
					if (typeof (data.response.body.items.item[val].firstimage) !== "undefined") {
					$("#rplaceImg"+ j).html('<a href="SC_07place?CONTENT_ID='+con+'&CONTENT_TYPE_ID='+contypeid+'"><img src='+data.response.body.items.item[val].firstimage+' width=60 height=60></a>');
					}else{
						$("#resImg"+ j).html('<a href="SC_07place?CONTENT_ID='+con+'&CONTENT_TYPE_ID='+contypeid+'"><img src="./resources/image/noimage.jpg" width=60 height=60></a>');
					}
					
					$("#rplacetitle"+ j).html('<a href="SC_07place?CONTENT_ID='+con+'&CONTENT_TYPE_ID='+contypeid+'">'+data.response.body.items.item[val].title.split("(",1))+'</a>';
					$("#rplaceaddr"+ j).html(data.response.body.items.item[val].addr1);
 		           	}
		})
		
		 });
}
//인근 음식점
function f_Data(){
	 $.getJSON(url, function(data) {
		areacode=data.response.body.items.item.areacode;
	    sigungucode=data.response.body.items.item.sigungucode;
		 
	 
	var cTypeId; 
	console.log(areacode); 
	console.log(sigungucode); 
	
	var url3= "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey="+key;
	url3 += "&contentTypeId=39&areaCode=" + areacode + "&sigunguCode=" + sigungucode + "&cat1=&cat2=&cat3=&listYN=Y";
	url3 += "&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=Q&numOfRows=100"; 
   
   
	$.getJSON(url3, function(data) {
		var length=data.response.body.items.item.length
		console.log('success', data);
		var j=0;
		
		
      		for( var i = 0 ; i < 3 ; i++){
			var j=j+1;
	         	console.log( data.response.body.items.item.length);
	           	var val = Math.floor( Math.random()*length);
	           	var con=data.response.body.items.item[val].contentid;
	           	console.log(con);
				console.log(val);
				console.log( data.response.body.items.item[val].title);
				var contypeid=data.response.body.items.item[val].contenttypeid;
				if (typeof (data.response.body.items.item[val].firstimage) !== "undefined") {
				$("#resImg"+ j).html('<a href="SC_07place?CONTENT_ID='+con+'&CONTENT_TYPE_ID='+contypeid+'"><img src='+data.response.body.items.item[val].firstimage+' width=60 height=60></a>');
				}else{
					$("#resImg"+ j).html('<a href="SC_07place?CONTENT_ID='+con+'&CONTENT_TYPE_ID='+contypeid+'"><img src="./resources/image/noimage.jpg" width=60 height=60></a>');
				}
				
				/* $("#rplaceImg"+ j).html('<a href="SC_07place?CONTENT_ID=1131275"><img src='+data.response.body.items.item[val].firstimage+' width=200 height=180></a>'); */
				$("#restitle"+ j).html('<a href="SC_07place?CONTENT_ID='+con+'&CONTENT_TYPE_ID='+contypeid+'">'+data.response.body.items.item[val].title.split("(",1))+'</a>';
				$("#resaddr"+ j).html(data.response.body.items.item[val].addr1);
	           	}
	})
	
	 });
}


	function initMap(myLatLng,data) {//맵 띄우는 함수
  map = new google.maps.Map(document.getElementById('map'), {
    center: myLatLng,
    zoom: 15
  });
  showmaker(data)
} 
 function showmaker(data){//마커 띄우는함수
	 marker = new google.maps.Marker({
		    position: myLatLng,
		    map: map,  		   
		   	draggable: false,
	    	animation: google.maps.Animation.DROP 
		  }); 
 }
 
 $(function(){
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
					 $.each(data,function(index,item){
						
						html+= "<div class='media'>";
						html+= "<a class='pull-left' href='#'>";
						html+= '<img class="media-object" src="http://placehold.it/64x64" alt=""></a>';
						html+= '<div class="media-body">';
						html+= '<div class="media-heading"><h4>'+item.user_ID;
						html+= '<small>'+item.inp_YMD+'</small>';
						html+= '</h4></div>';
						html+= item.rev_TXT;
						html+= '</div></div>';
					 })
						html2+='<div align="center">'; 
						html2+='<a href ="javascript:pagingFormSubmit(${navi.currentPage - navi.pagePerGroup})">◀◀</a>';
						html2+='<a href ="javascript:pagingFormSubmit(${navi.currentPage -1})">◀</a>';
						html2+='<c:forEach var="counter" begin="${navi.startPageGroup}" end="${navi.endPageGroup}">';
						html2+='<a href="javascript:pagingFormSubmit(${counter})">${counter}</a></c:forEach>';
						html2+='<a href="javascript:pagingFormSubmit(${navi.currentPage + 1})">▶</a>';
						html2+='<a href="javascript:pagingFormSubmit(${navi.currentPage + navi.pagePerGroup})">▶▶</a>';
						html2+='</div><form action="SC_07place" method="get" id="pagingForm">';
						html2+='<input type="hidden" id="page" name="page">';
						html2+='<input type="hidden" id="CONTENT_ID" name="CONTENT_ID" value="${contentid}">';
						html2+='<input type="hidden" id="CONTENT_TYPE_ID" name="CONTENT_TYPE_ID" value="${contypeid}"></form>';
						 
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
				var contypeidID=contentTypeId;
			$.ajax({
				type : "POST",
				url : "clipBoard",
				data :{
					CONTENT_ID : conID
					,CONTENT_TYPE_ID : contypeidID	
				},
				
				success : function(data){
					console.log(data);
					
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

</script>

</head>
<body>

<body>

 <!-- Navigation -->
   

        <nav class="navbar navbar-default">
          <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
              <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
              <a class="navbar-brand" href="#"><img src="./resources/img/logo.png" alt=""></a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
              <div class="button navbar-right">
                  <button class="navbar-btn nav-button wow bounceInRight login" data-wow-delay="0.8s">Login</button>
                  <button class="navbar-btn nav-button wow fadeInRight" data-wow-delay="0.6s">Sign up</button>
              </div>
              <ul class="main-nav nav navbar-nav navbar-right">
                <li class="wow fadeInDown" data-wow-delay="0s"><a class="active" href="#">Home</a></li>
                <li class="wow fadeInDown" data-wow-delay="0.1s"><a href="#">Job Seekers</a></li>
                <li class="wow fadeInDown" data-wow-delay="0.2s"><a href="#">Employeers</a></li>
                <li class="wow fadeInDown" data-wow-delay="0.3s"><a href="#">About us</a></li>
                <li class="wow fadeInDown" data-wow-delay="0.4s"><a href="#">Blog</a></li>
                <li class="wow fadeInDown" data-wow-delay="0.5s"><a href="SC_10">클립보드</a></li>
              </ul>
            </div><!-- /.navbar-collapse -->
          </div><!-- /.container-fluid -->
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
                <div class="pInfo-div">
                
                <div class="pInfo" id="pInfo"></div>
                <div class="pInfo2" id="pInfo2"></div>
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
                        <a href="#" class="btn btn-primary" id="write">등록</a> 
                       <!--  <button type="submit" class="btn btn-primary">Submit</button> -->
                    </form>
                </div>

                <hr>

                <!-- Posted Comments -->

                <!-- Comment -->
                <div id="review">
                <c:forEach var="reply" items="${rList}">
                <div class="media">
                    <a class="pull-left" href="#">
                        <img class="media-object" src="http://placehold.it/64x64" alt="">
                    </a>
                    <div class="media-body">
                        <div class="media-heading"><h4>${reply.USER_ID}
                            <small>${reply.INP_YMD}</small>
                        </h4></div>
                        ${reply.REV_TXT}
                    </div>
                </div>
				</c:forEach>
				</div>
				<c:choose>
				<c:when test="${rList.size() != 0 }">
				<div id="paging">
				<div align="center">
					<a href ="javascript:pagingFormSubmit(
						${navi.currentPage - navi.pagePerGroup})">◀◀</a>
						<a href ="javascript:pagingFormSubmit(${navi.currentPage -1})">◀</a>
					<c:forEach var="counter" begin="${navi.startPageGroup}" end="${navi.endPageGroup}">
						<a href="javascript:pagingFormSubmit(${counter})">${counter}</a>
			 		</c:forEach>
						<a href="javascript:pagingFormSubmit(${navi.currentPage + 1})">▶</a>
						<a href="javascript:pagingFormSubmit(
						${navi.currentPage + navi.pagePerGroup})">▶▶</a>
				</div>
				<form action="SC_07place" method="get" id="pagingForm">
			 	<!--boardlist컨트롤러의 id(page)와 같은  값(page)에 보낸다  -->
				<input type="hidden" id="page" name="page">
				<input type="hidden" id="CONTENT_ID" name="CONTENT_ID" value="${contentid}">
				<input type="hidden" id="CONTENT_TYPE_ID" name="CONTENT_TYPE_ID" value="${contypeid}">
				
				</form>				
				</div>
				</c:when>
				</c:choose>
				
				<div id="paging">
				</div>
				
                <!-- Comment -->
            </div>
			</div>
            <!-- Blog Sidebar Widgets Column -->
            <div class="col-left">
            <div class="col-md-4">

                <!-- Blog Search Well -->
                <div class="well">
                <div class="well-head">
                	<a href="#" onclick="locationObj(); return false">리뷰쓰기</a>&emsp;&emsp;
					<a href="#" id="clip"> 클립 </a>
                    
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
       
            <div class="row1">
                <div class="col-lg-12">
                <hr>
                    <p>Copyright &copy; Your Website 2017</p>
                </div>
            </div>
            <!-- /.row -->
        </footer>

    </div>
    
    <!-- /.container -->

    <!-- jQuery -->
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="./resources/js/vendor/jquery-1.10.2.min.js"><\/script>')</script>
    <script src="./resources/js/bootstrap.min.js"></script>
    <script src="./resources/js/owl.carousel.min.js"></script>
    <script src="./resources/js/wow.js"></script>
    <script src="./resources/js/main.js"></script>
    <script src="./resources/css/08bootstrap/js/bootstrap.js"></script>
	

</body>
</html>