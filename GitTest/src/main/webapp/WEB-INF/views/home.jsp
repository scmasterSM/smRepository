<!DOCTYPE html>
<html class="no-js">
<head>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<title>Travle Maker</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

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

<script src="./resources/js/bootstrap.js"></script>
<script src="./resources/js/owl.carousel.min.js"></script>
<script src="./resources/js/wow.js"></script>
<script src="./resources/js/main.js"></script>


<script type="text/javascript">
	//관광API 키값 
	var key = "2pTN6y%2BhCGaVQL97quhdeM%2FW9ezdUvBNytbkKoT323qbc%2Ff5ao8fYoW2C31AgwacBVhy7PYHqvuwcnzprU4%2BNw%3D%3D";

	function padDigits(number) {
		if (number < 10) {
			return "0" + number;
		} else {
			return number;
		}
	}
	//오늘의 날짜 (변환전)
	var today = new Date();
	//이번달 마지막 날짜(변환 전)
	var dt = new Date();
	dt.setFullYear(dt.getFullYear(), dt.getMonth() + 1, 0);
	//console.log(today.getFullYear() + "" + padDigits((today.getMonth() + 1), 2) + padDigits(today.getDate()), 2);

	//오늘의 날짜 (변환 후) 
	var dt_today = today.getFullYear() + "" + padDigits((today.getMonth() + 1))
			+ padDigits(today.getDate());
	//이번달 마지막 날짜(변환후)
	var dt_last = today.getFullYear() + "" + padDigits((today.getMonth() + 1)) + padDigits(dt.getDate());

	//다음달 첫날 
	var next_dt = new Date();
	next_dt.setMonth(next_dt.getMonth() + 1);
	next_dt.setDate(1);
	
	//다음달 마지막 날
	var next_dt_l = new Date();
	next_dt_l.setFullYear(next_dt_l.getFullYear(), next_dt_l.getMonth() + 1, 0);
	
	var next_dt_start = next_dt.getFullYear()+ "" +  padDigits((next_dt.getMonth() + 1)) + padDigits(next_dt.getDate());
	var next_dt_last = next_dt.getFullYear() + "" + padDigits((next_dt.getMonth() + 1)) + padDigits(next_dt_l.getDate());
	
	function checkId() {
		$("#loginAtag").trigger("click");
		$('#myModal').modal('show');
	}

	$(function() {

		$("#joinForm").on("click", function() { /* 조인버튼 클릭시 모달   */
			$("#regAtag").trigger("click");
		})
		$("#loginForm").on("click", function() { /*로그인 버튼 클릭시 모달 */
			$("#loginAtag").trigger("click");
		})

		$("#this-recommend").on("click", function() { /*이번달 추천탭 */
			r_Data('this');
		})

		$("#next-recommend").on("click", function() { /*다음달 추천탭  */
			r_Data('next');
		})

		r_Data('this');
		initCitySearch();

		getPoppular_city();

		//로그인 
		$("#submit_button").on("click", function() {

			var user_id1 = $("#user_id").val();
			var password1 = $("#password").val();

			if (user_id1.length == 0) {
				alert('아이디를 입력해주세요');
				return false;
			}
			if (password1.length == 0) {
				alert('비밀번호를 입력해주세요');
				return false;
			}

			$.ajax({
				type : "post",
				url : "login",
				data : {
					user_id : user_id1,
					password : password1
				},
				dataType : 'text',

				success : function(data) {
					if (data == "success") {
						$('#myModal').modal('hide');
						window.location.href = "./";

					} else {
						alert("비밀번호가 맞지 않습니다.");
					}
				},
				error : function(e) {
					console(e);
				}
			})
		});

		//조인

		$("#submit_join").on("click", function() {

			var user_id2 = $("#user_id1").val();
			var password2 = $("#password1").val();
			var password3 = $("#password2").val();
			var email1 = $("#email").val();
			var user_sex1 = $("#user_sex").val();

			var sung = "선택";

			//alert(user_sex1);
			//$('#user_sex option:selected').val();
			//$('select[name=user_sex]').val();

			if (user_id2.length == 0) {
				alert('아이디를 입력해주세요');
				return false;
			}
			if (password2.length == 0) {
				alert('비밀번호를 입력해주세요');
				return false;
			}
			if (email1.length == 0) {
				alert('이메일을 입력해주세요');
				return false;
			}

			if (user_sex1 == sung) {
				alert('성별을 입력해주세요');
				return false;
			}

			if (password2 != password3) {
				alert('비밀번호 확인 시 비밀번호가 일치하지 않습니다.');
				return false;
			}

			$.ajax({
				type : "post",
				url : "join",
				data : {
					user_id : user_id2,
					password : password2,
					email : email1,
					user_sex : user_sex1
				},
				dataType : 'text',

				success : function(data) {
					console.log(data);
					if (data == "success") {
						alert("가입처리가 완료 되었습니다.");
						$('#myModal').modal('hide');
						window.location.href = "./";
					} else {
						alert("가입 처리가 되지 않았습니다.");
					}
				},
				error : function(e) {
					console(e);
				}
			})
		});

	});//레디펑션

	var sigungu = new Array;
	var city_names = new Array;
	var pop_cities = [ {
		"index" : 0,
		"areaCode" : 1,
		"sigunguCode" : "",
		"name" : '서울',
		"name_en" : "Seoul",
		"lat" : parseFloat(37.566535),
		"lng" : parseFloat(126.9779692),
		"is_state" : 0
	}, {
		"areaCode" : 6,
		"sigunguCode" : "",
		"name" : '부산',
		"name_en" : "Busan",
		"lat" : parseFloat(35.1795543),
		"lng" : parseFloat(129.0756416),
		"is_state" : 0
	}, {
		"areaCode" : 39,
		"sigunguCode" : "",
		"name" : '제주도',
		"name_en" : "Jeju",
		"lat" : parseFloat(33.4890113),
		"lng" : parseFloat(126.4983023),
		"is_state" : 0
	}, {
		"areaCode" : 2,
		"sigunguCode" : "",
		"name" : '인천',
		"name_en" : "Incheon",
		"lat" : parseFloat(37.4562557),
		"lng" : parseFloat(126.7052062),
		"is_state" : 0
	}, {
		"areaCode" : 3,
		"sigunguCode" : "",
		"name" : '대전',
		"name_en" : "Daejeon",
		"lat" : parseFloat(36.3504119),
		"lng" : parseFloat(127.3845475),
		"is_state" : 0
	}, {
		"areaCode" : 4,
		"sigunguCode" : "",
		"name" : '대구',
		"name_en" : "Daegu",
		"lat" : parseFloat(35.8714354),
		"lng" : parseFloat(128.601445),
		"is_state" : 0
	}, {
		"areaCode" : 5,
		"sigunguCode" : "",
		"name" : '광주',
		"name_en" : "Gwangju",
		"lat" : parseFloat(35.1595454),
		"lng" : parseFloat(126.8526012),
		"is_state" : 0
	}, {
		"areaCode" : 7,
		"sigunguCode" : "",
		"name" : '울산',
		"name_en" : "Ulsan",
		"lat" : parseFloat(35.5383773),
		"lng" : parseFloat(129.3113596),
		"is_state" : 0
	}, {
		"areaCode" : 8,
		"sigunguCode" : "",
		"name" : '세종시',
		"name_en" : "Sejong",
		"lat" : parseFloat(36.4800984),
		"lng" : parseFloat(127.2890354),
		"is_state" : 0
	}, {
		"areaCode" : 31,
		"sigunguCode" : "",
		"name" : '경기도',
		"name_en" : "Gyeonggi-do",
		"lat" : parseFloat(37.41379999999999),
		"lng" : parseFloat(127.5183),
		"is_state" : 1
	}, {
		"areaCode" : 32,
		"sigunguCode" : "",
		"name" : '강원도',
		"name_en" : "Gangwon-do",
		"lat" : parseFloat(37.8228),
		"lng" : parseFloat(128.1555),
		"is_state" : 1
	}, {
		"areaCode" : 33,
		"sigunguCode" : "",
		"name" : '충청북도',
		"name_en" : "Chungcheongbuk-do",
		"lat" : parseFloat(36.8),
		"lng" : parseFloat(127.7),
		"is_state" : 1
	}, {
		"areaCode" : 34,
		"sigunguCode" : "",
		"name" : '충청남도',
		"name_en" : "Chungcheongnam-do",
		"lat" : parseFloat(36.5184),
		"lng" : parseFloat(126.8),
		"is_state" : 1
	}, {
		"areaCode" : 35,
		"sigunguCode" : "",
		"name" : '경상북도',
		"name_en" : "Gyeongsangbuk-do",
		"lat" : parseFloat(36.4919),
		"lng" : parseFloat(128.8889),
		"is_state" : 1
	}, {
		"areaCode" : 36,
		"sigunguCode" : "",
		"name" : '경상남도',
		"name_en" : "Gyeongsangnam-do",
		"lat" : parseFloat(35.4606),
		"lng" : parseFloat(128.2132),
		"is_state" : 1
	}, {
		"areaCode" : 37,
		"sigunguCode" : "",
		"name" : '전라북도',
		"name_en" : "Jeollabuk",
		"lat" : parseFloat(35.71750000000001),
		"lng" : parseFloat(127.153),
		"is_state" : 1
	}, {
		"areaCode" : 38,
		"sigunguCode" : "",
		"name" : '전라남도',
		"name_en" : "Jeollanam-do",
		"lat" : parseFloat(34.8679),
		"lng" : parseFloat(126.991),
		"is_state" : 1
	} ];

	function getSigungu(areaCode) {
		var key = "2pTN6y%2BhCGaVQL97quhdeM%2FW9ezdUvBNytbkKoT323qbc%2Ff5ao8fYoW2C31AgwacBVhy7PYHqvuwcnzprU4%2BNw%3D%3D";
		var sigunguCode;
		var url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaCode?ServiceKey="
				+ key
				+ "&areaCode="
				+ areaCode
				+ "&numOfRows=100&MobileOS=ETC&MobileApp=AppTesting&_type=json";
		$
				.ajax({
					type : "GET",
					url : url,
					success : function(result) {
						$
								.each(
										result.response.body.items.item,
										function(index, val) {
											gUrl = "https://maps.googleapis.com/maps/api/geocode/json?"
													+ "address="
													+ encodeURI(val.name)
													+ "+Korea&key=AIzaSyCgFBh9I4EcWgRNl5dRa93votTaRs_eE0A";
											$
													.ajax({
														type : "GET",
														url : gUrl,
														success : function(data) {
															var location = data.results[0].geometry.location;
															sigungu
																	.push({
																		"areaCode" : areaCode,
																		"sigunguCode" : val.code,
																		"name" : val.name,
																		"name_en" : "",
																		"lat" : location.lat,
																		"lng" : location.lng,
																		"is_state" : 0
																	});
															city_names
																	.push(val.name);
														},
														error : function(e) {
															console.log(e);
														}
													});//ajax
										});//each
					},
					error : function(e) {
						console.log(e);
					}
				});//ajax
	}

	function initCitySearch() {
		var html = '';
		$
				.each(
						pop_cities,
						function(index, val) {
							html += '<div class="item" data="'+ val.areaCode +'" data-ci_name="'+ val.name +'" data-lat="'+ val.lat +'" data-lng="' + val.lng + '" data-is_state="'+ val.is_state +'">';
							html += '<div class="img_box fl"><img src="./resources/img/city/'+val.areaCode+'.jpg"></div>';
							html += '<div class="info_box fl"><div class="info_title">'
									+ val.name
									+ '</div><div class="info_sub_title">'
									+ val.name_en + '</div></div>';
							html += '<div class="clear"></div></div>';
							if (sigungu.length < 100) {
								if (val.is_state == 0) {
									sigungu.push(val);
									city_names.push(val.name);
								} else {
									getSigungu(val.areaCode);
								}
							}
						});
		$('#searchTextField').autocomplete(
				{
					source : city_names,
					select : function(event, selected) {
						$.each(sigungu, function(index, val) {
							if (val.name == selected.item.value)
								location.href = "sc_05?areacode='"
										+ val.areaCode + "'&sigungucode='"
										+ val.sigunguCode + "'&city_nm="
										+ val.name + "";
						});
					}
				});
	}

	function city_search() {
		var input = $('#searchTextField').val();
		$.each(sigungu, function(index, val) {
			if (val.name == input)
				location.href = "sc_05?areacode='" + val.areaCode
						+ "'&sigungucode='" + val.sigunguCode + "'&city_nm="
						+ val.name + "";
		});
		return false;
	}

	//로그인& 조인 모달 
	$('#myModal').modal('show');
	//정보수정 모달
	$('#myModal_Edit').modal('show');

	//로그아웃 버튼 클릭시 처리 함수 
	function logout() {
		location.href = "logout";
	}

	//DB에서 불러온 인기도시
	function getPoppular_city() {
		areaCode = "";
		var key = "mAI%2FYXQZ6r2tOuKRb5BjfkHXavB%2BYidXtnLge18Ft%2Fzx2OvvU2Eq7za7nmbfumFdLtG7IOLQSoDYF2pAcMd3aw%3D%3D";
		var sigunguCode;
		var content2 = '';
		$
				.ajax({
					type : "GET",
					url : "bestcity",
					success : function(result) {
						//console.log(result);
						content2 += '<ul class="list-inline job-seeker">';
						$
								.each(
										result,
										function(index, val) {
											if (val.sigungu_code == null) {
												content2 += '<li><a href="sc_05?areacode='
														+ val.area_code
														+ '&sigungucode=%27%27&city_nm='
														+ val.city_nm
														+ '"> <img src="'+val.pic_address+'" alt="" width="300" height="200">';
											} else {
												content2 += '<li><a href="sc_05?areacode='
														+ val.area_code
														+ '&sigungucode='
														+ val.sigungu_code
														+ '&city_nm='
														+ val.city_nm
														+ '"> <img src="'+val.pic_address+'" alt="" width="300" height="200">';
											}
											content2 += '<div class="overlay">';
											content2 += '<h3>' + val.city_nm
													+ '</h3>';
											content2 += '<p>플랜 ' + val.city_cnt
													+ '개가 기록된 인기 도시</p>';

										}); //each 
						content2 += '</div></a></li></ul>';
						$("#tabtab").html(content2);
					},
					error : function(e) {
						console.log(e);
					}
				});//ajax
	}

	//행사 정보를 가져오는 메소드 
	function r_Data(month) {
		var url = ""
		url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchFestival?ServiceKey="
				+ key;
		if (month == 'next') {
			/* url2 ="&contentTypeId=15&areaCode=&sigunguCode=&cat1=&cat2=&cat3"; */
			url += "&eventStartDate="+next_dt_start+"&eventEndDate="+next_dt_last+"&arrange=A&listYN=Y&pageNo=1&numOfRows=50&MobileOS=ETC&MobileApp=AppTesting&_type=json";
		} else {
			url += "&eventStartDate="
					+ dt_today
					+ "&eventEndDate="+dt_last+"&arrange=A&listYN=Y&pageNo=1&numOfRows=199&MobileOS=ETC&MobileApp=AppTesting&_type=json";
		}

		$
				.getJSON(
						url,
						function(data) {
							var content = "";
							var length = data.response.body.items.item.length;
							//console.log('success', data);

							content += '<ul class="list-inline job-seeker">';

							//console.log(data.response.body.items.item.length);
							var outputArray = [];
							for (var i = 0; i < 6; i++) {
								var val = Math.floor(Math.random() * length);
								var repeat = false;
								var j = 0;
								for (j = 0; j < outputArray.length; j++) {
									if (outputArray[j] == data.response.body.items.item[val].title) {
										repeat = true;
										break;
									}
								}
								if (repeat) {
									i--;
									continue;
								} else {
									outputArray[j] = data.response.body.items.item[val].title;
								}

								var con = data.response.body.items.item[val].contentid;

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
							} //outer for
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
									<li><img src="./resources/image/login_img.png">
										${sessionScope.user_id }</li>
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
																		<select class="form-control" id="user_sex_ed">
																			<option value="m">남성</option>
																			<option value="f">여성</option>
																		</select>
																	</div>
																	<div class="col-md-9">
																		<input type="text" class="form-control"
																			id="user_id_ed" name="user_id_ed" placeholder="ID" />
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
																	id="password_ed" placeholder="Password" />
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
						<form action="" class=" form-inline"
							onsubmit="return city_search();">
							<div class="form-group">
								<input type="text" class="form-control" id="searchTextField"
									placeholder="도시명으로 검색">
							</div>
							<input type="submit" class="btn" value="Search"><br>

							<div id="searchformap">
								<a href="mapSearch"><button type="button"
										class="btn btn-default btn-xs">지도에서 검색</button></a>
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
						<p>
							나만의 여행 일정을 짜보거나<br> 다른 사람들의 일정도 확인 해보세요
						</p>
					</div>
				</div>
				<div class="col-md-4">
					<div class="single-work wow fadeInUp" data-wow-delay="1s">
						<img src="./resources/img/how-work3.png" alt="">
						<h3>일정 공유</h3>
						<p>
							내 일정을 공유하여 실시간으로 <br>친구와 함께 계획을 세워보세요
						</p>

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
							aria-controls="home" role="tab" data-toggle="tab">인기 도시 </a></li>
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
						<li role="presentation" class="active"><a id='this-recommend'
							aria-controls="home" role="tab" data-toggle="tab"
							style="cursor: pointer">이번 달 추천 행사 </a></li>
						<li role="presentation"><a id='next-recommend'
							aria-controls="profile" role="tab" data-toggle="tab"
							style="cursor: pointer">다음 달 추천 행사 </a></li>
					</ul>
					<!-- Tab panes -->
					<div class="tab-content">
						<div role="tabpanel" class="tab-pane fade in active"
							id="job-seekers"></div>
						<div role="tabpanel" class="tab-pane fade" id="employeers">

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
								<p>낮에는 아름다운 기와와 단청, 궁궐의 고즈넉한 모습이 아름답습니다. 데이트를 하는 연인과 외국인
									관광객이 많으며 한복을 입으면 입장료가 무료입니다. 주변에 한복을 대여하는 곳이 있으니 이용해보세요. 뒤에 높은
									건물이 없어 파란 하늘과 어우러진 아름다운 기와를 볼 수도 있습니다. 밤에 바라보는 경회루는 낭만적이니 밤에도 꼭
									보길 바랍니다.</p>
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
								<p>제주의 자연을 가장 잘 느낄수 있는 장소라고 생각합니다. 바다가 보이는 풍경이나 해변가도 좋고 버스
									투어를 하거나 스쿠터, 도보 등으로 즐기기에도 부담없는 여행지입니다. 우도로 가는 접근성도 나쁘지 않고 주변의
									성산일출봉이나 섭지코지를 함께 볼수있어 개인적으로 가장 선호하는 코스입니다.</p>
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
								<p>비내리는 날이라 산책하기 좋진 않았지만 신선한 공기와 대나무의 초록이 어울려 운치있는 하루였습니다.
									날씨만 좋았다면 정말 좋았을텐데. 입장료가 있지만 이번달엔 안에 있는 전시장 무료입장이 가능해서 좋았습니다.</p>
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
								<p>오래전 추억을 떠올릴수 있는 장소 입니다.도심에서 조금만 벗어나면 높은곳에 위치한 아주 오래된듯한
									마을이 나타납니다.겉으로 보는모습과는 다르게 마을안으로 들어서면 아기자기하고 이쁜 벽화와 조형물을 만날수있습니다.
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
			<br>
			<br>

			<div class="row footer-copy">
				<!-- 		<p>
					<span id="span1">(C) webstie, All rights reserved</span>
					
				</p> -->
			</div>
		</div>
	</div>

</body>
</html>
