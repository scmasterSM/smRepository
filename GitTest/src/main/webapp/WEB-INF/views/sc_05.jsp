<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
/* html, body {
	height: 100%;
	margin: 0;
	padding: 0;
}

.header{width : 100%;
	height : 100px;
	background-color : yellow;
	float : left;
}
.center{width : 100%;
		height : 100px;
		background-color : green;
		float : left;
		} */

/* body{
	text-align :center;
	color: #FFF;
	width : 900px;
}
div#wapper{
	width : 100%
	text-align : left;
	min-height : 300px;
	margin : 0 auto;
}
header, footer, nav, aside, section{
	boder : 1px solid #999;
	margin : 5px;
	padding : 10px;
}
header{
	height : 50px;
	background-color : red;
}
nav, section, aside{
	float : left;
	height : 200px;
}
nav{
	background-color : goldenrod;
	width : 100px;
}
section {
	background-color: green;
	width : 604px;
}
aside{
	background-color : goldenfod;
	width : 100px;
}
footer{
	height : 50px;
	background-color : blue;
	position : relative;
	clear : both;
}
article{
	width: 90%;
	margin : 20px;
	backgroun-color : #999;
} */
</style>

<script type="text/javascript"
	src="<c:url value="/resources/js/jquery-3.1.1.js"/>"></script>
<script type="text/javascript">

window.onload=function(){
	s_Data();
	
}


//서울의 모든 장소를 가져오는 함수 
function s_Data(){

	var key = "fHPwwCqceBLnLCExz65uYIYEAdiAs6xOwv79o6FcLHh7x6iPmxITE9Wk7TqH1q%2F1%2FeSw9j%2FUxPbGiQYcnVa0zw%3D%3D";
	var url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey="
				+ key;		
	url += "&contentTypeId=&areaCode=1&sigunguCode=&cat1=&cat2=&cat3=&listYN=Y&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=A&numOfRows=12&pageNo=1";
	url += "&_type=json";
	
	$.getJSON(url, function(data){
		var content ="";
		for (var i=0; i< data.response.body.items.item.length; i++){
			console.log('success detail data');
			console.log(data.response.body.items.item.length);
			
		content += '<div class="center">';
		content += '<div id="image">';
		if(typeof(data.response.body.items.item[i].firstimage2 !== 'undefined')){
			content += '<img src='+data.response.body.items.item[i].firstimage2 +' width=200 height=120>';
		}else{
			content += '<img src="">';
		}
		content += '</div>';
		content +='<h6 id="firstHeading" class="firstHeading">' + data.response.body.items.item[i].title + '</h1>';
		content +='</div>';
		
		} /* for */
		$("#center").html(content);
	});
}
</script>






</head>
<body>
<div class="row" id="header">안녕하세요
	<div class="col-md-12"></div>
</div>

<div class="row" id="center">
	<div class="col-md-12"></div>
</div>

<div class ="row" id="bottom">반갑습니다</div>





  <!-- <div id="wrapper">
		헤다시작 
		<header>
			<p>헤더입니다</p>
		</header>
		네비게이션 
		<nav>
			<p>nav</p>
			<ul>
				<li><a href="">link</a></li>
				<li><a href="">link</a></li>
				<li><a href="">link</a></li>
			</ul>
		</nav>			
		
		콘텐츠부문
		
		<section>
			<p>section</p>
			<article>
				<p>article</p>
			</article>
		</section>
		
		사이드바 
		<aside>
			<p>aside</p>
		</aside>
		풋터		
		<footer>footer</footer>
		</div>
 -->
</body>
</html>