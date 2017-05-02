<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="no-js">
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%@include file="joinForm.jsp"%> --%>

<title>SC_05화면</title>
<meta name="description" content="company is a free job board template">
<meta name="author" content="Ohidul">
<meta name="keyword" content="html, css, bootstrap, job-board">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800'
	rel='stylesheet' type='text/css'>

<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
<!-- <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
<link rel="icon" href="favicon.ico" type="image/x-icon"> -->

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
	<script src="./resources/js/vendor/jquery-1.10.2.min.js"></script>
	<script src="./resources/js/bootstrap.js"></script>
	<script src="./resources/js/owl.carousel.min.js"></script>
	<script src="./resources/js/wow.js"></script>
	<script src="./resources/js/main.js"></script>
	<!-- <link rel="stylesheet" type="text/css" href="./resources/js/jquery.autocomplete.css" />  -->
    <!-- <script type="text/javascript" src="./resources/js/jquery.js"></script> -->
   <!--  <script type='text/javascript' src='./resources/js/jquery.bgiframe.min.js'></script> -->
   <!--  <script type='text/javascript' src='./resources/js/jquery.ajaxQueue.js'></script> -->
    <!-- <script type='text/javascript' src='./resources/js/jquery.autocomplete.js'></script> -->

	
	
	
	
<!-- <script src="./resources/js/jquery-3.1.1.js"></script> -->

<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/hanna.css);
@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css);
@import url(http://fonts.googleapis.com/earlyaccess/nanumbrushscript.css);

/* #city_info {
			font-family: 'hanna', serif;
			font-size: 70px; 
} */
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

</style>

<script type="text/javascript">
     	var areacode = ${areacode};
     	var sigungucode = "";
     	var city_nm = '${city_nm}';
     	//alert(city_nm);
     	var key = "fHPwwCqceBLnLCExz65uYIYEAdiAs6xOwv79o6FcLHh7x6iPmxITE9Wk7TqH1q%2F1%2FeSw9j%2FUxPbGiQYcnVa0zw%3D%3D";
		
     	function checkId() {
     		$("#loginAtag").trigger("click");
     		$('#myModal').modal('show');
     	}
     	
     	
     	//정보수정 모달
     	$('#myModal_Edit').modal('show');

        $(function(){
        	
     		$("#joinForm").on("click",function(){
        		
    			$("#regAtag").trigger("click");
    		})
    		
    		$("#loginForm").on("click",function(){
    		
    			$("#loginAtag").trigger("click");
    		})
        	
        	theme_Data(areacode, "");
            popular_Data(areacode);
            city_img(city_nm);
           
            
            //전체
            $('#bMenu').on('click', 
                    function (){ 
                        theme_Data(areacode, ""); 
                  } );
          //자연
            $('#bMenu0').on('click', 
              function (){ 
                  theme_Data(areacode, "A01&cat2="); 
            } );
           //역사
            $('#bMenu1').on('click', 
              function (){ 
                  theme_Data(areacode,"A02&cat2=A0201"); 
            } );
            
           //휴양      
            $('#bMenu2').on('click', 
                    function (){ 
                        theme_Data(areacode, "A02&cat2=A0202"); 
            } );
           
           //체험
           
            $('#bMenu3').on('click', 
                    function (){ 
                        theme_Data(areacode, "A02&cat2=A0203"); 
            } );

           //건축
            $('#bMenu4').on('click', 
                    function (){ 
                        theme_Data(areacode, "A02&cat2=A0205"); 
            } ); 
           
           
           //문화시설
            $('#bMenu5').on('click', 
                    function (){ 
                        theme_Data(areacode, "A02&cat2=A0206"); 
            } ); 
   
           //레포츠
            $('#bMenu6').on('click', 
                    function (){ 
                        theme_Data(areacode, "A03"); 
            } ); 
           //쇼핑
            $('#bMenu7').on('click', 
                    function (){ 
                        theme_Data(areacode, "A04"); 
            } ); 
           //음식
            $('#bMenu8').on('click', 
                    function (){ 
                        theme_Data(areacode, "A05"); 
            } ); 
           
          //로그인 
    		$("#submit_button").on("click",function(){ 
    			
    			var user_id1 = $("#user_id").val();
    			var password1 = $("#password").val();
    			
    			if(user_id1.length == 0){
    				alert('아이디를 입력해주세요');
    				return false;
    			}
    			if(password1.length ==0){
    				alert('비밀번호를 입력해주세요');
    				return false;
    			} 

    			$.ajax({
    				type:"post",
    				url:"login",
    				data : {
    					user_id : user_id1,
    					password : password1
    				},
    				dataType : 'text',
    				
    				success : function(data){
    					if(data == "success"){
    						$('#myModal').modal('hide');
    						window.location.href = "home";
    						
    					}else{
    						alert("비밀번호가 맞지 않습니다.");
    					}
    				},
    				error : function(e){
    					console(e);
    				}
    			})
    		});
    		
    		//조인
    		
    		$("#submit_join").on("click",function(){
    			
    			var user_id2 = $("#user_id1").val();
    			var password2 = $("#password1").val();
    			var password3 = $("#password2").val();
    			var email1 = $("#email").val();
    			var user_sex1 = $("#user_sex").val();
    			
    			var sung = "선택";
    			
    			//alert(user_sex1);
    				//$('#user_sex option:selected').val();
    				//$('select[name=user_sex]').val();
    			
    			if(user_id2.length == 0){
    				alert('아이디를 입력해주세요');
    				return false;
    			}
    			if(password2.length ==0){
    				alert('비밀번호를 입력해주세요');
    				return false;
    			} 
    			if(email1.length == 0){
    				alert('이메일을 입력해주세요');
    				return false;
    			}
    			
    		    if(user_sex1 == sung ){
    				alert('성별을 입력해주세요');
    				return false;
    			} 
    			
    			if(password2 != password3){
    				alert('비밀번호 확인 시 비밀번호가 일치하지 않습니다.');
    				return false;
    			} 
    			
    			$.ajax({
    				type:"post",
    				url:"join",
    				data : {
    					user_id : user_id2,
    					password : password2,
    					email : email1,
    					user_sex : user_sex1
    				},
    				dataType : 'text',
    				
    				success : function(data){
    					console.log(data);
    					if(data == "success"){
    						alert("가입처리가 완료 되었습니다.");
    						$('#myModal').modal('hide');
    						window.location.href = "./";
    					}else{
    						alert("가입 처리가 되지 않았습니다.");
    					}
    				},
    				error : function(e){
    					console(e);
    				}
    			})
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
    		
    		
    		
 
        }); //레디펑션 end
        
      //로그인& 조인 모달 
        $('#myModal').modal('show');
        
        //로그아웃
        function logout(){
    		
    		location.href = "logout";
    	}
        
 
        
        //지역별 테마를 담는 변수 
        function theme_Data(areacode, themecode){
            
           	sigungucode = eval($("#test1").val());
            //alert(sigungucode);
            if(typeof(sigungucode)=='undefined'||sigungucode=='undefined') sigungucode="";
        	var url2 ="";
            url2 = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey="
                   +key;
            url2 += "&contentTypeId=&areaCode="+areacode+"&sigunguCode="+sigungucode+"&cat1="+themecode+"&cat3=&listYN=Y&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=A&numOfRows=30&pageNo=1";
            url2 += "&_type=json";

            //alert(url2);
            
            $.getJSON(url2,function(data) {
            
               var content = ""; 
               content += '<ul class="list-inline job-seeker">';
               
               var length=0;

           	   if(typeof(data.response.body.items.item) != 'undefined') length=data.response.body.items.item.length;
               
               // var addr = data.response.body.items.item.addr1;
                   // var addr1=addr.split(" ",1); //시의 정보를 가져오는 변수
               // var cityname = "<h1>"+addr1+"</h1>";
               //console.log(data);   
               
               var outputArray = [];
               //console.log(data.response.body.items.item);
               for (var i = 0; i < 6; i++) {
                   if(outputArray.length == 6) break;
                   if(typeof(data.response.body.items.item) != 'undefined' && data.response.body.items.item.length == outputArray.length) break;
                //컨텐트아이디 추출
                  //console.log(con);
                     /* alert('테마 6개를 가져오는 첫 for문 들어옴'); */
                     var val = Math.floor( Math.random()*(length-3));
                var repeat = false;
                var j = 0;
                //alert(outputArray.length);
                 for(j = 0; j < outputArray.length; j++){
					   if(typeof(data.response.body.items.item[val]) != 'undefined'){              	 
	                       if(outputArray[j] == data.response.body.items.item[val].title){
	                            /* alert('이름 중복 들어왔나 '); */
	                          data.response.body.items.item.splice(val, 1);
	                          repeat = true;
	                          break; 
	                       }
					   }  
                    }
                 if(repeat){
                       i--;
                    }else{
                    	if(typeof(data.response.body.items.item) != 'undefined'){
                    	if(typeof(data.response.body.items.item[val]) != 'undefined'){     
		                      if (typeof (data.response.body.items.item[val].firstimage) !== 'undefined') {
		                    	 //console.log(val);
		                          outputArray.push(data.response.body.items.item[val].title);
		                          var con = data.response.body.items.item[val].contentid;
		                          var conType=data.response.body.items.item[val].contenttypeid;
		                            
		                             content += '<li><a href="SC_07place?CONTENT_ID='+con+'&CONTENT_TYPE_ID='+conType+'"><img src='+data.response.body.items.item[val].firstimage+' width="300" height="200" alt="">';
		                              content += '<div class="overlay"><h3>'
		                             + data.response.body.items.item[val].title
		                             + '</h3><p>';
		                             if(typeof(data.response.body.items.item[val].addr1) != 'undefined'){
		                             	content += data.response.body.items.item[val].addr1.split(" ", 3);
		                             }
		                             content += '</p></div></a></li>'; 
		                       } else {
		                           i--;
		                        }
                    	}
                    	}
                    }
                }//outer for
               
                
                //전체
                if(themecode === ""){
                    $("#home").html(content); 
                    //console.log(content);
                
                //자연
                }else if(themecode === "A01&cat2="){
                   $("#home").html(content); 
               //역사 
                }else if(themecode === "A02&cat2=A0201"){
                    $("#home").html(content);
                //휴양
                }else if(themecode === "A02&cat2=A0202"){
                   $("#home").html(content);
                //체험
                }else if(themecode === "A02&cat2=A0202"){
                   $("#home").html(content);
                //건축   
                }else if(themecode === "A02&cat2=A0203"){
                   $("#home").html(content);
                //문화시설
                }else if(themecode === "A02&cat2=A0206"){
                   $("#home").html(content);
                //레포츠
                }else if(themecode === "A03" ){
                   $("#home").html(content);
                //쇼핑    
                }else if(themecode === "A04" ){
                   $("#home").html(content); 
                //음식    
                }else{
                   $("#home").html(content);
                }
                
            });         
         }
         
        
        /* 3장의 도시 이미지를 출력하는 메소드  */
        function city_img(city_nm){
        	//alert(city_nm);
        	var imageArray = [];
        	var city_info = "";  
        	
        	  $.ajax({
      	        type : "GET",
      	        url : "detail_city",
      	        data : {
      	        	 city_nm : city_nm
      	        },
      	        success : function(result){
      	        	//console.log(result);

      	        		city_info += '<div class="container">';
                    	city_info += '<div class="row page-title text-center wow zoomInDown" data-wow-delay="1s">';
                    	city_info += '<h2>'+result.city_name_en+'</h2>';
                    	city_info += '<h1>'+result.city_nm+'</h1>';
                    	city_info += '</div></div><br><br>';
                    	
                    	$("#city_info").html(city_info);
                    	
                    	imageArray.push(result.pic_address);
                        imageArray.push(result.pic_address);
                        imageArray.push(result.pic_address); 
          	        	
                        $.each($(".slide-image"), function(index, item) {
                            $(this).attr("src", imageArray[index]);
                         });
                        
      	           }, error : function(e){
      	              console.log(e);
      	           }
      	     });//ajax
     
        }
        
        
        //지역의 인기 장소를 가져오는 함수 
        function popular_Data(areacode) {

        	sigungucode = eval($("#test1").val());
            //지역별 인기 장소를 담는 변수
            var url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey="
                  + key;
            url += "&contentTypeId=&areaCode="
                  + areacode
                  + "&sigunguCode="+sigungucode+"&cat1=&cat2=&cat3=&listYN=Y&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=B&numOfRows=300&pageNo=";
            url += "&_type=json";
            
        	//console.log(url);
            $.getJSON(url,function(data) {
            	//console.log(data);
                           var content2 =""
                           content2 += '<ul class="list-inline job-seeker">';
                  	       	 var length=data.response.body.items.item.length;
                           
                  	       	 
                  	         var outputArray = [];
              	         
                  	         for (var i = 0; i < 6; i++) {
                  	        
                  	        	var val = Math.floor(Math.random() * length);  
                  	       	    var repeat = false; 
                  	       		var j = 0;
                       	 		for(j = 0; j < outputArray.length; j++){
                       				 if(outputArray[j] == data.response.body.items.item[val].title){
                       					
                       				 repeat = true;
                       			 	 break; 
                       		 		}
                       			 }
                       	 		if(repeat){
                       				 i--;
                       		 	continue;
                       	 		}else{
                       		 		outputArray[j] = data.response.body.items.item[val].title;
                       		 
                       	 		}
  
		                          	//컨텐트아이디 추출
		                  	       var con = data.response.body.items.item[val].contentid;
		                  	       var conType=data.response.body.items.item[val].contenttypeid;
		                  	       if (typeof (data.response.body.items.item[val].firstimage) !== 'undefined') {
		                          	
		                                  content2 += '<li><a href="SC_07place?CONTENT_ID='+con+'&CONTENT_TYPE_ID='+conType+'"><img src='+data.response.body.items.item[val].firstimage+' width="300" height="200" alt="">';
		                                  content2 += '<div class="overlay"><h3>'
												+ data.response.body.items.item[val].title
												+ '</h3><p>';
												if(typeof(data.response.body.items.item[val].addr1) != 'undefined'){
													content2 += data.response.body.items.item[val].addr1.split(" ", 3)
												}
												content2 += '</p></div></a></li>'; 
		                              
		                              } else {
		                    			i--;
		                              }
		                                      
		                           }//for
                           /*  $("#tabtab").html(function(index,content){
                               return content2;                      
                            }); */
                           $("#tabtab").html(content2);
                            
                        }); //json
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
			<c:when test="${sessionScope.user_id == null }">	
					<div class="header-half header-social">
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
			<a href="home"><img
					src="./resources/image/logoicon.png" alt="" width="80px" height="80px"></a>
					<img src="./resources/image/main_logo.png" alt="">
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
						data-toggle="modal" data-target="#myModal" id="loginForm" data-wow-delay="0.8s">Login</button>
					<button type="button" id="joinForm"
						class="navbar-btn nav-button wow fadeInRight" data-toggle="modal"
						data-target="#myModal" id="joinForm" data-wow-delay="0.6s" >Join</button>
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
													<form action="login" role="form" method="post" class="form-horizontal" onsubmit="return login()">
														<div class="form-group">
															<label for="email" class="col-sm-2 control-label">
																ID</label>
															<div class="col-sm-10">
																<input type="text" class="form-control" name="user_id" id="user_id"
																	placeholder="ID" />
															</div>
														</div>
														<div class="form-group">
															<label for="exampleInputPassword1"
																class="col-sm-2 control-label"> Password</label>
															<div class="col-sm-10">
																<input type="text" name="password" class="form-control"
																	id="password" placeholder="Password" />
															</div>
														</div>
														<div class="row">
															<div class="col-sm-2"></div>
															<div class="col-sm-10">
																<button type="button" class="btn btn-primary btn-sm" value="submit" id="submit_button">
																	Submit</button>
																<!-- <a href="javascript:;">Forgot your password?</a> -->
															</div>
														</div>
													</form>
												</div>
													<div class="tab-pane" id="Registration">
													<form action="join" role="form" method="post" class="form-horizontal" onsubmit="return joinCheck()">
														<div class="form-group">
															<label for="email" class="col-sm-2 control-label">
																ID</label>
															<div class="col-sm-10">
																<div class="row">
																	<div class="col-md-3">
																		<select class="form-control" name="user_sex" id="user_sex">
																			<option value="선택">선택</option>
																			<option value="m">남성</option>
																			<option value="f">여성</option>
																		</select>
																	</div>
																	<div class="col-md-9">
																		<input type="text" class="form-control"
																			placeholder="ID" name="user_id" id="user_id1"/>
																	</div>
																</div>
															</div>
														</div>
														<div class="form-group">
															<label for="email" class="col-sm-2 control-label">
																Email</label>
															<div class="col-sm-10">
																<input type="email" class="form-control" name="email" id="email"
																	placeholder="Email" />
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
																	id="password2" name="password2" placeholder="Password 확인" />
															</div>
														</div>
														<div class="row">
															<div class="col-sm-2"></div>
															<div class="col-sm-10">
																<button type="button" class="btn btn-primary btn-sm" id="submit_join">
																Save & Continue
																</button>
																<input type="reset" class="btn btn-default btn-sm" value="Reset" />
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
					<li class="wow fadeInDown" data-wow-delay="0.1s"><a href="#" onclick="checkId();">나의 일정 보기</a></li>
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
					<li class="wow fadeInDown" data-wow-delay="0.1s"><a href="SC_10">나의 일정 보기</a>
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


	<div class="content-area" id="city_info">
		<!-- <div class="container">
			<div class="row page-title text-center wow zoomInDown"
				data-wow-delay="1s">
				<h1>SEOUL</h1>
				<h2>서울은 먼지가 많다많다많다 </h2>
				<p>서울은 가장 아름 다운 도시입니다.</p>
			</div>
			</div> -->
		</div>
	

		<!--도시 이미지  -->
		  <div class="row carousel-holder">

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
                              alt="" width="770" height="288">
                        </div>
                        <div class="item">
                           <img class="slide-image" src="./resources/image/seoul/seoul.jpg"
                              alt="" width="770" height="288">
                        </div>
                        <div class="item">
                           <img class="slide-image" src="./resources/image/seoul/seoul.jpg"
                              alt="" width="770" height="288">
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

            </div> 
			
		
		
				
		<div class="container">
			<div class="row job-posting wow fadeInUp" data-wow-delay="1s"
				id="rowjob">
				<div role="tabpanel">
					<!-- Nav tabs -->
					<ul class="nav nav-tabs" role="tablist">
						<li id="bMenu" role="presentation" class="active"><a href="#job-seekers"
							aria-controls="home" role="tab" data-toggle="tab">전체</a></li>
						<li id="bMenu0" role="presentation"><a href="#employeers"
							aria-controls="profile" role="tab" data-toggle="tab">자연</a></li>
						<li id="bMenu1" role="presentation"><a href="#employeers"
							aria-controls="profile" role="tab" data-toggle="tab">역사</a></li>
						<li id="bMenu2" role="presentation"><a href="#"
							aria-controls="profile" role="tab" data-toggle="tab">휴양</a></li>
						<li id="bMenu3" role="presentation"><a href="#"
							aria-controls="profile" role="tab" data-toggle="tab">체험</a></li>
						<li id="bMenu4" role="presentation"><a href="#"
							aria-controls="profile" role="tab" data-toggle="tab">건축</a></li>
						<li id="bMenu5" role="presentation"><a href="#"
							aria-controls="profile" role="tab" data-toggle="tab">문화시설</a></li>
						<li id="bMenu6" role="presentation"><a href="#"
							aria-controls="profile" role="tab" data-toggle="tab">레포츠</a></li>
						<li id="bMenu7" role="presentation"><a href="#"
							aria-controls="profile" role="tab" data-toggle="tab">쇼핑</a></li>
						<li id="bMenu8" role="presentation"><a href="#"
							aria-controls="profile" role="tab" data-toggle="tab">음식</a></li>
					</ul>

					<!-- Tab panes -->
					<div class="tab-content">
					<!--자연-->
						<div role="tabpanel" class="tab-pane fade in active"
							id="home">
						 <!-- 행사정보  -->	
						</div>
				<!-- 		<div role="tabpanel" class="tab-pane fade" id="employeers">
							<ul class="list-inline">
								<li><a href=""> <img
										src="./resources/img/employee4.png" alt="">
										<div class="overlay">
											<h3>Instagram</h3>
										</div>
								</a></li>
							</ul>
						</div> -->
						<div role="tabpanel" class="tab-pane fade" id="menu1">
						</div>
						<div role="tabpanel" class="tab-pane fade" id="menu2">
						</div>
						<div role="tabpanel" class="tab-pane fade" id="menu3">
						</div>
						<div role="tabpanel" class="tab-pane fade" id="menu4">
						</div>
						<div role="tabpanel" class="tab-pane fade" id="menu5">
						</div>
						<div role="tabpanel" class="tab-pane fade" id="menu6">
						</div>
						<div role="tabpanel" class="tab-pane fade" id="menu7">
						</div>
						<div role="tabpanel" class="tab-pane fade" id="menu8">
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
					<li role="presentation" class="active"><a href="#tabtab"
						aria-controls="home" role="tab" data-toggle="tab">추천 장소</a></li>
				</ul>

				<!-- Tab panes -->
				<div class="tab-content">
					<div role="tabpanel" class="tab-pane fade in active"
						id="tabtab">
						<!-- <ul class="list-inline job-seeker">

								<li><a href=""> <img
										src="./resources/img/team-small-5.jpg" alt="">
										<div class="overlay">
											<h3>Ohidul Islam</h3>
											<p>Web Designer</p>
										</div>
								</a></li>
								<li><a href=""> <img
										src="./resources/img/team-small-6.jpg" alt="">
										<div class="overlay">
											<h3>Mohidul Islam</h3>
											<p>CEO</p>
										</div>
								</a></li>
								<li><a href=""> <img
										src="./resources/img/team-small-3.jpg" alt="">
										<div class="overlay">
											<h3>Unknown girl</h3>
											<p>Graphic Designer</p>
										</div>
								</a></li>
								<li><a href=""> <img
										src="./resources/img/team-small-4.jpg" alt="">
										<div class="overlay">
											<h3>Eftakher Alam</h3>
											<p>Graphic Designer</p>
										</div>
								</a></li>
								<li><a href=""> <img
										src="./resources/img/team-small-2.jpg" alt="">
										<div class="overlay">
											<h3>Mark Otto</h3>
											<p>Founder</p>
										</div>
								</a></li>
								<li><a href=""> <img
										src="./resources/img/team-small-1.jpg" alt="">
										<div class="overlay">
											<h3>Rasel Ahmed</h3>
											<p>Web Developer</p>
										</div>
								</a></li>
							</ul> -->
					</div>
					<!-- <div role="tabpanel" class="tab-pane fade" id="employeers">
						<ul class="list-inline">
							<li><a href=""> <img src="./resources/img/employee4.png"
									alt="">
									<div class="overlay">
										<h3>Instagram</h3>
									</div>
							</a></li>
							<li><a href=""> <img src="./resources/img/employee5.png"
									alt="">
									<div class="overlay">
										<h3>Microsoft</h3>
									</div>
							</a></li>
							<li><a href=""> <img src="./resources/img/employee6.png"
									alt="">
									<div class="overlay">
										<h3>Dribbble</h3>
									</div>
							</a></li>
							<li><a href=""> <img src="./resources/img/employee1.png"
									alt="">
									<div class="overlay">
										<h3>Beats Music</h3>
									</div>
							</a></li>
							<li><a href=""> <img src="./resources/img/employee2.png"
									alt="">
									<div class="overlay">
										<h3>Facebook</h3>
									</div>
							</a></li>
							<li><a href=""> <img src="./resources/img/employee3.png"
									alt="">
									<div class="overlay">
										<h3>Twitter</h3>
									</div>
							</a></li>
						</ul>
					</div> -->
				</div>
			</div>
		</div>
	</div>
<!--footer  -->
	 <div class="footer-area" style="border-top: 1px solid #00AEEF;">
		<div class="container" style="padding-bottom : 0px">
			<div class="row footer-copy">
				<p style="margin: 0 0 0px;">
					<span id="span1" style="color : gray;">Copyright &copy; NikoNikoNi 2017</span>
				</p>
			</div>
		</div>
        </div>

	<!-- Modal -->
<%--  	<div class="modal fade" id="myModal" role="dialog">
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
							<jsp:include page="/WEB-INF/views/joinForm.jsp" />
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>  --%>

    <input type="hidden" id="test1" value="${sigungucode}">
	<!-- footer -->

</body>
</html>