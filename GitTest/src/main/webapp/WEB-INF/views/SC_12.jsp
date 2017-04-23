<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js">
<!--<![endif]-->
<head>
<meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Jonaki | Job Board Template</title>
        <meta name="description" content="company is a free job board template">
        <meta name="author" content="Ohidul">
        <meta name="keyword" content="html, css, bootstrap, job-board">
        <meta name="viewport" content="width=device-width, initial-scale=1">

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
          <link rel="stylesheet" href="./resources/css/12css.css">
        <script   src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD_azK-PpKrUbRSAlyccxLXpUGnwagdJhQ"></script>         

<script type="text/javascript"
   src="<c:url value="/resources/js/jquery-3.1.1.js"/>"></script>
</head>
<body>

   <div id="preloader">
      <div id="status">&nbsp;</div>
   </div>
   <!-- Body content -->

   <div class="header-connect">
      <div class="container">
         <div class="row">
            <div class="col-md-5 col-sm-8 col-xs-8">
               <div class="header-half header-call">
                  <p>
                     <span><i class="icon-cloud"></i>+019 4854 8817</span> <span><i
                        class="icon-mail"></i>ohidul.islam951@gmail.com</span>
                  </p>
               </div>
            </div>
            <div
               class="col-md-2 col-md-offset-5  col-sm-3 col-sm-offset-1  col-xs-3  col-xs-offset-1">
               <div class="header-half header-social">
                  <ul class="list-inline">
                     <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                     <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                     <li><a href="#"><i class="fa fa-vine"></i></a></li>
                     <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                     <li><a href="#"><i class="fa fa-dribbble"></i></a></li>
                     <li><a href="#"><i class="fa fa-instagram"></i></a></li>
                  </ul>
               </div>
            </div>
         </div>
      </div>
   </div>

   <nav class="navbar navbar-default">
   <div class="container">
      <!-- Brand and toggle get grouped for better mobile display -->
      <div class="navbar-header">
         <button type="button" class="navbar-toggle collapsed"
            data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
            <span class="sr-only">Toggle navigation</span> <span
               class="icon-bar"></span> <span class="icon-bar"></span> <span
               class="icon-bar"></span>
         </button>
         <a class="navbar-brand" href="#"><img
            src="./resources/img/logo.png" alt=""></a>
      </div>

      <!-- Collect the nav links, forms, and other content for toggling -->
      <div class="collapse navbar-collapse"
         id="bs-example-navbar-collapse-1">
         <div class="button navbar-right">
            <button class="navbar-btn nav-button wow bounceInRight login"
               data-wow-delay="0.8s">Login</button>
            <button class="navbar-btn nav-button wow fadeInRight"
               data-wow-delay="0.6s">Sign up</button>
         </div>
         <ul class="main-nav nav navbar-nav navbar-right">
            <li class="wow fadeInDown" data-wow-delay="0s"><a
               class="active" href="#">Home</a></li>
            <li class="wow fadeInDown" data-wow-delay="0.1s"><a href="#">Job
                  Seekers</a></li>
            <li class="wow fadeInDown" data-wow-delay="0.2s"><a href="#">Employeers</a></li>
            <li class="wow fadeInDown" data-wow-delay="0.3s"><a href="#">About
                  us</a></li>
            <li class="wow fadeInDown" data-wow-delay="0.4s"><a href="#">Blog</a></li>
            <li class="wow fadeInDown" data-wow-delay="0.5s"><a href="#">Contact</a></li>
         </ul>
      </div>
      <!-- /.navbar-collapse -->
   </div>
   <!-- /.container-fluid --> </nav>

   <div class="slider-area">
      <div class="slider">
         <div id="bg-slider" class="owl-carousel owl-theme">

            <div class="item">
               <img src="./resources/img/slider-image-3.jpg" alt="Mirror Edge">
            </div>
            <div class="item">
               <img src="./resources/img/slider-image-2.jpg" alt="The Last of us">
            </div>
            <div class="item">
               <img src="./resources/img/slider-image-1.jpg" alt="GTA V">
            </div>

         </div>
      </div>
      <div class="container slider-content">
         <div class="row">
            <div
               class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1 col-sm-12">
               <h2>Job Searching Just Got So Easy</h2>
               <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
                  Eligendi deserunt deleniti, ullam commodi sit ipsam laboriosam
                  velit adipisci quibusdam aliquam teneturo!</p>
               <div class="search-form wow pulse" data-wow-delay="0.8s">
                  <form action="" class=" form-inline">
                     <div class="form-group">
                        <input type="text" class="form-control"
                           placeholder="Job Key Word">
                     </div>
                     <div class="form-group">
                        <select name="" id="" class="form-control">
                           <option>Select Your City</option>
                           <option selected>New york, CA</option>
                           <option>New york, CA</option>
                           <option>New york, CA</option>
                           <option>New york, CA</option>
                        </select>
                     </div>
                     <div class="form-group">
                        <select name="" id="" class="form-control">
                           <option>Select Your Category</option>
                           <option selected>Graphic Design</option>
                           <option>Web Design</option>
                           <option>App Design</option>
                        </select>
                     </div>
                     <input type="submit" class="btn" value="Search">


                  </form>
               </div>
            </div>
         </div>
      </div>
   </div>

   <div class="content-area">

      <hr>

      <div class="container">
         <div class="row job-posting wow fadeInUp" data-wow-delay="1s">
            <div role="tabpanel">
               <!-- Nav tabs -->
               <ul class="nav nav-tabs" role="tablist">
                  <li role="presentation" class="active"><a href="#job-seekers"
                     aria-controls="home" role="tab" data-toggle="tab">일정표</a></li>
                  <li role="presentation"><a href="#employeers"
                     aria-controls="profile" role="tab" data-toggle="tab">댓글</a></li>
                  <div class="plan-menu">
                  <a data-toggle="modal" href="#myModal">공유하기</a>&emsp;&emsp;
                  <a href="">복사하기</a>&emsp;&emsp;
                  <a href="edit_schedule?scd_sq=${scd_sq }">수정하기</a>&emsp;&emsp;
                  <a href="">다운로드</a>
                  </div>
               </ul>

               <!-- Tab panes -->
               <div class="tab-content">
                  <div role="tabpanel" class="tab-pane fade in active"
                     id="job-seekers">
                     <ul class="list-inline job-seeker">
                           <div class="wrap page" data-id="2">
                            <div id="scd_info"></div>
                            
                            <%-- <table class="sch_table" width="100%">
                                 <colgroup>
                                    <col width="20%" />
                                    <col width="20%" />
                                    <col width="20%" />
                                    <col width="20%" />
                                    <col width="20%" />
                                 </colgroup>
                                 <tr>
                                    <th>
                                       <div>
                                          <img src="/res/img/mypage/plan/sub/tr_date.png" alt="" />
                                          날짜
                                          <div class="clear"></div>
                                       </div>
                                    </th>
                                    <th>
                                       <div>
                                          <img src="" alt="" />
                                          도시
                                          <div class="clear"></div>
                                       </div>
                                    </th>
                                    
                                    <th>
                                       <div>
                                          <img src="" alt="" />
                                          일정
                                          <div class="clear"></div>
                                       </div>
                                    </th>
                                    <th>
                                       <div>
                                          <img src="" alt="" />
                                          지도
                                          <div class="clear"></div>
                                       </div>
                                    </th>
                                 </tr>
                                 <c:forEach var="scd" items="${daily_List}"> 
                                 <tr class="white">
                                    <td>
                                       <div class="scht_date">
                                          ${scd.daily_ymd } 
                                       </div>
                                       <div class="scht_day">DAY ${scd.DAILY_ORD}</div>
                                    </td>
                                    <td class="scht_vtop">
                                       <div class="scht_city">${scd.CITY_NM}</div>
                                       <div class="scht_city_en">Dubrovnik</div>
                                       <div class="scht_city_blank"></div>
                                    </td>
                                    
                                    <td class="scht_vtop">
                                    
                                       <div class="scht_spotname">
                                          <b>1.</b>마리나 베이 센즈
                                       </div>
                                    
                                       <div class="scht_spotname">
                                          <b>1.</b>마리나 베이 센즈
                                       </div> 
                                    </td>
                                    <td class="scht_vtop">
                                       <div class="scht_htname">지도</div> 
                                    </td>
                                 </tr>
                                 </c:forEach> 
                                 </div> 
                              </table>--%>
                              
                              
                           </div> 

                           

                        
                     </ul>
                  </div>
                  <div role="tabpanel" class="tab-pane fade" id="employeers">
                     <ul class="list-inline">
                        <li><a href=""> <img
                              src="./resources/img/employee4.png" alt="">
                              <div class="overlay">
                                 <h3>Instagram</h3>
                              </div>
                        </a></li>
                        <li><a href=""> <img
                              src="./resources/img/employee5.png" alt="">
                              <div class="overlay">
                                 <h3>Microsoft</h3>
                              </div>
                        </a></li>
                        <li><a href=""> <img
                              src="./resources/img/employee6.png" alt="">
                              <div class="overlay">
                                 <h3>Dribbble</h3>
                              </div>
                        </a></li>
                        <li><a href=""> <img
                              src="./resources/img/employee1.png" alt="">
                              <div class="overlay">
                                 <h3>Beats Music</h3>
                              </div>
                        </a></li>
                        <li><a href=""> <img
                              src="./resources/img/employee2.png" alt="">
                              <div class="overlay">
                                 <h3>Facebook</h3>
                              </div>
                        </a></li>
                        <li><a href=""> <img
                              src="./resources/img/employee3.png" alt="">
                              <div class="overlay">
                                 <h3>Twitter</h3>
                              </div>
                        </a></li>
                     </ul>
                  </div>
               </div>

            </div>
         </div>
      </div>
      <hr>
   </div>
   <div class="footer-area">
      <div class="container">
         <div class="row footer">
            <div class="col-md-4">
               <div class="single-footer">
                  <img src="./resources/img/footer-logo.png" alt=""
                     class="wow pulse" data-wow-delay="1s">
                  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
                     Obcaecati architecto quaerat facere blanditiis tempora sequi
                     nulla accusamus, possimus cum necessitatibus suscipit quia autem
                     mollitia, similique quisquam molestias. Vel unde, blanditiis.</p>
               </div>
            </div>
            <div class="col-md-4">
               <div class="single-footer">
                  <h4>Twitter update</h4>
                  <div class="twitter-updates">
                     <div class="single-tweets">
                        <h5>ABOUT 9 HOURS</h5>
                        <p>
                           <strong>AGOMeet Aldous</strong> - a Brave New World for #rails
                           with more cohesion, less coupling and greater dev speed <a
                              href="http://t.co/rsekglotzs">http://t.co/rsekglotzs</a>
                        </p>
                     </div>
                     <div class="single-tweets">
                        <h5>ABOUT 9 HOURS</h5>
                        <p>
                           <strong>AGOMeet Aldous</strong> - a Brave New World for #rails
                           with more cohesion, less coupling and greater dev speed <a
                              href="http://t.co/rsekglotzs">http://t.co/rsekglotzs</a>
                        </p>
                     </div>
                  </div>
               </div>
            </div>
            <div class="col-md-4">
               <div class="single-footer">
                  <h4>Useful lnks</h4>
                  <div class="footer-links">
                     <ul class="list-unstyled">
                        <li><a href="">About Us</a></li>
                        <li><a href="" class="active">Services</a></li>
                        <li><a href="">Work</a></li>
                        <li><a href="">Our Blog</a></li>
                        <li><a href="">Customers Testimonials</a></li>
                        <li><a href="">Affliate</a></li>
                        <li><a href="">Contact Us</a></li>
                     </ul>
                  </div>
               </div>
            </div>
         </div>
         <div class="row footer-copy">
            <p>
               <span>(C) webstie, All rights reserved</span> | <span>Graphic
                  Designed by <a href="https://dribbble.com/siblu">Eftakher Alam</a>
               </span> | <span> Web Designed by <a href="http://ohidul.me">Ohidul
                     Islam</a></span>
            </p>
         </div>
      </div>
   </div>

<!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">일정에 초대 하실 분의 아이디를 입력해주세요</h4>
        </div>
        <div class="modal-body">
        <input type="text" name="shareId" class="form-control" id="shareId" placeholder="공유할 ID를 입력해주세요" />
        </div>
        <div class="modal-footer">
        <div id="existId" class="existId"></div>
         <button type="button" class="btn btn-default btn_invite" onclick="return whoWithShare();">Invite</button>
          <button type="button" class="btn btn-default" data-dismiss="modal" onclick="return deleteElement();">Close</button>
        </div>
      </div>
      
    </div>
  </div>




      <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="./resources/js/vendor/jquery-1.10.2.min.js"><\/script>')</script>
        <script src="./resources/js/bootstrap.min.js"></script>
        <script src="./resources/js/owl.carousel.min.js"></script>
        <script src="./resources/js/wow.js"></script>
        <script src="./resources/js/main.js"></script>
</body>
<script>
var scd_sq=${scd_sq};
var info_List=[];
var key = "2pTN6y%2BhCGaVQL97quhdeM%2FW9ezdUvBNytbkKoT323qbc%2Ff5ao8fYoW2C31AgwacBVhy7PYHqvuwcnzprU4%2BNw%3D%3D";
var url;
var myLatLng;
var markers = [];
var myloc_path;
var myloc_markers = [];
var marker_no;
var map=[];

  $(function(){
     $.ajax({
         type : "POST",
         url : "scd_info",
         async : false,
         data :{
            scd_sq : scd_sq 
         },success : function(data){
            console.log(data);
            
            $.each(data,function(index,item){
               
               info_List.push(item);
            });
               
               console.log(info_List);
               
               
         },
         error : function(e){
            console.log(e);
         } 
         });      
              
      $.ajax({
         type : "POST",
         url : "read_scd_info",
         async : false,
         data :{
            scd_sq : scd_sq 
         },
         dataType: "json",
         success : function(data){
             
            console.log(data);
            //여행일수 카운트 
            var cnt=0;
            //여행 일정 카운트
            var j=0;
            //맵 생성 카운트
            var mapcount=1;
            var day_cnt;
            var DAILY_CNT;
            var html=""; 
                  html += '<table class="sch_table" width="100%"><colgroup>';
                  html += '<col width="20%" /><col width="20%" /><col width="20%" /><col width="20%" />';
                  html += '</colgroup><tr><th><div>';
                  html += '<img src="" alt="" />날짜<div class="clear"></div>';
                  html += '</div></th><th><div>';
                  html += '<img src="" alt="" />도시';
                  html += '<div class="clear"></div></div></th>';
                  html += '<th><div><img src="" alt="" />일정';
                  html += '<div class="clear"></div></div></th><th><div>';
                  html += '<img src="" alt="" />지도';
                  html += '<div class="clear"></div></div></th></tr> ';
                  
                                                   
                  
               $.each(data,function(index,item){
                  day_cnt= index;
                  DAILY_CNT=item.DAILY_CNT;
                  var areacode=item.AREA_CODE;
                  /* var contentId=item.DTL_CONTENT_ID;
                  console.log(contentId);
                  var sigungucode;
                  ReadApi(contentId); */
                  
                   
                  
                  html += '<tr class="white">';
                  html += '<td><div class="scht_date">'+ item.daily_ymd +'</div>';
                  html += '<div class="scht_day">DAY '+ item.DAILY_ORD +'</div></td>';                     
                  html += '<td class="scht_vtop">';
                  html += '<div class="scht_city"><a href="sc_05?areacode='+areacode+'">'+ item.CITY_NM +'</a></div>'; 
                  html += '<div class="scht_city_blank"></div></td>';
                  html += '<td class="scht_vtop">';                     
                   
                  console.log(DAILY_CNT);
                  for(var i=0;i<item.DAILY_CNT;i++){
                     
                     console.log(info_List);
                     
                     console.log(info_List[i].dtl_content_id);
                     
                     var contentId=info_List[j].dtl_content_id;
                     console.log(contentId);
                     ReadApi(contentId); 
                  
                     $.getJSON(url, function(data){ 
                            
                      }) 
                      
                    
                  html += '<div class="scht_spotname">';
                  html += '<b>'+(i+1)+'. '+'</b>'+info_List[j].place_nm+'</div>';
                  
                  j=j+1;
                  }
                  
                   
                  console.log("map    "+mapcount);
                  html += '</td>';
                  html += '<td class="scht_vtop">';
                  html += '<div class="scht_htname"><div class="map" id="map'+mapcount+'"></div></div></td>';                  
                  html += '</tr>';
                  mapcount=mapcount+1
                  
               })
               $.getJSON(url, function(data){
                   console.log('success', data);     
                  myLatLng={
                         lat : parseFloat(data.response.body.items.item.mapy),
                         lng : parseFloat(data.response.body.items.item.mapx)
                   }   
                      initMap(myLatLng,day_cnt+1);
                         
                   })
               html += '</div></table></div>'; 
               $("#scd_info").html(html);
               
         },
         error : function(e){
            console.log(e);
         } 
      });         
         
 })  
 
 $(function(){
	
		ws = new WebSocket("ws://10.10.6.61:8888/gittest/webSocket");
		
		var data = {
				"loginId" : "${user_id}"
		}
		
		console.log("loging id : "+data);
		ws.onopen = () => ws.send(JSON.stringify(data));
		
		ws.onmessage = function(event){
			console.log(event.data);
		}
		
		//서버에서 접속 종료한 후 이벤트 정의
		ws.onclose = function(event){
			
	}
})

$(function(){
	$('#shareId').keyup(function(){
		if($('#shareId').val() != null){
		 $.ajax({
				type : "POST",
				url : "checkId",
				data : { 
					"user_id" : $('#shareId').val(),
				}
				,success : function(data){
					if(data == '1'){
						$('#existId').html("<span>해당 아이디가 존재합니다. 일정을 공유하시겠습니까?</span>");
					}else{
						$('#existId').html("<span>해당 아이디가 존재하지 않습니다. 다시 입력해주세요</span>");
					}
				},
				error : function(e){
					console.log(e);
				} 
			});//ajax
		}
	}); 
})

function ReadApi(contentId) { /* currentPage가 어디서 호출되어 온다 */
   url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?ServiceKey="+key;
   url += "&mapX&mapY";
   url += "&contentTypeId&contentId="+contentId+"&areaCode&sigunguCode&cat1=&cat2=&cat3=&listYN=Y";
   url += "&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&transGuideYN=Y&_type=json";
   
}
  
  function whoWithShare(){
		var checkId = $('#shareId').val();
		if(checkId == ''){
			alert("일정을 함께 공유하실 분의 아이디를 입력해주세요.");
			return false;
		}
		
		var data = {
				"scd_sq" : ${scd_sq}
				,"searchId" : checkId
		}
		console.log(data);
		ws.send(JSON.stringify(data));
		
		return false;
	}

	function deleteElement(){
		document.getElementById('shareId').value = '';
		var html = '';
		$('#existId').html(html);
		return false;
	}


function initMap(myLatLng,day_cnt) {
   console.log(myLatLng);
   
   var count=0;
   for(var i=0;i<day_cnt;i++){   
      
   var zoom = 7;
   map[i] = new google.maps.Map(document.getElementById('map'+(1+count)), {
      center : myLatLng,
      zoom : zoom
   });
   
   count=count+1;
   }
   
   for(var i=0; i<map.length; i++){
	   console.log(map[i]);
   }
   
        $.ajax({
         type: "post",
         url: "get_daily_list",
         data: {
            scd_sq: scd_sq
         },
         async: false,
         success: function(data){
            $.each(data, function(index,item){
               show_myMarkers(item.DAILY_ORD);
             });
         },
         error: function(e){
            console.log(e);
         }      
      })
}  

function makeMarker(city){
    var marker = new google.maps.Marker({
        position: new google.maps.LatLng(city.lat, city.lng),
        map: map,
       /*  title: city.name, */
        /* lat:city.lat,
        lng:city.lng,
        labelContent: city.name,
      labelAnchor: new google.maps.Point(-11, 30),
     labelClass: "labels", // the CSS class for the label
      labelStyle: {opacity: 0.75} */
    });
    markers.push(marker);
    /* addMarkerListener(marker); */
    return marker;
}

function show_myMarkers(daily_ord){
     var sq = {
        scd_sq: scd_sq,
        daily_sq: daily_ord
     }
      $.ajax({
        type: "post",
        url: "get_places",
        data: sq,
        async: false,
        success: function(data){
        	var bounds = new google.maps.LatLngBounds();
        	
           if(data.length != 0){
              /* for(var i=0; i<myloc_markers.length; i++){
                 myloc_markers[i].setMap(null);
              } */
              myloc_markers.length = 0;
              marker_no = 0;
              var mymarkerlist = [];
              var iconsetngs = {
                     path: google.maps.SymbolPath.FORWARD_CLOSED_ARROW
                 };
                 myloc_path = new google.maps.Polyline({
                     geodesic: true,
                     strokeColor: '#FF0000',
                     strokeOpacity: 1.0,
                     strokeWeight: 2,
                     icons: [{
                        repeat: '130px',
                         icon: iconsetngs,
                         offset: '100%'}]
                   });
                 myloc_path.setMap(map[daily_ord-1]);
                 var path = myloc_path.getPath();
                $.each(data,function(index,item){
                   var latLng = new google.maps.LatLng(parseFloat(item.MAP_Y), parseFloat(item.MAP_X));
                   path.push(latLng);
                   mymarkerlist.push({lat: parseFloat(item.MAP_Y), lng: parseFloat(item.MAP_X)});
                });
                for(var i=0; i<mymarkerlist.length; i++){
                   marker_no++;
                   var latLng = {
                          lat : parseFloat(mymarkerlist[i].lat),
                          lng : parseFloat(mymarkerlist[i].lng)
                       }
                       var marker = new google.maps.Marker({
                          draggable : false,
                          position : latLng,
                          map : map[daily_ord-1],
                          title : "place"+(i+1),
                          id : i+1,
                          icon: "./resources/marker_img/number_"+marker_no+".png",
                          zIndex: 1000
                       });
                   myloc_markers.push(marker);
                   bounds.extend(marker.position);
                }
                map[daily_ord-1].fitBounds(bounds);
           }
        },
        error: function(e){
           console.log(e);
        }      
     })
 }
</script>

</html>