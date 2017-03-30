<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="./resources/js/jquery-3.1.1.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script async defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD_azK-PpKrUbRSAlyccxLXpUGnwagdJhQ"></script>
<title>SC13</title>
<style>
	* {
	    box-sizing: border-box;
	}
	
	[class*="col-"] {
	    float: left;
	    padding: 15px;
	    border: 1px solid black;
	}	
	
	.row::after {
	    content: "";
	    clear: both;
	    display: table;
	}
	
	.col-1 {width: 5%; height: 100%}
	.col-2 {width: 10%; height: 100%}
	.col-3 {width: 15%; height: 100%}
	.col-4 {width: 20%; height: 100%}
	.col-5 {width: 25%; height: 100%}
	.col-6 {width: 30%; height: 100%}
	.col-7 {width: 35%; height: 100%}
	.col-8 {width: 40%; height: 100%}
	.col-9 {width: 45%; height: 100%}
	.col-10 {width: 50%; height: 100%}
	.col-11 {width: 55%; height: 100%}
	.col-12 {width: 60%; height: 100%}
	.col-13 {width: 65%; height: 100%}
	.col-14 {width: 70%; height: 100%}
	.col-15 {width: 75%; height: 100%}
	.col-16 {width: 80%; height: 100%}
	.col-17 {width: 85%; height: 100%}
	.col-18 {width: 90%; height: 100%}
	.col-19 {width: 95%; height: 100%}
	.col-20 {width: 100%; height: 100%}
	
	.daylist ul {
	    list-style-type: none;
	    margin: 0;
	    padding: 0;
	}
	.daylist li {
	    padding: 8px;
	    margin-bottom: 7px;
	    background-color: #33b5e5;
	    color: #ffffff;
	    box-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);
	}
	.daylist li:hover {
	    background-color: #0099cc;
	}
	
	html, body {
		height: 100%;
		margin: 0;
		padding: 0;
	}
	
	.sidenav .closebtn {
	    position: absolute;
	    top: 0;
	    right: 10px;
	    font-size: 36px;
	    margin-left: 50px;
	}
	
	.sidenav > a {
	    padding: 8px 8px 8px 32px;
	    text-decoration: none;
	    font-size: 25px;
	    color: #818181;
	    display: block;
	    transition: 0.3s
	}

	.sidenav {
		padding: 15px 15px 15px 15px;
	    height: 100%;
	    width: 0;
	    position: fixed;
	    pointer-events: none;
	    z-index: 1;
	    top: 0;
	    left: 25%;
	    background-color: white;
	    overflow-x: hidden;	
	    transition: 0.5s;
	    opacity: 0;
	}
	
	#openNav {
		padding-left: 1px;
	    position: fixed;
	    z-index: 99;
	    left: 25%;
	}
	
</style>
	
	
  <script>
  $(function(){
	$("#add_day").on('click', function() {
		var day = '<li class="day" value='+''+'>Day'+''+'</li>';
		$("#daylist").before(day);
	});
	  
    //auto_search();
    
    $("#search").on("keyup", function(){
    	if($(this).val().length == 0){
    		var theme = $('input[type=radio][name=radio-1]:checked').val();
    		var theme2 = $('#select-1').val();
			if(typeof(theme) == 'undefined') theme = '';
			if(typeof(theme2) == 'undefined') theme2 = '';	
    		theme2_change(theme, theme2);
    	}
    });
    
    $(".radio").checkboxradio({
        icon: false
    });
    
    $('input[type=radio][name=radio-1]').on('change', function() {
    	var theme = $(this).val();
   		//alert(theme);
    	theme_change(theme);
	});
    
    $("#sortable").sortable();
    $("#sortable").disableSelection();
    
    theme2_change('', '');
  });
  
  var map;
  var myMarkers;

	function initMap() {
		var myLatLng = {
			lat : 36.242072,
			lng : 127.655798
		};
		var zoom = 7;
		map = new google.maps.Map(document.getElementById('map'), {
			center : myLatLng,
			zoom : zoom
		});
	} 
	
	/* function moveMap(Lat, Lng, zoom, data) {
		 map = new google.maps.Map(document.getElementById('map'), {
			center : {lat: Lat, 
					  lng: Lng},
			zoom : zoom
		}); 
		showMarker(data);
	} */
	
	function showMarker(data, autofill) {
		map = new google.maps.Map(document.getElementById('map'));
		myMarkers = [];
		var infowindow = new google.maps.InfoWindow();
		var bounds = new google.maps.LatLngBounds();
		var totalCount;
		var latAvg = 0;
		var lngAvg = 0;
		var firstAvgData = true;
		if(autofill){
			totalCount = data.response.body.totalCount;
		}else{
			totalCount = 50;
		}
		for (var i = 0; i < totalCount; i++) {
			if(typeof(data.response.body.items.item[i])!='undefined'){
				var lat = parseFloat(data.response.body.items.item[i].mapy);
				var lng = parseFloat(data.response.body.items.item[i].mapx);
				//console.log(data.response.body.items.item[i]);
				if(!isNaN(lat) && !isNaN(lng)){
					if(firstAvgData){
						latAvg += lat;
						lngAvg += lng;
						firstAvgData = false;
					}
					if((latAvg-0.3) < lat && lat < (latAvg+0.3) && (lngAvg-0.3)< lng && lng < (lngAvg+0.3)){
						latAvg = (latAvg + lat) / 2;
						lngAvg = (lngAvg + lng) / 2;
					}
				}
			}
		}
		//console.log(latAvg);
		//console.log(lngAvg);
		for (var i = 0; i < totalCount; i++) {
			if(typeof(data.response.body.items.item[i])!='undefined'){
				//console.log(data.response.body.items.item[i]);
			var latLng = {
				lat : parseFloat(data.response.body.items.item[i].mapy),
				lng : parseFloat(data.response.body.items.item[i].mapx)
			}
			//console.log(latLng);
			var marker = new google.maps.Marker({
				draggable : false,
				position : latLng,
				map : map,
				title : data.response.body.items.item[i].title,
				id : data.response.body.items.item[i].contentid
			});
			if(!isNaN(latLng.lat) && !isNaN(latLng.lng)){
				if((latAvg-0.3) < latLng.lat && latLng.lat < (latAvg+0.3) && (lngAvg-0.3)< latLng.lng && latLng.lng < (lngAvg+0.3)){
					//console.log(data.response.body.items.item[i].title);
					//console.log(latLng);
					myMarkers.push(marker);
					bounds.extend(marker.position);
				}else{
					//console.log(data.response.body.items.item[i].title);
					var target = '#'+data.response.body.items.item[i].contentid;
					//console.log(target);
					$(target).html('');
				}
			}else{
				//console.log(data.response.body.items.item[i].title);
				var target = '#'+data.response.body.items.item[i].contentid;
				//console.log(target);
				$(target).html('');
			}
			var content = '<div class="content">'
				+ '<div id="image">'
				+'<img src='+data.response.body.items.item[i].firstimage+' width=200 height=120>'
				+ '</div>'
				+ '<h3>'+data.response.body.items.item[i].title+'</h3>'
				+ '<h5>'+data.response.body.items.item[i].addr1+'</h5>'
				+ '<input type="button" value="자세히 보기" onclick="javascript:d_Data(' + data.response.body.items.item[i].contentid + ')"> '
				+ '<button class="add_place" onclick="javascript:add_place(\''+data.response.body.items.item[i].title+'\',\''+data.response.body.items.item[i].firstimage+'\')">일정에 추가</button>'
				+ '</div>'; 

			google.maps.event.addListener(marker,'click', (function(marker,content,infowindow){ 
			    return function() {
			        infowindow.setContent(content);
			        infowindow.open(map,marker);
			        /* var container = document.getElementById('location_info');
			        var rowToScrollTo = document.getElementById(marker.id);
			        container.scrollTop = rowToScrollTo.offsetTop; */
			        var target = "#" + marker.id;
			        $('#location_info').scrollTop(0);
			      	$('#location_info').animate({ scrollTop: $(target).offset().top - 200}, 2000);
			       	//console.log(target);
			    }; 	
			})(marker,content,infowindow));
			google.maps.event.addListener(marker,'dblclick', (function(marker,content,infowindow){ 
			    return function() {
			        infowindow.setContent(content);
			        infowindow.open(map,marker);
			    };
			})(marker,content,infowindow));
			/* marker.addListener('mouseover', function() {
				
			});
			marker.addListener('mouseout', function() {
			    
			});*/
			} 
		}
		map.fitBounds(bounds);
		//console.log(myMarkers);
		google.maps.event.addListenerOnce(map, 'bounds_changed', function() {
			if (this.getZoom() > 15) {
			    this.setZoom(15);
			}
		});
	    $('#location_info').scrollTop(0);
	}
	

	function add_place(title, firstimage) {
			
		var my_content = '';
		my_content += '<div class="my_loc">'						
		 	+ '<h4>'+ title+'</h4>'
			+ '<img src='+firstimage+' width=190 height=120><br>'
			//+ '주소: ' + data.response.body.items.item[i].addr1+'<br>'
			+ '<hr />'
			+ '</div>';
		$("#my_location").before(my_content);
	};  
  	
  function theme_change(theme) {
		var key = "fHPwwCqceBLnLCExz65uYIYEAdiAs6xOwv79o6FcLHh7x6iPmxITE9Wk7TqH1q%2F1%2FeSw9j%2FUxPbGiQYcnVa0zw%3D%3D";

		var areaCode = $('#areaCode').val();
		var sigunguCode = $('#sigunguCode').val();
		var theme2 = '';
		
		if(theme == 'A04'){
			theme2 = 'A0401';
		}else if(theme == 'A05'){
			theme2 = 'A0502';
		}
		
			var url = 
				"http://api.visitkorea.or.kr/openapi/service/rest/KorService/categoryCode?ServiceKey="+ key
				+ '&cat1=' + theme + '&cat2=' + theme2
				+ "&pageNo=1&numOfRows=10000&listYN=Y&arrange=A&MobileOS=ETC&MobileApp=AppTesting&_type=json";
			
			$.getJSON(url, function(data) {
				//console.log(data.response.body.totalCount);
				
				var content = '<select name="select-1" id="select-1">' + '<option value="">선택</option>';
				for (var i = 0; i < data.response.body.totalCount; i++) {
					//console.log(data.response.body.items.item[i]);
					content += '<option value='+data.response.body.items.item[i].code+'>'
					+ data.response.body.items.item[i].name+'</option>';
				}
				content += '</select>'
				$("#theme2_select").html(content);
				//$("#select-1").selectmenu();
				$('#select-1').on('change', function() {
					var theme = $('input[type=radio][name=radio-1]:checked').val();
					//alert(theme);
			    	var theme2 = $(this).val();
			    	//alert(theme2);
			    	theme2_change(theme, theme2);
				});
			});
		
		var url2 = 
			"http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey="+ key
			+ "&areaCode=" + areaCode + '&sigunguCode=' + sigunguCode +'&cat1=' + theme
			+ "&pageNo=1&numOfRows=10000&listYN=Y&arrange=B&MobileOS=ETC&MobileApp=AppTesting&_type=json";
		
		$.getJSON(url2, function(data) {
			auto_fill(data);
			console.log(data.response.body.totalCount);

			var content = '';
			for (var i = 0; i < 50; i++) {
				//console.log(data.response.body.items.item[i]);
				if(typeof(data.response.body.items.item[i])!='undefined'){
					content += '<div class="location" id="'+data.response.body.items.item[i].contentid
						+'" value="'+data.response.body.items.item[i].title+'">'							
					 	+ '<h4>'+ data.response.body.items.item[i].title+'</h4>'
						+ '<img src='+data.response.body.items.item[i].firstimage
						+' width=200 height=120><br>'
						+ '주소: ' + data.response.body.items.item[i].addr1+'<br>'
						+ '<input type="button" value="자세히 보기" onclick="javascript:d_Data(' + data.response.body.items.item[i].contentid + ')"> '
						+ '<button class="add_place" onclick="javascript:add_place(\''+data.response.body.items.item[i].title+'\',\''+data.response.body.items.item[i].firstimage+'\')">일정에 추가</button>'
						+ '</div>'
				}		
				$("#location_info").html(content);	
				location_event();
			}
			showMarker(data);
		});	
	}
  
  	
  function theme2_change(theme, theme2) {      
		var key = "fHPwwCqceBLnLCExz65uYIYEAdiAs6xOwv79o6FcLHh7x6iPmxITE9Wk7TqH1q%2F1%2FeSw9j%2FUxPbGiQYcnVa0zw%3D%3D";

		var areaCode = $('#areaCode').val();
		var sigunguCode = $('#sigunguCode').val();
		
		var theme3 = '';	

		if(theme == 'A04'){
			theme3 = theme2;
			theme2 = 'A0401';
		}else if(theme == 'A05'){
			theme3 = theme2;
			theme2 = 'A0502';
		}
		
		var url2 = 
			"http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey="+ key
			+ "&areaCode=" + areaCode + '&sigunguCode=' + sigunguCode + '&cat1=' + theme + '&cat2=' + theme2 + '&cat3=' + theme3
			+ "&pageNo=1&numOfRows=10000&listYN=Y&arrange=B&MobileOS=ETC&MobileApp=AppTesting&_type=json";
		
		$.getJSON(url2, function(data) {
			auto_fill(data);
			var content = '';
			if(data.response.body.totalCount == 0){
				$("#location_info").html(content);
				initMap();
				return;
			}
			for (var i = 0; i < 50; i++) {
				//console.log(data.response.body.items.item[i]);
				if(typeof(data.response.body.items.item[i])!='undefined'){
					content += '<div class="location" id="'+data.response.body.items.item[i].contentid
						+'" value="'+data.response.body.items.item[i].title+'">'							
					 	+ '<h4>'+ data.response.body.items.item[i].title+'</h4>'
						+ '<img src='+data.response.body.items.item[i].firstimage
						+' width=200 height=120><br>'
						+ '주소: ' + data.response.body.items.item[i].addr1+'<br>'
						+ '<input type="button" value="자세히 보기" onclick="javascript:d_Data(' + data.response.body.items.item[i].contentid + ')"> '
						+ '<button class="add_place" onclick="javascript:add_place(\''+data.response.body.items.item[i].title+'\',\''+data.response.body.items.item[i].firstimage+'\')">일정에 추가</button>'
						+ '</div>'
				}		
				$("#location_info").html(content);	
				location_event();	
			}
			showMarker(data);
		});	
	}
  	
  	function d_Data(contentid) {
		var key = "fHPwwCqceBLnLCExz65uYIYEAdiAs6xOwv79o6FcLHh7x6iPmxITE9Wk7TqH1q%2F1%2FeSw9j%2FUxPbGiQYcnVa0zw%3D%3D";

		var url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?ServiceKey="
				+ key;
		url += "&contentId=" + contentid
				+ "&defaultYN=Y&addrinfoYN=Y&firstImageYN=Y&overviewYN=Y";
		url += "&MobileOS=ETC&MobileApp=AppTesting&_type=json";
		
		$.getJSON(url, function(data) {
			//console.log(data.response.body.items.item);
			var content = 
				'<h2>'+ data.response.body.items.item.title+'</h2>'
				+ '<img src='+data.response.body.items.item.firstimage+' width=340 height=220>'
				+ '<h4>'+ data.response.body.items.item.overview+'</h4>'
				+ '주소: ' + data.response.body.items.item.addr1+'('+data.response.body.items.item.zipcode+')<br>';
				console.log(data.response.body.items.item.tel);
				if(typeof(data.response.body.items.item.tel) != 'undefined')
					content += '전화번호: '+ data.response.body.items.item.tel+'<br>';
				if(typeof(data.response.body.items.item.homepage) != 'undefined')
					content += '<h5>'+ data.response.body.items.item.homepage+'</h5>';
			$("#infolist").html(content);
			openDtl();
		});
	}
  	
  	function location_event(){
  		$(".location").mouseenter(function(){
	    	var title = $(this).attr("value");
	    	for(var i=0;i<myMarkers.length;i++){
	    	    if(myMarkers[i].title == title){
	    	    	myMarkers[i].setAnimation(google.maps.Animation.BOUNCE);
	    	        break;
	    	    }
	    	}
	    });
	    $(".location").mouseleave(function(){
	    	var title = $(this).attr("value");
	    	for(var i=0;i<myMarkers.length;i++){
	    	    if(myMarkers[i].title == title){
	    	    	myMarkers[i].setAnimation(null);
	    	        break;
	    	    }
	    	}
	    });
	    $(".location img").on("click", function(){
	    	var title = $(this).closest(".location").attr("value");
	    	for(var i=0;i<myMarkers.length;i++){
	    	    if(myMarkers[i].title == title){
	    	    	google.maps.event.trigger(myMarkers[i], "dblclick");
	    	        break;
	    	    }
	    	}
	    });
  	}
  
  	function auto_fill(data){
		$("#search").autocomplete({
			source: ' ',
			search: function(){
				var title = $(this).val();
				var content = '';
				var bounds = new google.maps.LatLngBounds();
				var result = false;
		   		//console.log(title);	    
				showMarker(data, true);
				//console.log(data.response.body.totalCount);
		   		for (var i = 0; i < data.response.body.totalCount; i++) {
					if(typeof(data.response.body.items.item[i])!='undefined'){
						if(data.response.body.items.item[i].title.includes(title)){
							//console.log(data.response.body.items.item[i].title);
							content += '<div class="location" id="'+data.response.body.items.item[i].title
								+'" value="'+data.response.body.items.item[i].title+'">'	
							 	+ '<h4>'+ data.response.body.items.item[i].title+'</h4>'
								+ '<img src='+data.response.body.items.item[i].firstimage
								+' width=200 height=120><br>'
								+ '주소: ' + data.response.body.items.item[i].addr1+'<br>'
								+ '<input type="button" value="자세히 보기" onclick="javascript:d_Data(' + data.response.body.items.item[i].contentid + ')"> '
								+ '<button class="add_place" onclick="javascript:add_place(\''+data.response.body.items.item[i].title+'\',\''+data.response.body.items.item[i].firstimage+'\')">일정에 추가</button>'
								+ '</div>'
							for (var j = 0; j < myMarkers.length; j++) {
								if(data.response.body.items.item[i].title == myMarkers[j].title){
									bounds.extend(myMarkers[j].position);
									result = true;
								}
							}
						}
						else{
							for (var j = 0; j < myMarkers.length; j++) {
								if(data.response.body.items.item[i].title == myMarkers[j].title){
									//console.log(myMarkers[j].title);
			    	    			myMarkers[j].setMap(null);
								}
							}
						}
					}
				}
				$("#location_info").html(content);	
				location_event();	
				if(result){
					map.fitBounds(bounds);
				}else{
					initMap();
				}
			}
		});
  	}
  	
  	function openNav() {
  		$('#map').css('left', '10%');
  		$('#openNav').css('opacity', '0');
  		$('#openNav').css('pointer-events', 'none');
  		$('#section3').css('pointer-events', 'visible');
  		$('#section3').css('opacity', '100');
  		$('#section3').css('width', '20%');
  		$("#section3").attr("class","col-4 sidenav");
  	}

  	function closeNav() {
  		$('#map').css('left', '0');
  		$('#openNav').css('opacity', '100');
  		$('#openNav').css('pointer-events', 'visible');
  		$('#section3').css('pointer-events', 'none');
  		$('#section3').css('opacity', '0');
  		$('#section3').css('width', '0');
  		$("#section3").attr("class","sidenav");
  	}
  	
  	function openDtl() {
  		$('#map').css('left', '12.5%');
  		$('#detail_info').css('opacity', '100');
  		$('#detail_info').css('pointer-events', 'visible');
  		$('#detail_info').css('width', '25%');
  		$("#detail_info").attr("class","col-4 sidenav");
  	}

  	function closeDtl() {
  		$('#map').css('left', '0');
  		$('#detail_info').css('opacity', '0');
  		$('#detail_info').css('pointer-events', 'none');
  		$('#detail_info').css('width', '0');
  		$("#detail_info").attr("class","sidenav");
  	}
  </script>
</head>
<body>

<div style="overflow:auto;" class="col-2 daylist" id="section1">
<input type="hidden" id="areaCode" value="${areaCode }">
<input type="hidden" id="sigunguCode" value="${sigunguCode }">
<ul>
<div id="daylist"></div>
<li id="add_day" value="">DAY 추가</li>
</ul>
</div>

<div style="overflow:auto;" class="col-3" id="section2">
<h1>Day1</h1>
<div id="sortable">
<div id="my_location"></div>
</div>
</div>

<div class="sidenav" id="section3">
<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
<div id="search_menu" style="height:25%;">
<div class="search_box">
  <label for="search">검색: </label>
  <input id="search">
</div>
<br>
<div class="theme_check">
    <label for="radio-1">자연</label>
    <input type="radio" class="radio" name="radio-1" id="radio-1" value="A01">
    <label for="radio-2">인문</label>
    <input type="radio" class="radio" name="radio-1" id="radio-2" value="A02">
    <label for="radio-3">레포츠</label>
    <input type="radio" class="radio" name="radio-1" id="radio-3" value="A03">
    <label for="radio-4">쇼핑</label>
    <input type="radio" class="radio" name="radio-1" id="radio-4" value="A04">
    <label for="radio-5">음식</label>
    <input type="radio" class="radio" name="radio-1" id="radio-5" value="A05">
    <label for="radio-6">클립</label>
    <input type="radio" class="radio" name="radio-1" id="radio-6" value="">
</div>
<br>
<div id="theme2_select"></div>
</div>
<div style="overflow:auto; height:75%;" id="location_info"></div>
</div>

<div style="overflow:auto;" class="sidenav" id="detail_info">
<a href="javascript:void(0)" class="closebtn" onclick="closeDtl()">&times;</a>
<div id="infolist"></div>
</div>

<div id="openNav">
<br><br><br>
<span style="font-size:30px;cursor:pointer;background:white;" onclick="openNav()">&#9776;</span>
</div>

<div class="col-15 map" id="map">
<!-- GMAP : AIzaSyD_azK-PpKrUbRSAlyccxLXpUGnwagdJhQ -->
</div>

</body>
</html>