<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="./resources/js/jquery-3.1.1.js"></script>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script   src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD_azK-PpKrUbRSAlyccxLXpUGnwagdJhQ"></script>
<link rel="stylesheet" href="./resources/css/bootstrap.css">
<script src="./resources/js/bootstrap.js"></script>
<style>
/* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
#map {
   float: left;
   width: 80%;
   height: 100%;
}
input[type=button], button {
	color: #333;
    background-color: #fff;
    border-color: #ccc;
    padding: 1px 8px;
    font-size: 12px;
    line-height: 1.5;
    border-radius: 3px;
    display: inline-block;
    text-align: center;
    white-space: nowrap;
    vertical-align: middle;
    touch-action: manipulation;
    cursor: pointer;
    user-select: none;
    background-image: none;
    border: 2.5px solid wheat;
    margin-top: 5px;
    margin-bottom: 5px;
   }
.labels {
     color: #363636;
     background-color: white;
     font-family: "nanum";
     font-size: 11px;
     font-weight: bold;
     text-align: center;
     min-width: 40px;
    padding:2px;
     border: 1px solid black;
     white-space: nowrap;
   }
   
.item .img_box {
  width: 60px;
  height: 50px;
  position: relative;
  float: left;
}

.item .img_box img {
  width: 60px;
  height: 50px;
}

.item_sub_info_box{color:#707070;font-size:13px;position:absolute;bottom:0px;left:0px}
.item .info_box{padding:1px;width:180px;}
.item .info_title{font-size:15px;color:#363636;}
.item .info_sub_title{font-size:12px;color:#b3b3b3;margin-top:5px;width:180px;}
.back_btn{width:60px;height:50px;background:#00AEEF;margin-top:22px;cursor:pointer;}

#pop_city_list_box .item {
  padding: 15px;
  cursor: pointer;
  border-bottom: solid #a7a7a7 1px;
  background-color: #fff;
  width: 100%;
  position: relative;
}
#pop_city_list_box .item:hover{
   background-color:#00AEEF;
}
.item .info_title:hover{
   color: white;
}

#pop_city_list_box {
   float: left;
   width: 20%;
   height: 100%;
   overflow: scroll
}

#city_list_box .item {
  padding: 15px;
  cursor: pointer;
  border-bottom: solid #a7a7a7 1px;
  background-color: #fff;
  width: 100%;
  position: relative;
}
#city_list_box .item:hover{
   background-color:#00AEEF;
}

#city_list_box {
   float: left;
   width: 20%;
   height: 100%;
   overflow: scroll
}

/* Optional: Makes the sample page fill the window. */
html, body {
   height: 100%;
   margin: 0;
   padding: 0;
}
</style>

<script type="text/javascript">
   var tourKey = "mAI%2FYXQZ6r2tOuKRb5BjfkHXavB%2BYidXtnLge18Ft%2Fzx2OvvU2Eq7za7nmbfumFdLtG7IOLQSoDYF2pAcMd3aw%3D%3D";
   var googleKey = "AIzaSyCgFBh9I4EcWgRNl5dRa93votTaRs_eE0A";
   var option = {
      center : {
         lat : 35.907757,
         lng : 127.766922
      },
      zoom : 7
   };
   var map;
   var pop_cities = [{"index" : 0, "areaCode" : 1, "name" : '서울', "name_en" : "Seoul", "lat" : parseFloat(37.566535), "lng" : parseFloat(126.9779692), "is_state" : 0},
      {"index" : 1, "areaCode" : 6, "name" : '부산', "name_en" : "Busan", "lat" : parseFloat(35.1795543), "lng" : parseFloat(129.0756416), "is_state" : 0},
      {"index" : 2, "areaCode" : 39, "name" : '제주도', "name_en" : "Jeju", "lat" : parseFloat(33.4890113), "lng" : parseFloat(126.4983023), "is_state" : 0},
      {"index" : 3, "areaCode" : 2, "name" : '인천', "name_en" : "Incheon", "lat" : parseFloat(37.4562557), "lng" : parseFloat(126.7052062), "is_state" : 0},
      {"index" : 4, "areaCode" : 3, "name" : '대전', "name_en" : "Daejeon", "lat" : parseFloat(36.3504119), "lng" : parseFloat(127.3845475), "is_state" : 0},
      {"index" : 5, "areaCode" : 4, "name" : '대구', "name_en" : "Daegu", "lat" : parseFloat(35.8714354), "lng" : parseFloat(128.601445), "is_state" : 0},
      {"index" : 6, "areaCode" : 5, "name" : '광주', "name_en" : "Gwangju", "lat" : parseFloat(35.1595454), "lng" : parseFloat(126.8526012), "is_state" : 0},
      {"index" : 7, "areaCode" : 7, "name" : '울산', "name_en" : "Ulsan", "lat" : parseFloat(35.5383773), "lng" : parseFloat(129.3113596), "is_state" : 0},
      {"index" : 8, "areaCode" : 8, "name" : '세종시', "name_en" : "Sejong", "lat" : parseFloat(36.4800984), "lng" : parseFloat(127.2890354), "is_state" : 0},
      {"index" : 9, "areaCode" : 31, "name" : '경기도', "name_en" : "Gyeonggi-do", "lat" : parseFloat(37.41379999999999), "lng" : parseFloat(127.5183), "is_state" : 1},
      {"index" : 10, "areaCode" : 32, "name" : '강원도', "name_en" : "Gangwon-do", "lat" : parseFloat(37.8228), "lng" : parseFloat(128.1555), "is_state" : 1},
      {"index" : 11, "areaCode" : 33, "name" : '충청북도', "name_en" : "Chungcheongbuk-do", "lat" : parseFloat(36.8), "lng" : parseFloat(127.7), "is_state" : 1},
      {"index" : 12, "areaCode" : 34, "name" : '충청남도', "name_en" : "Chungcheongnam-do", "lat" : parseFloat(36.5184), "lng" : parseFloat(126.8), "is_state" : 1},
      {"index" : 13, "areaCode" : 35, "name" : '경상북도', "name_en" : "Gyeongsangbuk-do", "lat" : parseFloat(36.4919), "lng" : parseFloat(128.8889), "is_state" : 1},
      {"index" : 14, "areaCode" : 36, "name" : '경상남도', "name_en" : "Gyeongsangnam-do", "lat" : parseFloat(35.4606), "lng" : parseFloat(128.2132), "is_state" : 1},
      {"index" : 15, "areaCode" : 37, "name" : '전라북도', "name_en" : "Jeollabuk", "lat" : parseFloat(35.71750000000001), "lng" : parseFloat(127.153), "is_state" : 1},
      {"index" : 16, "areaCode" : 38, "name" : '전라남도', "name_en" : "Jeollanam-do", "lat" : parseFloat(34.8679), "lng" : parseFloat(126.991), "is_state" : 1}];
   
   var markers = new Array;
   var sigungu = new Array;
   var infowindows = new Array;
   var nowSide;
   
   function initMap() {
      map = new google.maps.Map(document.getElementById('map'), option);
   }

   $(function() {
      //나중에 DB에서 cities 가지고 와야함
      initMap();
      makeSide('#pop_city_list_box', pop_cities);
   });
   function makeSide(where, city){
      var html="";
	   if(where == '#pop_city_list_box'){
		   $('#pop_city_list_box').show();
		   $('#city_list_box').hide();
		   $('#back_btn').hide();
		   nowSide = '#pop_city_list_box';
	   }
	   else{
		   $('#pop_city_list_box').hide();
		   $('#city_list_box').show();
		   html += '<div class=back_btn id=back_btn><img scr="./resources/img/city/back_btn">전국으로</div>'; 
		   $('#back_btn').show();
		   nowSide = '#city_list_box';
	   }
      
      $.each(city, function(index, val){
    	  html += '<div class="item" data-no="'+ index +'" data="'+ val.areaCode +'" data-ci_name="'+ val.name +'" data-lat="'+ val.lat +'" data-lng="' + '" data-is_state="'+ val.is_state +'">';
          html += '<div class="img_box fl"><img src="./resources/img/city/'+val.areaCode+'.jpg"></div>';
          html += '<div class="info_box fl"><div class="info_title">'+val.name+'</div><div class="info_sub_title">'+val.name_en+'</div></div>';
          html += '<div class="clear"></div></div>';
          makeMarker(val);
      });
      $(where).html(html);
      location_event();
	  $(where).off("click");
      $(where).on('click','.item',function(){
         var index = $(this).attr('data-no');
         var is_state = $(this).attr('data-is_state');
         var title = $(this).attr("data-ci_name");
         
         if(is_state == 1){
        	 var focusMarker = new google.maps.LatLng(city[index].lat, city[index].lng);
             map.setCenter(focusMarker);
             map.setZoom(9);
        	deleteMarkers();
            getDetail(city[index].areaCode);
         }else{
 	    	for(var i=0;i<markers.length;i++){
 	    	    if(markers[i].title == title){
 	    	    	selectSigungu(city[index], markers[i]);
 	    	        break;
 	    	    }
 	    	}
         }
      });
   }
   
   function location_event(){
	    $('.back_btn').on('click',function(){
		    initMap();
	 	    makeSide('#pop_city_list_box', pop_cities);
	    });
 		$(".item").mouseenter(function(){
	    	var title = $(this).attr("data-ci_name");
	    	for(var i=0;i<markers.length;i++){
	    	    if(markers[i].title == title){
	    	    	markers[i].setAnimation(google.maps.Animation.BOUNCE);
	    	        break;
	    	    }
	    	}
	    });
	    $(".item").mouseleave(function(){
	    	var title = $(this).attr("data-ci_name");
	    	for(var i=0;i<markers.length;i++){
	    	    if(markers[i].title == title){
	    	    	markers[i].setAnimation(null);
	    	        break;
	    	    }
	    	}
	    });
 	}
   
   function makeMarker(city){
        var marker = new google.maps.Marker({
            position: new google.maps.LatLng(city.lat, city.lng),
            map: map,
            title: city.name,
            lat:city.lat,
            lng:city.lng,
            labelContent: city.name,
          labelAnchor: new google.maps.Point(-11, 30),
         labelClass: "labels", // the CSS class for the label
          labelStyle: {opacity: 0.75}
        });
        markers.push(marker);
        addMarkerListener(marker);
        return marker;
   }
   
   function deleteMarkers() {
      clearMarkers();
      markers = [];
   }
   
   function clearMarkers() {
      setAllMap(null);
   }
   
   function setAllMap(map) {
       for (var i = 0; i < markers.length; i++) {
         markers[i].setMap(map);
        }
   }
   
   function deleteInfoWindows(){
	   $.each(infowindows, function(index, infowindow){
		   infowindow.setContent(null);
		   infowindow.close();
		   infowindows = [];
	   })
   }
   
   function getDetail(areaCode){
	   var sigunguCode;
      var url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaCode?ServiceKey="
            + tourKey + "&areaCode=" + areaCode 
            + "&numOfRows=100&MobileOS=ETC&MobileApp=AppTesting&_type=json";
      $.ajax({
         type : "GET",
         url : url,
         async : false,
         success : function(result){
        	 var cities = [];
      	   var html='<div class=back_btn id=back_btn><img scr="./resources/img/city/back_btn">전국으로</div>'; 
             $.each(result.response.body.items.item, function(index, val) {
            	 gUrl = "https://maps.googleapis.com/maps/api/geocode/json?"
                        + "address=" + encodeURI(val.name)
                        + "+Korea&key=AIzaSyCgFBh9I4EcWgRNl5dRa93votTaRs_eE0A";
                  $.ajax({
                     type : "GET",
                     url : gUrl,
                     success : function(data){
                        var location = data.results[0].geometry.location;
                        var city = {
                                "index" : val.rnum,
                                "areaCode" : areaCode,
                                "sigunguCode" : val.code,
                                "name" : val.name,
                                "name_en" : "",
                                "lat" : location.lat,
                                "lng" : location.lng,
                                "is_state" : 0
                             };
                        cities.push(city);
                        html += '<div class="item" data-no="'+ val.rnum +'" data="'+ areaCode +'" data-ci_name="'+ val.name +'" data-lat="'+ location.lat +'" data-lng="'+ location.lng +'" data-is_state="'+ 0 +'">';
                        html += '<div class="img_box fl"><img src="./resources/img/city/'+areaCode+'.jpg"></div>';
                        html += '<div class="info_box fl"><div class="info_title">'+val.name+'</div><div class="info_sub_title">'+""+'</div></div>';
                        html += '<div class="clear"></div></div>';
                        $('#city_list_box').html(html);
                        makeMarker(city);
             		   	location_event();
             		  	$('.item').on('click',function(){
             		        var index = $(this).attr('data-no');
             		    	var title = $(this).attr("data-ci_name");
	             		 	for(var i=0;i<markers.length;i++){
	           	    	   	 if(markers[i].title == title){
	           	    	    		selectSigungu(cities[index-1], markers[i]);
	           	    	    	    break;
	           	    	  	  }
	           	    		}
             		  	});
                     }, error : function(e){
                        console.log(e);
                     }
                  });//ajax
               });//each
               $('#pop_city_list_box').hide();
    		   $('#city_list_box').show();
    		   $('#back_btn').show();
    		   nowSide = '#city_list_box';	
            }, error : function(e){
               console.log(e);
            }
      });//ajax
   }
   
   function selectSigungu(city, marker){
	   /* var focusMarker = new google.maps.LatLng(city.lat, city.lng);
       map.setCenter(focusMarker);
       map.setZoom(11); */
       	var sigungu_code = city.sigunguCode;
  		var city_nm = city.name.toString();
   	 	if(typeof(sigungu_code) == 'undefined' || sigungu_code == 'undefined') sigungu_code = "";
       var content = '<div class="content">'
           + '<div id="image">'
           +'<img src=./resources/img/city/'+city.areaCode+'.jpg width=200 height=120>'
           + '</div>'
           + '<h3 id="firstHeading" class="firstHeading">'+city.name+'</h3>'
           + '<div id="bodyContent">'
           + '<a href="sc_05?areacode='+city.areaCode+'&sigungucode='+sigungu_code+'&city_nm='+city_nm+'">'
           + '<input type="button" value="자세히 보기"></a>'
           + '<input type="button" value="일정 만들기" onclick="make_schedule('+city.areaCode+', '+city.sigunguCode+', '+city.lat+', '+city.lng+', \''+city.name+'\')" />'
           + '</div>' + '</div>';   
       
           deleteInfoWindows();
	   var infowindow = new google.maps.InfoWindow();
	   infowindow.setContent('');
	   infowindow.setContent(content);
	   infowindow.open(map,marker);
	   infowindows.push(infowindow);
   }
   
   function addMarkerListener(marker){
	   google.maps.event.addListener(marker, 'click', function() {
		   var city = marker.title;
		   $(".item").each(function(index,item){
				if($(this).attr('data-ci_name') == marker.title){
					$(this).trigger("click");
				}
			})
        });
   }
   
   function make_schedule(areaCode, sigunguCode, lat, lng, name){
	   if(typeof(sigunguCode) == 'undefined'){
		   sigunguCode = 0;
	   }
	   document.getElementById('areaCode').value = areaCode;
	   document.getElementById('sigunguCode').value = sigunguCode;
	   document.getElementById('lat').value = lat;
	   document.getElementById('lng').value = lng;
	   document.getElementById('name').value = name;
	   document.getElementById('form').submit();
   }
   
</script>

<title>지도로 검색</title>
</head>
<body>
   <div id="pop_city_list_box"></div>
   <div id="city_list_box"></div>
   <div id="map"></div>
	<form action="make_schedule" method="post" id="form">
		<input type="hidden" id="areaCode" name="areaCode">
		<input type="hidden" id="sigunguCode" name="sigunguCode">
		<input type="hidden" id="lat" name="lat">
		<input type="hidden" id="lng" name="lng">
		<input type="hidden" id="name" name="name">
	</form>
</body>
</html>