<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript"src="<c:url value="/resources/js/jquery-3.1.1.js"/>"></script>
<!-- <link href="./resources/css/bootstrap.min.css" rel="stylesheet"/>
<link href="./resources/css/bootstrap.min.css" rel="stylesheet"/> -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>sc_08행사 상세 정보 화면</title>
<link rel="stylesheet" type="text/css" href="./resources/css/SC_08.css">
<script	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCW-Yin1kq0i_E_hqmkCdFXNWIaJLRoUN8&callback=initMap"
		async defer></script>
<script type="text/javascript">
var map;
var myLatLng;
var PLACE_NM;
var key = "fHPwwCqceBLnLCExz65uYIYEAdiAs6xOwv79o6FcLHh7x6iPmxITE9Wk7TqH1q%2F1%2FeSw9j%2FUxPbGiQYcnVa0zw%3D%3D";
	
    //장소바꿀때 전 단계에서 contentId를 받아와서 바꾸면 될듯
	
    var contentId=2376250;
  	var areaCode;
  	var sigunguCode;
    var lat;
  	var lng;
  	
    var url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?ServiceKey="+key;
    url += "&mapX&mapY";
    url += "&contentTypeId=15&contentId="+contentId+"&areaCode&sigunguCode&cat1=&cat2=&cat3=&listYN=Y";
    url += "&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&transGuideYN=Y&_type=json";

    window.onload=function(){
	l_Data();
	r_Data();
} 

function l_Data(){


    console.log(url);
    $.getJSON(url, function(data) {
    	myLatLng={
    			lat : data.response.body.items.item.mapy,
    			lng : data.response.body.items.item.mapx
    	}
    	
    	var PLACE_NM=data.response.body.items.item.title;
    	var areacode=data.response.body.items.item.areacode;
    	
    	initMap(myLatLng,data);
        console.log('success', data);
        /* for( var i = 0 ; i < data.response.body.totalCount ; i++){
            console.log( data.response.body.items.item[i] );
        }    */
        
        //행사 지역이름 추출
        var addr=data.response.body.items.item.addr1;
        var addr1=addr.split(" ",1);
        
        console.log(addr1);
        console.log(data.response.body.items.item);
        $("#placeName").html(data.response.body.items.item.title);
        $("#placeImg").html('<img src='+data.response.body.items.item.firstimage+' width=400 height=240>');
        $("#placeInfo").html(data.response.body.items.item.overview);
       
        $("#addr").html('<a href="sc_05?areacode='+areacode+'">'+addr1+'</a>'); //areacode드를 보내 주면 될듯 
    });
  
    
}

//주변 관광지
function r_Data(){
		 $.getJSON(url, function(data) {
			areacode=data.response.body.items.item.areacode;
		    sigungucode=data.response.body.items.item.sigungucode;
			 
		 
		
		console.log(areacode); 
		console.log(sigungucode); 
		
		var url2= "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey="+key;
		url2 += "&contentTypeId=12&areaCode=" + areacode + "&sigunguCode=" + sigungucode + "&cat1=&cat2=&cat3=&listYN=Y";
		url2 += "&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=Q&numOfRows=100"; 
	    
		$.getJSON(url2, function(data) {
			var length=data.response.body.items.item.length
			console.log('success', data);
			var j=0;
			
			 for( var i = 0 ; i < 3 ; i++){
				 var j=j+1;
		            console.log( data.response.body.items.item.length);
		            var val = Math.floor( Math.random()*length);
		            var con=data.response.body.items.item[val].contentid;
 		            console.log(con);
 		           
					console.log(val);
					console.log( data.response.body.items.item[val].title);
					$("#rplaceImg"+ j).html('<a href="SC_07place?PLACE_NM='+con+'"><img src='+data.response.body.items.item[val].firstimage+' width=200 height=180></a>');
					/* $("#rplaceImg"+ j).html('<a href="SC_07place?PLACE_NM=1131275"><img src='+data.response.body.items.item[val].firstimage+' width=200 height=180></a>'); */
					$("#rplacetitle"+ j).html('<a href="SC_07place?PLACE_NM='+con+'">'+data.response.body.items.item[val].title.split("(",1))+'</a>';
					$("#rplaceaddr"+ j).html(data.response.body.items.item[val].addr1);
			 } 
		})
		
		 });
}


	function initMap(myLatLng,data) {
  map = new google.maps.Map(document.getElementById('map'), {
    center: myLatLng,
    zoom: 15
  });
  showmaker(data)
} 
 function showmaker(data){
	 marker = new google.maps.Marker({
		    position: myLatLng,
		    map: map,  		   
		   	draggable: false,
	    	animation: google.maps.Animation.DROP 
		  }); 
 }
 
 $(function(){
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
						
						html+= "날짜 : " +item.inp_YMD
						html+= "ID : " +item.user_ID
						html+= "내용 : " +item.rev_TXT+"<br>"
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

<div class ="addr" id="addr"></div>


<textarea  class="reviewWrite" id="reviewWrite"></textarea>
<a href="#"  id="write">등록</a> 
<!-- <a target="_blank"  id="write">등록</a> -->
<div class ="review" id="review">

<%-- <c:forEach var="reply" items="${rList}">
${reply.inp_YMD}
${reply.user_ID}
${reply.rev_TXT}
<br>
</c:forEach> --%>
</div>
<br>
<br>
<div class="wrap3" id="warp3">
<div class="rplace1" id ="rplace1">
<div class="rplaceImg1" id ="rplaceImg1"></div>
<div class="rplacetitle1" id ="rplacetitle1"></div>
<div class="rplaceaddr1" id ="rplaceaddr1"></div>
</div>
<div class="rplace2" id ="rplace2">
<div class="rplaceImg2" id ="rplaceImg2"></div>
<div class="rplacetitle2" id ="rplacetitle2"></div>
<div class="rplaceaddr2" id ="rplaceaddr2"></div>
</div>
<div class="rplace3" id ="rplace3">
<div class="rplaceImg3" id ="rplaceImg3"></div>
<div class="rplacetitle3" id ="rplacetitle3"></div>
<div class="rplaceaddr3" id ="rplaceaddr3"></div>
</div>
</div>
<br>
</body>
</html>