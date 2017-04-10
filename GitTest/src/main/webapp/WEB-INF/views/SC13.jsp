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

#changelist .item {
  padding: 15px;
  cursor: pointer;
  border-bottom: solid #a7a7a7 1px;
  background-color: #fff;
  width: 100%;
  position: relative;
}
#changelist .item:hover{
   background-color:#00AEEF;
}
.item .info_title:hover{
   color: white;
}

</style>
	
	
  <script>
  $(function(){
	$("#add_day").on('click', function() {
		var order = parseInt($(".day:last").val()) + 1;
  		var last = $('.ymd:last').val();
  		var d = new Date(last);
  		d.setDate(d.getDate() + 1);
  		 var curr_date = '' + d.getDate();
		 var curr_month = '' + (d.getMonth() + 1);
		 var curr_year = d.getFullYear();
		 if (curr_month.length < 2) curr_month = '0' + curr_month;
		 if (curr_date.length < 2) curr_date = '0' + curr_date;
		 var date = curr_year + "-" + curr_month + "-" + curr_date;
		var day = '<div id="Day'+order+'" class="ordlist">'
				+ '<input type="hidden" class="areaCode" value="">'
				+ '<input type="hidden" class="sigunguCode" value="">'
				+ '<input type="hidden" class="ymd" value='+date+'>' 
				+ '<input type="hidden" class="day" value='+order+'>' 
				+ 'DAY '+order+' <br> '+date+' <br> <hr /></div>';
		$("#daylist").before(day);
		var scd_sq = $('#scd_sq').val();
		var daily_scd = {
				scd_sq: scd_sq,
				daily_ord: order,
				daily_ymd: date
			}
			$.ajax({
				type: "post",
				url: "add_day",
				data: daily_scd,
				success: function(data){
					console.log(data);
				},
				error: function(e){
					console.log(e);
				}		
			})
		$(".ordlist").off("click");
	    ordclick();
	});
	  
    //auto_search();
    
    ordclick();
    
    $("#search").on("keyup", function(){
    	if($(this).val().length == 0){
    		var theme = $('input[type=radio][name=radio-1]:checked').val();
    		var theme2 = $('#select-1').val();
			if(typeof(theme) == 'undefined') theme = '';
			if(typeof(theme2) == 'undefined') theme2 = '';	
    		theme2_change(theme, theme2);
    	}
    });
    
    $("#searchCity").on("keyup", function(){
    	if($(this).val().length == 0){
    		initCitySearch();
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
    
    sortable();
    
    theme2_change('', '');
    
    openNav();
    
    initCitySearch();
    citySearch();
  });
  
  var map;
  var myMarkers;
  var sigungu = new Array;
  var pop_cities = [{"index" : 0, "areaCode" : 1, "name" : '서울', "name_en" : "Seoul", "lat" : parseFloat(37.566535), "lng" : parseFloat(126.9779692), "is_state" : 0},
      {"areaCode" : 6, "sigunguCode" : "", "name" : '부산', "name_en" : "Busan", "lat" : parseFloat(35.1795543), "lng" : parseFloat(129.0756416), "is_state" : 0},
      {"areaCode" : 39, "sigunguCode" : "", "name" : '제주도', "name_en" : "Jeju", "lat" : parseFloat(33.4890113), "lng" : parseFloat(126.4983023), "is_state" : 0},
      {"areaCode" : 2, "sigunguCode" : "", "name" : '인천', "name_en" : "Incheon", "lat" : parseFloat(37.4562557), "lng" : parseFloat(126.7052062), "is_state" : 0},
      {"areaCode" : 3, "sigunguCode" : "", "name" : '대전', "name_en" : "Daejeon", "lat" : parseFloat(36.3504119), "lng" : parseFloat(127.3845475), "is_state" : 0},
      {"areaCode" : 4, "sigunguCode" : "", "name" : '대구', "name_en" : "Daegu", "lat" : parseFloat(35.8714354), "lng" : parseFloat(128.601445), "is_state" : 0},
      {"areaCode" : 5, "sigunguCode" : "", "name" : '광주', "name_en" : "Gwangju", "lat" : parseFloat(35.1595454), "lng" : parseFloat(126.8526012), "is_state" : 0},
      {"areaCode" : 7, "sigunguCode" : "", "name" : '울산', "name_en" : "Ulsan", "lat" : parseFloat(35.5383773), "lng" : parseFloat(129.3113596), "is_state" : 0},
      {"areaCode" : 8, "sigunguCode" : "", "name" : '세종시', "name_en" : "Sejong", "lat" : parseFloat(36.4800984), "lng" : parseFloat(127.2890354), "is_state" : 0},
      {"areaCode" : 31, "sigunguCode" : "", "name" : '경기도', "name_en" : "Gyeonggi-do", "lat" : parseFloat(37.41379999999999), "lng" : parseFloat(127.5183), "is_state" : 1},
      {"areaCode" : 32, "sigunguCode" : "", "name" : '강원도', "name_en" : "Gangwon-do", "lat" : parseFloat(37.8228), "lng" : parseFloat(128.1555), "is_state" : 1},
      {"areaCode" : 33, "sigunguCode" : "", "name" : '충청북도', "name_en" : "Chungcheongbuk-do", "lat" : parseFloat(36.8), "lng" : parseFloat(127.7), "is_state" : 1},
      {"areaCode" : 34, "sigunguCode" : "", "name" : '충청남도', "name_en" : "Chungcheongnam-do", "lat" : parseFloat(36.5184), "lng" : parseFloat(126.8), "is_state" : 1},
      {"areaCode" : 35, "sigunguCode" : "", "name" : '경상북도', "name_en" : "Gyeongsangbuk-do", "lat" : parseFloat(36.4919), "lng" : parseFloat(128.8889), "is_state" : 1},
      {"areaCode" : 36, "sigunguCode" : "", "name" : '경상남도', "name_en" : "Gyeongsangnam-do", "lat" : parseFloat(35.4606), "lng" : parseFloat(128.2132), "is_state" : 1},
      {"areaCode" : 37, "sigunguCode" : "", "name" : '전라북도', "name_en" : "Jeollabuk", "lat" : parseFloat(35.71750000000001), "lng" : parseFloat(127.153), "is_state" : 1},
      {"areaCode" : 38, "sigunguCode" : "", "name" : '전라남도', "name_en" : "Jeollanam-do", "lat" : parseFloat(34.8679), "lng" : parseFloat(126.991), "is_state" : 1}];
   
  function getSigungu(areaCode){
	  var key = "fHPwwCqceBLnLCExz65uYIYEAdiAs6xOwv79o6FcLHh7x6iPmxITE9Wk7TqH1q%2F1%2FeSw9j%2FUxPbGiQYcnVa0zw%3D%3D";
	  var sigunguCode;
      var url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaCode?ServiceKey="
           + key + "&areaCode=" + areaCode 
           + "&numOfRows=100&MobileOS=ETC&MobileApp=AppTesting&_type=json";
     $.ajax({
        type : "GET",
        url : url,
        success : function(result){
            $.each(result.response.body.items.item, function(index, val) {
           	 gUrl = "https://maps.googleapis.com/maps/api/geocode/json?"
                       + "address=" + encodeURI(val.name)
                       + "+Korea&key=AIzaSyCgFBh9I4EcWgRNl5dRa93votTaRs_eE0A";
                 $.ajax({
                    type : "GET",
                    url : gUrl,
                    async : false,
                    success : function(data){
                       var location = data.results[0].geometry.location;
                       sigungu.push({
                          "areaCode" : areaCode,
                          "sigunguCode" : val.code,
                          "name" : val.name,
                          "name_en" : "",
                          "lat" : location.lat,
                          "lng" : location.lng,
                          "is_state" : 0
                       });
                    }, error : function(e){
                       console.log(e);
                    }
                 });//ajax
              });//each
           }, error : function(e){
              console.log(e);
           }
     });//ajax
  }
  	
  	function initCitySearch(){
  		var html = '';
  		$.each(pop_cities, function(index, val){
      	  html += '<div class="item" data="'+ val.areaCode +'" data-ci_name="'+ val.name +'" data-lat="'+ val.lat +'" data-lng="' + val.lng + '" data-is_state="'+ val.is_state +'">';
            html += '<div class="img_box fl"><img src="./resources/img/city/'+val.areaCode+'.jpg"></div>';
            html += '<div class="info_box fl"><div class="info_title">'+val.name+'</div><div class="info_sub_title">'+val.name_en+'</div></div>';
            html += '<div class="clear"></div></div>';
            if(sigungu.length < 100){
	            if(val.is_state == 0){
	  				sigungu.push(val);
	  			}else{
	  				getSigungu(val.areaCode);
	  			}
            }
        });
        $('#changelist').html(html);
  	}
  	  
	function sortable(){
		$("#sortable").sortable({
        	update: function(event, ui) {
        		var itemOrder = $('#sortable').sortable("toArray");
        		console.log("sort change");
        		   for (var i = 0; i < itemOrder.length-1; i++) {
        		   		var target_span = '#'+itemOrder[i]+' > span';
        		   		var target_ord = '#'+itemOrder[i];
        		   		$(target_span).html(i+1);
        		   		$(target_ord).attr('dtl_ord', (i+1));
        		   }
        	// update order in db
        	$('.my_loc').each(function(){
        		var dtl_sq = $(this).attr('dtl_sq');
        		var dtl_ord = $(this).attr('dtl_ord');
            	var sort_change = {
                	dtl_sq: dtl_sq,
        			dtl_ord: dtl_ord
        		};
            	$.ajax({
        			type: "post",
        			url: "sort_change",
        			data: sort_change,
        			success: function(data){
        				console.log(data);
        			},
        			error: function(e){
        				console.log(e);
        			}
        		})//ajax
        	})//foreach
		
	        }//update
        });
        $("#sortable").disableSelection();
	}
	
  function ordclick(){
	  $(".ordlist").on("click", function(){
			var div_id = $(this).attr('id');
			var target = "#"+div_id;
			var areaCode = $(target+" > .areaCode").val();
			var sigunguCode = $(target+" > .sigunguCode").val();
			var ymd = $(target+" > .ymd").val();
			var day = "DAY " + $(target+" > .day").val();
			var content = '<h1 id="section2_day">'+day+'</h1>'
			+ '<div id="sortable">'
			//add places here using before(); below
			+ '<div id="my_location"></div>'
			+ '</div>';
			$('#section2').html(content);
			sortable();
			//ajax: get contents using scd_sq & daily_sq order by dtl_ord
			var scd_sq = $('#scd_sq').val();
			var daily_sq = parseInt($('#section2_day').text().match(/\d+/)[0], 10);
			var sq = {
				scd_sq: scd_sq,
				daily_sq: daily_sq
			}
			$.ajax({
				type: "post",
				url: "get_places",
				data: sq,
				dataType: "json",
				success: function(data){
					set_places(data);
				},
				error: function(e){
					console.log(e);
				}		
			})
	    });
  }
  
  function set_places(data){
	  var my_content = '';
	  $.each(data,function(index,item){
		my_content += '<div class="my_loc" id="'+item.DTL_SQ+'" dtl_sq="'+item.DTL_SQ+'" dtl_ord="'+item.DTL_ORD+'" title="'+item.PLACE_NM+'" contentid="'+item.DTL_CONTENT_ID+'">'
			+ '<span class="sec2_ord">'+item.DTL_ORD+'</span> '
			+ '<input type="hidden" id="sec2_id" value="'+item.DTL_CONTENT_ID+'">'
		 	+ item.PLACE_NM
			+ '<img src='+item.DTL_IMAGE+' width=190 height=120><br>'
			+ '<input type="button" value="삭제" onclick="javascript:delete_place('+item.DTL_SQ+');">'
			+ '<hr />'
			+ '</div>';
	  });
		$("#my_location").before(my_content);
		my_loc_event();
  }	
  
  function delete_place(dtl_sq){
	  $.ajax({
			type: "post",
			url: "delete_place",
			data: {	
				dtl_sq: dtl_sq
			},
			success: function(data){
				  $('div[class=my_loc][dtl_sq='+dtl_sq+']').trigger("mouseleave");
				  $('div[class=my_loc][dtl_sq='+dtl_sq+']').remove();
				  //$('#sortable').trigger('sortupdate');
				  var itemOrder = $('#sortable').sortable("toArray");
        			console.log("sort change");
        		   for (var i = 0; i < itemOrder.length-1; i++) {
        		   		var target_span = '#'+itemOrder[i]+' > span';
        		   		var target_ord = '#'+itemOrder[i];
        		   		$(target_span).html(i+1);
        		   		$(target_ord).attr('dtl_ord', (i+1));
        		   }
	        	// update order in db
	        	$('.my_loc').each(function(){
	        		var dtl_sq = $(this).attr('dtl_sq');
	        		var dtl_ord = $(this).attr('dtl_ord');
	            	var sort_change = {
	                	dtl_sq: dtl_sq,
	        			dtl_ord: dtl_ord
	        		};
	            	$.ajax({
	        			type: "post",
	        			url: "sort_change",
	        			data: sort_change,
	        			success: function(data){
	        				console.log(data);
	        			},
	        			error: function(e){
	        				console.log(e);
	        			}
	        		})//ajax
	        	})
				},
				error: function(e){
					console.log(e);
				}
		})
  }
		
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
				+ '<button class="add_place" onclick="javascript:add_place(\''+data.response.body.items.item[i].title+'\',\''+data.response.body.items.item[i].firstimage+'\',\''+data.response.body.items.item[i].contentid+'\')">일정에 추가</button>'
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
	

	function add_place(title, firstimage, contentid) {
		var dtl_ord = $('.sec2_ord:last').text();
		if(dtl_ord == ""){
			dtl_ord = 1;
		}else{
			dtl_ord = parseInt(dtl_ord) + 1;
		}
		
		var scd_sq = $('#scd_sq').val();
		var daily_sq = parseInt($('#section2_day').text().match(/\d+/)[0], 10);
		if(typeof(firstimage) == 'undefined'){
			firstimage = "";
		}
		
		var dtl_place = {
			scd_sq: scd_sq,
			daily_sq: daily_sq,
			dtl_ord: dtl_ord,
			dtl_content_id: contentid,
			place_nm: title,
			dtl_image: firstimage
		}
		$.ajax({
			type: "post",
			url: "detail_place",
			data: dtl_place,
			success: function(data){
				var my_content = '';
				my_content += '<div class="my_loc" id="'+dtl_ord+'" dtl_sq="'+data+'" dtl_ord="'+dtl_ord+'" title="'+title+'" contentid="'+contentid+'">'
					+ '<span class="sec2_ord">'+dtl_ord+'</span> '
					+ '<input type="hidden" id="sec2_id" value="'+contentid+'">'
				 	+ title
					+ '<img src='+firstimage+' width=190 height=120><br>'
					+ '<input type="button" value="삭제" onclick="javascript:delete_place('+data+');">'
					+ '<hr />'
					+ '</div>';
				$("#my_location").before(my_content);
				my_loc_event();
			},
			error: function(e){
				console.log(e);
			}
		})
	};  
  	
  function theme_change(theme) {
		var key = "fHPwwCqceBLnLCExz65uYIYEAdiAs6xOwv79o6FcLHh7x6iPmxITE9Wk7TqH1q%2F1%2FeSw9j%2FUxPbGiQYcnVa0zw%3D%3D";

		var areaCode = $("#areaCode").val();
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
						+ '<button class="add_place" onclick="javascript:add_place(\''+data.response.body.items.item[i].title+'\',\''+data.response.body.items.item[i].firstimage+'\',\''+data.response.body.items.item[i].contentid+'\')">일정에 추가</button>'
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
		console.log(areaCode);
		console.log(sigunguCode);
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
						+ '<button class="add_place" onclick="javascript:add_place(\''+data.response.body.items.item[i].title+'\',\''+data.response.body.items.item[i].firstimage+'\',\''+data.response.body.items.item[i].contentid+'\')">일정에 추가</button>'
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
				if(typeof(data.response.body.items.item.tel) != 'undefined')
					content += '전화번호: '+ data.response.body.items.item.tel+'<br>';
				if(typeof(data.response.body.items.item.homepage) != 'undefined')
					content += '<h5>'+ data.response.body.items.item.homepage+'</h5>';
			$("#infolist").html(content);
			openDtl();
		});
	}
  	
  	function city_change() {
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
  	
  	function my_loc_event(){
  		$(".my_loc").mouseenter(function(){
	    	var title = $(this).attr("title");
	    	for(var i=0;i<myMarkers.length;i++){
	    	    if(myMarkers[i].title == title){
	    	    	myMarkers[i].setAnimation(google.maps.Animation.BOUNCE);
	    	        break;
	    	    }
	    	}
	    });
	    $(".my_loc").mouseleave(function(){
	    	var title = $(this).attr("title");
	    	for(var i=0;i<myMarkers.length;i++){
	    	    if(myMarkers[i].title == title){
	    	    	myMarkers[i].setAnimation(null);
	    	        break;
	    	    }
	    	}
	    });
	    $(".my_loc img").on("click", function(){
	    	var id = $(this).closest(".my_loc").attr("contentid");
	    	d_Data(id);
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
								+ '<button class="add_place" onclick="javascript:add_place(\''+data.response.body.items.item[i].title+'\',\''+data.response.body.items.item[i].firstimage+'\',\''+data.response.body.items.item[i].contentid+'\')">일정에 추가</button>'
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
  	
  	function citySearch(){
		$("#searchCity").autocomplete({
			source: ' ',
			search: function(){
				var searchText = $(this).val();
				var content = '';
		   		console.log(searchText);	  
				//{"areaCode" : 6, "sigunguCode" : "", "name" : '부산', "name_en" : "Busan", "lat" : parseFloat(35.1795543), "lng" : parseFloat(129.0756416), "is_state" : 0},
		   		for (var i in sigungu) {
					if(sigungu[i].name.includes(searchText)){
						content += '<div class="item" data="'+ sigungu[i].areaCode +'" data2="'+ sigungu[i].sigunguCode +'" data-ci_name="'+ sigungu[i].name +'" data-lat="'+ sigungu[i].lat +'" data-lng="' + sigungu[i].lng + '" data-is_state="'+ sigungu[i].is_state +'">'
							+ '<div class="img_box fl"><img src="./resources/img/city/'+sigungu[i].areaCode+'.jpg"></div>'
						 	+ '<div class="info_box fl"><div class="info_title">'+sigungu[i].name+'</div><div class="info_sub_title">'+sigungu[i].name_en+'</div></div>'
							+ '<div class="clear"></div></div>';
					}
				}
				$("#changelist").html(content);	
				city_change_event();
			}
		});
  	}
  	
  	function city_change_event(){
  		$('.item').on('click', function(){
  			var areaCode = $(this).attr('data');
  			var sigunguCode = $(this).attr('data2');
  			if(typeof(sigunguCode) == 'undefined'){
  				sigunguCode = "";
  			}
  			$('#areaCode').val(areaCode);
  			$('#sigunguCode').val(sigunguCode);
  			theme2_change('', '');
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

  	function openCitySearch() {
  		$('#map').css('left', '10%');
  		$('#city_change').css('opacity', '100');
  		$('#city_change').css('pointer-events', 'visible');
  		$('#city_change').css('width', '20%');
  		$("#city_change").attr("class","col-4 sidenav");
  	}

  	function closeCitySearch() {
  		$('#map').css('left', '0');
  		$('#city_change').css('opacity', '0');
  		$('#city_change').css('pointer-events', 'none');
  		$('#city_change').css('width', '0');
  		$("#city_change").attr("class","sidenav");
  	}
  </script>
</head>
<body>
<input type="hidden" id="scd_sq" value="${schedule.scd_sq }">
<input type="hidden" id="areaCode" value="${dailyList[0].AREA_CODE }">
<input type="hidden" id="sigunguCode" value="${dailyList[0].SIGUNGU_CODE }">
<div style="overflow:auto;" class="col-2 daylist" id="section1">
<ul>

<c:forEach var="daily" items="${dailyList }">
<div id="Day${daily.DAILY_ORD }" class="ordlist">
<input type="hidden" class="areaCode" value="${daily.AREA_CODE }">
<input type="hidden" class="sigunguCode" value="${daily.SIGUNGU_CODE }">
<input type="hidden" class="ymd" value=${daily.DAILY_YMD }>
<input type="hidden" class="day" value=${daily.DAILY_ORD }>
DAY ${daily.DAILY_ORD } <br>
${daily.DAILY_YMD } <br>
${daily.CITY_NM }
<hr />
</div>
</c:forEach>
<div id="daylist"></div>
<li id="add_day" value="">DAY 추가</li>
</ul>
</div>

<div style="overflow:auto;" class="col-3" id="section2">
<h1 id="section2_day">DAY 1</h1>
<div id="sortable">
<div id="my_location"></div>
</div>
</div>

<div class="sidenav" id="section3">
<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
<div id="search_menu" style="height:25%;">
<div>
${dailyList[0].CITY_NM }
<input type="button" value="도시변경" onclick="javascript:openCitySearch();">
</div>
<div class="search_box">
  <label for="search">검색: </label>
  <input id="search">
<br><br>
</div>
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

<div style="overflow:auto;" class="sidenav" id="city_change">
<a href="javascript:void(0)" class="closebtn" onclick="closeCitySearch()">&times;</a>
<div style="overflow:auto; height:7%;" id="change_search">
<label for="searchCity">검색: </label>
<input id="searchCity">
</div>
<div style="overflow:auto; height:93%;" id="changelist"></div>
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