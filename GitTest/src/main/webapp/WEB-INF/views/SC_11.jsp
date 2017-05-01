<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="no-js">
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@include file="joinForm.jsp"%> --%>

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
<link rel ="stylesheet" href ="./resources/css/11css.css"> 
<script src="./resources/js/vendor/modernizr-2.6.2.min.js"></script>
<script src="./resources/js/jquery.min.js"></script> 
<!--Stylesheets-->
	<link href="./resources/css/jquery.modal.css" type="text/css" rel="stylesheet" />
	
	<!--jQuery-->
	<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript" src="./resources/js/jquery.modal.js"></script>
<script>
	window.jQuery
			|| document
					.write('<script src="./resources/js/vendor/jquery-1.10.2.min.js"><\/script>')
</script>
<script src="./resources/js/bootstrap.js"></script>
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

<style type="text/css">
	html,  body {
		overflow-x: hidden;
	}
</style>

<script type="text/javascript">
	/* var areacode = ${areacode}; */
	/* console.log(areacode); */
	var check = 0;
	var inner = null;
	var area = null;
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

<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/hanna.css);
.section-30 {
	background-image: url(./resources/image/otherpage/bg_11.png);
	background-repeat: repeat-y;
	background-size: 100%;
}
h1 {
	font-family: 'Hanna', serif;
	color : gray;
	font-size: -webkit-xxx-large;
}

h2 {
	font-family: 'Hanna', serif;
	color : gray;
	font-size: xx-large;
}

</style>
	<section
		class="section-30 section-sm-40 section-md-66 section-lg-bottom-90 bg-gray-dark page-title-wrap">
	<div class="shell">
		<div class="page-title" style="height: 400px;">
			<div class="container" style="margin: auto; margin-top: 85px;">
				<h1 id="sc_10_text"style="text-align:center;">Make a new plan</h1>
			</div>
		</div>
	</div>
	</section>
	<br><br><br>
<center>	

	<a href="new_schedule" class="btn btn-info" role="button">새로운
	일정 만들기</a> <a href="SC_10" class="btn btn-info" role="button">나의 일정 보기</a>
	<br><br>
	<h2>여행자들의 일정 보기</h2></center>

<div class="content">
	<div class="wrap">
		<div class="content_header">
			<div class="content_header_title">
				</div>
			<div class="clear"></div>
		</div>

	<div class="content_filter">
						<input type="hidden" id="cu_srl" >
			<input type="hidden" id="ci_srl" >
						<input type="hidden" id="tour_day">
			<input type="hidden" id="tour_month">
			<input type="hidden" id="tour_type">
			<div class="filter_title f_title" >
				필터			</div>
			<div class="filter_right f_content" id="filter_content">
			<div class="filter_set_btn" id="filter_set_btn">여행지 : </div>
			<div class="filter_set_box" id="filter_set_area"></div>
			<div class="filter_set_btn" id="filter_set_btn">여행일수 : </div>
			<div class="filter_set_box_day" id="filter_set_day"></div>
			<div class="filter_set_btn" id="filter_set_btn">여행시기 : </div>
			<div class="filter_set_box_day" id="filter_set_season"></div>
			<div class="filter_set_btn" id="filter_set_btn">여행테마 : </div>
			<div class="filter_set_box_theme" id="filter_set_theme"></div>
			</div>
			<div class="clear"></div>

			<div class="filter_title" data-sh="area_tab" >
				주요 여행지			</div>
			<div class="filter_right" data-sh="area_tab" >
					<div class="filter_set_btn">
					<a href ="javascript:areafilter(1,'서울')" onclick="false">서울</a>
					</div>
					<div class="filter_set_btn" >
					<a href ="javascript:areafilter(6,'부산')" onclick="false">부산</a>
					</div>
					<div class="filter_set_btn">
					<a href ="javascript:areafilter(39,'제주도')" onclick="false">제주도</a>
					</div>
					<div class="filter_set_btn" >
					<a href ="javascript:areafilter(2,'인천')" onclick="false">인천</a>
					</div>
					<div class="filter_set_btn">
					<a href ="javascript:areafilter(3,'대전')" onclick="false">대전</a>
					</div>
					<div class="filter_set_btn" >
					<a href ="javascript:areafilter(4,'대구')" onclick="false">대구</a>
					</div>
					<div class="filter_set_btn">
					<a href ="javascript:areafilter(5,'광주')" onclick="false">광주</a>
					</div>
					<div class="filter_set_btn" >
					<a href ="javascript:areafilter(7,'울산')" onclick="false">울산</a>
					</div>
					<div class="filter_set_btn" >
					<a href ="javascript:areafilter(8,'세종시')" onclick="false">세종시</a>
					</div>
					<!-- <div class="filter_set_btn" >
					<a href ="javascript:plusArea()">더보기</a>
					</div> -->
					<!-- 			<div class="area_btn" data-on="off"> -->
					
				</div>
				<div class="clear"></div>
			</div>
			<div class="clear"></div>
			<div class="area_tab" data-sh="area_tab">
			 
			</div>
			<div id="filter_area">
				<div class='filter_title' id='filter_title city' data-sh='city' >여행지역</div>				
			<div class='filter_right' data-sh='city'>
				<div class='filter_set_btn'><a href ="javascript:areafilter(31,'경기도')" onclick="false">경기도</a></div>
				<div class='filter_set_btn'><a href ="javascript:areafilter(32,'강원도')" onclick="false">강원도</a></div>
				<div class='filter_set_btn'><a href ="javascript:areafilter(33,'충청북도')" onclick="false">충청북도</a></div>
				<div class='filter_set_btn'><a href ="javascript:areafilter(34,'충청남도')" onclick="false">충청남도</a></div>
				<div class='filter_set_btn'><a href ="javascript:areafilter(35,'경상북도')" onclick="false">경상북도</a></div>
				<div class='filter_set_btn'><a href ="javascript:areafilter(36,'경상남도')" onclick="false">경상남도</a></div>
				<div class='filter_set_btn'><a href ="javascript:areafilter(37,'전라북도')" onclick="false">전라북도</a></div>
				<div class='filter_set_btn'><a href ="javascript:areafilter(38,'전라남도')" onclick="false">전라남도</a></div>
				<div class='clear'></div></div>
			</div>
			<div id="sigungu_area"></div>
			<div class="clear"></div>

			<div class="filter_title" data-sh="tour_day">
				여행일수			</div>
			<div class="filter_right" data-sh="tour_day">
				<div class="filter_set_btn"><a href ="javascript:dayfilter(1,'1일')" onclick="false">1일</a></div>
				<div class="filter_set_btn"><a href ="javascript:dayfilter(2,'2일')" onclick="false">2일</a></div>
				<div class="filter_set_btn"><a href ="javascript:dayfilter(3,'3일')" onclick="false">3일</a></div>
				<div class="filter_set_btn"><a href ="javascript:dayfilter(4,'4일')" onclick="false">4일</a></div>
				<div class="filter_set_btn"><a href ="javascript:dayfilter(5,'5일')" onclick="false">5일</a></div>
				<div class="filter_set_btn"><a href ="javascript:dayfilter(6,'6일')" onclick="false">6일</a></div>
				<div class="filter_set_btn"><a href ="javascript:dayfilter(7,'7일이상')" onclick="false">7일이상</a></div>
				<div class="clear"></div>
			</div>
			<div class="clear"></div>

			<div class="filter_title" data-sh="tour_ss">
				여행시기			</div>
			<div class="filter_right" data-sh="tour_ss">
				<div class="filter_set_btn"><a href ="javascript:seasonfilter('spring','봄')" onclick="false">봄</a></div>
				<div class="filter_set_btn"><a href ="javascript:seasonfilter('summer','여름')" onclick="false">여름</a></div>
				<div class="filter_set_btn"><a href ="javascript:seasonfilter('fall','가을')" onclick="false">가을</a></div>
				<div class="filter_set_btn"><a href ="javascript:seasonfilter('winter','겨울')" onclick="false">겨울</a></div>
				<div class="clear"></div>
			</div>
			<div class="clear"></div>

			<div class="filter_title last" data-sh="theme">
				여행테마			</div>
			<div class="filter_right last" data-sh="theme">
				<div class="filter_set_btn"><a href ="javascript:themefilter('alone','나홀로여행')" onclick="false">나홀로여행</a></div>
				<div class="filter_set_btn"><a href ="javascript:themefilter('couple','커플여행')" onclick="false">커플여행</a></div>
				<div class="filter_set_btn"><a href ="javascript:themefilter('family','가족여행')" onclick="false">가족여행</a></div>
				<div class="filter_set_btn"><a href ="javascript:themefilter('group','단체여행')" onclick="false">단체여행</a></div>
				
				<div class="clear"></div>
			</div>
			<div class="clear"></div>
		</div>		
		<div class="content_list">
			
		
		</div>
	</div>
	


					<div class="tab-content">
                        <div role="tabpanel" class="tab-pane fade in active" id="job-seekers">
                            <ul class="list-inline job-seeker" >
                             	<!-- 클립보드 탭 -->
                             <div id="all_scd_read" class="all_scd_read">  
                                
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
	<div id="paging"></div>
	
	
	
	<!--도시 이미지  -->
<!-- 	   <div class="row carousel-holder">

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

            </div>  -->

	<!-- footer -->
	<div class="footer-area">
		<div class="container">
			<br> <br>
			<div class="row footer-copy"></div>
		</div>
	</div>
</body>

<!-- <script src="./resources/js/jquery-3.1.1.js"></script> -->
<script>
var scd_sq_arry=[];

var _areacode='null';
var _day_cnt='null';
var _season='null';
var _theme='null';

var html_area="";
var html_day="";
var html_season="";
var html_theme="";
function areafilter(areacode,cite_nm){ 
	
	if(_areacode == 'null'){
		_areacode = areacode;
		html_area +='<div class="filter_value" id="filter_value_area">';
		html_area +="<a href='javascript:filter_cancel(1)' onclick='false'><span>"+cite_nm+"</span>";
		html_area +='<div class="f_line"></div>';
		html_area +='<img class="f_rm" src="./resources/img/icon/filter_rm.gif"><a/></div>';
	}else if(_areacode != areacode){
		_areacode = areacode;
		html_area="";			
		$("div#filter_value_area").detach();
		html_area +='<div class="filter_value" id="filter_value_area">';
		html_area +='<a href="javascript:filter_cancel(1)" onclick="false"><span>'+cite_nm+'</span>';
		html_area +='<div class="f_line"></div>';
		html_area +='<img class="f_rm" src="./resources/img/icon/filter_rm.gif"><a/></div>';
	}else if(_areacode==areacode){
		_areacode ='null';
		html_area="";
		$("div#filter_value_area").detach();
		filtering();
		return true;
	}
	$("#filter_set_area").html(html_area);
	filtering();
}
function dayfilter(day_cnt,day_nm){
	
	if(_day_cnt == 'null'){
		_day_cnt = day_cnt;
		html_day +='<div class="filter_value" id="filter_value_day">';
		html_day +='<a href="javascript:filter_cancel(2)" onclick="false"><span>'+day_nm+'</span>';
		html_day +='<div class="f_line"></div>';
		html_day +='<img class="f_rm" src="./resources/img/icon/filter_rm.gif"><a/></div>';
	}else if(_day_cnt != day_cnt){
		_day_cnt = day_cnt;
		html_day="";
		$("div#filter_value_day").detach();
		html_day +='<div class="filter_value" id="filter_value_day">';
		html_day +='<a href="javascript:filter_cancel(2)" onclick="false"><span>'+day_nm+'</span>';
		html_day +='<div class="f_line"></div>';
		html_day +='<img class="f_rm" src="./resources/img/icon/filter_rm.gif"><a/></div>';
	}else if(_day_cnt==day_cnt){
		_day_cnt ='null';
		html_day="";
		$("div#filter_value_day").detach();
		filtering();
		return false;
	}
	$("#filter_set_day").html(html_day);
	filtering();
}
 
function seasonfilter(season,season_nm){
	if(_season == 'null'){
		_season = season;
		html_season +='<div class="filter_value" id="filter_value_season">';
		html_season +='<a href="javascript:filter_cancel(3)" onclick="false"><span>'+season_nm+'</span>';
		html_season +='<div class="f_line"></div>';
		html_season +='<img class="f_rm" src="./resources/img/icon/filter_rm.gif"><a/></div>';
	}else if(_season != season){
		_season = season;
		hhtml_seasontml="";
		$("div#filter_value_season").detach(); 
		html +='<div class="filter_value" id="filter_value_season">';
		html +='<a href="javascript:filter_cancel(3)" onclick="false"><span>'+season_nm+'</span>';
		html +='<div class="f_line"></div>';
		html +='<img class="f_rm" src="./resources/img/icon/filter_rm.gif"><a/></div>';
	}else if(_season==season){
		_season ='null';
		html_season="";
		$("div#filter_value_season").detach();
		filtering();
		return false;
	}
	$("#filter_set_season").html(html_season);
	filtering();
}
function themefilter(theme,theme_nm){
	if(_theme == 'null'){
		_theme = theme;
		html_theme +='<div class="filter_value" id="filter_value_theme">';
		html_theme +='<a href="javascript:filter_cancel(4)" onclick="false"><span>'+theme_nm+'</span>';
		html_theme +='<div class="f_line"></div>';
		html_theme +='<img class="f_rm" src="./resources/img/icon/filter_rm.gif"><a/></div>';
	}else if(_theme != theme){
		_theme = theme;
		html_theme="";
		$("div#filter_value_theme").detach();
		html_theme +='<div class="filter_value" id="filter_value_theme">';
		html_theme +='<a href="javascript:filter_cancel(4)" onclick="false"><span>'+theme_nm+'</span>';
		html_theme +='<div class="f_line"></div>';
		html_theme +='<img class="f_rm" src="./resources/img/icon/filter_rm.gif"><a/></div>';
	}else if(_theme==theme){
		_theme ='null';
		html_theme="";
		$("div#filter_value_theme").detach();
		filtering();
		return false;
	}
	$("#filter_set_theme").html(html_theme);
	filtering();
}
function filter_cancel(filter){
	
	if(filter==1){
		html_area="";
		$("div#filter_value_area").detach();
		_areacode='null';		
	}else if(filter==2){
		html_day="";
		$("div#filter_value_day").detach();
		_day_cnt='null';
	}else if(filter==3){
		html_season="";
		$("div#filter_value_season").detach();
		_season='null';
	}else if(filter==4){
		html_theme="";
		$("div#filter_value_theme").detach();
		_theme='null';
	}
	filtering();
}
/////////////////스케줄  필터링 ///////////////
function filtering(){
	var html_Like="";
	var areacode=_areacode;
	var DAY_CNT=_day_cnt;
	var SCD_SEASON=_season;
	var SCD_THEME=_theme;
	 
	 
	console.log("지역코드 : "+areacode+"여행일수 : "+DAY_CNT+", 계절 :"+SCD_SEASON+", 테마 : "+SCD_THEME);
	$.ajaxSetup({
        async: false
    });
	
	$.ajax({
		type : "get",
		url : "filtering",
		data : {	
			
			 day_cnt : DAY_CNT
			,scd_season : SCD_SEASON
			,scd_theme : SCD_THEME 
			,area_code : areacode
		},
		success : function(data){
			 console.log(data);
			 console.log(data.filter_List.length);
			 
			if(data.filter_List.length < 1){
				$("div#all_scd_read").empty();
				return false;
			}
			//좋아요 담는 배열
			var l_List=data.l_List;
			//페이징 관련 html
            var html2 ="";
			//일정 관련 html
			var html ="";
			$.each(data.filter_List,function(index,item){
				console.log(item);
				var contentId=item.DTL_CONTENT_ID;				
			     ReadApi(contentId); 
			$.getJSON(url, function(data) { 
			    console.log('success1', data);
			    var scd_sq=item.SCD_SQ;
			    scd_sq_arry=scd_sq;
			    if (typeof (data.response.body.items.item.firstimage) !== "undefined") {
			    	contentId=item.DTL_CONTENT_ID;
			    	ReadApi(contentId);
			    	$.getJSON(url, function(data) {
			    	html += '<li>';
			    	html += '<div class="scd_box" id="scd_box">'
					html += '<a href="SC_12?scd_sq='+item.SCD_SQ+'">'; 
					html += '<img src='+data.response.body.items.item.firstimage+' width=300px height=200px>';
					if (typeof (item.SCD_DESC) !== "undefined") {
						html += '<div class="overlay"><h3>'+item.SCD_TITLE+'<br>'+item.SCD_DESC+'</h3></div>';	
						}else{
							html += '<div class="overlay"><h3>'+item.SCD_TITLE+'</h3></div>';	
						};
						var like=0;	
						for(var i=0;i<l_List.length;i++){
							if(l_List[i].scd_SQ==item.SCD_SQ){
								like=l_List[i].liked_SQ							
							} 
						}					
						html += '</a><div class="info_box"><div id="user_id_box" class="user_id_box"><img class="icon" src="./resources/img/icon/user_icon.png">'+item.USER_ID+'</div>';
						html += '<div id="like_box" class="like_box"><a href="javascript:insertLike('+item.SCD_SQ+')" onclick="false"><img class="icon" src="./resources/img/icon/like_icon.png">'+like+'</a></div></div>';
						html += '</div></li>';
				
			    	});
			    }else if (typeof (data.response.body.items.item.firstimage) == "undefined") {
			    	contentId=item.DTL_CONTENT_ID2;
			    	ReadApi(contentId);
			    	$.getJSON(url, function(data) {
			    	html += '<li>';
			    	html += '<div class="scd_box" id="scd_box">'
					html += '<a href="SC_12?scd_sq='+item.SCD_SQ+'">'; 
					html += '<img src='+data.response.body.items.item.firstimage+' width=300px height=200px>';
					if (typeof (item.SCD_DESC) !== "undefined") {
					html += '<div class="overlay"><h3>'+item.SCD_TITLE+'<br>'+item.SCD_DESC+'</h3></div>';	
					}else{
						html += '<div class="overlay"><h3>'+item.SCD_TITLE+'</h3></div>';	
					};
					var like=0;	
					for(var i=0;i<l_List.length;i++){
						if(l_List[i].scd_SQ==item.SCD_SQ){
							like=l_List[i].liked_SQ							
						} 
					}					
					html += '</a><div class="info_box"><div id="user_id_box" class="user_id_box"><img class="icon" src="./resources/img/icon/user_icon.png">'+item.USER_ID+'</div>';
					html += '<div id="like_box" class="like_box"><a href="javascript:insertLike('+item.SCD_SQ+')" onclick="false"><img class="icon" src="./resources/img/icon/like_icon.png">'+like+'</a></div></div>';
					html += '</div></li>'; 
			    });
			    	
			    }else{
			    	html += '<li>';
			    	html += '<div class="scd_box" id="scd_box">'
					html += '<a href="SC_12?scd_sq='+item.SCD_SQ+'">'; 
					html += '<img src="./resources/image/noimage.jpg" width=300px height=200px>';
					if (typeof (item.SCD_DESC) !== "undefined") {
					html += '<div class="overlay"><h3>'+item.SCD_TITLE+'<br>'+item.SCD_DESC+'</h3></div>';	
					}else{
						html += '<div class="overlay"><h3>'+item.SCD_TITLE+'</h3></div>';	
					};
					var like=0;	
					for(var i=0;i<l_List.length;i++){
						if(l_List[i].scd_SQ==item.SCD_SQ){
							like=l_List[i].liked_SQ							
						} 
					}					
					html += '</a><div class="info_box"><div id="user_id_box" class="user_id_box"><img class="icon" src="./resources/img/icon/user_icon.png">'+item.USER_ID+'</div>';
					html += '<div id="like_box" class="like_box"><a href="javascript:insertLike('+item.SCD_SQ+')" onclick="false"><img class="icon" src="./resources/img/icon/like_icon.png">'+like+'</a></div></div>';
						html += '</div></li>';				  
			    }			    
			});
			
			});			
			$("#all_scd_read").html(html);
			html2+='<div align="center">';
            var bigpageback=data.navi.currentPage - data.navi.pagePerGroup;
            console.log(bigpageback);
            html2+='<a href ="javascript:pagingFormSubmitF('+bigpageback +')">◀◀ </a>';
            var onepageback=data.navi.currentPage -1
            console.log(onepageback);
            html2+='<a href ="javascript:pagingFormSubmitF('+onepageback+')">◀ </a>';
            var j=0;
            for( var i = data.navi.startPageGroup ; i <= data.navi.endPageGroup ; i++){                   
               var counter=data.navi.startPageGroup+j;
               j=j+1;
               html2+='<a href="javascript:pagingFormSubmitF('+counter+')">'+i+' </a>';
                
            } 
            html2+='<a href="javascript:pagingFormSubmitF('+(data.navi.currentPage + 1)+')">▶ </a>';
            html2+='<a href="javascript:pagingFormSubmitF('+(data.navi.currentPage + data.navi.pagePerGroup)+')">▶▶</a></div>';
            html2+='<form action="filtering" method="get" id="pagingForm">';
            html2+='<input type="hidden" id="page" name="page">';                
            html2+='</form></div>';
            html2+='</div';
		    
         $("#paging").html(html2);
				
		},
		error : function(e){
			console.log(e);
		}
	}); 
	
	
};

var key = "fHPwwCqceBLnLCExz65uYIYEAdiAs6xOwv79o6FcLHh7x6iPmxITE9Wk7TqH1q%2F1%2FeSw9j%2FUxPbGiQYcnVa0zw%3D%3D";
var url;
function ReadApi(contentId,contentTypeId) {
	url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?ServiceKey="+key;
	url += "&mapX&mapY";
	url += "&contentTypeId"+contentTypeId+"&contentId="+contentId+"&areaCode&sigunguCode&cat1=&cat2=&cat3=&listYN=Y";
	url += "&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&transGuideYN=Y&_type=json";
	
}

function pagingFormSubmit(currentPage) { //currentPage가 어디서 호출되어 온다
	   var form=document.getElementById("pagingForm");
	   var page=document.getElementById("page"); 
	   page.value=currentPage; 
	   /* form.submit(); */
	   console.log(page.value);
	   paging(page.value);
	}

function pagingFormSubmitF(currentPage) { //currentPage가 어디서 호출되어 온다
	   var form=document.getElementById("pagingForm");
	   var page=document.getElementById("page"); 
	   page.value=currentPage; 
	   /* form.submit(); */
	   console.log(page.value);
	   Fpaging(page.value);
	}


//////////////////////////////////////전체 스케줄 호출////////////////////////////
/* $(function(){ */
function read_SCD() {
		
	
	$.ajaxSetup({
        async: false
    });
	
	$.ajax({
		type : "get",
		url : "all_scd_read",
		async : false,
		success : function(data){
			//좋아요 담는 배열
			var l_List=data.l_List;
			//페이징 관련 html
            var html2 ="";
			//일정 관련 html
			var html ="";
			$.each(data.all_scd_List,function(index,item){
				 
				var contentId=item.DTL_CONTENT_ID;				
			    ReadApi(contentId);
			$.getJSON(url, function(data) {
				
			    console.log('success1', data);
			    var scd_sq=item.SCD_SQ;
			    var scd_sq=[];
			    if (typeof (data.response.body.items.item.firstimage) !== "undefined") {
			    	
			    	html += '<li>';
					html += '<div class="scd_box" id="scd_box">'
					html += '<a href="SC_12?scd_sq='+item.SCD_SQ+'">'; 
					html += '<img src='+data.response.body.items.item.firstimage+' width=300px height=200px>';
					if (typeof (item.SCD_DESC) !== "undefined") {
						html += '<div class="overlay"><h3>'+item.SCD_TITLE+'<br>'+item.SCD_DESC+'</h3></div>';	
						}else{
							html += '<div class="overlay"><h3>'+item.SCD_TITLE+'</h3></div>';	
						};					
					var like=0;	
					for(var i=0;i<l_List.length;i++){
						if(l_List[i].scd_SQ==item.SCD_SQ){
							like=l_List[i].liked_SQ							
						} 
					}					
					html += '</a><div class="info_box"><div id="user_id_box" class="user_id_box"><img class="icon" src="./resources/img/icon/user_icon.png">'+item.USER_ID+'</div>';
					html += '<div id="like_box" class="like_box"><a href="javascript:insertLike('+item.SCD_SQ+')" onclick="false"><img class="icon" src="./resources/img/icon/like_icon.png">'+like+'</a></div></div>';
					html += '</div></li>';
					
			    }else if (typeof (data.response.body.items.item.firstimage) == "undefined") {
			    	contentId=item.DTL_CONTENT_ID2;
			    	ReadApi(contentId);
			    $.getJSON(url, function(data) {
			    	html += '<li>';
			    	html += '<div class="scd_box" id="scd_box">'
					html += '<a href="SC_12?scd_sq='+item.SCD_SQ+'">'; 
					html += '<img src='+data.response.body.items.item.firstimage+' width=300px height=200px>';
					if (typeof (item.SCD_DESC) !== "undefined") {
					html += '<div class="overlay"><h3>'+item.SCD_TITLE+'<br>'+item.SCD_DESC+'</h3></div>';	
					}else{
						html += '<div class="overlay"><h3>'+item.SCD_TITLE+'</h3></div>';	
					};
					var like=0;	
					for(var i=0;i<l_List.length;i++){
						if(l_List[i].scd_SQ==item.SCD_SQ){
							like=l_List[i].liked_SQ							
						} 
					}					
					html += '</a><div class="info_box"><div id="user_id_box" class="user_id_box"><img class="icon" src="./resources/img/icon/user_icon.png">'+item.USER_ID+'</div>';
					html += '<div id="like_box" class="like_box"><a href="javascript:insertLike('+item.SCD_SQ+')" onclick="false"><img class="icon" src="./resources/img/icon/like_icon.png">'+like+'</a></div></div>';
					html += '</div></li>';
				
					
				
			    });
			    	
			    }else{
			    	html += '<li>';
			    	html += '<div class="scd_box" id="scd_box">'
					html += '<a href="SC_12?scd_sq='+item.SCD_SQ+'">'; 
					html += '<img src="./resources/image/noimage.jpg" width=300px height=200px>';
					if (typeof (item.SCD_DESC) !== "undefined") {
					html += '<div class="overlay"><h3>'+item.SCD_TITLE+'<br>'+item.SCD_DESC+'</h3></div>';	
					}else{
						html += '<div class="overlay"><h3>'+item.SCD_TITLE+'</h3></div>';	
					};
					var like=0;	
					for(var i=0;i<l_List.length;i++){
						if(l_List[i].scd_SQ==item.SCD_SQ){
							like=l_List[i].liked_SQ							
						} 
					}					
					html += '</a><div class="info_box"><div id="user_id_box" class="user_id_box"><img class="icon" src="./resources/img/icon/user_icon.png">'+item.USER_ID+'</div>';
					html += '<div id="like_box" class="like_box"><a href="javascript:insertLike('+item.SCD_SQ+')" onclick="false"><img class="icon" src="./resources/img/icon/like_icon.png">'+like+'</a></div></div>';
					html += '</div></li>';				  
			    }
			});
			});
			    $("#all_scd_read").html(html);
			    
			    html2+='<div align="center">';
                var bigpageback=data.navi.currentPage - data.navi.pagePerGroup;
                console.log(bigpageback);
                html2+='<a href ="javascript:pagingFormSubmit('+bigpageback +')">◀◀ </a>';
                var onepageback=data.navi.currentPage -1
                console.log(onepageback);
                html2+='<a href ="javascript:pagingFormSubmit('+onepageback+')">◀ </a>';
                var j=0;
                for( var i = data.navi.startPageGroup ; i <= data.navi.endPageGroup ; i++){                   
                   var counter=data.navi.startPageGroup+j;
                   j=j+1;
                   html2+='<a href="javascript:pagingFormSubmit('+counter+')">'+i+' </a>';
                    
                } 
                html2+='<a href="javascript:pagingFormSubmit('+(data.navi.currentPage + 1)+')">▶ </a>';
                html2+='<a href="javascript:pagingFormSubmit('+(data.navi.currentPage + data.navi.pagePerGroup)+')">▶▶</a></div>';
                html2+='<form action="all_scd_read" method="get" id="pagingForm">';
                html2+='<input type="hidden" id="page" name="page">';                
                html2+='</form></div>';
                html2+='</div';
			    
             $("#paging").html(html2);   
			
			
				
		},
		error : function(e){
			console.log(e);
		}
	}); 
    
/* }); */
}
//ajax 페이징
function paging(page) {
	
	console.log(page);
	$.ajaxSetup({
        async: false
    });
	$.ajax({
		type : "get",
		url : "all_scd_read",
		data : {	
			
			page : page
		}, 
		success : function(data){
			//좋아요 담는 배열
			var l_List=data.l_List;
			//페이징 관련 html
            var html2 ="";
			//일정 관련 html
			var html ="";
			$.each(data.all_scd_List,function(index,item){ 
				var contentId=item.DTL_CONTENT_ID;				
			     ReadApi(contentId);
			$.getJSON(url, function(data) {
				
			    console.log('success1', data);
			    var scd_sq=item.SCD_SQ;
			    
			    if (typeof (data.response.body.items.item.firstimage) !== "undefined") {
			    	
			    	html += '<li>';
			    	html += '<div class="scd_box" id="scd_box">'
					html += '<a href="SC_12?scd_sq='+item.SCD_SQ+'">'; 
					html += '<img src='+data.response.body.items.item.firstimage+' width=300px height=200px>';
					if (typeof (item.SCD_DESC) !== "undefined") {
						html += '<div class="overlay"><h3>'+item.SCD_TITLE+'<br>'+item.SCD_DESC+'</h3></div>';	
						}else{
							html += '<div class="overlay"><h3>'+item.SCD_TITLE+'</h3></div>';	
						};
						var like=0;	
						for(var i=0;i<l_List.length;i++){
							if(l_List[i].scd_SQ==item.SCD_SQ){
								like=l_List[i].liked_SQ							
							} 
						}					
						html += '</a><div class="info_box"><div id="user_id_box" class="user_id_box"><img class="icon" src="./resources/img/icon/user_icon.png">'+item.USER_ID+'</div>';
						html += '<div id="like_box" class="like_box"><a href="javascript:insertLike('+item.SCD_SQ+')" onclick="false"><img class="icon" src="./resources/img/icon/like_icon.png">'+like+'</a></div></div>';
						html += '</div></li>';
				
				 
			    }else if (typeof (data.response.body.items.item.firstimage) == "undefined") {
			    	contentId=item.DTL_CONTENT_ID2;
			    	ReadApi(contentId);
			    $.getJSON(url, function(data) {
			    	html += '<li>';
			    	html += '<div class="scd_box" id="scd_box">'
					html += '<a href="SC_12?scd_sq='+item.SCD_SQ+'">'; 
					html += '<img src='+data.response.body.items.item.firstimage+'width=300px height=200px>';
					if (typeof (item.SCD_DESC) !== "undefined") {
					html += '<div class="overlay"><h3>'+item.SCD_TITLE+'<br>'+item.SCD_DESC+'</h3></div>';	
					}else{
						html += '<div class="overlay"><h3>'+item.SCD_TITLE+'</h3></div>';	
					};
					var like=0;	
					for(var i=0;i<l_List.length;i++){
						if(l_List[i].scd_SQ==item.SCD_SQ){
							like=l_List[i].liked_SQ							
						} 
					}					
					var like=0;	
					for(var i=0;i<l_List.length;i++){
						if(l_List[i].scd_SQ==item.SCD_SQ){
							like=l_List[i].liked_SQ							
						} 
					}					
					html += '</a><div class="info_box"><div id="user_id_box" class="user_id_box"><img class="icon" src="./resources/img/icon/user_icon.png">'+item.USER_ID+'</div>';
					html += '<div id="like_box" class="like_box"><a href="javascript:insertLike('+item.SCD_SQ+')" onclick="false"><img class="icon" src="./resources/img/icon/like_icon.png">'+like+'</a></div></div>';
					html += '</div></li>';
				
				
			    	
			    });
			    	
			    }else{
			    	html += '<li>';
			    	html += '<div class="scd_box" id="scd_box">'
					html += '<a href="SC_12?scd_sq='+item.SCD_SQ+'">'; 
					html += '<img src="./resources/image/noimage.jpg" width=300px height=200px>';
					if (typeof (item.SCD_DESC) !== "undefined") {
					html += '<div class="overlay"><h3>'+item.SCD_TITLE+'<br>'+item.SCD_DESC+'</h3></div>';	
					}else{
						html += '<div class="overlay"><h3>'+item.SCD_TITLE+'</h3></div>';	
					};
					var like=0;	
					for(var i=0;i<l_List.length;i++){
						if(l_List[i].scd_SQ==item.SCD_SQ){
							like=l_List[i].liked_SQ							
						} 
					}					
					html += '</a><div class="info_box"><div id="user_id_box" class="user_id_box"><img class="icon" src="./resources/img/icon/user_icon.png">'+item.USER_ID+'</div>';
					html += '<div id="like_box" class="like_box"><a href="javascript:insertLike('+item.SCD_SQ+')" onclick="false"><img class="icon" src="./resources/img/icon/like_icon.png">'+like+'</a></div></div>';
					html += '</div></li>';				  
			    }
			});
			});
			    $("#all_scd_read").html(html);
			    
			    html2+='<div align="center">';
                var bigpageback=data.navi.currentPage - data.navi.pagePerGroup;
                console.log(bigpageback);
                html2+='<a href ="javascript:pagingFormSubmit('+bigpageback +')">◀◀ </a>';
                var onepageback=data.navi.currentPage -1
                console.log(onepageback);
                html2+='<a href ="javascript:pagingFormSubmit('+onepageback+')">◀ </a>';
                var j=0;
                for( var i = data.navi.startPageGroup ; i <= data.navi.endPageGroup ; i++){                   
                   var counter=data.navi.startPageGroup+j;
                   j=j+1;
                   html2+='<a href="javascript:pagingFormSubmit('+counter+')">'+i+' </a>';
                    
                } 
                html2+='<a href="javascript:pagingFormSubmit('+(data.navi.currentPage + 1)+')">▶ </a>';
                html2+='<a href="javascript:pagingFormSubmit('+(data.navi.currentPage + data.navi.pagePerGroup)+')">▶▶</a></div>';
                html2+='<form action="all_scd_read" method="get" id="pagingForm">';
                html2+='<input type="hidden" id="page" name="page">';                
                html2+='</form></div>';
			    
			    
             $("#paging").html(html2);    
		},
		error : function(e){
			console.log(e);
		}
	}); 
    
}
function Fpaging(page) {
	var html_Like="";
	var areacode=_areacode;
	var DAY_CNT=_day_cnt;
	var SCD_SEASON=_season;
	var SCD_THEME=_theme;
	 
	 
	console.log("지역코드 : "+areacode+"여행일수 : "+DAY_CNT+", 계절 :"+SCD_SEASON+", 테마 : "+SCD_THEME);
	$.ajaxSetup({
        async: false
    });
	
	$.ajax({
		type : "get",
		url : "filtering",
		data : {	
			
			 day_cnt : DAY_CNT
			,scd_season : SCD_SEASON
			,scd_theme : SCD_THEME 
			,area_code : areacode
			,page :page
		},
		success : function(data){
			 console.log(data);
			 console.log(data.filter_List.length);
			 
			if(data.filter_List.length < 1){
				$("div#all_scd_read").empty();
				return false;
			}
			//좋아요 담는 배열
			var l_List=data.l_List;
			//페이징 관련 html
            var html2 ="";
			//일정 관련 html
			var html ="";
			$.each(data.filter_List,function(index,item){
				console.log(item);
				var contentId=item.DTL_CONTENT_ID;				
			     ReadApi(contentId); 
			$.getJSON(url, function(data) { 
			    console.log('success1', data);
			    var scd_sq=item.SCD_SQ;
			    scd_sq_arry=scd_sq;
			    if (typeof (data.response.body.items.item.firstimage) !== "undefined") {
			    	contentId=item.DTL_CONTENT_ID;
			    	ReadApi(contentId);
			    	$.getJSON(url, function(data) {
			    	html += '<li>';
			    	html += '<div class="scd_box" id="scd_box">'
					html += '<a href="SC_12?scd_sq='+item.SCD_SQ+'">'; 
					html += '<img src='+data.response.body.items.item.firstimage+' width=300px height=200px>';
					if (typeof (item.SCD_DESC) !== "undefined") {
						html += '<div class="overlay"><h3>'+item.SCD_TITLE+'<br>'+item.SCD_DESC+'</h3></div>';	
						}else{
							html += '<div class="overlay"><h3>'+item.SCD_TITLE+'</h3></div>';	
						};
						var like=0;	
						for(var i=0;i<l_List.length;i++){
							if(l_List[i].scd_SQ==item.SCD_SQ){
								like=l_List[i].liked_SQ							
							} 
						}					
						html += '</a><div class="info_box"><div id="user_id_box" class="user_id_box"><img class="icon" src="./resources/img/icon/user_icon.png">'+item.USER_ID+'</div>';
						html += '<div id="like_box" class="like_box"><a href="javascript:insertLike('+item.SCD_SQ+')" onclick="false"><img class="icon" src="./resources/img/icon/like_icon.png">'+like+'</a></div></div>';
						html += '</div></li>';
				
			    	});
			    }else if (typeof (data.response.body.items.item.firstimage) == "undefined") {
			    	contentId=item.DTL_CONTENT_ID2;
			    	ReadApi(contentId);
			    	$.getJSON(url, function(data) {
			    	html += '<li>';
			    	html += '<div class="scd_box" id="scd_box">'
					html += '<a href="SC_12?scd_sq='+item.SCD_SQ+'">'; 
					html += '<img src='+data.response.body.items.item.firstimage+' width=300px height=200px>';
					if (typeof (item.SCD_DESC) !== "undefined") {
					html += '<div class="overlay"><h3>'+item.SCD_TITLE+'<br>'+item.SCD_DESC+'</h3></div>';	
					}else{
						html += '<div class="overlay"><h3>'+item.SCD_TITLE+'</h3></div>';	
					};
					var like=0;	
					for(var i=0;i<l_List.length;i++){
						if(l_List[i].scd_SQ==item.SCD_SQ){
							like=l_List[i].liked_SQ							
						} 
					}					
					html += '</a><div class="info_box"><div id="user_id_box" class="user_id_box"><img class="icon" src="./resources/img/icon/user_icon.png">'+item.USER_ID+'</div>';
					html += '<div id="like_box" class="like_box"><a href="javascript:insertLike('+item.SCD_SQ+')" onclick="false"><img class="icon" src="./resources/img/icon/like_icon.png">'+like+'</a></div></div>';
					html += '</div></li>'; 
			    });
			    	
			    }else{
			    	html += '<li>';
			    	html += '<div class="scd_box" id="scd_box">'
					html += '<a href="SC_12?scd_sq='+item.SCD_SQ+'">'; 
					html += '<img src="./resources/image/noimage.jpg" width=300px height=200px>';
					if (typeof (item.SCD_DESC) !== "undefined") {
					html += '<div class="overlay"><h3>'+item.SCD_TITLE+'<br>'+item.SCD_DESC+'</h3></div>';	
					}else{
						html += '<div class="overlay"><h3>'+item.SCD_TITLE+'</h3></div>';	
					};
					var like=0;	
					for(var i=0;i<l_List.length;i++){
						if(l_List[i].scd_SQ==item.SCD_SQ){
							like=l_List[i].liked_SQ							
						} 
					}					
					html += '</a><div class="info_box"><div id="user_id_box" class="user_id_box"><img class="icon" src="./resources/img/icon/user_icon.png">'+item.USER_ID+'</div>';
					html += '<div id="like_box" class="like_box"><a href="javascript:insertLike('+item.SCD_SQ+')" onclick="false"><img class="icon" src="./resources/img/icon/like_icon.png">'+like+'</a></div></div>';
					html += '</div></li>';				  
			    }			    
			});
			
			});			
			$("#all_scd_read").html(html);
			html2+='<div align="center">';
            var bigpageback=data.navi.currentPage - data.navi.pagePerGroup;
            console.log(bigpageback);
            html2+='<a href ="javascript:pagingFormSubmitF('+bigpageback +')">◀◀ </a>';
            var onepageback=data.navi.currentPage -1
            console.log(onepageback);
            html2+='<a href ="javascript:pagingFormSubmitF('+onepageback+')">◀ </a>';
            var j=0;
            for( var i = data.navi.startPageGroup ; i <= data.navi.endPageGroup ; i++){                   
               var counter=data.navi.startPageGroup+j;
               j=j+1;
               html2+='<a href="javascript:pagingFormSubmitF('+counter+')">'+i+' </a>';
                
            } 
            html2+='<a href="javascript:pagingFormSubmitF('+(data.navi.currentPage + 1)+')">▶ </a>';
            html2+='<a href="javascript:pagingFormSubmitF('+(data.navi.currentPage + data.navi.pagePerGroup)+')">▶▶</a></div>';
            html2+='<form action="filtering" method="get" id="pagingForm">';
            html2+='<input type="hidden" id="page" name="page">';                
            html2+='</form></div>';
            html2+='</div';
		    
         $("#paging").html(html2);
				
		},
		error : function(e){
			console.log(e);
		}
	}); 
} 

function insertLike(scd_sq) { 
         
        $.ajax({
          type : "POST",
          url : "insertLiked",
          data :{
        	  SCD_SQ : scd_sq 
          }, 
          success : function(data){
             console.log(data);
              if(data==1){
             	modal({
     				type: 'success',
     				title: '좋아요',
     				text: '선택한 일정에 좋아요!',
             	}); 
             }else{
          	   modal({
     				type: 'error',
     				title: '좋아요 취소',
     				text: '선택한 일정에 좋아요 해제!',
     			});
             }     
          },
          error : function(e){
             console.log(e);
          } 
       })
       read_SCD();
}
window.onload=function(){
	read_SCD();
}
</script> 
</html>