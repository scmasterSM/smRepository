<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript"src="<c:url value="/resources/js/jquery-3.1.1.js"/>"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>장소화면</title>
<link rel="stylesheet" type="text/css" href="./resources/css/07place.css">
<script	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCW-Yin1kq0i_E_hqmkCdFXNWIaJLRoUN8&callback=initMap"
		async defer></script>
<script type="text/javascript">
var map;
var myLatLng;
var PLACE_NM;
    var key = "fHPwwCqceBLnLCExz65uYIYEAdiAs6xOwv79o6FcLHh7x6iPmxITE9Wk7TqH1q%2F1%2FeSw9j%2FUxPbGiQYcnVa0zw%3D%3D";
	
    //장소바꿀때 전 단계에서 contentId를 받아와서 바꾸면 될듯
    var contentTypeId = 14;
    var contentId = ${contentid};
    
  	var lat;
  	var lng;
  	
  	//선택된 장소의 이름, 대표 사진, 장소 설명, 좌표 불러오는API
    var url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?ServiceKey="+key;
    url += "&mapX&mapY";
    url += "&contentTypeId&contentId="+contentId;
    url += "&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&transGuideYN=Y&_type=json";

    window.onload=function(){
	l_Data();
}

function l_Data(){ //선택된 장소의 이름과 대표 사진 장소 설명 불러오기
    console.log(url);
    $.getJSON(url, function(data) {
    	myLatLng={
    			lat : parseFloat(data.response.body.items.item.mapy),
    			lng : parseFloat(data.response.body.items.item.mapx)
    	}
    	
    	var PLACE_NM=data.response.body.items.item.title;
    	
    	console.log(PLACE_NM); 
    	
    	initMap(myLatLng,data);
        console.log('sucess', data);
        /* for( var i = 0 ; i < data.response.body.totalCount ; i++){
            console.log( data.response.body.items.item[i] );
        }    */
       
        console.log(data.response.body.items.item);
        $("#placeName").html(data.response.body.items.item.title);
        $("#placeImg").html('<img src='+data.response.body.items.item.firstimage+' width=400 height=240>');
        $("#placeInfo").html(data.response.body.items.item.overview);
        
    });
    
}

	function initMap(myLatLng,data) {//맵 띄우는 함수
  map = new google.maps.Map(document.getElementById('map'), {
    center: myLatLng,
    zoom: 15
  });
  showmaker(data)
} 
 function showmaker(data){//마커 띄우는함수
	 marker = new google.maps.Marker({
		    position: myLatLng,
		    map: map,  		   
		   	draggable: false,
	    	animation: google.maps.Animation.DROP 
		  }); 
 }
 
 $(function(){// 리뷰 쓰기 및 불러오는 ajax
	$("#write").on("click",function(){ 

		$.getJSON(url, function(data) {
		console.log(data.response.body.items.item)
		var REV_TXT = $("#reviewWrite").val();
		var PLACE_NM = data.response.body.items.item.contentid;
		
		if(PLACE_NM.length ==0 || REV_TXT.length ==0) {
			alert("데이터를 입력해 주세요");
			return;
		} 
	 
		/* console.log(reviewData); */
		$.ajax({
			
			type : "post",
			url : "writeReview",
			data :{
				PLACE_NM : PLACE_NM
				,REV_TXT : REV_TXT	
			},
			
			success : function(data){
				
				console.log(data);
				 var html ="";
				 $.each(data,function(index,item){
					
					html+= "날짜 : " + item.inp_YMD;
					html+= "ID : " + item.user_ID;
					html+= "내용 : " + item.rev_TXT+"<br>";
				 })
				$("#review").html(html);				
				$('.reviewWrite').val('');										
			},
			error : function(e){
				console.log(e);
			}
		});

		});
		
	});
	

})


function locationObj(){
	
	location.href="#write";
	location.reload();
}
</script>

</head>
<body>
<div class="wrap">
<div class="placeName" id="placeName" ></div>
<div class="btn">
<a href="#" onclick="locationObj();">리뷰쓰기</a>
<a href="">클립</a>
</div>
</div>

<div class="wrap2">
<div class="placeImg" id="placeImg"></div>
<div class="map" id="map"></div>
</div>

<div class="placeInfo" id="placeInfo"></div> 
<br>
<div class ="review" id="review">
<c:forEach var="reply" items="${rList}">
${reply.INP_YMD}
${reply.USER_ID}
${reply.REV_TXT}
<br>
</c:forEach>
</div>


<textarea  class="reviewWrite" id="reviewWrite"></textarea>
<!-- <input type="text" class="reviewWrite" id="reviewWrite"> -->
<!-- <a target="_blank"  id="write">등록</a> -->
<a href="#"  id="write">등록</a>


</body>
</html>