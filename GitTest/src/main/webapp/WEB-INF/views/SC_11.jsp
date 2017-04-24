<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="no-js">
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@include file="joinForm.jsp"%> --%>

<title>SC_11화면</title>
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
<script>
	window.jQuery
			|| document
					.write('<script src="./resources/js/vendor/jquery-1.10.2.min.js"><\/script>')
</script>
<script src="./resources/js/bootstrap.min.js"></script>
<script src="./resources/js/owl.carousel.min.js"></script>
<script src="./resources/js/wow.js"></script>
<script src="./resources/js/main.js"></script>
<!-- <link rel="stylesheet" type="text/css" href="./resources/js/jquery.autocomplete.css" />  -->
<!-- <script type="text/javascript" src="./resources/js/jquery.js"></script> -->
<!--  <script type='text/javascript' src='./resources/js/jquery.bgiframe.min.js'></script> -->
<!--  <script type='text/javascript' src='./resources/js/jquery.ajaxQueue.js'></script> -->
<!-- <script type='text/javascript' src='./resources/js/jquery.autocomplete.js'></script> -->

<!--버튼에 대한 자바스크립트  -->
<!--   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	 -->


<!-- <script src="./resources/js/jquery-3.1.1.js"></script> -->

<script type="text/javascript">
	/* var areacode = ${areacode}; */
	/* console.log(areacode); */

	var key = "fHPwwCqceBLnLCExz65uYIYEAdiAs6xOwv79o6FcLHh7x6iPmxITE9Wk7TqH1q%2F1%2FeSw9j%2FUxPbGiQYcnVa0zw%3D%3D";

	//정보수정 모달
	$('#myModal_Edit').modal('show');

	$(function() {

		$("#joinForm").on("click", function() {

			$("#regAtag").trigger("click");
		})

		$("#loginForm").on("click", function() {

			$("#loginAtag").trigger("click");
		})

	}); //레디펑션 end

	//로그인& 조인 모달 
	$('#myModal').modal('show');

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
							<div class="header-half header-social"></div>
						</c:when>
						<c:otherwise>
							<div class="header-half header-social">
								<ul class="list-inline">
									<li><img src="./resources/image/login_img.png">${sessionScope.user_id }</li>
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
				width="80px" height="80px"></a> <img
				src="./resources/image/main_logo.png" alt="">
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
					<c:when test="${sessionScope.user_id == null }">
						<button type="button" id="loginForm"
							class="navbar-btn nav-button wow bounceInRight login"
							data-toggle="modal" data-target="#myModal" id="loginForm"
							data-wow-delay="0.8s">Login</button>
						<button type="button" id="joinForm"
							class="navbar-btn nav-button wow fadeInRight" data-toggle="modal"
							data-target="#myModal" id="joinForm" data-wow-delay="0.6s">Join</button>
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
				<c:when test="${sessionScope.user_id == null }">

					<ul class="main-nav nav navbar-nav navbar-right">
						<li class="wow fadeInDown" data-wow-delay="0s"><a
							class="active" href="#">일정 만들기</a></li>
						<li class="wow fadeInDown" data-wow-delay="0.1s"><a href="#">나의
								일정 보기</a></li>
						<!-- 					<li class="wow fadeInDown" data-wow-delay="0.2s"><a href="#">My
							Own Schedule</a></li>
					<li class="wow fadeInDown" data-wow-delay="0.3s"><a href="#">City
							Information</a></li> -->
					</ul>
				</c:when>
				<c:otherwise>
					<ul class="main-nav nav navbar-nav navbar-right">
						<li class="wow fadeInDown" data-wow-delay="0s"><a
							class="active" href="#">일정 만들기</a></li>
						<li class="wow fadeInDown" data-wow-delay="0.1s"><a
							href="SC_10">나의 일정 보기</a></li>
						<!-- 	<li class="wow fadeInDown" data-wow-delay="0.2s"><a href="#">나의 일정</a>
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
	<!-- /.container-fluid --> </nav>

	<div class="sc_11">
		<div id="sc_11_01"></div>
		<img src="">

	</div>




	<!-- <a href="new_schedule" class="btn btn-info" role="button">새로운 일정 만들기</a>
	<a href="#" class="btn btn-info" role="button">나의 일정 보기</a> -->



	<!-- <div class="slider-area">
		<div class="slider">
			<div id="bg-slider" class="owl">
				<div class="item">
					<img src="./resources/image/bg_city/bg_korea.jpg" alt="">
				</div>
			</div>
		</div>
		<div class="container slider-content">
			<div class="row">
				<div
					class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1 col-sm-12">
					<br>
					<div id="mainContent">
						<div class="content-area">
							
							
								<div class="row page-title text-center wow zoomInDown"
									data-wow-delay="1s">
									<a href="new_schedule" class="btn btn-info" role="button">새로운
										일정 만들기</a> <a href="#" class="btn btn-info" role="button">나의
										일정 보기</a>
								</div>
							
							<div class="container">
							</div>
						</div>
					</div>
					<br> <br> <br> <br> <br>
					<div class="search-form wow pulse" data-wow-delay="0.8s">
						<form action="" class=" form-inline"></form>
					</div>
				</div>
			</div>
		</div>
	</div> -->


	<div class="slider-area">
		<div class="slider">
			<div id="bg-slider1 class="owl-carousel owl-theme">

				<div class="item_12">
					 <img src="./resources/image/voyage.png" alt=""> 
				</div>
			<!-- 	<div class="item">
					<img src=""
						alt="The Last of us">
				</div>
				<div class="item">
					<img src="" alt="">
				</div> -->

			</div>
		</div>
		<div class="container slider-content">
			<div class="row">
				<div
					class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1 col-sm-12">
					<br>
					<div id="mainContent">
						<!-- <h2>
							나만의 일정을<br> 쉽게 만들어 보세요 
						</h2> -->
						<br><br>
					</div>
					<div class="content-area_1">
						<div class="container_1">
							<div class="row page-title text-center wow zoomInDown"
								data-wow-delay="1s">
								<a href="new_schedule" class="btn btn-info" role="button">새로운
									일정 만들기</a> <a href="SC_10" class="btn btn-info" role="button">나의 일정 보기</a>
								<!-- <button type="button" class="btn btn-primary">Primary</button>
  <button type="button" class="btn btn-success">Success</button> -->
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>


	<center><h5>여행 자들의 일정 보기</h5></center>



	<!--도시 이미지  -->
	<!--   <div class="row carousel-holder">

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

            </div> -->

	<!-- footer -->
	<div class="footer-area">
		<div class="container">
			<br> <br>
			<div class="row footer-copy"></div>
		</div>
	</div>
</body>
</html>