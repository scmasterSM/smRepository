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
                                <span><i class="icon-cloud"></i>+019 4854 8817</span>
                                <span><i class="icon-mail"></i>ohidul.islam951@gmail.com</span>
                            </p>
                        </div>
                    </div>
                    <div class="col-md-2 col-md-offset-5  col-sm-3 col-sm-offset-1  col-xs-3  col-xs-offset-1">
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
                            <ul class="list-inline job-seeker" id="clipInfo">
                                
                      <%--           <c:forEach var="reply" items="${rList}">
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
				</c:forEach> --%>
                              <%--   <c:forEach var="reply" items="${cList}"> --%>
                                
                                <li>
                               	<!-- 클립보드  -->
                                    <a href="">
                                        
                                        <div class="overlay"><h3>Ohidul Islam</h3><p>Web Designer</p></div>
                                    </a>
                                </li>
                             <%--    </c:forEach> --%>
                                <li>
                                    <a href="">
                                        <img src="./resources/img/team-small-6.jpg" alt="">
                                        <div class="overlay"><h3>Mohidul Islam</h3><p>CEO</p></div>
                                    </a>
                                </li>
                                
                                <li>
                                    <a href="">
                                        <img src="./resources/img/team-small-3.jpg" alt="">
                                        <div class="overlay"><h3>Unknown girl</h3><p>Graphic Designer</p></div>
                                    </a>
                                </li>
                                <li>
                                    <a href="">
                                        <img src="./resources/img/team-small-4.jpg" alt="">
                                        <div class="overlay"><h3>Eftakher Alam</h3><p>Graphic Designer</p></div>
                                    </a>
                                </li>
                                <li>
                                    <a href="">
                                        <img src="./resources/img/team-small-2.jpg" alt="">
                                        <div class="overlay"><h3>Mark Otto</h3><p>Founder</p></div>
                                    </a>
                                </li>
                                <li>
                                    <a href="">
                                        <img src="./resources/img/team-small-1.jpg" alt="">
                                        <div class="overlay"><h3>Rasel Ahmed</h3><p>Web Developer</p></div>
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <div role="tabpanel" class="tab-pane fade" id="employeers">
                            <ul class="list-inline">
                            <!-- 여행일정 -->
                                <li>
                                    <a href="">
                                        <img src="./resources/img/employee4.png" alt="">
                                        <div class="overlay"><h3>Instagram</h3></div>
                                    </a>
                                </li>
                                <li>
                                    <a href="">
                                        <img src="./resources/img/employee5.png" alt="">
                                        <div class="overlay"><h3>Microsoft</h3></div>
                                    </a>
                                </li>
                                <li>
                                    <a href="">
                                        <img src="./resources/img/employee6.png" alt="">
                                        <div class="overlay"><h3>Dribbble</h3></div>
                                    </a>
                                </li>
                                <li>
                                    <a href="">
                                        <img src="./resources/img/employee1.png" alt="">
                                        <div class="overlay"><h3>Beats Music</h3></div>
                                    </a>
                                </li>
                                <li>
                                    <a href="">
                                        <img src="./resources/img/employee2.png" alt="">
                                        <div class="overlay"><h3>Facebook</h3></div>
                                    </a>
                                </li>
                                <li>
                                    <a href="">
                                        <img src="./resources/img/employee3.png" alt="">
                                        <div class="overlay"><h3>Twitter</h3></div>
                                    </a>
                                </li>
                            </ul>
                        </div>
                      </div>

                    </div>
                </div>
            </div>
            <hr>

            <div class="container">
                <div class="row page-title text-center wow bounce"  data-wow-delay="1s">
                    <h5>Recent Jobs</h5>
                    <h2><span>54716</span> Available jobs for you</h2>
                </div>
                <div class="row jobs">
                    <div class="col-md-9">
                        <div class="job-posts table-responsive">
                            <table class="table">
                                <tr class="odd wow fadeInUp" data-wow-delay="1s">
                                    <td class="tbl-logo"><img src="./resources/img/job-logo1.png" alt=""></td>
                                    <td class="tbl-title"><h4>Web Designer <br><span class="job-type">full time</span></h4></td>
                                    <td><p>dribbble community</p></td>
                                    <td><p><i class="icon-location"></i>San Franciso, USA</p></td>
                                    <td><p>&dollar; 14000</p></td>
                                    <td class="tbl-apply"><a href="#">Apply now</a></td>
                                </tr>
                                <tr class="even wow fadeInUp" data-wow-delay="1.1s">
                                    <td class="tbl-logo"><img src="./resources/img/job-logo2.png" alt=""></td>
                                    <td class="tbl-title"><h4>Front End Developer <br><span class="job-type">full time</span></h4></td>
                                    <td><p>Jolil corporation</p></td>
                                    <td><p><i class="icon-location"></i>San Franciso, USA</p></td>
                                    <td><p>&dollar; 14000</p></td>
                                    <td class="tbl-apply"><a href="#">Apply now</a></td>
                                </tr>
                                <tr class="odd wow fadeInUp" data-wow-delay="1.2s">
                                    <td class="tbl-logo"><img src="./resources/img/job-logo3.png" alt=""></td>
                                    <td class="tbl-title"><h4>HR Manager <br><span class="job-type">full time</span></h4></td>
                                    <td><p>Fanta bevarage</p></td>
                                    <td><p><i class="icon-location"></i>San Franciso, USA</p></td>
                                    <td><p>&dollar; 14000</p></td>
                                    <td class="tbl-apply"><a href="#">Apply now</a></td>
                                </tr>
                                <tr class="even wow fadeInUp" data-wow-delay="1.3s">
                                    <td class="tbl-logo"><img src="./resources/img/job-logo4.png" alt=""></td>
                                    <td class="tbl-title"><h4>Internship Designer <br><span class="job-type">full time</span></h4></td>
                                    <td><p>Google</p></td>
                                    <td><p><i class="icon-location"></i>San Franciso, USA</p></td>
                                    <td><p>&dollar; 14000</p></td>
                                    <td class="tbl-apply"><a href="#">Apply now</a></td>
                                </tr>
                                <tr class="odd wow fadeInUp" data-wow-delay="1.4s">
                                    <td class="tbl-logo"><img src="./resources/img/job-logo5.png" alt=""></td>
                                    <td class="tbl-title"><h4>Software Designer <br><span class="job-type">full time</span></h4></td>
                                    <td><p>Microsoft</p></td>
                                    <td><p><i class="icon-location"></i>San Franciso, USA</p></td>
                                    <td><p>&dollar; 14000</p></td>
                                    <td class="tbl-apply"><a href="#">Apply now</a></td>
                                </tr>
                                <tr class="even hide-jobs">
                                    <td class="tbl-logo"><img src="./resources/img/job-logo4.png" alt=""></td>
                                    <td class="tbl-title"><h4>Internship Designer <br><span class="job-type">full time</span></h4></td>
                                    <td><p>Google</p></td>
                                    <td><p><i class="icon-location"></i>San Franciso, USA</p></td>
                                    <td><p>&dollar; 14000</p></td>
                                    <td class="tbl-apply"><a href="#">Apply now</a></td>
                                </tr>
                                <tr class="odd hide-jobs">
                                    <td class="tbl-logo"><img src="./resources/img/job-logo5.png" alt=""></td>
                                    <td class="tbl-title"><h4>Software Designer <br><span class="job-type">full time</span></h4></td>
                                    <td><p>Microsoft</p></td>
                                    <td><p><i class="icon-location"></i>San Franciso, USA</p></td>
                                    <td><p>&dollar; 14000</p></td>
                                    <td class="tbl-apply"><a href="#">Apply now</a></td>
                                </tr>
                                <tr class="even hide-jobs">
                                    <td class="tbl-logo"><img src="./resources/img/job-logo4.png" alt=""></td>
                                    <td class="tbl-title"><h4>Internship Designer <br><span class="job-type">full time</span></h4></td>
                                    <td><p>Google</p></td>
                                    <td><p><i class="icon-location"></i>San Franciso, USA</p></td>
                                    <td><p>&dollar; 14000</p></td>
                                    <td class="tbl-apply"><a href="#">Apply now</a></td>
                                </tr>
                                <tr class="odd hide-jobs">
                                    <td class="tbl-logo"><img src="./resources/img/job-logo5.png" alt=""></td>
                                    <td class="tbl-title"><h4>Software Designer <br><span class="job-type">full time</span></h4></td>
                                    <td><p>Microsoft</p></td>
                                    <td><p><i class="icon-location"></i>San Franciso, USA</p></td>
                                    <td><p>&dollar; 14000</p></td>
                                    <td class="tbl-apply"><a href="#">Apply now</a></td>
                                </tr>
                            </table>
                        </div>
                        <div class="more-jobs">
                            <a href=""> <i class="fa fa-refresh"></i>View more jobs</a>
                        </div>
                    </div>
                    <div class="col-md-3 hidden-sm">
                        <div class="job-add wow fadeInRight" data-wow-delay="1.5s">
                            <h2>Seeking a job?</h2>
                            <a href="#">Create a Account</a>
                        </div>
                    </div>
                </div>
            </div>
            <hr>

            <div class="container">
                <div class="row page-title text-center  wow bounce"  data-wow-delay=".7s">
                    <h5>TESTIMONIALS</h5>
                    <h2>WHAT PEOPLES ARE SAYING</h2>
                </div>
                <div class="row testimonial">
                    <div class="col-md-12">
                        <div id="testimonial-slider">
                            <div class="item">
                                <div class="client-text">                                
                                    <p>Jobify offer an amazing service and I couldn’t be happier! They 
                                    are dedicated to helping recruiters find great candidates, wonderful service!</p>
                                    <h4><strong>Ohidul Islam, </strong><i>Web Designer</i></h4>
                                </div>
                                <div class="client-face wow fadeInRight" data-wow-delay=".9s"> 
                                    <img src="./resources/img/client-face1.png" alt="">
                                </div>
                            </div>
                            <div class="item">
                                <div class="client-text">                                
                                    <p>Jobify offer an amazing service and I couldn’t be happier! They 
                                    are dedicated to helping recruiters find great candidates, wonderful service!</p>
                                    <h4><strong>Ohidul Islam, </strong><i>Web Designer</i></h4>
                                </div>
                                <div class="client-face">
                                    <img src="./resources/img/client-face2.png" alt="">
                                </div>
                            </div>
                            <div class="item">
                                <div class="client-text">                                
                                    <p>Jobify offer an amazing service and I couldn’t be happier! They 
                                    are dedicated to helping recruiters find great candidates, wonderful service!</p>
                                    <h4><strong>Ohidul Islam, </strong><i>Web Designer</i></h4>
                                </div>
                                <div class="client-face">
                                    <img src="./resources/img/client-face1.png" alt="">
                                </div>
                            </div>
                            <div class="item">
                                <div class="client-text">                                
                                    <p>Jobify offer an amazing service and I couldn’t be happier! They 
                                    are dedicated to helping recruiters find great candidates, wonderful service!</p>
                                    <h4><strong>Ohidul Islam, </strong><i>Web Designer</i></h4>
                                </div>
                                <div class="client-face">
                                    <img src="./resources/img/client-face2.png" alt="">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

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
        <script type="text/javascript"src="<c:url value="/resources/js/jquery-3.1.1.js"/>"></script>
    </body>
<script type="text/javascript">
var key = "fHPwwCqceBLnLCExz65uYIYEAdiAs6xOwv79o6FcLHh7x6iPmxITE9Wk7TqH1q%2F1%2FeSw9j%2FUxPbGiQYcnVa0zw%3D%3D";

//장소바꿀때 전 단계에서 contentId를 받아와서 바꾸면 될듯
/* $.each(${cList}, function(index, item){
	var contentid=item.CONTENT_ID;
	console.log(contentid);
}); */
var contentId=""
var contentTypeId=""
 $(function(){

	$.ajax({
		type : "get",
		url : "readClip",
		success : function(data){
			
			$.each(data,function(index,item){
				console.log(data);
				contentId=item.content_ID;
				contentTypeId=item.contenttype_ID;
				l_Data(contentId,contentTypeId)
			})
				console.log(contentId);
		},
		error : function(e){
			console.log(e);
		}
	})
		
	
	}) 
	/* for( var i = 0 ; i < ${cList.size} ; i++){
		var contentId=${cList};
		console.log(contentId);
	} */

	//행사 기본정보 가져오는 API

//행사 날짜 가져오는 API	
/* var url2= "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailIntro?ServiceKey="+key;
	url2 +=	"&contentTypeId=15&contentId="+contentId+"&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&introYN=Y&_type=json"; 
	 */


function l_Data(contentId,contentTypeId){

	var url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?ServiceKey="+key;
	url += "&mapX&mapY";
	url += "&contentTypeId="+contentTypeId+"&contentId="+contentId+"&areaCode&sigunguCode&cat1=&cat2=&cat3=&listYN=Y";
	url += "&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&transGuideYN=Y&_type=json";

console.log(url);
$.getJSON(url, function(data) {

    console.log('success', data);
    /* for( var i = 0 ; i < data.response.body.totalCount ; i++){
        console.log( data.response.body.items.item[i] );
    }    */
     
    console.log(data.response.body.items.item);
    var html="";
    html += '<li>';
	html += '<a href="">';
	html += ' <img src='+data.response.body.items.item.firstimage+' width=170 height=190 >';
	html += '<div class="overlay"><h3>Ohidul Islam</h3><p>Web Designer</p></div>';
	html += '</a>';
	html += '</li>';
	
   	$("#clipInfo").html(html);
    
   
}); 
}
	/*  <li>
    	<!-- 클립보드  -->
         <a href="">
             <div class="clipImg" id="clipImg"></div>
             <div class="overlay"><h3>Ohidul Islam</h3><p>Web Designer</p></div>
         </a>
     </li> */ 
	 
</script>    
</html>