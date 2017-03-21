<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<meta charset="utf-8">
<title>Simple markers</title>
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

<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.1.1.js"/>"></script>

</head>
<body>
	<div id="map"></div>
	<script>
	var myLatLng;
	var map;
	
		function initMap() {
			    myLatLng = {
				lat : -25.363,
				lng : 131.044
			};

			map = new google.maps.Map(document.getElementById('map'), {
				zoom : 3,
				center : myLatLng
			});

			//좌표
			  var marker = new google.maps.Marker({
			 position: myLatLng,
			 map: map,
			 title: 'Map map map'
			 }); 

			var key = "fHPwwCqceBLnLCExz65uYIYEAdiAs6xOwv79o6FcLHh7x6iPmxITE9Wk7TqH1q%2F1%2FeSw9j%2FUxPbGiQYcnVa0zw%3D%3D";

			var lat = 126.748025;
			var lng = 37.519114;
			var radius = 500;
			var title;
			var url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/locationBasedList?ServiceKey="
					+ key;
			url += "&mapX=" + lng + "&mapY=" + lat + "&radius=" + radius + "&title=" + title;
			url += "&pageNo=1&numOfRows=1000&listYN=Y&arrange=A&MobileOS=ETC&MobileApp=AppTesting&_type=json";

			/* 특정 타입만 보고 싶을 때 type기입 관광지:12, 문화시설: 14 축제 : 15 코스25 레포츠 28 숙박32 쇼핑 38 음식39
			if( contentTypeID != "ALL" ){
			    url += ("&contentTypeId=" + contentTypeID);
			}
			 */

			console.log(url);
			$.getJSON(url, function(data) {
				console.log('success', data);
				for (var i = 0; i < data.response.body.totalCount; i++) {
					console.log(data.response.body.items.item[i].mapx); // items.item[i]
					 myLatLng = { lat: parseFloat(data.response.body.items.item[i].mapy), lng : parseFloat(data.response.body.items.item[i].mapx)}
					 console.log(myLatLng); 
					 var marker = new google.maps.Marker({
						position : myLatLng,
						map : map,
						title : 'Map map map'
					}); 

				}
			});

		}
	</script>
	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCW-Yin1kq0i_E_hqmkCdFXNWIaJLRoUN8&callback=initMap"></script>
</body>
</html>