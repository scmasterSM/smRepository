<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="./resources/js/jquery-3.1.1.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="./resources/css/bootstrap.css">
<script src="./resources/js/bootstrap.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script   src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD_azK-PpKrUbRSAlyccxLXpUGnwagdJhQ"></script>
<style>
/* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
#map {
   float: left;
   width: 80%;
   height: 100%;
   left: 20%;
   z-index: 1;
   position: absolute;
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
    border: 2px solid wheat;
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
   overflow: scroll;
   border: 1px solid black;
}

/* Optional: Makes the sample page fill the window. */
html, body {
   height: 100%;
   margin: 0;
   padding: 0;
}

.sidenav {
		padding: 15px 15px 15px 15px;
	    height: 40%;
	    width: 20%;
	    position: fixed;
	    top: 0;
	    left: 20%;
	    background-color: white;
	    overflow-x: hidden;	
	    transition: 0.5s;
	    box-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);
	    border: 1px solid black;
	    z-index: 99;
	}

.sidenav2 {
		padding: 15px 15px 15px 15px;
	    height: 40%;
	    width: 20%;
	    position: fixed;
	    top: 0;
	    left: 20%;
	    background-color: white;
	    overflow-x: hidden;	
	    transition: 0.5s;
	    box-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);
	    border: 1px solid black;
	    z-index: 99;
	    opacity: 0;
	    pointer-events: none;
	}
		
.city {
	width: 100%;
 	 position: relative;
}

.form-con {
    /* display: block; */
    /* width: 100%; */
    /* height: 34px; */
    padding: 6px 12px;
    font-size: 14px;
    line-height: 1.42857143;
    color: #555;
    background-color: #fff;
    background-image: none;
    border: 1px solid #ccc;
    border-radius: 4px;
    -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
    box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
    -webkit-transition: border-color ease-in-out .15s, -webkit-box-shadow ease-in-out .15s;
    -o-transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
    transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
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
   
   var markers = [];
   var sigungu = [];
   var nowSide;
   
   function initMap() {
      map = new google.maps.Map(document.getElementById('map'), option);
   }

   $(function() {
      //나중에 DB에서 cities 가지고 와야함
      initMap();
      makeSide('#pop_city_list_box', pop_cities);
      $("#start_ymd").datepicker({
    	  dateFormat: "yy-mm-dd"
      });
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
         
         if(is_state == 1){
             var focusMarker = new google.maps.LatLng(city[index].lat, city[index].lng);
             map.setCenter(focusMarker);
             map.setZoom(9);
        	 deleteMarkers();
             getDetail(city[index].areaCode);
         }
      });
   }
   
   function makeMarker(city){
	   var sigunguCode = '';
	   if(typeof(city.sigunguCode) != 'undefined'){
		   sigunguCode = city.sigunguCode;
	   }
        var marker = new google.maps.Marker({
            position: new google.maps.LatLng(city.lat, city.lng),
            map: map,
            title: city.name,
            lat:city.lat,
            lng:city.lng,
            labelContent: city.name,
            labelAnchor: new google.maps.Point(-11, 30),
            labelClass: "labels", // the CSS class for the label
            labelStyle: {opacity: 0.75},
            areaCode: city.areaCode,
            sigunguCode: sigunguCode
        });
        markers.push(marker);
        addMarkerListener(marker);
        return marker;
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
	    $(".item").on("click", function(){
 	    	var title = $(this).closest(".item").attr("data-ci_name");
 	    	for(var i=0;i<markers.length;i++){
 	    	    if(markers[i].title == title){
 	    	    	google.maps.event.trigger(markers[i], "click");
 	    	        break;
 	    	    }
 	    	}
 	    });
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
                        html += '<div class="item" data-no="'+ val.rnum +'" data="'+ areaCode +'" data-ci_name="'+ val.name +'" data-lat="'+ location.lat +'" data-lng="'+ location.lng +'" data-is_state="'+ 0 +'">';
                        html += '<div class="img_box fl"><img src="./resources/img/city/'+areaCode+'.jpg"></div>';
                        html += '<div class="info_box fl"><div class="info_title">'+val.name+'</div><div class="info_sub_title">'+""+'</div></div>';
                        html += '<div class="clear"></div></div>';
                        $('#city_list_box').html(html);
             		   location_event();
                        makeMarker(city);
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
   
   var city_count = 1;
   var daycount = 1;
   
   function addMarkerListener(marker){
	   google.maps.event.addListener(marker, 'click', function() {
		   var title = marker.title;
		   var flag = 1;
		   $.each(pop_cities, function(index, val){
		    	  if(title == val.name && val.is_state == 1){
		    		  flag = 0;
		    	  }
		      });
		   if(flag == 1){
				city_count++;
				var a_name = 'areaCode'+city_count;
				var s_name = 'sigunguCode'+city_count;
				var c_name = 'city'+city_count;
				var days = 'days'+city_count;
			    var city = '';
			    city += '<div class="city" id="city'+city_count+'">'
			    city += '&nbsp &nbsp <input type="button" value="x" onclick="javascript:deleteCity('+city_count+');">'
			    city +=	'&nbsp &nbsp <span style="display:inline-block;width:100px">'+title+'</span> &nbsp'
			    city +=	'<input type="button" value="-" onclick="javascript:minusDays('+city_count+');">'
			    city +=	' <span id="'+days+'">2</span>일 '
			    city +=	'<input type="button" value="+" onclick="javascript:plusDays('+city_count+');">'
			    city +=	'<input type="hidden" name="'+a_name+'" value="'+marker.areaCode+'">'
		   		city +=	'<input type="hidden" name="'+s_name+'" value="'+marker.sigunguCode+'">'
		   		city +=	'<input type="hidden" name="'+c_name+'" value="'+title+'">'
		   		city +=	'</div>';
  			$('#flag').before(city);
  			$('#flag').text("");
  		   	var numItems = $('div.city').length;
  		    if(numItems == 1){
  		    	$('#flag').after('<br> <input type="button" id="inputdetail" value="세부정보 입력" data-toggle="modal" href="#myModal">');
  		    }
		   }else{
			    var focusMarker = new google.maps.LatLng(marker.lat, marker.lng);
	            map.setCenter(focusMarker);
	            map.setZoom(9);
	        	deleteMarkers();
		   		getDetail(marker.areaCode);
		   }
        });
   }
   
   function add_citylist(){
		var d = new Date($('#start_ymd').val());
		
		for(var i=1; i<=city_count; i++){
			var daysSearch = '#days'+i;
			var areaCodeSearch = 'input[type=hidden][name=areaCode'+i+']';
			var sigunguCodeSearch = 'input[type=hidden][name=sigunguCode'+i+']';
			var citySearch = 'input[type=hidden][name=city'+i+']';
			var days = $(daysSearch).text();
			var areaCode = $(areaCodeSearch).val();
			var sigunguCode = $(sigunguCodeSearch).val();
			var city_nm = $(citySearch).val();
			for(var j=0; j<days; j++){
				 var curr_date = d.getDate();
				 var curr_month = d.getMonth() + 1;
				 var curr_year = d.getFullYear();
				 var date_ymd = curr_year + "-" + curr_month + "-" + curr_date;
				
				var day_city = {
					daily_ord: daycount,
					daily_ymd: date_ymd,
					area_code: areaCode,
					sigungu_code: sigunguCode,
					city_nm: city_nm
				}
				$.ajax({
					type: "post",
					url: "set_citylist",
					data: day_city,
					error: function(e){
						console.log(e);
					}		
				})
				d.setDate(d.getDate() + 1);
				daycount++;
			}
		}
		document.getElementById('day_cnt').value = daycount - 1;
	}
   
   function deleteCity(index){
	   var target = '#city'+index;
	   $(target).remove();
	   var numItems = $('div.city').length;
	   if(numItems == 0){
		   $('#flag').text("도시를 선택해 주세요.");
		   $('#inputdetail').remove();
	   }
   }
   function minusDays(index){
	   var target = '#days'+index;
	   var days = $(target).text();
	   if(days == 1){
		   return;
	   }else{
		   $(target).text(days-1);
	   }
   }
   function plusDays(index){
	   var target = '#days'+index;
	   var days = $(target).text();
	   days = parseInt(days) + 1;
	   $(target).text(days);
   }
   
   function open_scd() {
 		$('#scd_info').css('opacity', '100');
 		$('#scd_info').css('pointer-events', 'visible');
 		$('#city_info').css('opacity', '0');
 		$('#city_info').css('pointer-events', 'none');
 	}
   
   function back() {
		$('#city_info').css('opacity', '100');
		$('#city_info').css('pointer-events', 'visible');
		$('#scd_info').css('opacity', '0');
		$('#scd_info').css('pointer-events', 'none');
	}
   
</script>

<title>make_schedule</title>
</head>
<body>
   <div id="pop_city_list_box"></div>
   <div id="city_list_box"></div>
   <div id="map"></div>
   
   
    <div style="overflow:auto;" class="sidenav" id="city_info">
	<h3>여행도시</h3>
	<hr />
	<div id="city_day_box">
		<c:if test="${name != null}">
			<div class="city" id="city1">
			&nbsp &nbsp <input type="button" value="x" onclick="javascript:deleteCity(1);">
			&nbsp &nbsp<span style="display:inline-block;width:100px">${name }</span>&nbsp 
			<input type="button" value="-" onclick="javascript:minusDays(1);">
			<span id="days1">2</span>일
			<input type="button" value="+" onclick="javascript:plusDays(1);">
			<input type="hidden" name="areaCode1" value="${areaCode }">
			<input type="hidden" name="sigunguCode1" value="${sigunguCode }">
			<input type="hidden" name="city1" value="${name }">
			</div>
			<div id="flag"></div>
			<br>
			<input type="button" id="inputdetail" value="세부정보 입력" data-toggle="modal" href="#myModal">
		</c:if>
		<c:if test="${name == null}">
			<div id="flag">도시를 선택해 주세요.</div>
		</c:if>
	</div>
		
<!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">세부정보 입력</h4>
        </div>
        <div class="modal-body">
						<form role="form" class="form-horizontal" action="create_schedule" method="post" onsubmit="return add_citylist();">
							<div class="form-group">
								<label for="scd_title" class="col-sm-2 control-label"> 제목</label>
								<div class="col-sm-10">
									<input type="hidden" id="user_id" name="user_id" value="${user_id }" placeholder="ID">
									<input type="text" class="form-con" id="scd_title" name="scd_title" placeholder="제목 입력">
								</div>
							</div>
							<div class="form-group">
								<label for="start_ymd" class="col-sm-2 control-label"> 출발일</label>
								<div class="col-sm-10">
									<input type="text" class="form-con" id="start_ymd" name="start_ymd" placeholder="클릭하여 달력에서 선택">
								</div>
							</div>
							<div class="form-group">
								<label for="scd_theme" class="col-sm-2 control-label"> 테마</label>
								<div class="col-sm-10">
									<input type="radio" class="form-con" name="scd_theme" value="alone" checked="checked">홀로 &nbsp; &nbsp;
									<input type="radio" class="form-con" name="scd_theme" value="couple">커플 &nbsp; &nbsp;
									<input type="radio" class="form-con" name="scd_theme" value="family">가족 &nbsp; &nbsp;
									<input type="radio" class="form-con" name="scd_theme" value="group">단체 &nbsp; &nbsp;
								</div>
							</div>
							<div class="form-group">
								<label for="scd_season" class="col-sm-2 control-label"> 계절</label>
								<div class="col-sm-10">
									<input type="radio" class="form-con" name="scd_season" value="spring" checked="checked">봄 &nbsp; &nbsp; &nbsp; &nbsp;
									<input type="radio" class="form-con" name="scd_season" value="summer">여름 &nbsp; &nbsp;
									<input type="radio" class="form-con" name="scd_season" value="fall">가을 &nbsp; &nbsp;
									<input type="radio" class="form-con" name="scd_season" value="winter">겨울 &nbsp; &nbsp;
								</div>
							</div>
							<div class="form-group">
								<label for="scd_desc" class="col-sm-2 control-label"> 설명</label>
								<div class="col-sm-10">
									<input type="text" class="form-con" id="scd_desc" name="scd_desc" placeholder="설명 입력">
									<input type="hidden" class="form-con" id="day_cnt" name="day_cnt">
								</div>
							</div>
							<div class="form-group">
								<label for="public_fl" class="col-sm-2 control-label"> 공개여부</label>
								<div class="col-sm-10">
									<input type="checkbox" class="form-con" name="public_fl" value="public">공개 &nbsp; &nbsp;
									<input type="checkbox" class="form-con" name="public_fl" value="shared_user">비공개 &nbsp; &nbsp;
								</div>
							</div>
							
        </div>
        <div class="modal-footer">
        <div id="existId" class="existId"></div>
			<button type="submit" class="btn btn-default btn_next">완료</button>
			<button type="button" class="btn btn-default" data-dismiss="modal" onclick="javascript:back();">돌아가기</button>
			</form>
        </div>
      </div>
      
    </div>
  </div>
	
</body>
</html>