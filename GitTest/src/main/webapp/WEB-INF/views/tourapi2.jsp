<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>seanlee22</title>
<style type="text/css">
html, body {
	height: 100%;
	margin: 0;
	padding: 0;
}

#map {
	height: 70%;
}
</style>
</head>
<body>
	<!-- GMAP : AIzaSyD_azK-PpKrUbRSAlyccxLXpUGnwagdJhQ -->
	<div id="map"></div>

	<button type="button" id="btnKto" onClick="Javascript:l_Data();">위치기반조회</button>
</body>

<script type="text/javascript"
	src="<c:url value="/resources/js/jquery-3.1.1.js"/>"></script>
<script async defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD_azK-PpKrUbRSAlyccxLXpUGnwagdJhQ&callback=initMap"></script>



<!-- <script type="text/javascript" src="http://apis.daum.net/maps/maps3.js?apikey=다음앱키"></script>

<script type="text/javascript" src="./js/drawingmap.gs.js"> </script>
<script type="text/javascript" src="./js/geolocation.gs.js"> </script>

<link rel="stylesheet" type="text/css" href="./css/daumstyle.css"> -->

<script language="javascript">
	/*     function init(){            
	        //geolocation.gs.js
	        geoLocation();
	    }
	    window.onload=init();
	 */

	var map;

	function initMap() {
		var myLatLng = {
			lat : 37.566535,
			lng : 126.97796919999999
		};
		var zoom = 15;
		map = new google.maps.Map(document.getElementById('map'), {
			center : myLatLng,
			zoom : zoom
		});
	}

	function moveMap(myLatLng, zoom, data) {
		map = new google.maps.Map(document.getElementById('map'), {
			center : myLatLng,
			zoom : zoom
		});
		showMarker(data);
	}
	
	function showMarker(data) {
		var infowindow = new google.maps.InfoWindow();
		for (var i = 0; i < data.response.body.totalCount; i++) {
			var latLng = {
				lat : data.response.body.items.item[i].mapy,
				lng : data.response.body.items.item[i].mapx
			}
			var marker = new google.maps.Marker({
				draggable : false,
				position : latLng,
				map : map,
				title : data.response.body.items.item[i].title
			});	
			
			var content = '<div class="content">'
				+ '<div id="image">'
				+'<img src='+data.response.body.items.item[i].firstimage+' width=200 height=120>'
				+ '</div>'
				+ '<h1 id="firstHeading" class="firstHeading">'+data.response.body.items.item[i].title+'</h1>'
				+ '<div id="bodyContent">'
				+ '<input type="button" value="자세히 보기" onclick="javascript:d_Data(' + data.response.body.items.item[i].contentid + ')">'
				+ '</div>' + '</div>'; 

			google.maps.event.addListener(marker,'click', (function(marker,content,infowindow){ 
			    return function() {
			        infowindow.setContent(content);
			        infowindow.open(map,marker);
			    };
			})(marker,content,infowindow)); 

		}
	}

	function l_Data() {
		var key = "fHPwwCqceBLnLCExz65uYIYEAdiAs6xOwv79o6FcLHh7x6iPmxITE9Wk7TqH1q%2F1%2FeSw9j%2FUxPbGiQYcnVa0zw%3D%3D";

		var lat = 37.566535;
		var lng = 126.97796919999999;
		var myLatLng = {
			lat : 37.566535,
			lng : 126.97796919999999
		};
		var radius = 400;

		var url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/locationBasedList?ServiceKey="
				+ key;
		url += "&mapX=" + lng + "&mapY=" + lat + "&radius=" + radius;
		url += "&pageNo=1&numOfRows=1000&listYN=Y&arrange=A&MobileOS=ETC&MobileApp=AppTesting&_type=json";

		// 특정 타입만 보고 싶을 때 type기입 관광지:12, 문화시설: 14 축제 : 15 코스25 레포츠 28 숙박32 쇼핑 38 음식39
		var contentTypeID = 15;
		if (contentTypeID != "ALL") {
			url += ("&contentTypeId=" + contentTypeID);
		}

		console.log(url);
		$.getJSON(url, function(data) {
			console.log('sucess', data);
			moveMap(myLatLng, 15, data);
			for (var i = 0; i < data.response.body.totalCount; i++) {
				console.log(data.response.body.items.item[i]);
			}
		});
	}

	function d_Data(contentid) {
		var key = "fHPwwCqceBLnLCExz65uYIYEAdiAs6xOwv79o6FcLHh7x6iPmxITE9Wk7TqH1q%2F1%2FeSw9j%2FUxPbGiQYcnVa0zw%3D%3D";

		var url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?ServiceKey="
				+ key;
		url += "&contentId=" + contentid
				+ "&defaultYN=Y&addrinfoYN=Y&overviewYN=Y";
		url += "&MobileOS=ETC&MobileApp=AppTesting&_type=json";
		
		$.getJSON(url, function(data) {
			console.log('sucess detail data');
			console.log(data.response.body.items.item);
			var content = 
				'<h2>'+ data.response.body.items.item.title+'</h2>'
				+ '<h4>'+ data.response.body.items.item.overview+'</h4>'
				+ '주소: ' + data.response.body.items.item.addr1+'('+data.response.body.items.item.zipcode+')<br>'
				+ '전화번호: '+ data.response.body.items.item.tel+'<br>'
				+ data.response.body.items.item.homepage;
			$("#detail").html(content);
		});
	}
</script>
<div id="detail"></div>
</html>
