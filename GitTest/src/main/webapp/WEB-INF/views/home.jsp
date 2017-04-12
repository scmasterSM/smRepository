<!DOCTYPE html>
<html class="no-js">
<head>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<title>Travle Maker</title>
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

<!--모달 CSS  -->
<style type="text/css">
.nav-tabs {
	margin-bottom: 15px;
}

.sign-with {
	margin-top: 25px;
	padding: 20px;
}

/* div#OR {
	height: 30px;
	width: 30px;
	border: 1px solid #C2C2C2;
	border-radius: 50%;
	font-weight: bold;
	line-height: 28px;
	text-align: center;
	font-size: 12px;
	float: right;
	position: absolute;
	right: -16px;
	top: 40%;
	z-index: 1;
	background: #DFDFDF; */
}
</style>
<script>
	window.jQuery
			|| document
					.write('<script src="./resources/js/vendor/jquery-1.10.2.min.js"><\/script>')
</script>
<script src="./resources/js/bootstrap.min.js"></script>
<script src="./resources/js/owl.carousel.min.js"></script>
<script src="./resources/js/wow.js"></script>
<script src="./resources/js/main.js"></script>


<script type="text/javascript">
	//관광API 키값 
	var key = "fHPwwCqceBLnLCExz65uYIYEAdiAs6xOwv79o6FcLHh7x6iPmxITE9Wk7TqH1q%2F1%2FeSw9j%2FUxPbGiQYcnVa0zw%3D%3D";

	$(function() {
		$("#joinForm").on("click",function(){ /* 조인버튼 클릭시 모달 처리   */
			$("#regAtag").trigger("click");
		})
		$("#loginForm").on("click",function(){  /*로그인 버튼 클릭시 모달 처리  */
			$("#loginAtag").trigger("click");
		})
		r_Data(); 
		random_city();
	});

	//로그인& 조인 모달 
	$('#myModal').modal('show');
	//정보수정 모달
	$('#myModal_Edit').modal('show');
	
	//로그아웃 버튼 클릭시 처리 함수 
	function logout(){
		location.href = "logout";
	}
	
	//추천 지역을 랜덤으로 보여주는 메소드
	function random_city(){
		var content2 = '';
		

		content2 += '<ul class="list-inline job-seeker">';
		content2 += '<li><a href="sc_05?areacode=1"> <img src="./resources/image/main_city/city_seoul.jpg" alt="" width="300" height="200">';
		content2 += '<div class="overlay">';
		content2 +=	'<h3>서울</h3>';
		content2 +=	'<p>쇼핑,관광등 없는게 없는 "Soul of Asia!"</p>';
		content2 +=	'</div></a></li><li><a href="sc_05?areacode=6"> <img src="./resources/image/main_city/city_busan.jpg" alt="" width="300" height="200">';
		content2 +=	'<div class="overlay"><h3>부산</h3><p>탁트인 바다,맛있는 음식 exciting city! </p></div></a></li>';
		content2 +=  '<li><a href="sc_05?areacode=38"> <img src="./resources/image/main_city/city_junju.jpg" alt="" width="300" height="200">';
		content2 +=  '<div class="overlay">';
		content2 +=	'<h3>전주</h3><p>옛것을 고수하는 아름다운  slow city! </p></div></a></li>';
		content2 +=   '<li><a href="sc_05?areacode=39"> <img src="./resources/image/main_city/city_jeju.jpg" alt="" width="300" height="200">';
		content2 += '<div class="overlay"><h3>제주도</h3><p>4계절 내내 다채로운 대표 관광 city!</p></div></a></li>';
		content2 += '<li><a href="sc_05?areacode=32"> <img src="./resources/image/main_city/city_kwd.jpg" alt="" width="300" height="200">';
		content2 +=		'<div class="overlay"><h3>강원도</h3><p>바다와 산 모두 즐길 수 있는 곳!</p></div></a></li>';
		content2 += '<li><a href="sc_05?areacode=35"> <img src="./resources/image/main_city/city_kj.jpg" alt="" width="300" height="200">';
		content2 +=	'<div class="overlay"><h3>경주</h3><p>역사를 품은 색다른 매력이 있는 곳! </p></div></a></li></ul>';
		
		$("#tabtab").html(content2);
		
	}
	

	//행사 정보를 가져오는 메소드 
	 function r_Data() {
		var url =""
			url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchFestival?ServiceKey="
	            + key;
		if(false){
	      /* url2 ="&contentTypeId=15&areaCode=&sigunguCode=&cat1=&cat2=&cat3"; */
	      url += "&eventStartDate=20170501&eventEndDate=20170531&arrange=A&listYN=Y&pageNo=1&numOfRows=50&MobileOS=ETC&MobileApp=AppTesting&_type=json";
		}else{
			url += "&eventStartDate=20170401&eventEndDate=20170430&arrange=A&listYN=Y&pageNo=1&numOfRows=199&MobileOS=ETC&MobileApp=AppTesting&_type=json";
		}
	
      $.getJSON(
                  url,
                  function(data) {
                     console.log(data);

                     var content = "";
                     var length = data.response.body.items.item.length;
                     console.log('success', data);

                     content += '<ul class="list-inline job-seeker">';
                     
                     console.log(data.response.body.items.item.length);

                     for (var i = 0; i < 9; i++) {
                        console
                              .log(data.response.body.items.item.length);

                        var val = Math.floor(Math.random() * length);
                        console.log(val);
                        var con = data.response.body.items.item[val].contentid;
                        console.log(con);
                        console
                              .log(data.response.body.items.item[val].title);
                        if (typeof (data.response.body.items.item[val].firstimage) !== 'undefined') {
                           content += '<li><a href="SC_08?CONTENT_ID='
                                 + con
                                 + '"><img src='+data.response.body.items.item[val].firstimage+' width="300" height="200" alt="">';
                           content += '<div class="overlay"><h3>'
                                 + data.response.body.items.item[val].title
                                 + '</h3><p>'
                                 + data.response.body.items.item[val].addr1
                                       .split(" ", 2)
                                 + '</p></div></a></li>';
                        } else {
                           i--;
                        }
                     } //for
                     $("#job-seekers").html(content);
                  });
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
					<!-- 	<ul class="list-inline">
							<li><a href="autoLogin">연습</a></li>
						</ul> -->
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

				<a href="home2"><img src="./resources/image/logoicon.png" alt=""
					width="80px" height="80px"></a><img src="./resources/image/main_logo.png" alt="">

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
			<c:when test="${sessionScope.id == null }">
					<button type="button" id="loginForm"
						class="navbar-btn nav-button wow bounceInRight login"
						data-toggle="modal" data-target="#myModal" id="loginForm" data-wow-delay="0.8s">Login</button>
					<button type="button"
						class="navbar-btn nav-button wow fadeInRight" data-toggle="modal"
						data-target="#myModal" id="joinForm" data-wow-delay="0.6s">Join</button>
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
					<li class="wow fadeInDown" data-wow-delay="0.1s"><a href="#">나의 일정 보기</a>
					</li>
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

	<div class="slider-area">
		<div class="slider">
			<div id="bg-slider" class="owl-carousel owl-theme">

				<div class="item">
					<img src="./resources/image/bg_city/bg_korea.jpg" alt="">
				</div>
				<div class="item">
					<img src="./resources/image/bg_city/bg_korea2.jpg"
						alt="The Last of us">
				</div>
				<div class="item">
					<img src="./resources/image/bg_city/bg_korea111.jpg" alt="">
				</div>

			</div>
		</div>
		<div class="container slider-content">
			<div class="row">
				<div
					class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1 col-sm-12">
					<br>
					<div id="mainContent">
					<h2>
						내가 사는 이 도시가 <br> 새롭게 보이기 시작했다
					</h2>
					</div>
					<br> <br> <br> <br> <br>
					<div class="search-form wow pulse" data-wow-delay="0.8s">
						<form action="" class=" form-inline">
							<div class="form-group">
								<input type="text" class="form-control" id="searchTextField"
									placeholder="도시명으로 검색">
							</div>
							<input type="submit" class="btn" value="Search"><br>

							<div id="searchformap">
									<a href="mapSearch"><button type="button" class="btn btn-default btn-xs">지도에서 검색</button></a>
							</div>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="content-area">
		<div class="container">
			<div class="row page-title text-center wow zoomInDown"
				data-wow-delay="1s">
				<h3>Let's plan with Travel Maker!</h3>
				<h2>여행은 하고 싶은데 어디를 가야할지 고민이라면?</h2>
				<!-- <p>전국 163개 도시의 10,000개의 관광명소, 음식점, 쇼핑 정보를 확인하세요.</p> -->
			</div>
			<div class="row how-it-work text-center">
				<div class="col-md-4">
					<div class="single-work wow fadeInUp" data-wow-delay="0.8s">
						<img src="./resources/img/how-work1.png" alt="">
						<h3>여행 정보</h3>
						<p>전국 163개 도시, 10,000개 이상의 관광명소, 음식점, 쇼핑 정보를 확인하세요</p>
					</div>
				</div>
				<div class="col-md-4">
					<div class="single-work  wow fadeInUp" data-wow-delay="0.9s">
						<img src="./resources/img/how-work2.png" alt="">
						<h3>여행 일정</h3>
						<p>나만의 여행 일정을 짜보거나<br> 다른 사람들의 일정도 확인 해보세요</p>
					</div>
				</div>
				<div class="col-md-4">
					<div class="single-work wow fadeInUp" data-wow-delay="1s">
						<img src="./resources/img/how-work3.png" alt="">
						<h3>일정 공유</h3>
						<p>내 일정을 공유하여 실시간으로 <br>친구와 함께 계획을 세워보세요</p>
						
					</div>
				</div>
		</div>
	</div>


	<div class="container" id="aaa">
		<div class="row job-posting wow fadeInUp1" data-wow-delay="1s"
			id="rowjob1">
			<div role="tabpanel">
				<!-- Nav tabs -->
				<ul class="nav nav-tabs" role="tablist">
					<li role="presentation" class="active"><a href="#tabtab"
						aria-controls="home" role="tab" data-toggle="tab">인기 도시
					</a></li>
				</ul>
				<!-- Tab panes -->
				<div class="tab-content">
					<div role="tabpanel" class="tab-pane fade in active" id="tabtab">
						<!-- 도시 추천 자바스크립트로 옮겨진 부분  --> 
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
					<li role="presentation" class="active"><a href="#job-seekers"
						aria-controls="home" role="tab" data-toggle="tab">이번 달 추천 행사 </a></li>
					<li role="presentation"><a href="#employeers"
						aria-controls="profile" role="tab" data-toggle="tab">다음 달 추천 행사 </a></li>
				</ul>
				<!-- Tab panes -->
				<div class="tab-content">
					<div role="tabpanel" class="tab-pane fade in active"
						id="job-seekers">
						<!-- <ul class="list-inline job-seeker">

								<li><a href=""> <img
										src="./resources/img/team-small-5.jpg" alt="">
										<div class="overlay">
											<h3>Ohidul Islam</h3>
											<p>Web Designer</p>
										</div>
								</a></li>
							</ul> -->
					</div>
					<div role="tabpanel" class="tab-pane fade" id="employeers">
						<!-- <ul class="list-inline">
							<li><a href=""> <img src="./resources/img/employee4.png"
									alt="">
									<div class="overlay">
										<h3>Instagram</h3>
									</div>
							</a></li>
							<li><a href=""> <img src="./resources/img/employee3.png"
									alt="">
									<div class="overlay">
										<h3>Twitter</h3>
									</div>
							</a></li>
						</ul> -->
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- <div class="container">
			<div class="row page-title text-center wow bounce"
				data-wow-delay="1s">
				<h5>Recent Jobs</h5>
				<h2>
					<span>54716</span> Available jobs for you
				</h2>
			</div> -->
	<!-- 		<div class="row jobs">
				<div class="col-md-9">
					<div class="job-posts table-responsive">
						<table class="table">
							<tr class="odd wow fadeInUp" data-wow-delay="1s">
								<td class="tbl-logo"><img
									src="./resources/img/job-logo1.png" alt=""></td>
								<td class="tbl-title"><h4>
										Web Designer <br>
										<span class="job-type">full time</span>
									</h4></td>
								<td><p>dribbble community</p></td>
								<td><p>
										<i class="icon-location"></i>San Franciso, USA
									</p></td>
								<td><p>&dollar; 14000</p></td>
								<td class="tbl-apply"><a href="#">Apply now</a></td>
							</tr>
							<tr class="even wow fadeInUp" data-wow-delay="1.1s">
								<td class="tbl-logo"><img
									src="./resources/img/job-logo2.png" alt=""></td>
								<td class="tbl-title"><h4>
										Front End Developer <br>
										<span class="job-type">full time</span>
									</h4></td>
								<td><p>Jolil corporation</p></td>
								<td><p>
										<i class="icon-location"></i>San Franciso, USA
									</p></td>
								<td><p>&dollar; 14000</p></td>
								<td class="tbl-apply"><a href="#">Apply now</a></td>
							</tr>
							<tr class="odd wow fadeInUp" data-wow-delay="1.2s">
								<td class="tbl-logo"><img
									src="./resources/img/job-logo3.png" alt=""></td>
								<td class="tbl-title"><h4>
										HR Manager <br>
										<span class="job-type">full time</span>
									</h4></td>
								<td><p>Fanta bevarage</p></td>
								<td><p>
										<i class="icon-location"></i>San Franciso, USA
									</p></td>
								<td><p>&dollar; 14000</p></td>
								<td class="tbl-apply"><a href="#">Apply now</a></td>
							</tr>
							<tr class="even wow fadeInUp" data-wow-delay="1.3s">
								<td class="tbl-logo"><img
									src="./resources/img/job-logo4.png" alt=""></td>
								<td class="tbl-title"><h4>
										Internship Designer <br>
										<span class="job-type">full time</span>
									</h4></td>
								<td><p>Google</p></td>
								<td><p>
										<i class="icon-location"></i>San Franciso, USA
									</p></td>
								<td><p>&dollar; 14000</p></td>
								<td class="tbl-apply"><a href="#">Apply now</a></td>
							</tr>
							<tr class="odd wow fadeInUp" data-wow-delay="1.4s">
								<td class="tbl-logo"><img
									src="./resources/img/job-logo5.png" alt=""></td>
								<td class="tbl-title"><h4>
										Software Designer <br>
										<span class="job-type">full time</span>
									</h4></td>
								<td><p>Microsoft</p></td>
								<td><p>
										<i class="icon-location"></i>San Franciso, USA
									</p></td>
								<td><p>&dollar; 14000</p></td>
								<td class="tbl-apply"><a href="#">Apply now</a></td>
							</tr>
							<tr class="even hide-jobs">
								<td class="tbl-logo"><img
									src="./resources/img/job-logo4.png" alt=""></td>
								<td class="tbl-title"><h4>
										Internship Designer <br>
										<span class="job-type">full time</span>
									</h4></td>
								<td><p>Google</p></td>
								<td><p>
										<i class="icon-location"></i>San Franciso, USA
									</p></td>
								<td><p>&dollar; 14000</p></td>
								<td class="tbl-apply"><a href="#">Apply now</a></td>
							</tr>
							<tr class="odd hide-jobs">
								<td class="tbl-logo"><img
									src="./resources/img/job-logo5.png" alt=""></td>
								<td class="tbl-title"><h4>
										Software Designer <br>
										<span class="job-type">full time</span>
									</h4></td>
								<td><p>Microsoft</p></td>
								<td><p>
										<i class="icon-location"></i>San Franciso, USA
									</p></td>
								<td><p>&dollar; 14000</p></td>
								<td class="tbl-apply"><a href="#">Apply now</a></td>
							</tr>
							<tr class="even hide-jobs">
								<td class="tbl-logo"><img
									src="./resources/img/job-logo4.png" alt=""></td>
								<td class="tbl-title"><h4>
										Internship Designer <br>
										<span class="job-type">full time</span>
									</h4></td>
								<td><p>Google</p></td>
								<td><p>
										<i class="icon-location"></i>San Franciso, USA
									</p></td>
								<td><p>&dollar; 14000</p></td>
								<td class="tbl-apply"><a href="#">Apply now</a></td>
							</tr>
							<tr class="odd hide-jobs">
								<td class="tbl-logo"><img
									src="./resources/img/job-logo5.png" alt=""></td>
								<td class="tbl-title"><h4>
										Software Designer <br>
										<span class="job-type">full time</span>
									</h4></td>
								<td><p>Microsoft</p></td>
								<td><p>
										<i class="icon-location"></i>San Franciso, USA
									</p></td>
								<td><p>&dollar; 14000</p></td>
								<td class="tbl-apply"><a href="#">Apply now</a></td>
							</tr>
						</table>
					</div>
					<div class="more-jobs">
						<a href=""> <i class="fa fa-refresh"></i>View more jobs
						</a>
					</div>
				</div>
				<div class="col-md-3 hidden-sm">
					<div class="job-add wow fadeInRight" data-wow-delay="1.5s">
						<h2>Seeking a job?</h2>
						<a href="#">Create a Account</a>
					</div>
				</div>
			</div>
		</div> -->
	<hr>
	<div class="container">
		<div class="row page-title text-center  wow bounce"
			data-wow-delay=".7s">
			<h2>WHAT PEOPLES ARE SAYING</h2>
		</div>
		<div class="row testimonial">
			<div class="col-md-12">
				<div id="testimonial-slider">
					<div class="item">
						<div class="client-text">
							<p>낮에는 아름다운 기와와 단청, 궁궐의 고즈넉한 모습이 아름답습니다. 
							데이트를 하는 연인과 외국인 관광객이 많으며 한복을 입으면 입장료가 무료입니다. 
							주변에 한복을 대여하는 곳이 있으니 이용해보세요. 뒤에 높은 건물이 없어 파란 하늘과 어우러진 아름다운 기와를 볼 수도 있습니다. 
							밤에 바라보는 경회루는 낭만적이니 밤에도 꼭 보길 바랍니다.</p>
							<h4>
								<strong>서울 경복궁 / </strong><i>Pearl K</i>
							</h4>
						</div>
						<div class="client-face wow fadeInRight" data-wow-delay=".9s">
							<img src="./resources/img/client-face1.png" alt="">
						</div>
					</div>
					<div class="item">
						<div class="client-text">
							<p>제주의 자연을 가장 잘 느낄수 있는 장소라고 생각합니다. 
							바다가 보이는 풍경이나 해변가도 좋고 버스 투어를 하거나 스쿠터, 
							도보 등으로 즐기기에도 부담없는 여행지입니다. 우도로 가는 접근성도 나쁘지 않고 
							주변의 성산일출봉이나 섭지코지를 함께 볼수있어 개인적으로 가장 선호하는 코스입니다.</p>
							<h4>
								<strong>제주도 우도 / </strong><i>2013tessie </i>
							</h4>
						</div>
						<div class="client-face">
							<img src="./resources/img/client-face2.png" alt="">
						</div>
					</div>
					<div class="item">
						<div class="client-text">
							<p>비내리는 날이라 산책하기 좋진 않았지만 
							신선한 공기와 대나무의 초록이 어울려 운치있는 하루였습니다. 
							날씨만 좋았다면 정말 좋았을텐데. 
							입장료가 있지만 이번달엔 안에 있는 전시장 무료입장이 가능해서 좋았습니다.</p>
							<h4>
								<strong>전남 담양군 죽녹원 / </strong><i>민재 성</i>
							</h4>
						</div>
						<div class="client-face">
							<img src="./resources/img/client-face1.png" alt="">
						</div>
					</div>
					<div class="item">
						<div class="client-text">
							<p>오래전 추억을 떠올릴수 있는 장소 입니다.도심에서 조금만 벗어나면 높은곳에 위치한 
							아주 오래된듯한 마을이 나타납니다.겉으로 보는모습과는 
							다르게 마을안으로 들어서면 아기자기하고 이쁜 벽화와 조형물을 만날수있습니다.
							어린왕자는 사진찍는 필수 코스 입니다</p>
							<h4>
								<strong>부산 감천문화마을 / </strong><i>seoulbangi</i>
							</h4>
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

	<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog">
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
							<%-- <jsp:include page="/WEB-INF/views/joinForm.jsp" /> --%>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>


	<!-- footer -->

	<div class="footer-area">
		<div class="container">
		<br><br>
			
			<div class="row footer-copy">
		<!-- 		<p>
					<span id="span1">(C) webstie, All rights reserved</span>
					
				</p> -->
			</div>
		</div>
	</div>

</body>
</html>
