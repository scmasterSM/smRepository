<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<title>간단한 지도 표시하기</title>

</head>

<body>
	<style>
html, body {
	height: 100%;
	margin: 0;
	padding: 0;
}

#map {
	height: 100%;
}
</style>

	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCW-Yin1kq0i_E_hqmkCdFXNWIaJLRoUN8&callback=initMap"
		async defer></script>
	<script type="text/javascript"
		src="<c:url value="/resources/js/jquery-3.1.1.js"/>"></script>
</head>
<body>
	<div id="map"></div>
	<button type="button" id="btnKto" onClick="Javascript:l_Data();">위치기반조회</button>


</body>
<script>
var map;
var myLatLng;

var key = "fHPwwCqceBLnLCExz65uYIYEAdiAs6xOwv79o6FcLHh7x6iPmxITE9Wk7TqH1q%2F1%2FeSw9j%2FUxPbGiQYcnVa0zw%3D%3D";

var lat = 37.566535;
var lng = 126.97796919999999;
var radius = 500;
var title;
var contentId=126508;
var marker;
/* var url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/locationBasedList?ServiceKey="+key;
url += "&mapX=" + lng +"&mapY=" + lat + "&radius=" + radius+ "&title=" + title +"&contentTypeId=" + contentTypeID;
url += "&pageNo=1&numOfRows=1000&listYN=Y&arrange=A&MobileOS=ETC&MobileApp=AppTesting&_type=json"; */
var url ="http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?ServiceKey="+key
url += "&contentId="+contentId+"&defaultYN=Y&addrinfoYN=Y&overviewYN=Y&MobileOS=ETC&MobileApp=AppTesting&_type=json";      
        /* 특정 타입만 보고 싶을 때 type기입 관광지:12, 문화시설: 14 축제 : 15 코스25 레포츠 28 숙박32 쇼핑 38 음식39
        if( contentTypeID != "ALL" ){
            url += ("&contentTypeId=" + contentTypeID);
        }
        */

function initMap() {
  
	map = new google.maps.Map(document.getElementById('map'), {
		center : {
			lat : 37.566095, 
			lng : 126.976988
		},
		zoom : 16
	}); 
        }
	var myLatLng = {lat: 37.5665097998, lng: 126.9781877165};
	console.log(myLatLng);
	console.log(url);
    $.getJSON(url, function(data) {
    console.log('sucess', data);
    console.log(data);
    console.log(data.response.body.items.item.overview);
    var infowindow;
            var contentString;
           	 for( var i = 0 ; i < data.response.body.totalCount ; i++){
             console.log( data.response.body.items.item[i] ); 
                /* myLatLng = {lat: parseFloat(data.response.body.items.item[i].mapy), lng: parseFloat(data.response.body.items.item[i].mapx)}; */ 
              	 contentString = "fdfdf";
              	marker = new google.maps.Marker({
      		    position: myLatLng,
      		    map: map,
      		    title : title,
      		   	draggable: true,
      	    	animation: google.maps.Animation.DROP 
      		  });
              	/* markers.push(marker); */
              	
              	infowindow = new google.maps.InfoWindow({
            	    content: contentString
            	  });
              	
              	 marker.addListener('click', function() {
              	    infowindow.open(map, marker);
              	  });

      	 }
    
        }
        
</script>
</html>