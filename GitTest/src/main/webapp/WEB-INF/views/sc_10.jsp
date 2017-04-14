<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
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
        <link rel ="stylesheet" href ="./resources/css/10css.css">
        <script type="text/javascript"src="<c:url value="/resources/js/jquery-3.1.1.js"/>"></script>
        <script	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCW-Yin1kq0i_E_hqmkCdFXNWIaJLRoUN8&callback=initMap"
		async defer></script>
    </head>
    <body>

        <div id="preloader">
            <div id="status">&nbsp;</div>
        </div>
        <!-- Body content -->
		
       

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
                <li class="wow fadeInDown" data-wow-delay="0.5s"><a href="#">Contact</a></li>
              </ul>
            </div><!-- /.navbar-collapse -->
          </div><!-- /.container-fluid -->
        </nav>

        <div class="slider-area">
            <div class="slider">
                <div id="bg-slider" class="owl-carousel owl-theme">
                 
                  <div class="item"><img src="./resources/img/slider-image-3.jpg" alt="Mirror Edge"></div>
                  <div class="item"><img src="./resources/img/slider-image-2.jpg" alt="The Last of us"></div>
                  <div class="item"><img src="./resources/img/slider-image-1.jpg" alt="GTA V"></div>
                 
                </div>
            </div>
            <div class="container slider-content">
                <div class="row">
                    <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1 col-sm-12">
                        <h2>여행 일정</h2>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eligendi deserunt deleniti, ullam commodi sit ipsam laboriosam velit adipisci quibusdam aliquam teneturo!</p>                        
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
                        <li role="presentation" class="active"><a href="#job-seekers" aria-controls="home" role="tab" data-toggle="tab">클립 보드</a></li>
                        <li role="presentation"><a href="#employeers" aria-controls="profile" role="tab" data-toggle="tab">여행 일정</a></li>
                      </ul>

                      <!-- Tab panes -->
                      <div class="tab-content">
                        <div role="tabpanel" class="tab-pane fade in active" id="job-seekers">
                            <ul class="list-inline job-seeker" >
                             	<!-- 클립보드 탭 -->
                             <div id="clipInfo" class="clipInfo">  
                                
                             </div> 
                            </ul>
                        </div>
                        <div role="tabpanel" class="tab-pane fade" id="employeers">
                            <ul class="list-inline">
                            <!-- 여행일정 -->
                                <div id="myPlan" class="myPlan"></div>
                                
                                
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
                            <img src="./resources/img/footer-logo.png" alt="" class="wow pulse" data-wow-delay="1s">
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Obcaecati architecto quaerat facere blanditiis tempora sequi nulla accusamus, possimus cum necessitatibus suscipit quia autem mollitia, similique quisquam molestias. Vel unde, blanditiis.</p>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="single-footer">
                            <h4>Twitter update</h4>
                            <div class="twitter-updates">
                                <div class="single-tweets">
                                    <h5>ABOUT 9 HOURS</h5>
                                    <p><strong>AGOMeet Aldous</strong> - a Brave New World for #rails with more cohesion, less coupling and greater dev speed <a href="http://t.co/rsekglotzs">http://t.co/rsekglotzs</a></p>
                                </div>
                                <div class="single-tweets">
                                    <h5>ABOUT 9 HOURS</h5>
                                    <p><strong>AGOMeet Aldous</strong> - a Brave New World for #rails with more cohesion, less coupling and greater dev speed <a href="http://t.co/rsekglotzs">http://t.co/rsekglotzs</a></p>
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
                    <p><span>(C) webstie, All rights reserved</span> | <span>Graphic Designed by <a href="https://dribbble.com/siblu">Eftakher Alam</a></span> | <span> Web Designed by <a href="http://ohidul.me">Ohidul Islam</a></span> </p>
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
<script type="text/javascript">
var key = "mAI%2FYXQZ6r2tOuKRb5BjfkHXavB%2BYidXtnLge18Ft%2Fzx2OvvU2Eq7za7nmbfumFdLtG7IOLQSoDYF2pAcMd3aw%3D%3D";
var url;
function ReadApi(contentId,contentTypeId) { /* currentPage가 어디서 호출되어 온다 */
	url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?ServiceKey="+key;
	url += "&mapX&mapY";
	url += "&contentTypeId"+contentTypeId+"&contentId="+contentId+"&areaCode&sigunguCode&cat1=&cat2=&cat3=&listYN=Y";
	url += "&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&transGuideYN=Y&_type=json";
	
}


 $(function(){

	$.ajax({
		type : "get",
		url : "readClip",
		success : function(data){
			var html="";
			$.each(data,function(index,item){
				console.log(data);
				var contentId=item.content_ID;
				var contentTypeId=item.content_TYPE_ID;
				ReadApi(contentId,contentTypeId);
				/* var url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?ServiceKey="+key;
				url += "&mapX&mapY";
				url += "&contentTypeId="+contentTypeId+"&contentId="+contentId+"&areaCode&sigunguCode&cat1=&cat2=&cat3=&listYN=Y";
				url += "&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&transGuideYN=Y&_type=json"; */
			console.log(url);
			$.getJSON(url, function(data) {

			    console.log('success', data);
			    
			    
			    html += '<li>';
				html += '<a href="SC_07place?CONTENT_ID='+contentId+'&CONTENT_TYPE_ID='+contentTypeId+'">';
				
				html += '<img src='+data.response.body.items.item.firstimage+' width=170 height=190>';
				html += '<div class="overlay"><h3>'+data.response.body.items.item.title+'</h3></div>';
				html += '</a>';
				html += '</li>';
			
			$("#clipInfo").html(html);
			}); 
			})
				
		},
		error : function(e){
			console.log(e);
		}
	}) 
	}) 
	
$(function(){

	$.ajax({
		type : "get",
		url : "read_scd",
		success : function(data){
			var html="";
			console.log(data);
			$.each(data,function(index,item){
				console.log(item);
				var contentId=item.DTL_CONTENT_ID; 
				/* var url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?ServiceKey="+key;
				url += "&mapX&mapY";
				url += "&contentTypeId&contentId="+contentId+"&areaCode&sigunguCode&cat1=&cat2=&cat3=&listYN=Y";
				url += "&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&transGuideYN=Y&_type=json"; */
			     ReadApi(contentId);
			console.log(url);
			$.getJSON(url, function(data) {
				
			    console.log('success1', data);
			    var scd_sq=item.SCD_SQ;
			    console.log(scd_sq);
			    if (typeof (data.response.body.items.item.firstimage) !== "undefined") {
			    	
			    	html += '<li>';
					html += '<a href="SC_12?scd_sq='+scd_sq+'">'; 
					html += '<img src='+data.response.body.items.item.firstimage+' width=170 height=190>';
					if (typeof (item.SCD_DESC) !== "undefined") {
						html += '<div class="overlay"><h3>'+item.SCD_TITLE+'<br>'+item.SCD_DESC+'</h3></div>';	
						}else{
							html += '<div class="overlay"><h3>'+item.SCD_TITLE+'</h3></div>';	
						}					
					html += '</a>';
					html += '</li>';
				
				$("#myPlan").html(html);
			    }else if (typeof (data.response.body.items.item.firstimage) == "undefined") {
			    	contentId=item.DTL_CONTENT_ID2;
			    	ReadApi(contentId);
			    $.getJSON(url, function(data) {
			    	html += '<li>';
					html += '<a href="SC_12?scd_sq='+scd_sq+'">'; 
					html += '<img src='+data.response.body.items.item.firstimage+' width=170 height=190>';
					if (typeof (item.SCD_DESC) !== "undefined") {
					html += '<div class="overlay"><h3>'+item.SCD_TITLE+'<br>'+item.SCD_DESC+'</h3></div>';	
					}else{
						html += '<div class="overlay"><h3>'+item.SCD_TITLE+'</h3></div>';	
					}
					html += '</a>';
					html += '</li>';
				
				$("#myPlan").html(html);
			    	
			    })
			    	
			    }
			    console.log(data.response.body.items.item); 
			 });
			
			})
				
		},
		error : function(e){
			console.log(e);
		}
	}) 
	}) 
 
	
	 
</script>    
</html>