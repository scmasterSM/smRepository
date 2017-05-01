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
        <title>상세 일정 화면</title>
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
html, body {
	overflow-x: hidden;
}
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
	<!-- /.container-fluid --> </nav>

	<!-- <section class="jumbotron text-center" style="background:url(./resources/image/otherpage/111.png);">
	 <img src="./resources/image/otherpage/111.png" > 
      <div class="container">
      <br><br>
         <h1 class="jumbotron-heading">My schedule</h1>
        <p class="lead text-muted">일정 상세 보기</p>
        <p>
          <a href="#" class="btn btn-primary">Main call to action</a>
          <a href="#" class="btn btn-secondary">Secondary action</a>
        </p> 
      </div>
    </section>  -->


	<style type="text/css">
	 @import url(http://fonts.googleapis.com/earlyaccess/hanna.css);
.section-30 {
	background-image: url(./resources/image/otherpage/myPage-temp5.png);
	background-repeat: repeat-y;
	background-size: 100%;
}
h1 {
	font-family: 'Hanna', serif;
	color : gray;
	font-size: -webkit-xxx-large;
}

</style>
	<section
		class="section-30 section-sm-40 section-md-66 section-lg-bottom-90 bg-gray-dark page-title-wrap">
	<div class="shell">
		<div class="page-title" style="height: 400px;">
			<div class="container" style="margin: auto; margin-top: 85px;">
				<h1>My Itinerary</h1>
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
                  <li role="presentation" class="active"><a href="#job-seekers"
                     aria-controls="home" role="tab" data-toggle="tab">일정표</a></li>
                  <li role="presentation"><a href="#employeers"
                     aria-controls="profile" role="tab" data-toggle="tab">댓글</a></li>
                  <div class="plan-menu">
                  <c:set var="check" value="0"/>
                  <c:forEach var="shared" items="${sharedList }">
                  		<c:if test="${sessionScope.user_id == shared.USER_ID}">
							<c:set var="check" value="1"/>
						</c:if>
                  </c:forEach>
                  <c:if test="${sessionScope.user_id == schedule.user_id}">
					   <c:set var="check" value="1"/>
				  </c:if>
	                  <c:choose>
	                  	<c:when test="${check == 1}">
	                  		<a data-toggle="modal" href="#myModal_share">공유하기</a>&emsp;&emsp;
			                <a href="javascript:copy_schedule(${scd_sq });">복사하기</a>&emsp;&emsp;
			                <a data-toggle="modal" href="#myModal_edit">수정하기</a>&emsp;&emsp;
			                <a href="javascript:delete_schedule(${scd_sq });">삭제하기</a>
	                  	</c:when>
	                  	<c:otherwise>
	                  		<a href="javascript:copy_schedule(${scd_sq });">복사하기</a>&emsp;&emsp;
					  		<a href="javascript:insertLike();">좋아요</a>&emsp;&emsp;	
	                  	</c:otherwise>
	                  </c:choose>
<%--                   <a href="edit_schedule?scd_sq=${scd_sq }">수정하기</a>&emsp;&emsp; --%>                  
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
                   <div class="well">
                    <h4>일정댓글</h4>
                    <form role="form">
                        <div class="form-group">
                            <textarea class="form-control" id="reviewWrite" rows="3"></textarea>
                        </div>
                        <a href="#" onclick="return false" class="btn btn-primary" id="write">등록</a> 
                       <!--  <button type="submit" class="btn btn-primary">Submit</button> -->
                    </form>
                </div>

                <hr>
                   
                   <div id="review">
                   	댓글 페이지
                   	</div>
                   	<div id="paging">
                   	</div>
                  </div>
               </div>

            </div>
         </div>
      </div>
      <!-- <hr> -->
   </div>
  <!-- footer -->
	<div class="footer-area" style="border-top: 1px solid #00AEEF;">
		<div class="container" style="padding-bottom : 0px">
			<div class="row footer-copy">
				<p style="margin: 0 0 0px;">
					<span id="span1" style="color : gray;">Copyright &copy; NikoNikoNi 2017</span>
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
        <script src="./resources/js/bootstrap.js"></script>
		<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    	<script type="text/javascript" src="./resources/js/jquery-ui.min.js"></script>
        <script src="./resources/js/owl.carousel.min.js"></script>
        <script src="./resources/js/wow.js"></script>
        <script src="./resources/js/main.js"></script>
         <!--Stylesheets-->
		<link href="./resources/css/jquery.modal.css" type="text/css" rel="stylesheet" />
	
		<!--jQuery-->
		<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script type="text/javascript" src="./resources/js/jquery.modal.js"></script>
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
                   day_cnt= index;
                  /* var contentId=item.DTL_CONTENT_ID;
                  console.log(contentId);
                  var sigungucode;
                  ReadApi(contentId); */
                  
                  var d = new Date(item.DAILY_YMD);
     			  var weekday = [' (일)',' (월)',' (화)',' (수)',' (목)',' (금)',' (토)'];
     			  var day = weekday[d.getDay()]; 
                  
                  html += '<tr class="white">';
                  html += '<td><div class="scht_date">'+ item.DAILY_YMD + day +'</div>';
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
	
	//정보수정
	
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
	
	
	
	
	
	
	
})

//로그아웃 버튼 클릭시 처리 함수 
	function logout() {
		location.href = "logout";
	}

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
    $.ajax({
        type : "post",
        url : "addShareAuthority",
        data : {
			  scd_sq : '${scd_sq}',
			  searchId : checkId
    	},
        success : function(inform){
           alert(inform);
           //모달 꺼야함
        },
        error : function(e){
           console.log(e);
        }
    });//ajax

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
 
 function delete_schedule(scd_sq){
	 var del = confirm("정말 삭제하시겠습니까?");
	 if(del){
		 $.ajax({
			type : "post",
			url : "delete_to_home",
			data : { 
				scd_sq: scd_sq
			}
			,success : function(data){
				alert("일정이 삭제되었습니다!");
				location.href="SC_10";
			},
			error : function(e){
				console.log(e);
			} 
		 });//ajax
	 }
 }
 
 function edit_form(){
	 var scd_sq = parseInt($('#scd_sq').val());
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
	 var day_cnt = $('.scht_day').length;
	 
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
	 			,day_cnt: day_cnt
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
 function insertLike() { 
     var scd_sq=${scd_sq}
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
}
///////////////////////////////////댓글 페이징 구역///////////////////////////////////

//////페이징///////////
 function pagingFormSubmit(currentPage) { //currentPage가 어디서 호출되어 온다
	   var form=document.getElementById("pagingForm");
	   var page=document.getElementById("page"); 
	   page.value=currentPage;  
	   paging(page.value);
	}
 	var scd_sq=${scd_sq}
	var check = 0;
	var inner = null;
	var updatenum = 0;
	
	
//////리플 수정//////////////////////////////////////////////
	function replyUpdateForm(REPLY_SQ, SCD_SQ){
	   
	   if(check == 1 && REPLY_SQ == updatenum){
	      document.getElementById(REPLY_SQ).innerHTML = inner;
	      check=0;
	      return;
	   }
	   
	   if(updatenum != REPLY_SQ && updatenum != ''){
	      document.getElementById(updatenum).innerHTML = inner;
	   }
	   
	   
	   updatenum = REPLY_SQ;
	   console.log(REPLY_SQ);
	   inner = document.getElementById(REPLY_SQ).innerHTML;
	   console.log(inner);
	   
	   document.getElementById(REPLY_SQ).innerHTML = 
		   "<textarea class='form-control' name='text' id='reply' rows='3'>"+inner+"</textarea>"
	      +"<a href='#' class='btn btn-primary' onclick='replyUpdate("+REPLY_SQ+","+SCD_SQ+"); return false'>수정</a>";
	        
	      
	      
	   check = 1;
	}
/////////////////////리플 읽어오기	//////////////////////////
var login_id=${sessionScope.user_id};
	$(function(){	
		 
		console.log(scd_sq);
		
		$.ajax({
		    
		    type : "post",
		    url : "read_reply",
		    data :{
		    	SCD_SQ : scd_sq          
		    },
		    
		    success : function(data){
		       
		       console.log(data);
		        var html ="";
		        var html2 ="";
		        $.each(data.rList,function(index,item){
		          console.log(item);
		        
		          html+= "<div class='media'>";
		          html+= "<a class='pull-left' href='#'>";
		          if(item.USER_SEX=='M'){
		          html+= '<img class="media-object" src="./resources/img/icon/manicon.png" width=64 height=64 alt=""></a>';		        	  
		          }else if(item.USER_SEX=='F'){
		          html+= '<img class="media-object" src="./resources/img/icon/womanicon.png" width=64 height=64 alt=""></a>';
		          }
		          html+= '<div class="media-body">';
		          html+= '<div class="media-heading"><h4>'+item.USER_ID;
		          html+= '<small>'+item.UPD_YMD;
		          if(login_id == item.USER_ID){
		  		  html+= '<a href="javascript:replyUpdateForm('+item.REPLY_SQ+','+item.SCD_SQ+')" onclick="false"> 수정 </a>';
		          html+= '<a href="#none" onclick="deleteReply('+item.REPLY_SQ+','+item.SCD_SQ+')"> 삭제 </a>';
		          }
		          html+= '</small></h4></div>';
		          html+= '<pre>';
		          html+= "<div id='"+item.REPLY_SQ+"'class='review_txt'>"+item.REPLY_TXT+"</div>"; 
						html+= "</pre></div></div>";
		        });
		          html2+='<div align="center">';
		          var bigpageback=data.navi.currentPage - data.navi.pagePerGroup;
		          html2+='<a href ="javascript:pagingFormSubmit('+bigpageback +')">◀◀ </a>';
		          var onepageback=data.navi.currentPage -1
		          html2+='<a href ="javascript:pagingFormSubmit('+onepageback+')">◀ </a>';
		          var j=0;
		          console.log(data.navi.endPageGroup);
		          for( var i = data.navi.startPageGroup ; i <= data.navi.endPageGroup ; i++){
		        	  var counter=data.navi.startPageGroup+j;
		        	  j=j+1;
		              html2+='<a href="javascript:pagingFormSubmit('+counter+')">'+i+' </a>'; 
		          } 
		          html2+='<a href="javascript:pagingFormSubmit('+(data.navi.currentPage + 1)+')">▶ </a>';
		          html2+='<a href="javascript:pagingFormSubmit('+(data.navi.currentPage + data.navi.pagePerGroup)+')">▶▶</a></div>';
		          html2+='<form action="read_reply" method="post" id="pagingForm">';
		          html2+='<input type="hidden" id="page" name="page">';		          
		          html2+='</form></div>'; 
		        
		        $("#review").html(html);
		        $("#paging").html(html2);
		        $('#reviewWrite').val(''); 
		    },
		    error : function(e){
		       console.log(e);
		    }   
		 });
		});	
	
	
 
 //리플달기
 $(function(){
     $("#write").on("click",function(){ 

        $.getJSON(url, function(data) {
        console.log(data.response.body.items.item)
        var REPLY_TXT = $("#reviewWrite").val();
        var SCD_SQ = ${scd_sq};
        
        if(REPLY_TXT.length ==0 || SCD_SQ.length ==0) {
           alert("데이터를 입력해 주세요");
           return;
        } 
      
     
        $.ajax({
           
           type : "post",
           url : "writeReply",
           data :{
        	   SCD_SQ : SCD_SQ
              ,REPLY_TXT : REPLY_TXT   
           },
           
           success : function(data){
              
              console.log(data);
              var html ="";
               var html2 ="";
               $.each(data.rList,function(index,item){
                 console.log(item); 
                 html+= "<div class='media'>";
                 html+= "<a class='pull-left' href='#'>";
                 if(item.USER_SEX=='M'){
   		          html+= '<img class="media-object" src="./resources/img/icon/manicon.png" width=64 height=64 alt=""></a>';		        	  
   		          }else if(item.USER_SEX=='F'){
   		          html+= '<img class="media-object" src="./resources/img/icon/womanicon.png" width=64 height=64 alt=""></a>';
   		          }
                 html+= '<div class="media-body">';
                 html+= '<div class="media-heading"><h4>'+item.USER_ID;
                 html+= '<small>'+item.UPD_YMD;
                 if(login_id == item.USER_ID){ 		
             		  html+= '<a href="javascript:replyUpdateForm('+item.REPLY_SQ+','+item.SCD_SQ+')"> 수정 </a>';
                     html+= '<a href="#none" onclick="deleteReply('+item.REPLY_SQ+','+item.SCD_SQ+')"> 삭제 </a>';
                     }
                 html+= '</small></h4></div>';
                 html+= '<pre>';
                 html+= "<div id='"+item.REPLY_SQ+"'class='review_txt'>"+item.REPLY_TXT+"</div>"; 
     				html+= "</pre></div></div>";
               })
                 html2+='<div align="center">';
                 var bigpageback=data.navi.currentPage - data.navi.pagePerGroup;
                 html2+='<a href ="javascript:pagingFormSubmit('+bigpageback +')">◀◀ </a>';
                 var onepageback=data.navi.currentPage -1
                 html2+='<a href ="javascript:pagingFormSubmit('+onepageback+')">◀ </a>';
                 var j=0;
                 for( var i = data.navi.startPageGroup ; i <= data.navi.endPageGroup ; i++){
               	  var counter=data.navi.startPageGroup+j;
                     j=j+1;
                     html2+='<a href="javascript:pagingFormSubmit('+counter+')">'+i+' </a>'; 
                 } 
                 html2+='<a href="javascript:pagingFormSubmit('+(data.navi.currentPage + 1)+')">▶ </a>';
                 html2+='<a href="javascript:pagingFormSubmit('+(data.navi.currentPage + data.navi.pagePerGroup)+')">▶▶</a></div>';
                 html2+='<form action="read_reply" method="post" id="pagingForm">';
                 html2+='<input type="hidden" id="page" name="page">';                
                 html2+='</form></div>'; 
               
               $("#review").html(html);
               $("#paging").html(html2);
               $('#reviewWrite').val(''); 
           },
           error : function(e){
              console.log(e);
           }   
        });
        });
     });
     
  });
 
 

///////////리플 업데이트//////////////////
	function replyUpdate(REPLY_SQ, SCD_SQ){
	   
	   text = $("#reply").val();
	   console.log(text);
	   $.ajax({
	      
	      type : "post",
	      url : "updateReply",
	      data : {
	    	  REPLY_TXT : text,
	    	 REPLY_SQ : REPLY_SQ,
	    	 SCD_SQ : SCD_SQ
	      },
	      success : function(data){
	         
	         console.log(data);
	          var html ="";
	         
	          $.each(data,function(index,item){
	             console.log(item);
	             
	            html+= "<div class='media'>";
	            html+= "<a class='pull-left' href='#'>";
	            if(item.USER_SEX=='M'){
	   		          html+= '<img class="media-object" src="./resources/img/icon/manicon.png" width=64 height=64 alt=""></a>';		        	  
	   		          }else if(item.USER_SEX=='F'){
	   		          html+= '<img class="media-object" src="./resources/img/icon/womanicon.png" width=64 height=64 alt=""></a>';
	   		          }
	            html+= "<div class='media-body'>";
	            html+= "<div class='media-heading'><h4>"+item.USER_ID;
	            html+= "<small>"+item.UPD_YMD;
	            if(login_id == item.USER_ID){ 		
	        		html+= '<a href="javascript:replyUpdateForm('+item.REPLY_SQ+','+item.SCD_SQ+')"> 수정 </a>';
	                html+= '<a href="#none" onclick="deleteReply('+item.REPLY_SQ+','+item.SCD_SQ+')"> 삭제 </a>';
	                }
	            html+= "</small></h4></div>";
	            html+= "<pre>";
	            html+= "<div id='"+item.REPLY_SQ+"'class='review_txt'>"+item.REPLY_TXT+"</div>"; 
				html+= "</pre></div></div>"; 
	          }) 
	          $("#review").html(html);
	          
	          
	              
	      },
	      error : function(e){
	         console.log(e);
	         }
	   })   
	   
	   check=0;
	   updatenum = 0;
	}
//////////////////리플 삭제////////////////
	function deleteReply(REPLY_SQ, SCD_SQ){
		
		$.ajax({
			
			type : "post",
			url : "deleteReply",
			data : {
				REPLY_SQ : REPLY_SQ,
				SCD_SQ : SCD_SQ
			},
			success : function(data){
				console.log(data);
				var html ="";
				var html2 ="";
					$.each(data.rList, function(index,item){
						   
		                  html+= "<div class='media'>";
		                  html+= "<a class='pull-left' href='#'>";
		                  if(item.USER_SEX=='M'){
		       		          html+= '<img class="media-object" src="./resources/img/icon/manicon.png" width=64 height=64 alt=""></a>';		        	  
		       		          }else if(item.USER_SEX=='F'){
		       		          html+= '<img class="media-object" src="./resources/img/icon/womanicon.png" width=64 height=64 alt=""></a>';
		       		          }
		                  html+= '<div class="media-body">';
		                  html+= '<div class="media-heading"><h4>'+item.USER_ID;
		                  html+= '<small>'+item.UPD_YMD; 
		                  if(login_id == item.USER_ID){ 		
		              		  html+= '<a href="javascript:replyUpdateForm('+item.REPLY_SQ+','+item.SCD_SQ+')"> 수정 </a>';
		                      html+= '<a href="#none" onclick="deleteReply('+item.REPLY_SQ+','+item.SCD_SQ+')"> 삭제 </a>';
		                      }
		                  html+= "</small></h4></div>";
		                  html+= "<pre>";
		                  html+= "<div id='"+item.REPLY_SQ+"'class='review_txt'>"+item.REPLY_TXT+"</div>"; 
		      			  html+= "</pre></div></div>";
		                })
		                  html2+='<div align="center">';
		                  var bigpageback=data.navi.currentPage - data.navi.pagePerGroup;
		                  html2+='<a href ="javascript:pagingFormSubmit('+bigpageback +')">◀◀ </a>';
		                  var onepageback=data.navi.currentPage -1
		                  html2+='<a href ="javascript:pagingFormSubmit('+onepageback+')">◀ </a>';
		                  var j=0;
		                  for( var i = data.navi.startPageGroup ; i <= data.navi.endPageGroup ; i++){
		                	  var counter=data.navi.startPageGroup+j;
		                      j=j+1;
		                      html2+='<a href="javascript:pagingFormSubmit('+counter+')">'+i+' </a>'; 
		                  } 
		                  html2+='<a href="javascript:pagingFormSubmit('+(data.navi.currentPage + 1)+')">▶ </a>';
		                  html2+='<a href="javascript:pagingFormSubmit('+(data.navi.currentPage + data.navi.pagePerGroup)+')">▶▶</a></div>';
		                  html2+='<form action="read_reply" method="post" id="pagingForm">';
		                  html2+='<input type="hidden" id="page" name="page">';		                  
		                  html2+='</form></div>'; 
		                
		                $("#review").html(html);
		                $("#paging").html(html2);

				$("#replytable").html(html);
			},
			error : function(e){
				console.log(e);
			}
		})
			
	}
	
	
////////////페이징 ajax 처리////////////////////////	
	function paging(page) { 
	console.log(page);
		$.ajax({ 
	        type : "post",
	        url : "read_reply",
	        data :{
	        	SCD_SQ : scd_sq,
	           page : page
	        },
	        
	        success : function(data){
	           
	           console.log(data);
	            var html ="";
	            var html2 ="";
	            $.each(data.rList,function(index,item){
	              console.log(item); 
	              html+= "<div class='media'>";
	              html+= "<a class='pull-left' href='#'>";
	              if(item.USER_SEX=='M'){
	   		          html+= '<img class="media-object" src="./resources/img/icon/manicon.png" width=64 height=64 alt=""></a>';		        	  
	   		          }else if(item.USER_SEX=='F'){
	   		          html+= '<img class="media-object" src="./resources/img/icon/womanicon.png" width=64 height=64 alt=""></a>';
	   		          }
	              html+= '<div class="media-body">';
	              html+= '<div class="media-heading"><h4>'+item.USER_ID;
	              html+= '<small>'+item.UPD_YMD;
	              if(login_id == item.USER_ID){ 		
	          		  html+= '<a href="javascript:replyUpdateForm('+item.REPLY_SQ+','+item.SCD_SQ+')"> 수정 </a>';
	                  html+= '<a href="#none" onclick="deleteReply('+item.REPLY_SQ+','+item.SCD_SQ+')"> 삭제 </a>';
	                  }
	              html+= '</small></h4></div>';
	              html+= '<pre>';
	              html+= "<div id='"+item.REPLY_SQ+"'class='review_txt'>"+item.REPLY_TXT+"</div>"; 
	  				html+= "</pre></div></div>";
	            })
	              html2+='<div align="center">';
	              var bigpageback=data.navi.currentPage - data.navi.pagePerGroup;
	              html2+='<a href ="javascript:pagingFormSubmit('+bigpageback +')">◀◀ </a>';
	              var onepageback=data.navi.currentPage -1
	              html2+='<a href ="javascript:pagingFormSubmit('+onepageback+')">◀ </a>';
	              var j=0;
	              for( var i = data.navi.startPageGroup ; i <= data.navi.endPageGroup ; i++){
	            	  var counter=data.navi.startPageGroup+j;
	                  j=j+1;
	                  html2+='<a href="javascript:pagingFormSubmit('+counter+')">'+i+' </a>'; 
	              } 
	              html2+='<a href="javascript:pagingFormSubmit('+(data.navi.currentPage + 1)+')">▶ </a>';
	              html2+='<a href="javascript:pagingFormSubmit('+(data.navi.currentPage + data.navi.pagePerGroup)+')">▶▶</a></div>';
	              html2+='<form action="read_reply" method="post" id="pagingForm">';
	              html2+='<input type="hidden" id="page" name="page">';	              
	              html2+='</form></div>'; 
	            
	            $("#review").html(html);
	            $("#paging").html(html2);
	            $('#reviewWrite').val('');      
	        },
	        error : function(e){
	           console.log(e);
	        }   
	     });
	};	
</script>

</html>