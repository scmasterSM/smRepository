<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
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
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<link rel="stylesheet" href="./resources/css/owl.carousel.css">
<link rel="stylesheet" href="./resources/css/owl.theme.css">
<link rel="stylesheet" href="./resources/css/owl.transitions.css">
<link rel="stylesheet" href="./resources/css/style.css">
<link rel="stylesheet" href="./resources/css/responsive.css">
<link rel="stylesheet" href="./resources/css/12css.css">
<script src="./resources/js/vendor/modernizr-2.6.2.min.js"></script>
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
						<a href="">복사하기</a>&emsp;&emsp;
						<a href="">수정하기</a>&emsp;&emsp;
						<a href="">다운로드</a>
						</div>
					</ul>

					<!-- Tab panes -->
					<div class="tab-content">
						<div role="tabpanel" class="tab-pane fade in active"
							id="job-seekers">
							<ul class="list-inline job-seeker">
									<div class="wrap page" data-id="2">
										<table class="sch_table" width="100%">
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
														<img src="/res/img/mypage/plan/sub/tr_city.png" alt="" />
														도시
														<div class="clear"></div>
													</div>
												</th>
												
												<th>
													<div>
														<img src="/res/img/mypage/plan/sub/tr_sch.png" alt="" />
														일정
														<div class="clear"></div>
													</div>
												</th>
												<th>
													<div>
														<img src="/res/img/mypage/plan/sub/tr_ht.png" alt="" />
														지도
														<div class="clear"></div>
													</div>
												</th>
											</tr>

											<tr class="white">
												<td>
													<div class="scht_date">
														5월 12일 <span>(월)</span>
													</div>
													<div class="scht_day">DAY 1</div>
												</td>
												<td class="scht_vtop">
													<div class="scht_city">두브로브니크</div>
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
													<div class="scht_spotname">
														<b>1.</b>마리나 베이 센즈
													</div>
													<div class="scht_spotname">
														<b>1.</b>마리나 베이 센즈
													</div>
													<div class="scht_spotname">
														<b>1.</b>마리나 베이 센즈
													</div>
													<div class="scht_spotname">
														<b>1.</b>마리나 베이 센즈
													</div>
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

										</table>
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





	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<script>window.jQuery || document.write('<script src="./resources/js/vendor/jquery-1.10.2.min.js"><\/script>')
	</script>
	<script src="./resources/js/bootstrap.min.js"></script>
	<script src="./resources/js/owl.carousel.min.js"></script>
	<script src="./resources/js/wow.js"></script>
	<script src="./resources/js/main.js"></script>
</body>
</html>