<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>SC_05화면</title>

<!--Tabs JS  -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="./resources/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<!-- Bootstrap Core CSS -->
<link href="./resources/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="./resources/css/shop-homepage.css" rel="stylesheet">


<script type="text/javascript"
	src="<c:url value="/resources/js/jquery-3.1.1.js"/>"></script>
<!-- Bootstrap Core JavaScript -->
<script src="./resources/js/bootstrap.min.js"></script>

<!-- 	// 자연 cat1 =A01,역사 cat1 =A02 cat2=A0201, 휴양 cat1 =A02 cat2=A0202
	  // 체험  cat1 =A02 cat2=A0203, 건축 cat1 =A02 cat2=A0205,
	 // 문화시설 cat1 =A02 cat2=A0206, 레포츠 cat1 =A03, 쇼핑 cat1 =A04, 음식 cat1 =A05 -->


<script type="text/javascript">
	$(function() {
		
		theme_Data(1, "A01&cat2=");
		//theme_Data(1, "A02&cat2=A0201");
		popular_Data(1);
		
		 //자연
		 $('#bMenu0').on('click', 
			function (){ 
				 theme_Data(1, "A01&cat2="); 
		 } );
		//역사
		 $('#bMenu1').on('click', 
			function (){ 
				 theme_Data(1,"A02&cat2=A0201"); 
		 } );
		 
		//휴양		
		 $('#bMenu2').on('click', 
					function (){ 
						 theme_Data(1, "A02&cat2=A0202"); 
		 } );
		
		//체험
		
		 $('#bMenu3').on('click', 
					function (){ 
						 theme_Data(1, "A02&cat2=A0203"); 
		 } );

		//건축
	    $('#bMenu4').on('click', 
					function (){ 
						 theme_Data(1, "A02&cat2=A0205"); 
		 } ); 
		
		
		//문화시설
		 $('#bMenu5').on('click', 
					function (){ 
						 theme_Data(1, "A02&cat2=A0206"); 
		 } ); 
		
		
		//레포츠
		 $('#bMenu6').on('click', 
					function (){ 
						 theme_Data(1, "A03"); 
		 } ); 
		//쇼핑
		 $('#bMenu7').on('click', 
					function (){ 
						 theme_Data(1, "A04"); 
		 } ); 
		//음식
		 $('#bMenu8').on('click', 
					function (){ 
						 theme_Data(1, "A05"); 
		 } ); 
		
	});
	
	//테마별 장소를 담는 변수 
	var content2 = ""; //지역별 인기장소를 담는 변수 
	var modal1 = ""; 
	var modal2 = "";
	var key = "fHPwwCqceBLnLCExz65uYIYEAdiAs6xOwv79o6FcLHh7x6iPmxITE9Wk7TqH1q%2F1%2FeSw9j%2FUxPbGiQYcnVa0zw%3D%3D";

	var url2 = ""; //지역의 테마를 가져오는 함수 - url 변수 
	
	
	//지역의 테마를 가져오는 함수 
	function theme_Data(citynum, themecode){
		//지역별 테마를 담는 변수  
		url2 = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey="
			    +key;
		url2 += "&contentTypeId=&areaCode="+citynum+"&sigunguCode=&cat1="+themecode+"&cat3=&listYN=Y&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=A&numOfRows=8&pageNo=1";
		url2 += "&_type=json";

		
		$.getJSON(url2,function(data) {
			var content = ""; 
			// var addr = data.response.body.items.item.addr1;
       		// var addr1=addr.split(" ",1); //시의 정보를 가져오는 변수
			// var cityname = "<h1>"+addr1+"</h1>";
       		 
			 for (var i = 0; i < data.response.body.items.item.length; i++) {
				 content += '<div class="col-sm-4 col-lg-4 col-md-4">';
				 content += '<div class="thumbnail">';
				 if (typeof (data.response.body.items.item[i].firstimage2 !== 'undefined')) {
				 content += '<img src='+data.response.body.items.item[i].firstimage2+' width=200 height=120>';
				 } else {
				 content += '<img src="./resources/image/noimage.jpg">';
				 }
				 content += '<div class="caption">';
				 content += '<h4>'+data.response.body.items.item[i].title+'</h4>';
				 content += '<p>This is a short description. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>';
				 content += '</div>';
				 content += '</p>';
				 content += '</div>';
				 content += '</div>';
			 }
			 
			 //자연
			 if(themecode === "A01&cat2="){
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
	
	
	//지역의 모든 장소를 가져오는 함수 
	function popular_Data(citynum) {

		var imageArray = [];

		//관광 api 에서는 서울이면1 ,부산이면 6 
		if (citynum == 1) {
			imageArray.push("./resources/image/seoul/seoul.jpg");
			imageArray.push("./resources/image/seoul/seoul2.jpg");
			imageArray.push("./resources/image/seoul/seoul3.jpg");
		} else if (citynum == 6) {
			imageArray.push("./resources/image/busan/busan1.jpg");
			imageArray.push("./resources/image/busan/busan2.jpg");
			imageArray.push("./resources/image/busan/busan3.jpg");
			//}else if(){
			//}else{	
		}

		$.each($(".slide-image"), function(index, item) {
			$(this).attr("src", imageArray[index]);
		});

		//console.log(nani);
		var key = "fHPwwCqceBLnLCExz65uYIYEAdiAs6xOwv79o6FcLHh7x6iPmxITE9Wk7TqH1q%2F1%2FeSw9j%2FUxPbGiQYcnVa0zw%3D%3D";
		
		//지역별 인기 장소를 담는 변수
		var url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey="
				+ key;
		url += "&contentTypeId=&areaCode="
				+ citynum
				+ "&sigunguCode=&cat1=&cat2=&cat3=&listYN=Y&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=A&numOfRows=8&pageNo=1";
		url += "&_type=json";
		
		$.getJSON(url,function(data) {
							
							console.log(content2);
							for (var i = 0; i < data.response.body.items.item.length; i++) {
								content2 += '<div class="col-sm-4 col-lg-4 col-md-4">';
								content2 += '<div class="thumbnail">';
								if (typeof (data.response.body.items.item[i].firstimage2) !== "undefined") {

									//console.log('테스트 if');
									content2 += '<img src='+data.response.body.items.item[i].firstimage2+' width=180 height=120>';
								} else {
									//console.log('테스트 else');
									content2 += '<img src="./resources/image/noimage.jpg">';
								}
								content2 += '<div class="caption">';
								content2 += '<h4><a href="#">'
										+ data.response.body.items.item[i].title
										+ '</a></h4>';
								content2 += '<p> 뭐지 뭐지 ?</p>';
								//content2 += '<input type="button" value="detail" onclick="javascript:d_Data(' + data.response.body.items.item[i].contentid + ')">';
								content2 += '<button id="modalbtn" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal"></button>';				
								content2 += '</div>';
								content2 += '<div class="ratings">';
								content2 += '<p class="pull-right">18 reviews</p>';
								content2 += '<p>';
								content2 += '<span class="glyphicon glyphicon-star"></span>';
								content2 += '<span class="glyphicon glyphicon-star"></span>';
								content2 += '<span class="glyphicon glyphicon-star"></span>';
								content2 += '<span class="glyphicon glyphicon-star"></span>';
								content2 += '<span class="glyphicon glyphicon-star-empty"></span>';
								content2 += '</p>';
								content2 += '</div>';
								content2 += '</div>';
								content2 += '</div>';
								
								modal1 += '<h4>'+ data.response.body.items.item[i].title +'</h4>';	
                                
							}//for

                                modal2 +=  '<button type="button" class="btn btn-default" data-dismiss="modal">' +
                                '</button>' + '<button type="button" class="btn btn-primary" id="myButtons1">' +
                                '</button>';
							 
							//$("#center").html(content2);
							
							 $("#center").html(function(index,content){
								 return content2;							 
							 });

							$("#modalbtn").click(function(){
						         alert('AJAX로 처리하고 정상 응답이면.. hide 해 준다.');
								 $("#modal-body").html(modal1);
								// $("#modal-body").html(modal2);
								 //$('#myModal').modal('show');
								 $('#myModal').modal('hide');
						         
						     }); //modal 
						}); //json
					}
	
	// 자연 cat1 =A01,역사 cat1 =A02 cat2=A0201, 휴양 cat1 =A02 cat2=A0202
	  // 체험  cat1 =A02 cat2=A0203, 건축 cat1 =A02 cat2=A0205,
	 // 문화시설 cat1 =A02 cat2=A0206, 레포츠 cat1 =A03, 쇼핑 cat1 =A04, 음식 cat1 =A05
	 
	 
	//역사를 클릭했을 때 
	// $(function(){
		// $('#menu1').on('click', theme_Data(1,"A02&cat2=A0201"));
		 //$('#menu2').on('click', theme_Data(1,"A02&cat2=A0202"));
	// })
	 

	///휴양
	//$('#menu2').on('click', theme_Data(1,"A02&cat2=A0202"));
	
	//체험
	
	//건축 
	
	//문화시설
	
	//레포츠
	
	//쇼핑
	
	//음식
	
	
	

</script>


</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">Travel Maker</a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="#">About</a></li>
					<li><a href="#">Services</a></li>
					<li><a href="#">Contact</a></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container -->
	</nav>

	<!-- Page Content -->
	<div class="container">

		<div class="row">

			<!-- 왼쪽 Div  -->
			<div class="col-md-3">
				<p class="lead"></p>
				<div class="list-group"></div>
			</div>

			<div class="col-md-9">

				<!-- <input type="button" onclick="javascript:theme_Data(1)" value="서울로 검색">
				<input type="button" onclick="javascript:theme_Data(6)" value="부산으로 검색"> -->
				
				<div id="cityname"></div>

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
									<img class="slide-image" src="./resources/image/noimage.jpg"
										alt="">
								</div>
								<div class="item">
									<img class="slide-image" src="./resources/image/noimage.jpg"
										alt="">
								</div>
								<div class="item">
									<img class="slide-image" src="./resources/image/noimage.jpg"
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

				</div>

				<h1>
					<span class="label label-primary">이 도시의 테마</span>
				</h1>

				<ul class="nav nav-tabs">
					<li class="active"><a data-toggle="tab" id="bMenu0" style="cursor:pointer">자연</a></li>
					<li><a data-toggle="tab" id="bMenu1" style="cursor:pointer">역사</a></li>
					<li><a data-toggle="tab" id="bMenu2" style="cursor:pointer">휴양</a></li>
					<li><a data-toggle="tab" id="bMenu3" style="cursor:pointer">체험</a></li>
					<li><a data-toggle="tab" id="bMenu4" style="cursor:pointer">건축</a></li>
					<li><a data-toggle="tab" id="bMenu5" style="cursor:pointer">문화시설</a></li>
					<li><a data-toggle="tab" id="bMenu6" style="cursor:pointer">레포츠</a></li>
					<li><a data-toggle="tab" id="bMenu7" style="cursor:pointer">쇼핑</a></li>
					<li><a data-toggle="tab" id="bMenu8" style="cursor:pointer">음식</a></li>
				</ul>

				<div class="tab-content">
					<div id="home" class="tab-pane fade in active">
										<!--해당 지역의 테마  -->

					</div>
				 <!-- 역사  -->
					<div id="menu1" class="tab-pane fade">
						
					</div>
					<div id="menu2" class="tab-pane fade">
						
					</div>
					<div id="menu3" class="tab-pane fade">
						
					</div>
					<div id="menu4" class="tab-pane fade">
					
					</div>
					<div id="menu5" class="tab-pane fade">
					
					</div>
					<div id="menu6" class="tab-pane fade">
					
					</div>
					<div id="menu7" class="tab-pane fade">
					
					</div>
					<div id="menu8" class="tab-pane fade">
						
					</div>
					
				</div>

				<h1>
					<span class="label label-success"> 이 도시의 인기 장소</span>
				</h1>
				<!--서울의 인기 장소   -->
				<div class="row" id="center"></div>

			</div>

		</div>

	</div>


	<!-- /.container -->

	<div class="container">
	
	<!--모달 창  -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" 
   aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog modal-lg">    <!--  큰창:<div class="modal-dialog modal-lg"> 작은창 :<div class="modal-dialog modal-sm">  -->
      <div class="modal-content">
         <div class="modal-header" id="modal-header">
          <!--   <button type="button" class="close" data-dismiss="modal" 
               aria-hidden="true">
            </button> -->
            <h4 class="modal-title" id="myModalLabel">
            </h4>
         </div>
         <div class="modal-body" id="modal-body">
         </div>
         <div class="modal-footer" id="modal-footer">
           <!--  <button type="button" class="btn btn-default" data-dismiss="modal">
            </button>
            <button type="button" class="btn btn-primary" id="myButtons1">
            </button> -->
         </div>
      </div> 
   </div> 
</div> 

		<hr>
		<!-- Footer -->
		<footer>
			<div class="row">
				<div class="col-lg-12">
					<br> <br>
					<p>Copyright &copy; SC IT MASTER DO RE MI</p>
				</div>
			</div>
		</footer>

	</div>


</body>
</html>