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
        <title>나의 일정보기</title>
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
        <script	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCW-Yin1kq0i_E_hqmkCdFXNWIaJLRoUN8"></script>
        
        <style type="text/css">
		html, body {
			overflow-x: hidden;
		}
        </style>
        
        <script type="text/javascript">
        
      //로그인& 조인 모달 
    	$('#myModal').modal('show');
    	//정보수정 모달
    	$('#myModal_Edit').modal('show');

    	//로그아웃 버튼 클릭시 처리 함수 
    	function logout() {
    		location.href = "logout";
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
									<li>welcome! <img src="./resources/image/icon.png" width="27px" height="27px">
										${sessionScope.user_id } </li>
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

					<!--로그인&조인 모달  -->
					<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
						aria-labelledby="myLargeModalLabel" aria-hidden="true">
						<div class="modal-dialog modal-lg">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">×</button>

									<h4 class="modal-title" id="myModalLabel">Login / Join</h4>
								</div>
								<div class="modal-body">
									<div class="row">
										<div class="col-md-8"
											style="border-right: 1px dotted #C2C2C2; padding-right: 30px;">
											<!-- Nav tabs -->
											<ul class="nav nav-tabs headertabs">
												<li class="active"><a href="#Login" id="loginAtag"
													data-toggle="tab">Login</a></li>
												<li><a href="#Registration" id="regAtag"
													data-toggle="tab">Join</a></li>
											</ul>
											<!-- Tab panes -->
											<div class="tab-content">
												<div class="tab-pane active" id="Login">
													<form action="login" role="form" method="post"
														class="form-horizontal" onsubmit="return login()">
														<div class="form-group">
															<label for="email" class="col-sm-2 control-label">
																ID</label>
															<div class="col-sm-10">
																<input type="text" name="user_id" class="form-control"
																	id="user_id" placeholder="ID" />
															</div>
														</div>
														<div class="form-group">
															<label for="exampleInputPassword1"
																class="col-sm-2 control-label"> Password</label>
															<div class="col-sm-10">
																<input type="password" name="password"
																	class="form-control" id="password"
																	placeholder="Password" />
															</div>
														</div>
														<div class="row">
															<div class="col-sm-2"></div>
															<div class="col-sm-10">
																<button type="button" class="btn btn-primary btn-sm"
																	value="submit" id="submit_button">Submit</button>
																<!-- <a href="javascript:;">Forgot your password?</a> -->
															</div>
														</div>
													</form>
												</div>
												<div class="tab-pane" id="Registration">
													<form action="join" role="form" method="post"
														class="form-horizontal" onsubmit="return joinCheck()">
														<div class="form-group">
															<label for="email" class="col-sm-2 control-label">
																ID</label>
															<div class="col-sm-10">
																<div class="row">
																	<div class="col-md-3">
																		<select class="form-control" name="user_sex"
																			id="user_sex">
																			<option value="선택">선택</option>
																			<option value="m">남성</option>
																			<option value="f">여성</option>
																		</select>
																	</div>
																	<div class="col-md-9">
																		<input type="text" class="form-control"
																			placeholder="ID" name="user_id" id="user_id1" />
																	</div>
																</div>
															</div>
														</div>
														<div class="form-group">
															<label for="email" class="col-sm-2 control-label">
																Email</label>
															<div class="col-sm-10">
																<input type="email" class="form-control" name="email"
																	id="email" placeholder="Email" />
															</div>
														</div>
														<div class="form-group">
															<label for="mobile" class="col-sm-2 control-label">
																Password</label>
															<div class="col-sm-10">
																<input type="password" class="form-control"
																	id="password1" name="password" placeholder="Password" />
															</div>
														</div>
														<div class="form-group">
															<label for="password" class="col-sm-2 control-label">
															</label>
															<div class="col-sm-10">
																<input type="password" class="form-control"
																	id="password2" name="password2"
																	placeholder="Password 확인" />
															</div>
														</div>
														<div class="row">
															<div class="col-sm-2"></div>
															<div class="col-sm-10">
																<button type="button" class="btn btn-primary btn-sm"
																	id="submit_join">Save & Continue</button>
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
					<!--로그인&조인 모달 끝 -->
					<!--정보수정 모달 시작  -->
					<div class="modal fade" id="myModal_Edit" tabindex="-1"
						role="dialog" aria-labelledby="myLargeModalLabel"
						aria-hidden="true">
						<div class="modal-dialog modal-lg">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">×</button>

									<h4 class="modal-title" id="myModalLabel">Edit my
										information</h4>
								</div>
								<div class="modal-body">
									<div class="row">
										<div class="col-md-8"
											style="border-right: 1px dotted #C2C2C2; padding-right: 30px;">
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

<!--         <div class="slider-area">
            <div class="slider">
                <div id="bg-slider" class="owl-carousel owl-theme">
                 
                  <div class="item"><img src="./resources/image/otherpage/scsc.png" alt="Mirror Edge"></div>
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
        </div> -->
<!-- 
	<section class="jumbotron text-center">
	 <img src="./resources/image/otherpage/111.png" > 
      <div class="container">
      <br><br>
         <h1 class="jumbotron-heading">My schedule</h1>
        <p class="lead text-muted">나의 일정 ㅂ</p>
        <p>
          <a href="#" class="btn btn-primary">Main call to action</a>
          <a href="#" class="btn btn-secondary">Secondary action</a>
        </p> 
      </div>
    </section>  -->
    
   <style type="text/css">
    @import url(http://fonts.googleapis.com/earlyaccess/hanna.css);
    
.section-30 {
	background-image: url(./resources/image/otherpage/heekyung.png);
	background-repeat: repeat-y;
	background-size: 100%;
}

h1 {
	
	font-family: 'Hanna', serif;
	color : gray;
	font-size: -webkit-xxx-large;
}

  </style>    
        
	<section class="section-30 section-sm-40 section-md-66 section-lg-bottom-90 bg-gray-dark page-title-wrap">
      <div class="shell">
        <div class="page-title" style="height:400px;">
        	<div class="container" style="margin:auto; margin-top:85px;">
        	  <h1 id="sc_10_text"style="text-align:center;">My Page </h1>                  
          </div>
        </div>
      </div>
    </section>

        <div class="content-area">
            <div class="container">
                <div class="row job-posting wow fadeInUp" data-wow-delay="1s">
                    <div role="tabpanel">
                      <!-- Nav tabs -->
                      <ul class="nav nav-tabs" role="tablist">
                        <li role="presentation" class="active"><a href="#job-seekers" aria-controls="home" role="tab" data-toggle="tab">클립 보드</a></li>
                        <li role="presentation"><a href="#employeers" aria-controls="profile" role="tab" data-toggle="tab">여행 일정</a></li>
                        <li role="presentation"><a href="#shared" aria-controls="profile" role="tab" data-toggle="tab">공유 받은 일정</a></li>
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
                        <div role="tabpanel" class="tab-pane fade" id="shared">
                            <ul class="list-inline">
                            <!-- 여행일정 -->
                                <div id="sharedPlan" class="sharedPlan"></div>
                                
                                
                            </ul>
                        </div>
                      </div>

                    </div>
                </div>
            </div>
           <!--  <hr> -->
        </div>
        
        <div class="footer-area" style="border-top: 1px solid #00AEEF;">
		<div class="container" style="padding-bottom : 0px">
			<div class="row footer-copy">
				<p style="margin: 0 0 0px;">
					<span id="span1" style="color : gray;">Copyright &copy; NikoNikoNi 2017</span>
				</p>
			</div>
		</div>
        </div>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="./resources/js/vendor/jquery-1.10.2.min.js"><\/script>')</script>
        <script src="./resources/js/bootstrap.js"></script>
        <script src="./resources/js/owl.carousel.min.js"></script>
        <script src="./resources/js/wow.js"></script>
        <script src="./resources/js/main.js"></script>
        
    </body>
<script type="text/javascript">
var key = "fHPwwCqceBLnLCExz65uYIYEAdiAs6xOwv79o6FcLHh7x6iPmxITE9Wk7TqH1q%2F1%2FeSw9j%2FUxPbGiQYcnVa0zw%3D%3D";
var url;
function ReadApi(contentId,contentTypeId) { /* currentPage가 어디서 호출되어 온다 */
	url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?ServiceKey="+key;
	url += "&mapX&mapY";
	url += "&contentTypeId"+contentTypeId+"&contentId="+contentId+"&areaCode&sigunguCode&cat1=&cat2=&cat3=&listYN=Y";
	url += "&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&transGuideYN=Y&_type=json";
	
}


 $(function(){
	 $.ajaxSetup({
	        async: false
	    });
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
				
				html += '<img src='+data.response.body.items.item.firstimage+' width=300 height=200>';
				html += '<div class="overlay"><h3>'+data.response.body.items.item.title+'<br>'+data.response.body.items.item.addr1.split(" ", 2)+'</h3></div>';
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
	$.ajaxSetup({
        async: false
    });
	$.ajax({
		type : "get",
		url : "read_scd",
		success : function(data){
			var html="";
			console.log(data);
			$.each(data,function(index,item){
				console.log(item);
				var contentId=item.DTL_CONTENT_ID;				
			     ReadApi(contentId);
			console.log(url);
			$.getJSON(url, function(data) {
				
			    console.log('success1', data);
			    var scd_sq=item.SCD_SQ;
			    
			    if (typeof (data.response.body.items.item.firstimage) !== "undefined") {
			    	
			    	html += '<li>';
					html += '<a href="SC_12?scd_sq='+scd_sq+'">'; 
					html += '<img src='+data.response.body.items.item.firstimage+' width=300 height=200>';
					if (typeof (item.SCD_DESC) !== "undefined") {
						html += '<div class="overlay"><h3>'+item.SCD_TITLE+'<br>'+item.SCD_DESC+'</h3></div>';	
						}else{
							html += '<div class="overlay"><h3>'+item.SCD_TITLE+'</h3></div>';	
						}					
					html += '</a>';
					html += '</li>';
				
				/* $("#myPlan").html(html); */
			    }else if (typeof (data.response.body.items.item.firstimage) == "undefined") {
			    	contentId=item.DTL_CONTENT_ID2;
			    	ReadApi(contentId);
			    $.getJSON(url, function(data) {
			    	html += '<li>'; 
					html += '<a href="SC_12?scd_sq='+scd_sq+'">'; 
					html += '<img src='+data.response.body.items.item.firstimage+' width=300 height=200>';
					if (typeof (item.SCD_DESC) !== "undefined") {
					html += '<div class="overlay"><h3>'+item.SCD_TITLE+'<br>'+item.SCD_DESC+'</h3></div>';	
					}else{
						html += '<div class="overlay"><h3>'+item.SCD_TITLE+'</h3></div>';	
					}
					html += '</a>';
					html += '</li>';
				
				
			    	
			    })
			    	
			    }
			    
			$("#myPlan").html(html);
			 });
			})
				
		},
		error : function(e){
			console.log(e);
		}
	}) 
	}) 
 
$(function(){
	$.ajaxSetup({
        async: false
    });
	$.ajax({
		type : "get",
		url : "shared_read_scd",
		success : function(data){
			var html="";
			console.log(data);
			$.each(data,function(index,item){
				console.log(item);
				var contentId=item.DTL_CONTENT_ID;				
			     ReadApi(contentId);
			console.log(url);
			$.getJSON(url, function(data) {
				
			    console.log('success1', data);
			    var scd_sq=item.SCD_SQ;
			    console.log(scd_sq);
			    if (typeof (data.response.body.items.item.firstimage) !== "undefined") {
			    	
			    	html += '<li>';
					html += '<a href="SC_12?scd_sq='+scd_sq+'">'; 
					html += '<img src='+data.response.body.items.item.firstimage+' width=300 height=200>';
					if (typeof (item.SCD_DESC) !== "undefined") {
						html += '<div class="overlay"><h3>'+item.SCD_TITLE+'<br>'+item.SCD_DESC+'</h3></div>';	
						}else{
							html += '<div class="overlay"><h3>'+item.SCD_TITLE+'</h3></div>';	
						}					
					html += '</a>';
					html += '</li>';
				
				$("#sharedPlan").html(html);
			    }else if (typeof (data.response.body.items.item.firstimage) == "undefined") {
			    	contentId=item.DTL_CONTENT_ID2;
			    	ReadApi(contentId);
			    $.getJSON(url, function(data) {
			    	html += '<li>'; 
					html += '<a href="SC_12?scd_sq='+scd_sq+'">'; 
					html += '<img src='+data.response.body.items.item.firstimage+' width=300 height=200>';
					if (typeof (item.SCD_DESC) !== "undefined") {
					html += '<div class="overlay"><h3>'+item.SCD_TITLE+'<br>'+item.SCD_DESC+'</h3></div>';	
					}else{
						html += '<div class="overlay"><h3>'+item.SCD_TITLE+'</h3></div>';	
					}
					html += '</a>';
					html += '</li>';
				
				$("#sharedPlan").html(html);
			    	
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