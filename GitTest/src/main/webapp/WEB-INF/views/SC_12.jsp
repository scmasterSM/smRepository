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
		<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
		<link rel="stylesheet" href="./resources/css/bootstrap.css">
		<link rel="stylesheet" href="./resources/css/jquery-ui.min.css" type="text/css" media="screen" />
        <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
        <link rel="icon" href="favicon.ico" type="image/x-icon">
        <link rel="stylesheet" href="./resources/css/normalize.css">
        <link rel="stylesheet" href="./resources/css/font-awesome.min.css">
        <link rel="stylesheet" href="./resources/css/fontello.css">
        <link rel="stylesheet" href="./resources/css/animate.css">
        <link rel="stylesheet" href="./resources/css/owl.carousel.css">
        <link rel="stylesheet" href="./resources/css/owl.theme.css">
        <link rel="stylesheet" href="./resources/css/owl.transitions.css">
        <link rel="stylesheet" href="./resources/css/style.css">
        <link rel="stylesheet" href="./resources/css/responsive.css">
        <script src="./resources/js/vendor/modernizr-2.6.2.min.js"></script>
          <link rel="stylesheet" href="./resources/css/12css.css">
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD_azK-PpKrUbRSAlyccxLXpUGnwagdJhQ"></script>
<style type="text/css">
body.modal-open {
    overflow: hidden;
}
.modal-header {
	background-color: #00AEF0;
	color: #fff;
}
.btn-default {
	background-color: #00AEF0;
	color: #fff;
}
.form-con {
    /* display: block; */
    /* width: 100%; */
    /* height: 34px; */
    padding: 6px 12px;
    font-size: 14px;
    line-height: 1.42857143;
    color: #555;
    background-color: #fff;
    background-image: none;
    border: 1px solid #ccc;
    border-radius: 4px;
    -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
    box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
    -webkit-transition: border-color ease-in-out .15s, -webkit-box-shadow ease-in-out .15s;
    -o-transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
    transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
}
</style>
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
                  <a data-toggle="modal" href="#myModal_share">공유하기</a>&emsp;&emsp;
                  <a href="javascript:copy_schedule(${scd_sq });">복사하기</a>&emsp;&emsp;
                  <a data-toggle="modal" href="#myModal_edit">수정하기</a>&emsp;&emsp;
                 <%--  <a href="edit_schedule?scd_sq=${scd_sq }">수정하기</a>&emsp;&emsp; --%>
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

<!-- Modal_share -->
  <div class="modal fade" id="myModal_share" role="dialog">
    <div class="modal-dialog">
    
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h3 class="modal-title" style=" font-weight: bold;">일정에 초대 하실 분의 아이디를 입력해주세요</h3>
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

<!-- Modal_edit -->
  <div class="modal fade" id="myModal_edit" role="dialog">
    <div class="modal-dialog">
    
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h3 class="modal-title" style=" font-weight: bold;">세부정보 수정</h3>
        </div>
        <div class="modal-body">
						<form role="form" class="form-horizontal" action="" method="get" onsubmit="return edit_form();">
							<div class="form-group">
								<label for="scd_title" class="col-sm-2 control-label"> 제목</label>
								<div class="col-sm-10">
									<input type="hidden" id="scd_sq" name="scd_sq" value="${scd_sq }" placeholder="ID">
									<input type="hidden" id="user_id" name="user_id" value="${user_id }" placeholder="ID">
									<input type="text" class="form-con" id="scd_title" name="scd_title" value="${schedule.scd_title }" placeholder="제목 입력">
								</div>
							</div>
							<div class="form-group">
								<label for="start_ymd" class="col-sm-2 control-label"> 출발일</label>
								<div class="col-sm-10">
									<input type="text" class="form-con" id="start_ymd" name="start_ymd" value="${schedule.start_ymd }" placeholder="클릭하여 선택">
								</div>
							</div>
							<div class="form-group">
								<label for="scd_theme" class="col-sm-2 control-label"> 테마</label>
								<div class="col-sm-10">
									<input type="radio" class="form-con" name="scd_theme" value="alone" <c:if test="${schedule.scd_theme == 'alone'}">checked="checked"</c:if>>홀로 &nbsp; &nbsp;
									<input type="radio" class="form-con" name="scd_theme" value="couple" <c:if test="${schedule.scd_theme == 'couple'}">checked="checked"</c:if>>커플 &nbsp; &nbsp;
									<input type="radio" class="form-con" name="scd_theme" value="family" <c:if test="${schedule.scd_theme == 'family'}">checked="checked"</c:if>>가족 &nbsp; &nbsp;
									<input type="radio" class="form-con" name="scd_theme" value="group" <c:if test="${schedule.scd_theme == 'group'}">checked="checked"</c:if>>단체 &nbsp; &nbsp;
								</div>
							</div>
							<div class="form-group">
								<label for="scd_season" class="col-sm-2 control-label"> 계절</label>
								<div class="col-sm-10">
									<input type="radio" class="form-con" name="scd_season" value="spring" <c:if test="${schedule.scd_season == 'spring'}">checked="checked"</c:if>>봄 &nbsp; &nbsp; &nbsp; &nbsp;
									<input type="radio" class="form-con" name="scd_season" value="summer" <c:if test="${schedule.scd_season == 'summer'}">checked="checked"</c:if>>여름 &nbsp; &nbsp;
									<input type="radio" class="form-con" name="scd_season" value="fall" <c:if test="${schedule.scd_season == 'fall'}">checked="checked"</c:if>>가을 &nbsp; &nbsp;
									<input type="radio" class="form-con" name="scd_season" value="winter" <c:if test="${schedule.scd_season == 'winter'}">checked="checked"</c:if>>겨울 &nbsp; &nbsp;
								</div>
							</div>
							<div class="form-group">
								<label for="scd_desc" class="col-sm-2 control-label"> 설명</label>
								<div class="col-sm-10">
									<input type="text" class="form-con" id="scd_desc" name="scd_desc" value="${schedule.scd_desc }" placeholder="설명 입력">
									<input type="hidden" class="form-con" id="day_cnt" name="day_cnt">
								</div>
							</div>
							<div class="form-group">
								<label for="public_fl" class="col-sm-2 control-label"> 공개여부</label>
								<div class="col-sm-10">
									<input type="radio" class="form-con" name="public_fl" value="public" <c:if test="${schedule.public_fl == 'public'}">checked="checked"</c:if>>공개 &nbsp; &nbsp;
									<input type="radio" class="form-con" name="public_fl" value="shared_user" <c:if test="${schedule.public_fl == 'shared_user'}">checked="checked"</c:if>>비공개 &nbsp; &nbsp;
								</div>
							</div>
							
        </div>
        <div class="modal-footer">
        <div id="existId" class="existId"></div>
			<button type="submit" class="btn btn-default btn_next">제출</button>
			<button type="button" class="btn btn-default" data-dismiss="modal" onclick="return false;">돌아가기</button>
			</form>
        </div>
      </div>
      
    </div>
  </div>



      <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="./resources/js/vendor/jquery-1.10.2.min.js"><\/script>')</script>
		<script type="text/javascript" src="./resources/js/jquery-3.1.1.js"></script>
        <script src="./resources/js/bootstrap.min.js"></script>
		<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    	<script type="text/javascript" src="./resources/js/jquery-ui.min.js"></script>
        <script src="./resources/js/owl.carousel.min.js"></script>
        <script src="./resources/js/wow.js"></script>
        <script src="./resources/js/main.js"></script>
</body>
<script>
var scd_sq=${scd_sq};
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
         url : "get_daily_list",
         async : false,
         data :{
            scd_sq : scd_sq 
         },
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
            	   console.log("index: "+index);
                   day_cnt= index;
                  /* var contentId=item.DTL_CONTENT_ID;
                  console.log(contentId);
                  var sigungucode;
                  ReadApi(contentId); */
                  
                   
                  
                  html += '<tr class="white">';
                  html += '<td><div class="scht_date">'+ item.DAILY_YMD +'</div>';
                  html += '<div class="scht_day">DAY '+ item.DAILY_ORD +'</div></td>';                     
                  html += '<td class="scht_vtop">';
                  html += '<div class="scht_city">';
                  
                  var daily_sq = item.DAILY_SQ;
                  $.ajax({
                      type : "POST",
                      url : "get_city_list",
                      async : false,
                      data :{
                         daily_sq : daily_sq
                      },
                      success : function(data){
                         $.each(data,function(index,item){	
                        	 var sigungu_code = item.SIGUNGU_CODE;
                        	 var city_nm = encodeURI(item.CITY_NM);
                         	 if(typeof(sigungu_code) == 'undefined' || sigungu_code == 'undefined') sigungu_code = "";
                        	 if(index == 0) html += '<a href="sc_05?areacode='+item.AREA_CODE+'&sigungucode='+sigungu_code+'&city_nm='+city_nm+'">'+ item.CITY_NM +'</a>';
                        	 else html += ', <a href="sc_05?areacode='+item.AREA_CODE+'&sigungucode='+sigungu_code+'&city_nm='+city_nm+'">'+ item.CITY_NM +'</a>';
                         });
                      },
                      error : function(e){
                         console.log(e);
                      } 
                   }); 
                  html += '</div>'; 
                  html += '<div class="scht_city_blank"></div></td>';
                  html += '<td class="scht_vtop">';                     
                  
                  var daily_ord = item.DAILY_ORD;
                  
                  $.ajax({
                      type : "POST",
                      url : "get_places",
                      async : false,
                      data :{
                         scd_sq : scd_sq
                         ,daily_sq : daily_ord
                      },success : function(data){
                         $.each(data,function(index,item){
                        	 ReadApi(item.DTL_CONTENT_ID);
                        	 html += '<div class="scht_spotname">';
                             html += '<b>'+(index+1)+'. '+'</b>'+item.PLACE_NM+'</div>';
                         });
                      },
                      error : function(e){
                         console.log(e);
                      } 
                   }); 
                   
                  console.log("map    "+mapcount);
                  html += '</td>';
                  html += '<td class="scht_vtop">';
                  html += '<div class="scht_htname"><div class="map" id="map'+mapcount+'"></div></div></td>';                  
                  html += '</tr>';
                  mapcount=mapcount+1
                  
               })
               
               html += '</div></table></div>'; 
               $("#scd_info").html(html);
               initMap();
               
         },
         error : function(e){
            console.log(e);
         } 
      });         

	  $("#start_ymd").datepicker({
  	  		dateFormat: "yy-mm-dd"
      });
 })  
 
/*  $(function(){
	
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
}) */

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


function initMap() {
        $.ajax({
         type: "post",
         url: "get_daily_list",
         data: {
            scd_sq: scd_sq
         },
         async: false,
         success: function(data){
        	 var count=0;
            $.each(data, function(index,item){
            	var area_code = item.AREA_CODE;
            	var sigungu_code = item.SIGUNGU_CODE;
            	if(typeof(sigungu_code) == 'undefined' || sigungu_code == 'undefined' || sigungu_code == 'null') sigungu_code = "";
            	$.ajax({
                    type: "post",
                    url: "get_citylatlng",
                    data: {
                    	area_code: area_code
                    	,sigungu_code: sigungu_code
                    },
                    async: false,
                    success: function(data){
                    	console.log(data);
                    	   var zoom = 7;
                    	   map[count] = new google.maps.Map(document.getElementById('map'+(1+count)), {
                    	      center : {lat: parseFloat(data.map_y), lng: parseFloat(data.map_x)},
                    	      zoom : zoom
                    	   });
                    	   count=count+1;
                    },
                    error: function(e){
                       console.log(e);
                    }      
                 })
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
	console.log("do:   "+ daily_ord);
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
                   mymarkerlist.push({lat: parseFloat(item.MAP_Y), lng: parseFloat(item.MAP_X), title: item.PLACE_NM});
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
      					  title : (myloc_markers.length+1)+". "+mymarkerlist[i].title,
      					  id : myloc_markers.length+1,
                          icon: "./resources/marker_img/number_"+marker_no+".png",
                          zIndex: 1000
                       });
                   myloc_markers.push(marker);
                   bounds.extend(marker.position);
                }
                if(myloc_markers.length != 0){
                	map[daily_ord-1].fitBounds(bounds);
                	google.maps.event.addListenerOnce(map[daily_ord-1], 'bounds_changed', function() {
            			if (this.getZoom() > 15) {
            			    this.setZoom(15);
            			}
            		});
                }
           }
        },
        error: function(e){
           console.log(e);
        }      
     })
 }
 
 function copy_schedule(scd_sq){
	 $.ajax({
			type : "post",
			url : "copy_schedule",
			data : { 
				scd_sq: scd_sq
			}
			,success : function(data){
				alert("일정이 복사되었습니다!");
			},
			error : function(e){
				console.log(e);
			} 
	});//ajax
 }
 
 function edit_form(){
	 var scd_sq = parseInt($('#scd_sq').val());
	 console.log(typeof(scd_sq));
	 console.log(scd_sq);
	 var d = new Date($('#start_ymd').val());
	 var curr_date = d.getDate();
	 var curr_month = d.getMonth() + 1;
	 var curr_year = d.getFullYear();
	 var start_ymd = curr_year + "-" + curr_month + "-" + curr_date;
	 var scd_title = $('#scd_title').val();
	 var scd_desc = $('#scd_desc').val();
	 var scd_theme = $('input[name=scd_theme]:checked').val();
	 var scd_season = $('input[name=scd_season]:checked').val();
	 var public_fl = $('input[name=public_fl]:checked').val();
	 
	 $.ajax({
			type : "post",
			url : "edit_schedule_info",
			data : { 
				scd_sq: scd_sq
	 			,scd_title: scd_title
	 			,scd_desc: scd_desc
	 			,scd_season: scd_season
	 			,scd_theme: scd_theme
	 			,public_fl: public_fl
	 			,start_ymd: start_ymd
			},
			success : function(data){
			},
			error : function(e){
				console.log(e);
			}
	});//ajax 

		window.location.href = "edit_schedule?scd_sq="+scd_sq;	
		return false;
 }
</script>

</html>