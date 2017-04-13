<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="no-js">
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%@include file="joinForm.jsp"%> --%>

<title>SC_05화면</title>
<meta name="description" content="company is a free job board template">
<meta name="author" content="Ohidul">
<meta name="keyword" content="html, css, bootstrap, job-board">
<meta name="viewport" content="width=device-width, initial-scale=1">

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
<script src="./resources/js/vendor/modernizr-2.6.2.min.js"></script>
<!-- <script src="./resources/js/jquery-3.1.1.js"></script> -->
	<script src="./resources/js/jquery.min.js"></script>
	<script>window.jQuery || document.write('<script src="./resources/js/vendor/jquery-1.10.2.min.js"><\/script>')</script>
	<script src="./resources/js/bootstrap.min.js"></script>
	<script src="./resources/js/owl.carousel.min.js"></script>
	<script src="./resources/js/wow.js"></script>
	<script src="./resources/js/main.js"></script>
	<!-- <link rel="stylesheet" type="text/css" href="./resources/js/jquery.autocomplete.css" />  -->
    <!-- <script type="text/javascript" src="./resources/js/jquery.js"></script> -->
   <!--  <script type='text/javascript' src='./resources/js/jquery.bgiframe.min.js'></script> -->
   <!--  <script type='text/javascript' src='./resources/js/jquery.ajaxQueue.js'></script> -->
    <!-- <script type='text/javascript' src='./resources/js/jquery.autocomplete.js'></script> -->

	
	
	
	
<!-- <script src="./resources/js/jquery-3.1.1.js"></script> -->

<script type="text/javascript">
     	var areacode = ${areacode};
     	var sigungucode = "";
     	var key = "fHPwwCqceBLnLCExz65uYIYEAdiAs6xOwv79o6FcLHh7x6iPmxITE9Wk7TqH1q%2F1%2FeSw9j%2FUxPbGiQYcnVa0zw%3D%3D";
		
     	//정보수정 모달
     	$('#myModal_Edit').modal('show');

        $(function(){
        	
     		$("#joinForm").on("click",function(){
        		
    			$("#regAtag").trigger("click");
    		})
    		
    		$("#loginForm").on("click",function(){
    		
    			$("#loginAtag").trigger("click");
    		})
        	
        	theme_Data(areacode, "A01&cat2=");
            popular_Data(areacode);
            city_img(areacode);
           
          //자연
            $('#bMenu0').on('click', 
              function (){ 
                  theme_Data(areacode, "A01&cat2="); 
            } );
           //역사
            $('#bMenu1').on('click', 
              function (){ 
                  theme_Data(areacode,"A02&cat2=A0201"); 
            } );
            
           //휴양      
            $('#bMenu2').on('click', 
                    function (){ 
                        theme_Data(areacode, "A02&cat2=A0202"); 
            } );
           
           //체험
           
            $('#bMenu3').on('click', 
                    function (){ 
                        theme_Data(areacode, "A02&cat2=A0203"); 
            } );

           //건축
            $('#bMenu4').on('click', 
                    function (){ 
                        theme_Data(areacode, "A02&cat2=A0205"); 
            } ); 
           
           
           //문화시설
            $('#bMenu5').on('click', 
                    function (){ 
                        theme_Data(areacode, "A02&cat2=A0206"); 
            } ); 
   
           //레포츠
            $('#bMenu6').on('click', 
                    function (){ 
                        theme_Data(areacode, "A03"); 
            } ); 
           //쇼핑
            $('#bMenu7').on('click', 
                    function (){ 
                        theme_Data(areacode, "A04"); 
            } ); 
           //음식
            $('#bMenu8').on('click', 
                    function (){ 
                        theme_Data(areacode, "A05"); 
            } ); 
        }); //레디펑션 end
        
      //로그인& 조인 모달 
        $('#myModal').modal('show');
        
        function logout(){
    		
    		location.href = "logout_05";
    	}
        
 
        
        //지역별 테마를 담는 변수 
        function theme_Data(areacode, themecode){
            
            sigungucode = eval($("#test1").val());
            
        	var url2 ="";
            url2 = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey="
                   +key;
            url2 += "&contentTypeId=&areaCode="+areacode+"&sigunguCode="+sigungucode+"&cat1="+themecode+"&cat3=&listYN=Y&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=A&numOfRows=11&pageNo=1";
            url2 += "&_type=json";

            
            $.getJSON(url2,function(data) {
               var content = ""; 
               content += '<ul class="list-inline job-seeker">';
               // var addr = data.response.body.items.item.addr1;
                   // var addr1=addr.split(" ",1); //시의 정보를 가져오는 변수
               // var cityname = "<h1>"+addr1+"</h1>";
               var length=data.response.body.items.item.length;
               //console.log(data);   
               
                
                for (var i = 0; i < 3; i++) {
              	 //컨텐트아이디 추출
      	         //console.log(con);
      	         var val = Math.floor( Math.random()*length);
				 	console.log(val);	
				 var con = data.response.body.items.item[val].contentid;
 		         	console.log(con);
 		         var conType=data.response.body.items.item[val].contenttypeid;
      	           if (typeof (data.response.body.items.item[val].firstimage) !== 'undefined') {
      	        	   
      	        	 content += '<li><a href="SC_07place?CONTENT_ID='+con+'&CONTENT_TYPE_ID='+conType+'"><img src='+data.response.body.items.item[val].firstimage+' width="300" height="200" alt="">';
      	        	 content += '<div class="overlay"><h3>'
							+ data.response.body.items.item[val].title
							+ '</h3><p>'
							+ data.response.body.items.item[val].addr1
							+ '</p></div></a></li>'; 
      	       
            		} else {
                   		
                   }
                }
                
                //자연
                if(themecode === "A01&cat2="){
                   $("#home").html(content); 
               //역사 
                }else if(themecode === "A02&cat2=A0201"){
                    $("#home").html(content);
                //휴양
                }else if(themecode === "A02&cat2=A0202"){
                   $("#home").html(content);
                //체험
                }else if(themecode === "A02&cat2=A0202"){
                   $("#home").html(content);
                //건축   
                }else if(themecode === "A02&cat2=A0203"){
                   $("#home").html(content);
                //문화시설
                }else if(themecode === "A02&cat2=A0206"){
                   $("#home").html(content);
                //레포츠
                }else if(themecode === "A03" ){
                   $("#home").html(content);
                //쇼핑    
                }else if(themecode === "A04" ){
                   $("#home").html(content); 
                //음식    
                }else{
                   $("#home").html(content);
                }
                
            });         
         }
         
        
        /* 3장의 도시 이미지를 출력하는 메소드  */
        function city_img(areacode){
        	
        	var imageArray = [];
        	var city_info = "";  
            if (areacode == 1) { /*서울 */
               
            	city_info += '<div class="container">';
            	city_info += '<div class="row page-title text-center wow zoomInDown" data-wow-delay="1s">';
            	city_info += '<h2>ソウル</h2>';
            	city_info += '<h1>SEOUL</h1>';
            	city_info += '</div></div>';
            	
            	$("#city_info").html(city_info);
            	
            	imageArray.push("./resources/image/seoul/seoul.jpg");
               imageArray.push("./resources/image/seoul/seoul2.jpg");
               imageArray.push("./resources/image/seoul/seoul3.jpg");
               
            } else if (areacode == 2) { /* 인천 */
            	
            	city_info += '<div class="container">';
            	city_info += '<div class="row page-title text-center wow zoomInDown" data-wow-delay="1s">';
            	city_info += '<h2>インチョン</h2>';
            	city_info += '<h1>인천</h1>';
            	city_info += '</div></div>';
            	
            	$("#city_info").html(city_info);
            	
                imageArray.push("./resources/image/05_city/incheon770.jpg");
                imageArray.push("./resources/image/05_city/incheon770.jpg");
                imageArray.push("./resources/image/05_city/incheon770.jpg");
             
            } else if (areacode == 3) { /* 대전 */
            	
            	city_info += '<div class="container">';
            	city_info += '<div class="row page-title text-center wow zoomInDown" data-wow-delay="1s">';
            	city_info += '<h2>大田(テジョン)</h2>';
            	city_info += '<h1>DAEJOEN</h1>';
            	city_info += '</div></div>';
            	
            	$("#city_info").html(city_info);
            	
                imageArray.push("./resources/image/");
                imageArray.push("./resources/image/");
                imageArray.push("./resources/image/");
         
             } else if (areacode == 4) { /* 대구 */
            	 
            	city_info += '<div class="container">';
             	city_info += '<div class="row page-title text-center wow zoomInDown" data-wow-delay="1s">';
             	city_info += '<h2>大邱(テグ)</h2>';
             	city_info += '<h1>DAEGU</h1>';
             	city_info += '</div></div>';
             	
             	$("#city_info").html(city_info);
            	 
                 imageArray.push("./resources/image/");
                 imageArray.push("./resources/image/");
                 imageArray.push("./resources/image/");
            
              } else if (areacode == 5) { /* 광주 */
            	  
            	  city_info += '<div class="container">';
               	city_info += '<div class="row page-title text-center wow zoomInDown" data-wow-delay="1s">';
               	city_info += '<h2>光州(クァンジュ)</h2>';
               	city_info += '<h1>GWANGJU</h1>';
               	city_info += '</div></div>';
               	
               	$("#city_info").html(city_info);
            	  
                  imageArray.push("./resources/image/");
                  imageArray.push("./resources/image/");
                  imageArray.push("./resources/image/");
             
               }  else if (areacode == 6) { /* 부산  */
            	   
            	   city_info += '<div class="container">';
                  	city_info += '<div class="row page-title text-center wow zoomInDown" data-wow-delay="1s">';
                  	city_info += '<h2>釜山(プサン)</h2>';
                  	city_info += '<h1>BUSAN</h1>';
                  	city_info += '</div></div>';
               
                  	$("#city_info").html(city_info);
                  	
                   imageArray.push("./resources/image/busan/busan1.jpg");
                   imageArray.push("./resources/image/busan/busan2.jpg");
                   imageArray.push("./resources/image/busan/busan3.jpg");
              
                } else if (areacode == 7) { /*울산 */
                    imageArray.push("./resources/image/");
                    imageArray.push("./resources/image/");
                    imageArray.push("./resources/image/");
               
                 } else if (areacode == 8) { /* 세종시  */
                     imageArray.push("./resources/image/");
                     imageArray.push("./resources/image/");
                     imageArray.push("./resources/image/");
                
                  } else if (areacode == 31) { /* 경기도 */
                	   city_info += '<div class="container">';
                     	city_info += '<div class="row page-title text-center wow zoomInDown" data-wow-delay="1s">';
                     	city_info += '<h2>キョンギ・ド</h2>';
                     	city_info += '<h1>경기도</h1>';
                     	city_info += '</div></div>';
                	  
                      	$("#city_info").html(city_info);
                	  
                      imageArray.push("./resources/image/");
                      imageArray.push("./resources/image/");
                      imageArray.push("./resources/image/");
                 
                   } else if (areacode == 32) { /* 강원도  */
                	   
                	   city_info += '<div class="container">';
                    	city_info += '<div class="row page-title text-center wow zoomInDown" data-wow-delay="1s">';
                    	city_info += '<h2>カンウォン・ド</h2>';
                    	city_info += '<h1>강원도</h1>';
                    	city_info += '</div></div>';
               	  
                     	$("#city_info").html(city_info);
                	   
                       imageArray.push("./resources/image/");
                       imageArray.push("./resources/image/");
                       imageArray.push("./resources/image/");
                  
                    } else if (areacode == 33) { /* 충청북도  */
                    	
                    	city_info += '<div class="container">';
                    	city_info += '<div class="row page-title text-center wow zoomInDown" data-wow-delay="1s">';
                    	city_info += '<h2>チュンチョンブク・ト</h2>';
                    	city_info += '<h1>충청북도</h1>';
                    	city_info += '</div></div>';
               	  
                     	$("#city_info").html(city_info);
                    	
                        imageArray.push("./resources/image/");
                        imageArray.push("./resources/image/");
                        imageArray.push("./resources/image/");
                   
                     } else if (areacode == 34) { /* 충남  */
                    	 
                    	   	city_info += '<div class="container">';
                        	city_info += '<div class="row page-title text-center wow zoomInDown" data-wow-delay="1s">';
                        	city_info += '<h2></h2>';
                        	city_info += '<h1>충청남도</h1>';
                        	city_info += '</div></div>';
                   	  
                         	$("#city_info").html(city_info);
                    	 
                         imageArray.push("./resources/image/");
                         imageArray.push("./resources/image/");
                         imageArray.push("./resources/image/");
                    
                      } else if (areacode == 35) { /* 경북 */
                    	  
                    	 	city_info += '<div class="container">';
                        	city_info += '<div class="row page-title text-center wow zoomInDown" data-wow-delay="1s">';
                        	city_info += '<h2></h2>';
                        	city_info += '<h1>경상북도</h1>';
                        	city_info += '</div></div>';
                   	  
                         	$("#city_info").html(city_info);
                    	  
                          imageArray.push("./resources/image/");
                          imageArray.push("./resources/image/");
                          imageArray.push("./resources/image/");
                     
                       } else if (areacode == 36) { /*경남 */
                    	   
                    		city_info += '<div class="container">';
                        	city_info += '<div class="row page-title text-center wow zoomInDown" data-wow-delay="1s">';
                        	city_info += '<h2></h2>';
                        	city_info += '<h1>경상남도</h1>';
                        	city_info += '</div></div>';
                   	  
                         	$("#city_info").html(city_info);
                    	   
                    	   
                           imageArray.push("./resources/image/");
                           imageArray.push("./resources/image/");
                           imageArray.push("./resources/image/");
                      
                        }else if (areacode == 37) { /* 전북  */
                        	
                        	city_info += '<div class="container">';
                        	city_info += '<div class="row page-title text-center wow zoomInDown" data-wow-delay="1s">';
                        	city_info += '<h2></h2>';
                        	city_info += '<h1>전라북도</h1>';
                        	city_info += '</div></div>';
                   	  
                         	$("#city_info").html(city_info);
                        	
                            imageArray.push("./resources/image/");
                            imageArray.push("./resources/image/");
                            imageArray.push("./resources/image/");
                       
                         }else if (areacode == 38) { /*전남  */
                        	 
                        		city_info += '<div class="container">';
                            	city_info += '<div class="row page-title text-center wow zoomInDown" data-wow-delay="1s">';
                            	city_info += '<h2></h2>';
                            	city_info += '<h1>전라남도</h1>';
                            	city_info += '</div></div>';
                       	  
                             	$("#city_info").html(city_info);
                        	 
                             imageArray.push("./resources/image/");
                             imageArray.push("./resources/image/");
                             imageArray.push("./resources/image/");
                        
                          }else if (areacode == 39) { /*제주도  */
                        	  
                        	  
                      		city_info += '<div class="container">';
                          	city_info += '<div class="row page-title text-center wow zoomInDown" data-wow-delay="1s">';
                          	city_info += '<h2>JEJUDO</h2>';
                          	city_info += '<h1>제주도</h1>';
                          	city_info += '</div></div>';
                     	  
                           	$("#city_info").html(city_info);
                        	  
                              imageArray.push("./resources/image/");
                              imageArray.push("./resources/image/");
                              imageArray.push("./resources/image/");
                           }
                 
                 $.each($(".slide-image"), function(index, item) {
                     $(this).attr("src", imageArray[index]);
                  });
        }
        
        
        //지역의 모든 장소를 가져오는 함수 
        function popular_Data(areacode) {

        	sigungucode = eval($("#test1").val());
            //지역별 인기 장소를 담는 변수
            var url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey="
                  + key;
            url += "&contentTypeId=&areaCode="
                  + areacode
                  + "&sigunguCode="+sigungucode+"&cat1=&cat2=&cat3=&listYN=Y&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=A&numOfRows=500&pageNo=";
            url += "&_type=json";
            
        	console.log(url);
            $.getJSON(url,function(data) {
            	console.log(data);
            			console.log(data);
                           var content2 =""
                           content2 += '<ul class="list-inline job-seeker">';
                  	       	 var length=data.response.body.items.item.length;
                           for (var i = 0; i < 6; i++) {
                  	       	 var val = Math.floor(Math.random() * length);  
                          	
                          	//컨텐트아이디 추출
                  	       var con = data.response.body.items.item[val].contentid;
                  	       var conType=data.response.body.items.item[val].contenttypeid;
                  	     if (typeof (data.response.body.items.item[val].firstimage) !== 'undefined') {
                          	
                                  content2 += '<li><a href="SC_07place?CONTENT_ID='+con+'&CONTENT_TYPE_ID='+conType+'"><img src='+data.response.body.items.item[val].firstimage+' width="300" height="200" alt="">';
                                  content2 += '<div class="overlay"><h3>'
										+ data.response.body.items.item[val].title
										+ '</h3><p>'
										+ data.response.body.items.item[val].addr1
										+ '</p></div></a></li>'; 
                              
                              } else {
                    			i--;
                              }
                                      
                           }//for
                           /*  $("#tabtab").html(function(index,content){
                               return content2;                      
                            }); */
                           $("#tabtab").html(content2);
                            
                        }); //json
                     }
        </script>
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
					</div>
				</div>
				<div
					class="col-md-2 col-md-offset-5  col-sm-3 col-sm-offset-1  col-xs-3  col-xs-offset-1">
			<c:choose>
			<c:when test="${sessionScope.id == null }">	
					<div class="header-half header-social">
					</div>
			</c:when>
			<c:otherwise>
				<div class="header-half header-social">
						<ul class="list-inline">
							<li><img src="./resources/image/login_img.png">${sessionScope.id }님 환영합니다</li>
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
			<a href="home"><img
					src="./resources/image/logoicon.png" alt="" width="80px" height="80px"></a>
					<img src="./resources/image/main_logo.png" alt="">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<!-- <a class="navbar-brand" href="#"><img
					src="./resources/image/logoicon.png" alt="" width="80px" height="80px"></a>		 -->
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<div class="button navbar-right">
				
			<c:choose>
			<c:when test="${sessionScope.id == null }">
					<button type="button" id="loginForm"
						class="navbar-btn nav-button wow bounceInRight login"
						data-toggle="modal" data-target="#myModal" id="loginForm" data-wow-delay="0.8s">Login</button>
					<button type="button" id="joinForm"
						class="navbar-btn nav-button wow fadeInRight" data-toggle="modal"
						data-target="#myModal" id="joinForm" data-wow-delay="0.6s" >Join</button>
			</c:when>	
			<c:otherwise>
				<button type="button" id="Edit"
						class="navbar-btn nav-button wow bounceInRight login"
						data-toggle="modal" data-target="#myModal_Edit" id="editForm" data-wow-delay="0.8s">Edit</button>
					<button type="button"
						class="navbar-btn nav-button wow fadeInRight" id="logout" data-wow-delay="0.6s" onclick="logout()">logout</button>
			</c:otherwise>
			</c:choose>
			
					<!--로그인&조인 모달  -->
					<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
						aria-labelledby="myLargeModalLabel" aria-hidden="true">
						<div class="modal-dialog modal-lg">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">×</button>

									<h4 class="modal-title" id="myModalLabel">
										Login / Join</h4>
								</div>
								<div class="modal-body">
									<div class="row">
										<div class="col-md-8"
											style="border-right: 1px dotted #C2C2C2; padding-right: 30px;"> 
											<!-- Nav tabs -->
											<ul class="nav nav-tabs headertabs">
												<li class="active"><a href="#Login" id="loginAtag" data-toggle="tab">Login</a></li>
												<li><a href="#Registration" id="regAtag" data-toggle="tab">Join</a></li>
											</ul>
											<!-- Tab panes -->
											<div class="tab-content">
												<div class="tab-pane active" id="Login">
													<form role="form" class="form-horizontal">
														<div class="form-group">
															<label for="email" class="col-sm-2 control-label">
																ID</label>
															<div class="col-sm-10">
																<input type="text" class="form-control" id="email1"
																	placeholder="ID" />
															</div>
														</div>
														<div class="form-group">
															<label for="exampleInputPassword1"
																class="col-sm-2 control-label"> Password</label>
															<div class="col-sm-10">
																<input type="text" class="form-control"
																	id="exampleInputPassword1" placeholder="Password" />
															</div>
														</div>
														<div class="row">
															<div class="col-sm-2"></div>
															<div class="col-sm-10">
																<button type="submit" class="btn btn-primary btn-sm">
																	Submit</button>
																<a href="javascript:;">Forgot your password?</a>
															</div>
														</div>
													</form>
												</div>
												<div class="tab-pane" id="Registration">
													<form role="form" class="form-horizontal">
														<div class="form-group">
															<label for="email" class="col-sm-2 control-label">
																ID</label>
															<div class="col-sm-10">
																<div class="row">
																	<div class="col-md-3">
																		<select class="form-control">
																			<option>남성</option>
																			<option>여성</option>
																		</select>
																	</div>
																	<div class="col-md-9">
																		<input type="text" class="form-control"
																			placeholder="ID" />
																	</div>
																</div>
															</div>
														</div>
														<div class="form-group">
															<label for="email" class="col-sm-2 control-label">
																Email</label>
															<div class="col-sm-10">
																<input type="email" class="form-control" id="email"
																	placeholder="Email" />
															</div>
														</div>
														<div class="form-group">
															<label for="mobile" class="col-sm-2 control-label">
																Password</label>
															<div class="col-sm-10">
																<input type="password" class="form-control"
																	id="password1" placeholder="Password" />
															</div>
														</div>
														<div class="form-group">
															<label for="password" class="col-sm-2 control-label">
															</label>
															<div class="col-sm-10">
																<input type="password" class="form-control"
																	id="password2" placeholder="Password 확인" />
															</div>
														</div>
														<div class="row">
															<div class="col-sm-2"></div>
															<div class="col-sm-10">
																<button type="button" class="btn btn-primary btn-sm">
																	Save & Continue</button>
																<button type="button" class="btn btn-default btn-sm">
																	Cancel</button>
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
					<!--로그인&조인 모달 끝 -->
					<!--정보수정 모달 시작  -->
					<div class="modal fade" id="myModal_Edit" tabindex="-1" role="dialog"
						aria-labelledby="myLargeModalLabel" aria-hidden="true">
						<div class="modal-dialog modal-lg">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">×</button>

									<h4 class="modal-title" id="myModalLabel">
										Edit my information</h4>
								</div>
								<div class="modal-body">
									<div class="row">
										<div class="col-md-8"
											style="border-right: 1px dotted #C2C2C2; padding-right: 30px;"> 
											<!-- Nav tabs -->
											<ul class="nav nav-tabs headertabs">
												<li class="active"><a href="#Login" id="loginAtag" data-toggle="tab">Edit</a></li>
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
																		<select class="form-control">
																			<option>남성</option>
																			<option>여성</option>
																		</select>
																	</div>
																	<div class="col-md-9">
																		<input type="text" class="form-control"
																			placeholder="ID" />
																	</div>
																</div>
															</div>
														</div>
														<div class="form-group">
															<label for="email" class="col-sm-2 control-label">
																Email</label>
															<div class="col-sm-10">
																<input type="email" class="form-control" id="email"
																	placeholder="Email" />
															</div>
														</div>
														<div class="form-group">
															<label for="mobile" class="col-sm-2 control-label">
																Password</label>
															<div class="col-sm-10">
																<input type="password" class="form-control"
																	id="password1" placeholder="Password" />
															</div>
														</div>
														<div class="form-group">
															<label for="password" class="col-sm-2 control-label">
															</label>
															<div class="col-sm-10">
																<input type="password" class="form-control"
																	id="password2" placeholder="Password 확인" />
															</div>
														</div>
														<div class="row">
															<div class="col-sm-2"></div>
															<div class="col-sm-10">
																<button type="button" class="btn btn-primary btn-sm">
																	Save & Continue</button>
																<button type="button" class="btn btn-default btn-sm">
																	Cancel</button>
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
				<c:when test="${sessionScope.id == null }">
				
				<ul class="main-nav nav navbar-nav navbar-right">
					<li class="wow fadeInDown" data-wow-delay="0s"><a
						class="active" href="SC_11">일정 만들기</a></li>
					<li class="wow fadeInDown" data-wow-delay="0.1s"><a href="#">나의 일정 보기</a></li>
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
					<li class="wow fadeInDown" data-wow-delay="0.1s"><a href="#">나의 일정 보기</a>
					</li>
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


	<div class="content-area" id="city_info">
		<!-- <div class="container">
			<div class="row page-title text-center wow zoomInDown"
				data-wow-delay="1s">
				<h1>SEOUL</h1>
				<h2>서울은 먼지가 많다많다많다 </h2>
				<p>서울은 가장 아름 다운 도시입니다.</p>
			</div>
			</div> -->
		</div>
	

		<!--도시 이미지  -->
		    <div class="row carousel-holder">

               <div class="col-md-12">
                  <div id="carousel-example-generic" class="carousel slide"
                     data-ride="carousel">
                     <ol class="carousel-indicators">
                        <li data-target="#carousel-example-generic" data-slide-to="0"
                           class="active"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                     </ol>
                     
                     <div class="carousel-inner">
                        <div class="item active">
                           <img class="slide-image" src="./resources/image/seoul/seoul.jpg"
                              alt="">
                        </div>
                        <div class="item">
                           <img class="slide-image" src="./resources/image/seoul/seoul.jpg"
                              alt="">
                        </div>
                        <div class="item">
                           <img class="slide-image" src="./resources/image/seoul/seoul.jpg"
                              alt="">
                        </div>
                     </div>
                    
                     <a class="left carousel-control" href="#carousel-example-generic"
                        data-slide="prev"> <span
                        class="glyphicon glyphicon-chevron-left"></span>
                     </a> <a class="right carousel-control"
                        href="#carousel-example-generic" data-slide="next"> <span
                        class="glyphicon glyphicon-chevron-right"></span>
                     </a>
                     
                  </div>
               </div>

            </div>

		
		
				
		<div class="container">
			<div class="row job-posting wow fadeInUp" data-wow-delay="1s"
				id="rowjob">
				<div role="tabpanel">
					<!-- Nav tabs -->
					<ul class="nav nav-tabs" role="tablist">
						<li id="bMenu0" role="presentation" class="active"><a href="#job-seekers"
							aria-controls="home" role="tab" data-toggle="tab">자연</a></li>
						<li id="bMenu1" role="presentation"><a href="#employeers"
							aria-controls="profile" role="tab" data-toggle="tab">역사</a></li>
						<li id="bMenu2" role="presentation"><a href="#"
							aria-controls="profile" role="tab" data-toggle="tab">휴양</a></li>
						<li id="bMenu3" role="presentation"><a href="#"
							aria-controls="profile" role="tab" data-toggle="tab">체험</a></li>
						<li id="bMenu4" role="presentation"><a href="#"
							aria-controls="profile" role="tab" data-toggle="tab">건축</a></li>
						<li id="bMenu5" role="presentation"><a href="#"
							aria-controls="profile" role="tab" data-toggle="tab">문화시설</a></li>
						<li id="bMenu6" role="presentation"><a href="#"
							aria-controls="profile" role="tab" data-toggle="tab">레포츠</a></li>
						<li id="bMenu7" role="presentation"><a href="#"
							aria-controls="profile" role="tab" data-toggle="tab">쇼핑</a></li>
						<li id="bMenu8" role="presentation"><a href="#"
							aria-controls="profile" role="tab" data-toggle="tab">음식</a></li>
					</ul>

					<!-- Tab panes -->
					<div class="tab-content">
					<!--자연-->
						<div role="tabpanel" class="tab-pane fade in active"
							id="home">
						 <!-- 행사정보  -->	
						</div>
				<!-- 		<div role="tabpanel" class="tab-pane fade" id="employeers">
							<ul class="list-inline">
								<li><a href=""> <img
										src="./resources/img/employee4.png" alt="">
										<div class="overlay">
											<h3>Instagram</h3>
										</div>
								</a></li>
							</ul>
						</div> -->
						<div role="tabpanel" class="tab-pane fade" id="menu1">
						</div>
						<div role="tabpanel" class="tab-pane fade" id="menu2">
						</div>
						<div role="tabpanel" class="tab-pane fade" id="menu3">
						</div>
						<div role="tabpanel" class="tab-pane fade" id="menu4">
						</div>
						<div role="tabpanel" class="tab-pane fade" id="menu5">
						</div>
						<div role="tabpanel" class="tab-pane fade" id="menu6">
						</div>
						<div role="tabpanel" class="tab-pane fade" id="menu7">
						</div>
						<div role="tabpanel" class="tab-pane fade" id="menu8">
						</div>
						
					</div>
				</div>
			</div>
		</div>
	

	   <div class="container">
		<div class="row job-posting wow fadeInUp" data-wow-delay="1s"
			id="rowjob">
			<div role="tabpanel">
				<!-- Nav tabs -->
				<ul class="nav nav-tabs" role="tablist">
					<li role="presentation" class="active"><a href="#tabtab"
						aria-controls="home" role="tab" data-toggle="tab">추천 장소</a></li>
				</ul>

				<!-- Tab panes -->
				<div class="tab-content">
					<div role="tabpanel" class="tab-pane fade in active"
						id="tabtab">
						<!-- <ul class="list-inline job-seeker">

								<li><a href=""> <img
										src="./resources/img/team-small-5.jpg" alt="">
										<div class="overlay">
											<h3>Ohidul Islam</h3>
											<p>Web Designer</p>
										</div>
								</a></li>
								<li><a href=""> <img
										src="./resources/img/team-small-6.jpg" alt="">
										<div class="overlay">
											<h3>Mohidul Islam</h3>
											<p>CEO</p>
										</div>
								</a></li>
								<li><a href=""> <img
										src="./resources/img/team-small-3.jpg" alt="">
										<div class="overlay">
											<h3>Unknown girl</h3>
											<p>Graphic Designer</p>
										</div>
								</a></li>
								<li><a href=""> <img
										src="./resources/img/team-small-4.jpg" alt="">
										<div class="overlay">
											<h3>Eftakher Alam</h3>
											<p>Graphic Designer</p>
										</div>
								</a></li>
								<li><a href=""> <img
										src="./resources/img/team-small-2.jpg" alt="">
										<div class="overlay">
											<h3>Mark Otto</h3>
											<p>Founder</p>
										</div>
								</a></li>
								<li><a href=""> <img
										src="./resources/img/team-small-1.jpg" alt="">
										<div class="overlay">
											<h3>Rasel Ahmed</h3>
											<p>Web Developer</p>
										</div>
								</a></li>
							</ul> -->
					</div>
					<!-- <div role="tabpanel" class="tab-pane fade" id="employeers">
						<ul class="list-inline">
							<li><a href=""> <img src="./resources/img/employee4.png"
									alt="">
									<div class="overlay">
										<h3>Instagram</h3>
									</div>
							</a></li>
							<li><a href=""> <img src="./resources/img/employee5.png"
									alt="">
									<div class="overlay">
										<h3>Microsoft</h3>
									</div>
							</a></li>
							<li><a href=""> <img src="./resources/img/employee6.png"
									alt="">
									<div class="overlay">
										<h3>Dribbble</h3>
									</div>
							</a></li>
							<li><a href=""> <img src="./resources/img/employee1.png"
									alt="">
									<div class="overlay">
										<h3>Beats Music</h3>
									</div>
							</a></li>
							<li><a href=""> <img src="./resources/img/employee2.png"
									alt="">
									<div class="overlay">
										<h3>Facebook</h3>
									</div>
							</a></li>
							<li><a href=""> <img src="./resources/img/employee3.png"
									alt="">
									<div class="overlay">
										<h3>Twitter</h3>
									</div>
							</a></li>
						</ul>
					</div> -->
				</div>
			</div>
		</div>
	</div>

		<!-- <hr>
		<div class="container">
			<div class="row page-title text-center  wow bounce"
				data-wow-delay=".7s">
				<h5>TESTIMONIALS</h5>
				<h2>WHAT PEOPLES ARE SAYING</h2>
			</div>
			<div class="row testimonial">
				<div class="col-md-12">
					<div id="testimonial-slider">
						<div class="item">
							<div class="client-text">
								<p>Jobify offer an amazing service and I couldn’t be
									happier! They are dedicated to helping recruiters find great
									candidates, wonderful service!</p>
								<h4>
									<strong>Ohidul Islam, </strong><i>Web Designer</i>
								</h4>
							</div>
							<div class="client-face wow fadeInRight" data-wow-delay=".9s">
								<img src="./resources/img/client-face1.png" alt="">
							</div>
						</div>
						<div class="item">
							<div class="client-text">
								<p>Jobify offer an amazing service and I couldn’t be
									happier! They are dedicated to helping recruiters find great
									candidates, wonderful service!</p>
								<h4>
									<strong>Ohidul Islam, </strong><i>Web Designer</i>
								</h4>
							</div>
							<div class="client-face">
								<img src="./resources/img/client-face2.png" alt="">
							</div>
						</div>
						<div class="item">
							<div class="client-text">
								<p>Jobify offer an amazing service and I couldn’t be
									happier! They are dedicated to helping recruiters find great
									candidates, wonderful service!</p>
								<h4>
									<strong>Ohidul Islam, </strong><i>Web Designer</i>
								</h4>
							</div>
							<div class="client-face">
								<img src="./resources/img/client-face1.png" alt="">
							</div>
						</div>
						<div class="item">
							<div class="client-text">
								<p>Jobify offer an amazing service and I couldn’t be
									happier! They are dedicated to helping recruiters find great
									candidates, wonderful service!</p>
								<h4>
									<strong>Ohidul Islam, </strong><i>Web Designer</i>
								</h4>
							</div>
							<div class="client-face">
								<img src="./resources/img/client-face2.png" alt="">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div> -->

	</div>

	<!-- Modal -->
<%--  	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title"></h4>
				</div>
				<div class="modal-body">
					<div class="modal fade" id="userView" role="dialog">
						<div class="modal-dialog">
							<jsp:include page="/WEB-INF/views/joinForm.jsp" />
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>  --%>

    <input type="hidden" id="test1" value="${sigungucode}">
	<!-- footer -->
	<div class="footer-area">
		<div class="container">
			<br><br>
			<div class="row footer-copy">
			</div>
		</div>
	</div>
</body>
</html>