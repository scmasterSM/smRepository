<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="./resources/js/jquery-3.1.1.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="./resources/css/bootstrap.css">
<script src="./resources/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="./resources/css/jquery-ui.min.css" type="text/css" media="screen" />
<script type="text/javascript" src="./resources/js/jquery-ui.min.js"></script>
<link type="text/css" href="./resources/css/jquery.ui.chatbox.css" rel="stylesheet" />
<script type="text/javascript" src="./resources/js/jquery.ui.chatbox.js"></script>
<link rel='stylesheet' href='./resources/css/perfect-scrollbar.css' />
<script src='./resources/js/perfect-scrollbar.jquery.js'></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD_azK-PpKrUbRSAlyccxLXpUGnwagdJhQ"></script>
<title>Edit Schedule</title>
<style>
	* {
	    box-sizing: border-box;
	}
	
	[class*="col-"] {
	    float: left;
	    padding: 15px;
	    border: solid #ebebeb 1px;
	}	
	
	.row::after {
	    content: "";
	    clear: both;
	    display: table;
	}
	
	.header {
		width: 100%; 
		height: 8%;    
		/* border-top: solid #4eb1e4 2px; */
  		position: relative;
	    float: left;
	    height: 60px;
	    background-color: white;
	    width: 100%;
	    min-width: 1092px;
	    z-index: 100;
	    border-bottom: solid #ebebeb 1px; 
	}
	.fl {
   		float: left;
	}
	#plan_title {
	    font-size: 20px;
	    color: #363636;
	    font-weight: bold;
	    margin-top: 7px;
	    line-height: 26px;
	    height: 45px;
	    padding: 10px;
	    border-radius: 5px;
	    cursor: pointer;
	    padding-right: 30px;
	}
	#plan_out_btn {
	    width: 100px;
	    height: 42px;
	    text-align: center;
	    background: #00AEEF;
	    border: medium none;
	    line-height: 42px;
	    font-weight: bold;
	    font-size: 16px;
	    color: #fff;
	    margin-right: 10px;
	    cursor: pointer;
	}
	.pn_title_input_box {
	    width: 260px;
	    height: 30px;
	    border: 1px solid #c8c8ca;
	    padding-left: 10px;
	    padding-right: 40px;
	    font-size: 13px;
	    color: #808080;
	}
	#plan_title.on {
	    padding-right: 0px;
	}
	.pn_title_chg_ok {
	    background: #ff9320;
	    border: 1px solid #f7870f;
	    margin-left: 2px;
	    width: 60px;
	    height: 30px;
	    font-size: 12px;
	    color: white;
	    cursor: pointer;
	}
	.modal-header {
		background-color: #00AEF0;
		color: #fff;
	}
	.btn-default {
		background-color: #00AEF0;
		color: #fff;
	}
	
	.col-1 {width: 5%; height: 92%}
	.col-2 {width: 10%; height: 92%}
	.col-3 {width: 15%; height: 92%}
	.col-4 {width: 20%; height: 92%}
	.col-5 {width: 25%; height: 92%}
	.col-6 {width: 30%; height: 92%}
	.col-7 {width: 35%; height: 92%}
	.col-8 {width: 40%; height: 92%}
	.col-9 {width: 45%; height: 92%}
	.col-10 {width: 50%; height: 92%}
	.col-11 {width: 55%; height: 92%}
	.col-12 {width: 60%; height: 92%}
	.col-13 {width: 65%; height: 92%}
	.col-14 {width: 70%; height: 92%}
	.col-15 {width: 75%; height: 92%}
	.col-16 {width: 80%; height: 92%}
	.col-17 {width: 85%; height: 92%}
	.col-18 {width: 90%; height: 92%}
	.col-19 {width: 95%; height: 92%}
	.col-20 {width: 100%; height: 92%}
	
	.daylist ul {
	    list-style-type: none;
	    margin: 0;
	    padding: 0;
	}
	.daylist li {
	    padding: 8px;
	    margin-top: 0px;
	    margin-bottom: 0px;
	    margin-left: 0px;
	    background-color: #00AEEF;
	    width: 100%;
	    color: #ffffff;
	    border: medium none;
	    box-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);
	    font-weight: bold;
	    font-size: 13px;
	}
	
	html, body {
		height: 100%;
		margin: 0;
		padding: 0;
		overflow: hidden;
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
	    height: 92%;
	    width: 0;
	    position: fixed;
	    pointer-events: none;
	    z-index: 1;
	    top: 8%;
	    left: 25%;
	    background-color: white;
	    overflow-x: hidden;	
	    transition: 0.5s;
	    opacity: 0;
	    border-top: solid #ebebeb 1px; 
	}
	
	.my_loc {
		border-top: 2px solid #00AEEF;
		padding-top: 10px;
		padding-bottom: 10px;
	}
	
	.ordlist {
		border-top: 2px solid #00AEEF;
		padding-top: 10px;
		padding-bottom: 10px;
  		cursor: pointer;
	}
	
	.alterDaylist {
		border-bottom: 2px solid #00AEEF;
		padding-top: 10px;
		padding-bottom: 10px;
	}
	
	#alter_schedule{
		padding: 15px 15px 15px 15px;
	    height: 91.9%;
	    width: 0;
	    position: fixed;
	    pointer-events: none;
	    z-index: 1;
	    top: 8.1%;
	    left: 0%;
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
	    top: 8%;
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
   
   #theme2_select {
   	   background: url(http://i62.tinypic.com/15xvbd5.png) no-repeat 96% 0;
	   height: 29px;
	   overflow: hidden;
	   width: 240px;
	   border: 1px solid black;
       margin-top: 5px;
       margin-bottom: 5px;
   }
   
   #theme2_select select {
   	   background: transparent;
	   font-size: 13px;
	   height: 29px;
	   padding: 2px; /* If you add too much padding here, the options won't show in IE */
	   width: 252px;
   }
   
   .theme_check label {
	    width: 78px;
	    height: 32px;
	    text-align: center;
	    background: #00AEEF;
	    border: medium none;
	    line-height: 32px;
	    font-weight: bold;
	    font-size: 13px;
	    color: #fff;
	    margin-right: 10px;
	    cursor: pointer;
    	margin-top: 5px;
    	margin-bottom: 5px;
   }
   
   input[type=button], button {
	color: #333;
    background-color: #fff;
    border-color: #ccc;
    padding: 1px 5px;
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
   
   #eddays, #add_day, #alter_complete {
   	padding: 8px;
    margin-top: 0px;
    margin-bottom: 10px;
    background-color: #00AEEF;
    width: 100%;
    color: #ffffff;
    border: medium none;
    box-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);
    font-weight: bold;
    font-size: 13px;
   }
   
   .radio {
    	display: none
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
  var ws = null;
  
  $(function(){
	
	add_day();
	init_daily_date();
    init_daily_list();
    ordclick();
    
    $("#search").on("keyup", function(){
    	if($(this).val().length == 0){
    		var theme = $('input[type=radio][name=radio-1]:checked').val();
    		var theme2 = $('#select-1').val();
			if(typeof(theme) == 'undefined') theme = '';
			if(typeof(theme2) == 'undefined' || theme2 == '카테고리를 먼저 선택하세요') theme2 = '';	
    		theme2_change(theme, theme2);
    	}
    });
    
    $("#searchCity").on("keyup", function(){
    	if($(this).val().length == 0){
    		initCitySearch();
    	}
    });
    
    /* $(".radio").checkboxradio({
        icon: false
    }); */
    
    $('input[type=radio][name=radio-1]').on('change', function() {
    	var theme = $(this).val();
    	theme_change(theme);
	});
    
    sortable();
	alter_sortable();
    
    openNav();
    
    initCitySearch();
    citySearch();
    
    $("#start_ymd").datepicker({
  	  dateFormat: "yy-mm-dd"
    });

   //$('.ordlist:first').trigger('click');
    
    $('#section1').perfectScrollbar();
    $('#section2').perfectScrollbar({
    	wheelPropagation: true
    });
    $('#location_info').perfectScrollbar();
    $('#section3').perfectScrollbar({
  	  suppressScrollY: true
  	});
    
    $('#shareId').keyup(function(){
        if($('#shareId').val() != null){
         $.ajax({
              type : "POST",
              url : "checkId",
              data : { 
                 "user_id" : $('#shareId').val(),
              }
              ,success : function(data){
                 if(data == '1'){
                    $('#existId').html("<span>해당 아이디가 존재합니다. 일정을 공유하시겠습니까?</span>");
                    $('#invite_btn').attr('onclick', 'return whoWithShare();');
                 }else{
                    $('#existId').html("<span>해당 아이디가 존재하지 않습니다. 다시 입력해주세요</span>");
                    $('#invite_btn').attr('onclick', '');
                 }
              },
              error : function(e){
                 console.log(e);
              } 
           });//ajax
        }
     });
    
    connectWebSocket();
    
    var box = null;
    $("#connectChat").click(function(event, ui) {
        if(box) {
            box.chatbox("option", "boxManager").toggleBox();
        }
        else {
            box = $("#chat_div").chatbox({
            	id:'${user_id}', 
                user:{key : "value"},
                title : "chat",
                messageSent : function(id, user, msg) {
                	//$("#log").append(id + " said: " + msg + "<br/>");
                   //$("#chat_div").chatbox("option", "boxManager").addMsg(id, msg);
                   data = {
                		   id : id,
                		   msg : msg
                   }
                   wsComms("chat", data);
           		}
            });
        }
    });
    $("#connectChat").trigger('click');
    $("#connectChat").css('opacity','0');
    $("#connectChat").css('pointer-events','none');
    //$("#chat_div").chatbox("option", "boxManager").addMsg(false, '${user_id}'+"님이 입장하셨습니다.");    
    //여기 수정해야 됨 websocket으로 broadcasting 해야함
    /* $(window).unload(function(){
    	$("#chat_div").chatbox("option", "boxManager").addMsg(false, ${user_id}+"님이 퇴장하셨습니다.");
    	alert('asdsad');
    }); */
  });
  
  function connectWebSocket(){
	  ws = new WebSocket("ws://10.10.6.13:8888/gittest/webSocket");
		
		var data = {
				"loginId" : "${user_id}",
				"scd_sq" : "${scd_sq}"
		}
		ws.onopen = () => wsComms("webSocketlogIn", data);
		
		ws.onmessage = function(event){
			var obj = JSON.parse(event.data);
			  console.log(obj);
			  switch(obj.doWhat){
			  case 'loginSuccess' :
				  $('.ordlist:first').trigger('click');
				  var msg = obj.data;
				  $("#chat_div").chatbox("option", "boxManager").addMsg('', msg);
				  break;
				  
			  case 'sortable' :
				  $("#Day"+obj.data).trigger('click');
				  break;
			  
			  case 'closeAlt' : 
				  init_daily_list();
			  	  $(".ordlist").off("click");
			  	  ordclick();
			  	  $("#alterlist").sortable("disable");
			  	  $("#sortable").sortable("enable");
			  	  $('.ordlist:first').trigger('click');
			  	  init_search_menu();
				  break;
				  
			  case "delete_day" : 
				  init_daily_list();
			  	  $(".ordlist").off("click");
			  	  ordclick();
			  	  $("#alterlist").sortable("disable");
			  	  $("#sortable").sortable("enable");
			  	  $('.ordlist:first').trigger('click');
			  	  init_search_menu();
				  break;
				  
			  case "ordclick" :
				  init_search_menu();
		  			msgMarkers = [];
		  			var div_id = obj.data;
					var target = "#"+div_id;
					var areaCode = $(target+" > .areaCode").val();
					var sigunguCode = $(target+" > .sigunguCode").val();
					var name = $(target+" > .day_city_name").val();
					var ymd = $(target+" > .ymd").val();
					var day = "DAY " + $(target+" > .day").val();
					console.log(name);
					if((name != "" || areaCode != "") && name.length < 4){
						$('#city_name').text(name);
						$('#day_city_name').val(name);
						$('#areaCode').val(areaCode);
						$('#sigunguCode').val(sigunguCode);
					}
					var content = '<h3 id="section2_day">'+day+'</h3>'	
					+ 'KRW <span id="daily_budget"></span>'
					+ '<div id="sortable">'
					+ '<div id="my_location"></div>'
					+ '</div>';
					$('#section2').html(content);
					sortable();
					$("#sortable").sortable("enable");
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
						async: false,
						success: function(data){
							get_daily_budget();
							get_budget_total();
							if(data.length != 0) set_places(data);
							else theme2_change('', '');
						},
						error: function(e){
							console.log(e);
						}		
					})
				  break;
					
			  case 'add_day' : 
				  init_daily_list();
			  	  $(".ordlist").off("click");
			  	  ordclick();
			  	  $("#alterlist").sortable("disable");
			  	  $("#sortable").sortable("enable");
			  	  $('.ordlist:last').trigger('click');
			  	  init_search_menu();
				  break;
				  
			  case 'update_bgt' :
				  get_daily_budget();
				  get_budget_total();
				  break;
				  
			  case 'delete_place' :
				  var day = obj.data;
				  $("#Day"+day).trigger('click');
				  break;
			  
			  case 'add_place' : 
				  var day = obj.data;
				  $("#Day"+day).trigger('click');
				  break;
				  
			  case 'update_scd':
				  $('#plan_title').html(obj.data);
				  break;
				  
			  case 'chat' : 
				  $("#chat_div").chatbox("option", "boxManager").addMsg(obj.data.id, obj.data.msg);
				  break;
			  }
		}
		
		ws.onerror = function(event){
			ws.close();
		}
		
		ws.onclose = function(event){
			ws.close();
			ws = null;
		}
  }
  
  function wsComms(doWhat, data){
	  var data = {
			  "doWhat" : doWhat,
			  "data" : data
	  }
	  ws.send(JSON.stringify(data));
  }
  
  var key = "kfupvY3Myl8FHox4srLxSuu86iEx8egaMeeg8xn8PAlWG4QTHGBmI%2FhHznRSRyiPl9bLqx0LjdR6FcOsjGDgnw%3D%3D";
  var map;
  var myMarkers;
  var myloc_path;
  var myloc_markers = [];
  var marker_no;
  var sigungu = new Array;
  var pop_cities = [{"areaCode" : 1, "sigunguCode" : "", "name" : '서울', "name_en" : "Seoul", "lat" : parseFloat(37.566535), "lng" : parseFloat(126.9779692), "is_state" : 0},
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
	  var sigunguCode;
      var url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaCode?ServiceKey="
           + key + "&areaCode=" + areaCode 
           + "&numOfR93=100&MobileOS=ETC&MobileApp=AppTesting&_type=json";
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
  	
  	function add_day(){
  		$("#add_day").on('click', function() {
  			var order = parseInt($(".day:last").val()) + 1;
  	  		var last = $('.ymd:last').val();
  	  		var d = new Date(last);
  	  		d.setDate(d.getDate() + 1);
			 var weekday = [' (일)',' (월)',' (화)',' (수)',' (목)',' (금)',' (토)'];
			 var day = weekday[d.getDay()];
  	  		 var curr_date = '' + d.getDate();
  			 var curr_month = '' + (d.getMonth() + 1);
  			 var curr_year = d.getFullYear();
  			 if (curr_month.length < 2) curr_month = '0' + curr_month;
  			 if (curr_date.length < 2) curr_date = '0' + curr_date;
  			 var date = curr_year + "-" + curr_month + "-" + curr_date + day;
  			 var areacode = $('.areaCode:last').val();
  			 var sigungucode = $('.sigunguCode:last').val();
  			 var cityname = $('.day_city_name:last').val();
  			var day = '<div id="Day'+order+'" class="ordlist">'
  					+ '<input type="hidden" class="areaCode" value="'+areacode+'">'
  					+ '<input type="hidden" class="sigunguCode" value="'+sigungucode+'">'
  					+ '<input type="hidden" class="day_city_name" value="'+cityname+'">'
  					+ '<input type="hidden" class="ymd" value="'+date+'">' 
  					+ '<input type="hidden" class="day" value="'+order+'">' 
  					+ 'DAY '+order+' <br> '+date+' <br> <span id="city_names">'+cityname+'</span><br></div>';
  			$("#daylist").before(day);
  			var scd_sq = $('#scd_sq').val();
  			var daily_scd = {
  					scd_sq: scd_sq,
  					daily_ord: order,
  					daily_ymd: date,
  					area_code: areacode,
  					sigungu_code: sigungucode,
  					city_nm: cityname,
  					city_ord: 1
  				}
  				$.ajax({
  					type: "post",
  					url: "add_day",
  					data: daily_scd,
  					async: false,
  					success : function(e){
  						wsComms("add_day", "add_day");
  					},
  					error: function(e){
  						console.log(e);
  					}		
  				})
  			$(".ordlist").off("click");
  		    ordclick();
  		});
  	}
  	
  	function initCitySearch(){
  		var html = '';
  		sigungu = [];
  		$.each(pop_cities, function(index, val){
      	  html += '<div class="item" data="'+ val.areaCode +'" data-ci_name="'+ val.name +'" data-lat="'+ val.lat +'" data-lng="' + val.lng + '" data-is_state="'+ val.is_state +'">';
            html += '<div class="img_box"><img src="./resources/img/city/'+val.areaCode+'.jpg"></div>';
            html += '<div class="info_box"><div class="info_title">'+val.name+'</div><div class="info_sub_title">'+val.name_en+'</div></div>';
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
        city_change_event();
  	}
  	  
	function sortable(){
		$("#sortable").sortable({
        	update: function(event, ui) {
        		var itemOrder = $('#sortable').sortable("toArray");
        		   for (var i = 0; i < itemOrder.length-1; i++) {
        		   		var target_span = '#'+itemOrder[i]+' > span';
        		   		var target_ord = '#'+itemOrder[i];
        		   		$(target_span).html(i+1);
        		   		$(target_ord).attr('dtl_ord', (i+1));
        		   }
        		check_cities();
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
        			async: false,
        			success: function(data){
        			},
        			error: function(e){
        				console.log(e);
        			}
        		})//ajax
        	})//foreach
        	wsComms("sortable", itemOrder[0]);
        	delete_myMarkers();
	        }//update
        });
        $("#sortable").disableSelection();
	}
	
	function init_search_menu(){
		$('#search').val("");
		$('input[type=radio][name=radio-1]').each(function(){
	 		$(this).attr('checked',false);
	 	})
	 	$('#select-1').html('<option selected="selected">카테고리를 먼저 선택하세요</option>');
	 	$('#select-1').attr('disabled', 'disabled');
	}
	
  function ordclick(){
	  $(".ordlist").on("click", function(){
			init_search_menu();
  			msgMarkers = [];
			
			var div_id = $(this).attr('id');
			var target = "#"+div_id;
			var areaCode = $(target+" > .areaCode").val();
			var sigunguCode = $(target+" > .sigunguCode").val();
			var name = $(target+" > .day_city_name").val();
			var ymd = $(target+" > .ymd").val();
			var day = "DAY " + $(target+" > .day").val();
			if((name != "" || areaCode != "") && name.length < 4){
				$('#city_name').text(name);
				$('#day_city_name').val(name);
				$('#areaCode').val(areaCode);
				$('#sigunguCode').val(sigunguCode);
			}
			var content = '<h3 id="section2_day">'+day+'</h3>'	
			+ 'KRW <span id="daily_budget"></span>'
			+ '<div id="sortable">'
			+ '<div id="my_location"></div>'
			+ '</div>';
			$('#section2').html(content);
			sortable();
			$("#sortable").sortable("enable");
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
				async: false,
				success: function(data){
					get_daily_budget();
					get_budget_total();
					//wsComms("ordclick", div_id);
					if(data.length != 0) set_places(data);
					else theme2_change('', '');
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
		var sigunguCode = item.SIGUNGU_CODE;
		if(typeof(sigunguCode) == 'undefined' || sigunguCode == 'undefined' || sigunguCode == 'null') sigunguCode = "";
		var image = item.DTL_IMAGE;
		if(typeof(image) == 'undefined' || image == 'undefined') image = "./resources/image/noimage.jpg";
		  my_content += '<div class="my_loc" id="'+item.DTL_SQ+'" dtl_sq="'+item.DTL_SQ+'" dtl_ord="'+item.DTL_ORD+'" title="'+item.PLACE_NM+'" contentid="'+item.DTL_CONTENT_ID+'" '
			+ 'areaCode="'+item.AREA_CODE+'" sigunguCode="'+sigunguCode+'" city_name="'+item.CITY_NM+'">'
			+ '<span class="sec2_ord">'+item.DTL_ORD+'</span> '
			+ '<input type="hidden" id="sec2_id" value="'+item.DTL_CONTENT_ID+'">'
		 	+ item.PLACE_NM
			+ '<img src='+image+' width=190 height=120><br>'
			+ '<input type="button" value="예산/메모" onclick="javascript:budget_memo(\''+item.DTL_SQ+'\',\''+item.DTL_CONTENT_ID+'\');"> '
			+ '<input type="button" value="삭제" onclick="javascript:delete_place('+item.DTL_SQ+');">'
			+ '<br>'
			+ '</div>';
	  });
		$("#my_location").before(my_content);
		var areaCode = $('.my_loc:last').attr('areacode');
		var sigunguCode = $('.my_loc:last').attr('sigungucode');
		var name = $('.my_loc:last').attr('city_name');
		if(name != "" || areaCode != ""){
			$('#city_name').text(name);
			$('#day_city_name').val(name);
			$('#areaCode').val(areaCode);
			$('#sigunguCode').val(sigunguCode);
		}
		theme2_change('', '');
		my_loc_event();
		check_cities();
  }	
  
  function show_myMarkers(){
	  for(var i=0; i<myloc_markers.length; i++){
			myloc_markers[i].setMap(null);
		}
		myloc_markers.length = 0;
		marker_no = 0;
		var mymarkerlist = [];
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
			async: false,
			success: function(data){
					var iconsetngs = {
						    path: google.maps.SymbolPath.FORWARD_CLOSED_ARROW
						};
						myloc_path = new google.maps.Polyline({
						    geodesic: true,
						    strokeColor: '#FF0000',
						    strokeOpacity: 1.0,
						    strokeWeight: 2,
						    icons: [{
						    	repeat: '130px',
						        icon: iconsetngs,
						        offset: '100%'}]
						  });
						myloc_path.setMap(map);
						var path = myloc_path.getPath();
					  $.each(data,function(index,item){
						  var latLng = new google.maps.LatLng(parseFloat(item.MAP_Y), parseFloat(item.MAP_X));
						  path.push(latLng);
						  mymarkerlist.push({lat: parseFloat(item.MAP_Y), lng: parseFloat(item.MAP_X), title: item.PLACE_NM});
					  });
					  for(var i=0; i<mymarkerlist.length; i++){
						  marker_no++;
						  var latLng = {
									lat : parseFloat(mymarkerlist[i].lat),
									lng : parseFloat(mymarkerlist[i].lng)
								}
								var marker = new google.maps.Marker({
									draggable : false,
									position : latLng,
									map : map,
									title : (i+1)+". "+mymarkerlist[i].title,
									id : i+1,
									icon: "./resources/marker_img/number_"+marker_no+".png",
									zIndex: 1000
								});
						  myloc_markers.push(marker);
					  }
			},
			error: function(e){
				console.log(e);
			}		
		})
  }
  
  function delete_place(dtl_sq){
	  var day;
	  $.ajax({
		  type : "post",
		  url : "get_Daily_Scd",
		  data : {
			  dtl_sq : dtl_sq
		  },
		  async : false,
		  success : function (data){
			  day = data;
		  }, error : function(e){
			  console.log(e);
		  }
	  })
	  $.ajax({
			type: "post",
			url: "delete_place",
			data: {	
				dtl_sq: dtl_sq
			},
			async: false,
			success: function(data){
				  $('div[class=my_loc][dtl_sq='+dtl_sq+']').trigger("mouseleave");
				  $('div[class=my_loc][dtl_sq='+dtl_sq+']').remove();
				  var itemOrder = $('#sortable').sortable("toArray");
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
	        			success : function(e){
	        			},
	        			error: function(e){
	        				console.log(e);
	        			}
	        		})//ajax
	        	})
    			wsComms("delete_place", day);
	    		delete_myMarkers();
				},
				error: function(e){
					console.log(e);
				}
		})
		check_cities();
		get_daily_budget();
		get_budget_total();
  }
  
  function delete_myMarkers(){
	  if(typeof(myloc_path) != 'undefined'){
		var path = myloc_path.getPath();
	    for(var i=0; i<path.length+10; i++){
			path.pop();
	    }
	  }
	    show_myMarkers();
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
		for (var i = 0; i < totalCount; i++) {
			if(typeof(data.response.body.items.item[i])!='undefined' && !(data.response.body.items.item[i].title.includes("2016"))){
			var latLng = {
				lat : parseFloat(data.response.body.items.item[i].mapy),
				lng : parseFloat(data.response.body.items.item[i].mapx)
			}
			var marker = new google.maps.Marker({
				draggable : false,
				position : latLng,
				map : map,
				title : data.response.body.items.item[i].title,
				id : data.response.body.items.item[i].contentid
			});
			if(!isNaN(latLng.lat) && !isNaN(latLng.lng)){
				if((latAvg-0.3) < latLng.lat && latLng.lat < (latAvg+0.3) && (lngAvg-0.3)< latLng.lng && latLng.lng < (lngAvg+0.3)){
					myMarkers.push(marker);
					bounds.extend(marker.position);
				}else{
					var target = '#'+data.response.body.items.item[i].contentid;
					$(target).html('');
				}
			}else{
				var target = '#'+data.response.body.items.item[i].contentid;
				$(target).html('');
			}
			var image = data.response.body.items.item[i].firstimage;
			if(typeof(image) == 'undefined' || image == 'undefined') image = "./resources/image/noimage.jpg";
			var content = '<div class="content">'
				+ '<div id="image">'
				+'<img src='+image+' width=200 height=120>'
				+ '</div>'
				+ '<h3>'+data.response.body.items.item[i].title+'</h3>'
				+ '<h5>'+data.response.body.items.item[i].addr1+'</h5>'
				+ '<input type="button" value="자세히 보기" onclick="javascript:d_Data(' + data.response.body.items.item[i].contentid + ')"> '
				+ '<button class="add_place" onclick="javascript:add_place(\''+data.response.body.items.item[i].title+'\',\''+image+'\',\''+data.response.body.items.item[i].contentid+'\',\''+data.response.body.items.item[i].mapx+'\',\''+data.response.body.items.item[i].mapy+'\')">일정에 추가</button> '
				+ '<input type="button" value="채팅에 전송" onclick="javascript:place_to_chat(\''+data.response.body.items.item[i].contentid+'\',\''+data.response.body.items.item[i].title+'\')">'
				+ '</div>'; 

			google.maps.event.addListener(marker,'click', (function(marker,content,infowindow){ 
			    return function() {
			        infowindow.setContent(content);
			        infowindow.open(map,marker);
			        var target = "#" + marker.id;
			        $('#location_info').scrollTop(0);
			      	$('#location_info').animate({ scrollTop: $(target).offset().top - 270}, 2000);
			    }; 	
			})(marker,content,infowindow));
			google.maps.event.addListener(marker,'dblclick', (function(marker,content,infowindow){ 
			    return function() {
			        infowindow.setContent(content);
			        infowindow.open(map,marker);
			    };
			})(marker,content,infowindow));
			} 
		}
		map.fitBounds(bounds);
		google.maps.event.addListenerOnce(map, 'bounds_changed', function() {
			if (this.getZoom() > 15) {
			    this.setZoom(15);
			}
		});
	    $('#location_info').scrollTop(0);
	    if(!autofill){
		    delete_myMarkers();
		}
	}
	

	function add_place(title, firstimage, contentid, map_x, map_y, addr) {
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
		
		var areaCode;
		var sigunguCode;
		var city_name;
		
		if(typeof(addr) == 'undefined'){
			var areaCode = $('#areaCode').val();
			var sigunguCode = $('#sigunguCode').val();
			var city_name = $('#day_city_name').val();
		}else{
			for(var i=0; i<sigungu.length; i++){
				if(addr.includes(sigungu[i].name)){
					areaCode = sigungu[i].areaCode;
					sigunguCode = sigungu[i].sigunguCode;
					city_name = sigungu[i].name;
				}
			}
		}
		
		var dtl_place = {
			scd_sq: scd_sq,
			daily_sq: daily_sq,
			dtl_ord: dtl_ord,
			dtl_content_id: contentid,
			place_nm: title,
			dtl_image: firstimage,
			area_code: areaCode,
			sigungu_code: sigunguCode,
			city_nm: city_name,
			map_x: map_x,
			map_y: map_y
		}
		$.ajax({
			type: "post",
			url: "detail_place",
			data: dtl_place,
			async: false,
			success: function(dtl_sq){
				var my_content = '';
				my_content += '<div class="my_loc" id="'+dtl_sq+'" dtl_sq="'+dtl_sq+'" dtl_ord="'+dtl_ord+'" title="'+title+'" contentid="'+contentid+'" '
					+ 'areaCode="'+areaCode+'" sigunguCode="'+sigunguCode+'" city_name="'+city_name+'">'
					+ '<span class="sec2_ord">'+dtl_ord+'</span> '
					+ '<input type="hidden" id="sec2_id" value="'+contentid+'">'
				 	+ title
					+ '<img src='+firstimage+' width=190 height=120><br>'
					+ '<input type="button" value="예산/메모" onclick="javascript:budget_memo(\''+dtl_sq+'\',\''+contentid+'\');"> '
					+ '<input type="button" value="삭제" onclick="javascript:delete_place('+dtl_sq+');">'
					+ '<br>'
					+ '</div>';
				$("#my_location").before(my_content);
				my_loc_event();
				wsComms("add_place", dtl_sq);
			},
			error: function(e){
				console.log(e);
			}
		})
		sortable();
		check_cities();
		add_myMarkers(map_x, map_y, title);
	};
	
	function add_myMarkers(map_x, map_y, title){
		myloc_path.setMap(map);
		var path = myloc_path.getPath();
		var latLng = new google.maps.LatLng(parseFloat(map_y), parseFloat(map_x));
	    path.push(latLng);
	    
	   			marker_no++;
				var marker = new google.maps.Marker({
					draggable : false,
					position : latLng,
					map : map,
					title : (myloc_markers.length+1)+". "+title,
					id : myloc_markers.length+1,
					icon: "./resources/marker_img/number_"+marker_no+".png",
					zIndex: 1000
				});
		  		myloc_markers.push(marker);
	}
	
	function budget_memo(dtl_sq, contentid){
		var scd_sq = $('#scd_sq').val();
		var daily_sq = parseInt($('#section2_day').text().match(/\d+/)[0], 10);
		
		var url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?ServiceKey="
				+ key;
		url += "&contentId=" + contentid
				+ "&defaultYN=Y&addrinfoYN=Y&firstImageYN=Y&overviewYN=Y";
		url += "&MobileOS=ETC&MobileApp=AppTesting&_type=json";
		
		$.getJSON(url, function(data) {
			var image = data.response.body.items.item.firstimage;
			if(typeof(image) == 'undefined' || image == 'undefined') image = "./resources/image/noimage.jpg";
			var content = '';
				content += '<h3>'+ data.response.body.items.item.title+'</h3>';
				content += '<img src='+image+' width=340 height=220>';
				$.ajax({
					type: "post",
					url: "get_budget_memo",
					data: {
						dtl_sq: dtl_sq
					},
					async: false,
					success: function(data){
						var budget = data.dtl_budget;
						var memo = data.dtl_memo;
						if(typeof(budget) == 'undefined') budget = "";
						if(typeof(memo) == 'undefined') memo = "";
						content += '<input type="hidden" id="place_scd_sq" value="'+scd_sq+'">';
						content += '<input type="hidden" id="place_daily_sq" value="'+daily_sq+'">';
						content += '<input type="hidden" id="place_dtl_sq" value="'+dtl_sq+'">';
						content += '<h4 style="font-weight: bold;">예산</h4> KRW <input type="number" min="0" step="1000" id="place_budget" value="'+budget+'" placeholder="예산을 입력하세요">';
						content += '<h4 style="font-weight: bold;">메모</h4> <textarea rows="5" cols="40" id="place_memo" placeholder="메모를 입력하세요">'+memo+'</textarea>';
					},
					error: function(e){
						console.log(e);
					}		
				})
				content += '<h5>'+ data.response.body.items.item.overview+'</h5>';
				content += '주소: ' + data.response.body.items.item.addr1+'('+data.response.body.items.item.zipcode+')<br>';
				if(typeof(data.response.body.items.item.tel) != 'undefined')
					content += '전화번호: '+ data.response.body.items.item.tel+'<br>';
				if(typeof(data.response.body.items.item.homepage) != 'undefined')
					content += '<h5>'+ data.response.body.items.item.homepage+'</h5>';
			$("#bmlist").html(content);
			openBgtMemo();
		});
	}
	
	function formatNumber (num) {
	    return num.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,")
	}
	
	function get_daily_budget(){
		var scd_sq = $('#scd_sq').val();
		var daily_sq = parseInt($('#section2_day').text().match(/\d+/)[0], 10);
		$.ajax({
			type: "post",
			url: "get_daily_budget",
			async: false,
			data: {
				scd_sq: scd_sq
				,daily_sq: daily_sq
			},
			success: function(data){
				var daily_budget = data.dtl_budget;
				if(typeof(daily_budget) == 'undefined') daily_budget = 0;
				$('#daily_budget').text(formatNumber(daily_budget));
			},
			error: function(e){
				console.log(e);
			}
		})
	}
	
	function get_budget_total(){
		var scd_sq = $('#scd_sq').val();
		$.ajax({
			type: "post",
			url: "get_budget_total",
			async: false,
			data: {
				scd_sq: scd_sq
			},
			success: function(data){
				var budget_total = data.dtl_budget;
				if(typeof(budget_total) == 'undefined') budget_total = 0;
				$('#budget_total').text(formatNumber(budget_total));
			},
			error: function(e){
				console.log(e);
			}
		})
	}
	
	function check_cities(){
		var cities = [];
		var scd_sq = $('#scd_sq').val();
		var daily_sq = parseInt($('#section2_day').text().match(/\d+/)[0], 10);
		var city_ord = 1;
		$('.my_loc').each(function(index, item){
			var areaCode = $(this).attr('areaCode');
			var sigunguCode = $(this).attr('sigunguCode');
			var city_name = $(this).attr('city_name');
			var city = {
					scd_sq: scd_sq,
					daily_sq: daily_sq,
					city_ord: city_ord,					
					area_code: areaCode,
					sigungu_code: sigunguCode,
					city_nm: city_name
				}
			if(cities.length == 0){
				city_ord++;
				cities.push(city);
			}
			var dup_check = true;
			for(var i=0; i < cities.length; i++){
				if(cities[i].area_code == areaCode && cities[i].sigungu_code == sigunguCode && cities[i].city_nm == city_name)
					dup_check = false;
			}
			if(dup_check){
				city_ord++;
				cities.push(city);
			}
		})
		var city_names = '';
		for(var i=0; i < cities.length; i++){
			cities[i].city_cnt = cities.length;
			$.ajax({
				type: "post",
				url: "update_cities",
				async: false,
				data: cities[i],
				error: function(e){
					console.log(e);
				}
			})
			
			if(i == 0){
				city_names += cities[i].city_nm;
			}else{
				city_names += ', ' + cities[i].city_nm;
			}
		}
		var target = '#Day' + daily_sq;
		$(target + ' > span').text(city_names);
		sgg = $('div[class=my_loc]:last').attr('sigunguCode');
		$(target + ' > input[class=areaCode]').val($('div[class=my_loc]:last').attr('areaCode'));
		if(typeof(sgg) != 'undefined' && sgg != 'undefined') 
			$(target + ' > input[class=sigunguCode]').val($('div[class=my_loc]:last').attr('sigunguCode'));
		$(target + ' > input[class=day_city_name]').val($('div[class=my_loc]:last').attr('city_name'));
	}
  	
  function theme_change(theme) {
		var areaCode = $("#areaCode").val();
		var sigunguCode = $('#sigunguCode').val();
		if(typeof(sigunguCode) == 'undefined' || sigunguCode == 'undefined' || sigunguCode == 'null') sigunguCode = "";
		var theme2 = '';
		
		if(theme == 'A04'){
			theme2 = 'A0401';
		}else if(theme == 'A05'){
			theme2 = 'A0502';
		}else if(theme == 'clip'){
			$('#search').val("");
		 	$('#select-1').text('');
			get_cliplist();
			return;
		}
		
			var url = 
				"http://api.visitkorea.or.kr/openapi/service/rest/KorService/categoryCode?ServiceKey="+ key
				+ '&cat1=' + theme + '&cat2=' + theme2
				+ "&pageNo=1&numOfRows=10000&listYN=Y&arrange=A&MobileOS=ETC&MobileApp=AppTesting&_type=json";
			
			$.getJSON(url, function(data) {
				
				var content = '<select name="select-1" id="select-1">' + '<option value="">선택</option>';
				for (var i = 0; i < data.response.body.totalCount; i++) {
					content += '<option value='+data.response.body.items.item[i].code+'>'
					+ data.response.body.items.item[i].name+'</option>';
				}
				content += '</select>'
				$("#theme2_select").html(content);
				$('#select-1').on('change', function() {
					var theme = $('input[type=radio][name=radio-1]:checked').val();
			    	var theme2 = $(this).val();
			    	theme2_change(theme, theme2);
				});
			});
		
		var url2 = 
			"http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey="+ key
			+ "&areaCode=" + areaCode + '&sigunguCode=' + sigunguCode +'&cat1=' + theme
			+ "&pageNo=1&numOfRows=10000&listYN=Y&mapinfoYN=Y&arrange=B&MobileOS=ETC&MobileApp=AppTesting&_type=json";
		
		$.getJSON(url2, function(data) {
			auto_fill(data);
			var content = '';
			for (var i = 0; i < 50; i++) {
				var image = data.response.body.items.item[i].firstimage;
				if(typeof(image) == 'undefined' || image == 'undefined') image = "./resources/image/noimage.jpg";
				if(typeof(data.response.body.items.item[i])!='undefined'){
					if(!data.response.body.items.item[i].title.includes("2016")) {
					content += '<div class="location" id="'+data.response.body.items.item[i].contentid
						+'" value="'+data.response.body.items.item[i].title+'">'							
					 	+ '<h4>'+ data.response.body.items.item[i].title+'</h4>'
						+ '<img src='+image
						+' width=200 height=120><br>'
						+ '주소: ' + data.response.body.items.item[i].addr1+'<br>'
						+ '<input type="button" value="자세히 보기" onclick="javascript:d_Data(' + data.response.body.items.item[i].contentid + ')"> '
						+ '<button class="add_place" onclick="javascript:add_place(\''+data.response.body.items.item[i].title+'\',\''+image+'\',\''+data.response.body.items.item[i].contentid+'\',\''+data.response.body.items.item[i].mapx+'\',\''+data.response.body.items.item[i].mapy+'\')">일정에 추가</button> '
						+ '<input type="button" value="채팅에 전송" onclick="javascript:place_to_chat(\''+data.response.body.items.item[i].contentid+'\',\''+data.response.body.items.item[i].title+'\')">'
						+ '</div>'
					}
				}		
				$("#location_info").html(content);
				location_event();
			}
			showMarker(data);
		});	
	}
  
  function get_cliplist(){
	  $.ajax({
			type: "post",
			url: "get_cliplist",
			async: false,
			data: {
				user_id: 1
			},
			success: function(data){
				$("#location_info").empty();
				$("#location_info").html('<div id="location_flag"></div>');	
				 $.each(data, function(index, item){
					 clip_data(item.CONTENT_ID, item.CONTENT_TYPE_ID);
			   	 });	
				 location_event();
			},
			error: function(e){
				console.log(e);
			}
		})
  }
  
  function clip_data(contentid, contenttypeid) {
		var url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?ServiceKey="
				+ key;
		url += "&contentId=" + contentid + "&contentTypeId=" + contenttypeid
				+ "&defaultYN=Y&addrinfoYN=Y&firstImageYN=Y&overviewYN=Y&mapinfoYN=Y";
		url += "&MobileOS=ETC&MobileApp=AppTesting&_type=json";
		
		$.getJSON(url, function(data) {
			//auto_fill(data);
			console.log(data);
			var image = data.response.body.items.item.firstimage;
			if(typeof(image) == 'undefined' || image == 'undefined') image = "./resources/image/noimage.jpg";
			var content = '';
				if(typeof(data.response.body.items.item)!='undefined'){
					content += '<div class="location" id="'+data.response.body.items.item.contentid
						+'" value="'+data.response.body.items.item.title+'">'							
					 	+ '<h4>'+ data.response.body.items.item.title+'</h4>'
						+ '<img src='+image
						+' width=200 height=120><br>'
						+ '주소: ' + data.response.body.items.item.addr1+'<br>'
						+ '<input type="button" value="자세히 보기" onclick="javascript:d_Data(' + data.response.body.items.item.contentid + ')"> '
						+ '<button class="add_place" onclick="javascript:add_place(\''+data.response.body.items.item.title+'\',\''+image+'\',\''+data.response.body.items.item.contentid+'\',\''+data.response.body.items.item.addr1+'\',\''+data.response.body.items.item.mapx+'\',\''+data.response.body.items.item.mapy+'\')">일정에 추가</button> '
						+ '<input type="button" value="채팅에 전송" onclick="javascript:place_to_chat(\''+data.response.body.items.item.contentid+'\',\''+data.response.body.items.item.title+'\')">'
						+ '</div>';
				$("#location_flag").before(content);
				}
		});
	}
  	
  function theme2_change(theme, theme2) {      
		var areaCode = $('#areaCode').val();
		var sigunguCode = $('#sigunguCode').val();
		if(typeof(sigunguCode) == 'undefined' || sigunguCode == 'undefined' || sigunguCode == 'null') sigunguCode = "";
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
			+ "&pageNo=1&numOfRows=10000&listYN=Y&mapinfoYN=Y&arrange=B&MobileOS=ETC&MobileApp=AppTesting&_type=json";
		
		$.getJSON(url2, function(data) {
			auto_fill(data);
			var content = '';
			if(data.response.body.totalCount == 0){
				$("#location_info").html(content);
				initMap();
				return;
			}
			for (var i = 0; i < 50; i++) {
				if(typeof(data.response.body.items.item[i])!='undefined'){
					var image = data.response.body.items.item[i].firstimage;
					if(typeof(image) == 'undefined' || image == 'undefined') image = "./resources/image/noimage.jpg";
					if(!data.response.body.items.item[i].title.includes("2016")) {
					content += '<div class="location" id="'+data.response.body.items.item[i].contentid
						+'" value="'+data.response.body.items.item[i].title+'">'							
					 	+ '<h4>'+ data.response.body.items.item[i].title+'</h4>'
						+ '<img src='+image
						+' width=200 height=120><br>'
						+ '주소: ' + data.response.body.items.item[i].addr1+'<br>'
						+ '<input type="button" value="자세히 보기" onclick="javascript:d_Data(' + data.response.body.items.item[i].contentid + ')"> '
						+ '<button class="add_place" onclick="javascript:add_place(\''+data.response.body.items.item[i].title+'\',\''+image+'\',\''+data.response.body.items.item[i].contentid+'\',\''+data.response.body.items.item[i].mapx+'\',\''+data.response.body.items.item[i].mapy+'\')">일정에 추가</button> '
						+ '<input type="button" value="채팅에 전송" onclick="javascript:place_to_chat(\''+data.response.body.items.item[i].contentid+'\',\''+data.response.body.items.item[i].title+'\')">'
						+ '</div>'
					}
				}		
				$("#location_info").html(content);	
				location_event();	
			}
			showMarker(data);
		});	
	}
  	
  	function d_Data(contentid) {
		var url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?ServiceKey="
				+ key;
		url += "&contentId=" + contentid
				+ "&defaultYN=Y&addrinfoYN=Y&firstImageYN=Y&overviewYN=Y&mapinfoYN=Y";
		url += "&MobileOS=ETC&MobileApp=AppTesting&_type=json";
		
		$.getJSON(url, function(data) {
			var image = data.response.body.items.item.firstimage;
			if(typeof(image) == 'undefined' || image == 'undefined') image = "./resources/image/noimage.jpg";
			var content = 
				'<h3>'+ data.response.body.items.item.title+'</h3>'
				+ '<img src='+image+' width=340 height=220>'
				+ '<h5>'+ data.response.body.items.item.overview+'</h5>'
				+ '주소: ' + data.response.body.items.item.addr1+'('+data.response.body.items.item.zipcode+')<br>';
				if(typeof(data.response.body.items.item.tel) != 'undefined')
					content += '전화번호: '+ data.response.body.items.item.tel+'<br>';
				if(typeof(data.response.body.items.item.homepage) != 'undefined')
					content += '<h5>'+ data.response.body.items.item.homepage+'</h5>';
			$("#infolist").html(content);
			openDtl();
		});
	}
  	
  	var msgMarkers = [];
  	function msg_place(contentid) {
		var url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?ServiceKey="
				+ key;
		url += "&contentId=" + contentid
				+ "&defaultYN=Y&addrinfoYN=Y&firstImageYN=Y&overviewYN=Y&mapinfoYN=Y";
		url += "&MobileOS=ETC&MobileApp=AppTesting&_type=json";
		
		$.getJSON(url, function(data) {
			var dupCheck = true;
			for(var i=0; i<msgMarkers.length; i++){
				if(msgMarkers[i].id == data.response.body.items.item.contentid){
					google.maps.event.trigger(msgMarkers[i], "click");
					dupCheck = false;
				}
			}
			if(dupCheck){
				var infowindow = new google.maps.InfoWindow();
				var latLng = {
						lat : parseFloat(data.response.body.items.item.mapy),
						lng : parseFloat(data.response.body.items.item.mapx)
					}
				var marker = new google.maps.Marker({
					draggable : false,
					position : latLng,
					map : map,
					title : data.response.body.items.item.title,
					id : data.response.body.items.item.contentid
				});
				msgMarkers.push(marker);
				var image = data.response.body.items.item.firstimage;
				if(typeof(image) == 'undefined' || image == 'undefined') image = "./resources/image/noimage.jpg";
				var content = '<div class="content">'
					+ '<div id="image">'
					+'<img src='+image+' width=200 height=120>'
					+ '</div>'
					+ '<h3>'+data.response.body.items.item.title+'</h3>'
					+ '<h5>'+data.response.body.items.item.addr1+'</h5>'
					+ '<input type="button" value="자세히 보기" onclick="javascript:d_Data(' + data.response.body.items.item.contentid + ')"> '
					+ '<button class="add_place" onclick="javascript:add_place(\''+data.response.body.items.item.title+'\',\''+image+'\',\''+data.response.body.items.item.contentid+'\',\''+data.response.body.items.item.mapx+'\',\''+data.response.body.items.item.mapy+'\')">일정에 추가</button> '
					+ '<input type="button" value="채팅에 전송" onclick="javascript:place_to_chat(\''+data.response.body.items.item.contentid+'\',\''+data.response.body.items.item.title+'\')">'
					+ '</div>'; 
				google.maps.event.addListener(marker,'click', (function(marker,content,infowindow){ 
				    return function() {
				        infowindow.setContent(content);
				        infowindow.open(map,marker);
				    }; 	
				})(marker,content,infowindow));
				google.maps.event.trigger(marker, "click");
			}
		});
	}
  	
  	function place_to_chat(contentid, title){
    	msg = "contentid,"+contentid+",#"+title;
    	id = '${user_id}';
    	var data = {
    			id : id,
    			msg : msg
    	}
    	wsComms("chat", data);
        //$("#chat_div").chatbox("option", "boxManager").addMsg('${user_id}', msg);
  	}
  	
  	function location_event(){
  		$(".location").mouseenter(function(){
  			$(this).find('img').css( 'cursor', 'pointer' );
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
  			$(this).find('img').css( 'cursor', 'pointer' );
	    	var dtl_ord = $(this).attr("dtl_ord");
	    	for(var i=0;i<myloc_markers.length;i++){
	    	    if(myloc_markers[i].id == dtl_ord){
	    	    	myloc_markers[i].setAnimation(google.maps.Animation.BOUNCE);
	    	        break;
	    	    }
	    	}
	    });
	    $(".my_loc").mouseleave(function(){
	    	var dtl_ord = $(this).attr("dtl_ord");
	    	for(var i=0;i<myloc_markers.length;i++){
	    	    if(myloc_markers[i].id == dtl_ord){
	    	    	myloc_markers[i].setAnimation(null);
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
				showMarker(data, true);
		   		for (var i = 0; i < data.response.body.totalCount; i++) {
					var image = data.response.body.items.item[i].firstimage;
					if(typeof(image) == 'undefined' || image == 'undefined') image = "./resources/image/noimage.jpg";
					if(typeof(data.response.body.items.item[i])!='undefined'){
						if(data.response.body.items.item[i].title.includes(title) && !(data.response.body.items.item[i].title.includes('2016'))){
							content += '<div class="location" id="'+data.response.body.items.item[i].title
								+'" value="'+data.response.body.items.item[i].title+'">'	
							 	+ '<h4>'+ data.response.body.items.item[i].title+'</h4>'
								+ '<img src='+image
								+' width=200 height=120><br>'
								+ '주소: ' + data.response.body.items.item[i].addr1+'<br>'
								+ '<input type="button" value="자세히 보기" onclick="javascript:d_Data(' + data.response.body.items.item[i].contentid + ')"> '
								+ '<button class="add_place" onclick="javascript:add_place(\''+data.response.body.items.item[i].title+'\',\''+image+'\',\''+data.response.body.items.item[i].contentid+'\',\''+data.response.body.items.item[i].mapx+'\',\''+data.response.body.items.item[i].mapy+'\')">일정에 추가</button> '
								+ '<input type="button" value="채팅에 전송" onclick="javascript:place_to_chat(\''+data.response.body.items.item[i].contentid+'\',\''+data.response.body.items.item[i].title+'\')">'
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
		   		for (var i in sigungu) {
					if(sigungu[i].name.includes(searchText)){
						content += '<div class="item" data="'+ sigungu[i].areaCode +'" data2="'+ sigungu[i].sigunguCode +'" data-ci_name="'+ sigungu[i].name +'" data-lat="'+ sigungu[i].lat +'" data-lng="' + sigungu[i].lng + '" data-is_state="'+ sigungu[i].is_state +'">'
							+ '<div class="img_box"><img src="./resources/img/city/'+sigungu[i].areaCode+'.jpg"></div>'
						 	+ '<div class="info_box"><div class="info_title">'+sigungu[i].name+'</div><div class="info_sub_title">'+sigungu[i].name_en+'</div></div>'
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
  			init_search_menu();
  			msgMarkers = [];
  			var areaCode = $(this).attr('data');
  			var sigunguCode = $(this).attr('data2');
  			var name = $(this).attr('data-ci_name');
  			var state = $(this).attr('data-is_state');
  			if(typeof(sigunguCode) == 'undefined' || sigunguCode == 'undefined' || sigunguCode == 'null') sigunguCode = "";
  			if(state == 1){
				var html = '<input type="button" value="돌아가기" onclick="initCitySearch();">';
  				for(var i in sigungu){
  					if(sigungu[i].areaCode == areaCode){
  						html += '<div class="item" data="'+ sigungu[i].areaCode +'" data2="'+ sigungu[i].sigunguCode +'" data-ci_name="'+ sigungu[i].name +'" data-lat="'+ sigungu[i].lat +'" data-lng="' + sigungu[i].lng + '" data-is_state="'+ sigungu[i].is_state +'">';
  			            html += '<div class="img_box"><img src="./resources/img/city/'+sigungu[i].areaCode+'.jpg"></div>';
  			            html += '<div class="info_box"><div class="info_title">'+sigungu[i].name+'</div><div class="info_sub_title">'+sigungu[i].name_en+'</div></div>';
  			            html += '<div class="clear"></div></div>';
  					}
  				}
		        $('#changelist').html(html);
		        $('#changelist').scrollTop(0);
		        city_change_event();
  			}else{
	  			$('#areaCode').val(areaCode);
	  			$('#sigunguCode').val(sigunguCode);
	  			$('#day_city_name').val(name);
	  			theme2_change('', '');
	  			closeCitySearch();
	  			$('#city_name').text(name);
  			}
  		});
  	}
  	
  	function openNav() {
  		//$('#map').css('left', '10%');
  		$('#openNav').css('opacity', '0');
  		$('#openNav').css('pointer-events', 'none');
  		$('#section3').css('pointer-events', 'visible');
  		$('#section3').css('overflow', 'hidden');
  		$('#section3').css('opacity', '100');
  		$('#section3').css('width', '20%');
  		$("#section3").attr("class","col-4 sidenav");
  	}

  	function closeNav() {
  		//$('#map').css('left', '0');
  		$('#openNav').css('opacity', '100');
  		$('#openNav').css('pointer-events', 'visible');
  		$('#section3').css('pointer-events', 'none');
  		$('#section3').css('opacity', '0');
  		$('#section3').css('width', '0');
  		$("#section3").attr("class","sidenav");
  	}
  	
  	function openDtl() {
  		//$('#map').css('left', '12.5%');
  		$('#detail_info').css('opacity', '100');
  		$('#detail_info').css('pointer-events', 'visible');
  		$('#detail_info').css('width', '25%');
  		$("#detail_info").attr("class","col-4 sidenav");
  	}

  	function closeDtl() {
  		//$('#map').css('left', '0');
  		$('#detail_info').css('opacity', '0');
  		$('#detail_info').css('pointer-events', 'none');
  		$('#detail_info').css('width', '0');
  		$("#detail_info").attr("class","sidenav");
  	}
  	
  	function openBgtMemo() {
  		//$('#map').css('left', '12.5%');
  		$('#budget_memo').css('opacity', '100');
  		$('#budget_memo').css('pointer-events', 'visible');
  		$('#budget_memo').css('width', '25%');
  		$("#budget_memo").attr("class","col-4 sidenav");
  	}

  	function closeBgtMemo() {
		var scd_sq = $('#place_scd_sq').val();
		var daily_sq = $('#place_daily_sq').val();
		var dtl_sq = $('#place_dtl_sq').val();
		var budget = $('#place_budget').val();
		var memo = $('#place_memo').val();
		$.ajax({
			type: "post",
			url: "update_bgt",
			async: false,
			data: {
				scd_sq: scd_sq
				,daily_sq: daily_sq
				,dtl_sq: dtl_sq
				,dtl_budget: budget
				,dtl_memo: memo
			},
			success: function(data){
				get_daily_budget();
				get_budget_total();
				wsComms("update_bgt", "update_bgt");
			},
			error: function(e){
				console.log(e);
			}		
		})
  		//$('#map').css('left', '0');
  		$('#budget_memo').css('opacity', '0');
  		$('#budget_memo').css('pointer-events', 'none');
  		$('#budget_memo').css('width', '0');
  		$('#budget_memo').attr("class","sidenav");
  	}

  	function openCitySearch() {
  		//$('#map').css('left', '10%');
  		$('#city_change').css('opacity', '100');
  		$('#city_change').css('pointer-events', 'visible');
  		$('#city_change').css('width', '20%');
  		$('#city_change').attr("class","col-4 sidenav");
  	}

  	function closeCitySearch() {
  		//$('#map').css('left', '0');
  		$('#city_change').css('opacity', '0');
  		$('#city_change').css('pointer-events', 'none');
  		$('#city_change').css('width', '0');
  		$('#city_change').attr("class","sidenav");
  		$('#searchCity').val("");
  		initCitySearch();
  	}
  	
  	function openAlt() {
  		//$('#map').css('left', '10%');
  		alter_schedule();
  		$('#alter_schedule').css('opacity', '100');
  		$('#alter_schedule').css('pointer-events', 'visible');
  		$('#alter_schedule').css('width', '10%');
  		$('#alter_schedule').attr("class","col-2 sidenav");
  	}

  	function closeAlt() {
  		daily_date_change();
  		//$('#map').css('left', '0');
  		$('#alter_schedule').css('opacity', '0');
  		$('#alter_schedule').css('pointer-events', 'none');
  		$('#alter_schedule').css('width', '0');
  		$('#alter_schedule').attr("class","sidenav");
  		init_daily_list();
		$(".ordlist").off("click");
	    ordclick();
  		$("#alterlist").sortable("disable");
  		$("#sortable").sortable("enable");
	  	$('.ordlist:first').trigger('click');
		init_search_menu();
		msgMarkers = [];
		wsComms("closeAlt", "closeAlt");
  	}
  	
  	function daily_date_change(){
  		var scd_sq = $('#scd_sq').val();
  		var d = new Date($('#start_ymd').val());
  		var day_cnt = $('.alterDaylist').length;
  		$('.alterDaylist').each(function(index, item){
  			 var curr_date = d.getDate();
			 if(curr_date < 10) curr_date = '0'+curr_date;
			 var curr_month = d.getMonth() + 1;
			 if(curr_month < 10) curr_month = '0'+curr_month;
			 var curr_year = d.getFullYear();
			 var date_ymd = curr_year + "-" + curr_month + "-" + curr_date;
  			$.ajax({
				type: "post",
				url: "updateDates",
				async: false,
				data: {
					scd_sq: scd_sq
					,daily_ord: index + 1
					,daily_ymd: date_ymd
				},
				error: function(e){
					console.log(e);
				}	
			})
			if(index==0){
				$.ajax({
					type: "post",
					url: "edit_start_ymd",
					async: false,
					data: {
						scd_sq: scd_sq
						,start_ymd: date_ymd
						,day_cnt: day_cnt
					},
					error: function(e){
						console.log(e);
					}	
				})
			}
			d.setDate(d.getDate() + 1);	
  		});
  		
  	}
  	
  	function init_daily_date(){
  		var scd_sq = $('#scd_sq').val();
  		var d = new Date($('#init_start_ymd').val());
  		var day_cnt = $('#init_day_cnt').val();
  		for(var index=0; index<day_cnt; index++){
  			 var curr_date = d.getDate();
			 if(curr_date < 10) curr_date = '0'+curr_date;
			 var curr_month = d.getMonth() + 1;
			 if(curr_month < 10) curr_month = '0'+curr_month;
			 var curr_year = d.getFullYear();
			 var date_ymd = curr_year + "-" + curr_month + "-" + curr_date;
  			$.ajax({
				type: "post",
				url: "updateDates",
				async: false,
				data: {
					scd_sq: scd_sq
					,daily_ord: index + 1
					,daily_ymd: date_ymd
				},
				error: function(e){
					console.log(e);
				}	
			})
			d.setDate(d.getDate() + 1);	
  		}
  	}
  	
  	function init_daily_list(){
  		var scd_sq = $('#scd_sq').val();
  		$.ajax({
			type: "post",
			url: "get_daily_list",
			data: {
				scd_sq: scd_sq
			},
			async: false,
			success: function(data){
				set_dailylist(data);
			},
			error: function(e){
				console.log(e);
			}		
		})
		
		$.ajax({
			type: "post",
			url: "select_scd",
			data: {
				scd_sq: scd_sq
			},
			success: function(data){
				$('#plan_title').html(data.scd_title);
			},
			error: function(e){
				console.log(e);
			}		
		})
  	}
  	
  	function set_dailylist(data){
    	  var my_content = '';
    	  $.each(data, function(index,item){
    		var city_nm = item.CITY_NM;
    		if(index == 0) $('#start_ymd').val(item.DAILY_YMD);
    		if(typeof(city_nm) == 'undefined') city_nm = "";
    			 var d = new Date(item.DAILY_YMD);
    			 var weekday = [' (일)',' (월)',' (화)',' (수)',' (목)',' (금)',' (토)'];
    			 var day = weekday[d.getDay()];
      			 var curr_date = d.getDate();
    			 if(curr_date < 10) curr_date = '0'+curr_date;
    			 var curr_month = d.getMonth() + 1;
    			 if(curr_month < 10) curr_month = '0'+curr_month;
    			 var curr_year = d.getFullYear();
    			 var date_ymd = curr_year + "-" + curr_month + "-" + curr_date + day;
    		  my_content += '<div id="Day'+item.DAILY_ORD+'" class="ordlist">'
    		    + '<input type="hidden" class="daily_sq" value="'+item.DAILY_SQ+'">'
    		    + '<input type="hidden" class="areaCode" value="'+item.AREA_CODE+'">'
    		    + '<input type="hidden" class="sigunguCode" value="'+item.SIGUNGU_CODE+'">'
    		    + '<input type="hidden" class="day_city_name" value="'+item.CITY_NM+'">'
    		    + '<input type="hidden" class="ymd" value="'+item.DAILY_YMD+'">'
    		    + '<input type="hidden" class="day" value="'+item.DAILY_ORD+'">'
    			+ 'DAY '+item.DAILY_ORD+' <br>'
    		 	+ date_ymd +' <br>'
    			+ '<span id="city_names">'+item.CITY_NM+'</span>'
    			+ '<br>'
    			+ '</div>';
    	  	});
    	  	my_content += '<div id="daylist"></div>';
    	  	$('#days').html(my_content); 
      }	
  	
  	function alter_schedule(){
		var scd_sq = $('#scd_sq').val();
  		$.ajax({
			type: "post",
			url: "get_daily_list",
			data: {
				scd_sq: scd_sq
			},
			async: false,
			success: function(data){
				set_alterlist(data);
			},
			error: function(e){
				console.log(e);
			}		
		})
  	}
  	
  	function set_alterlist(data){
  	  var my_content = '';
  	  $.each(data, function(index,item){
  		var city_nm = item.CITY_NM;
  		var d = new Date(item.DAILY_YMD);
		 var weekday = [' (일)',' (월)',' (화)',' (수)',' (목)',' (금)',' (토)'];
		 var day = weekday[d.getDay()];
		 var curr_date = '' + d.getDate();
	     var curr_month = '' + (d.getMonth() + 1);
		 var curr_year = d.getFullYear();
		 if (curr_month.length < 2) curr_month = '0' + curr_month;
		 if (curr_date.length < 2) curr_date = '0' + curr_date;
		 var date = curr_year + "-" + curr_month + "-" + curr_date + day;
  		if(typeof(city_nm) == 'undefined') city_nm = "";
  		  my_content += '<div class="alterDaylist" id="'+item.DAILY_ORD+'" daily_sq="'+item.DAILY_SQ+'" daily_ord="'+item.DAILY_ORD+'" daily_ymd="'+item.DAILY_YMD+'" city_nm="'+item.CITY_NM+'">'
  			+ 'DAY<span id="alter_day">'+item.DAILY_ORD+'</span><br>'
  		 	+ '<div id="daily_date">'+date+'</div>'
  			+ '<div id="city_names">'+item.CITY_NM+'</div>'
  			+ '<input type="button" value="삭제" onclick="javascript:delete_day(\''+item.DAILY_SQ+'\',\''+item.DAILY_ORD+'\');">'
  			+ '<br>'
  			+ '</div>';
  	  });
  		$('.alterDaylist').each(function(){
  			$(this).remove();
  		});
  		$("#alterflag").before(my_content);
  		$("#sortable").sortable("disable");
  		$("#alterlist").sortable("enable");
    }	
  	
  	function delete_day(daily_sq, daily_ord){
  		var check = confirm("정말 삭제하시겠습니까?");
  		if(!check) return;
  		
  		var targetsq = "#"+daily_ord;
  		$(targetsq).remove();
  		
  		$.ajax({
			type: "post",
			url: "delete_day",
			async: false,
			data: {
				daily_sq: daily_sq
			},
				success: function(data){
					var itemOrder = $('#alterlist').sortable("toArray");
	     		   for (var i = 0; i < itemOrder.length-1; i++) {
	     			   var target_span = '#'+itemOrder[i]+' > span';
	    		   			var target_ord = '#'+itemOrder[i];
	    		   			$(target_span).html(i+1);
	    		   			$(target_ord).attr('daily_ord', (i+1));
	     		   }
			     	// update order in db
			     	$('.alterDaylist').each(function(){
			     		var daily_sq = $(this).attr('daily_sq');
			     		var daily_ord = $(this).attr('daily_ord');
			         	var sort_change = {
			         		daily_sq: daily_sq,
			         		daily_ord: daily_ord
			     		};
			         	$.ajax({
			     			type: "post",
			     			url: "day_sort_change",
			     			data: sort_change,
			     			async: false,
			     			error: function(e){
			     				console.log(e);
			     			}
			     		})//ajax
			     	})//foreach
			},
			error: function(e){
				console.log(e);
			}		
		});
  		wsComms("delete_day", "delete_day");
	}

	function alter_sortable(){
		$("#alterlist").sortable({
        	update: function(event, ui) {
        		var itemOrder = $('#alterlist').sortable("toArray");
        		   for (var i = 0; i < itemOrder.length-1; i++) {
        			    //var target_span = '#'+itemOrder[i]+' > span';
       		   			var target_ord = '#'+itemOrder[i];
       		   			//$(target_span).html(i+1);
       		   			$(target_ord).attr('daily_ord', (i+1));
        		   }
        		//check_cities();
        	// update order in db
        	$('.alterDaylist').each(function(){
        		var daily_sq = $(this).attr('daily_sq');
        		var daily_ord = $(this).attr('daily_ord');
            	var sort_change = {
            		daily_sq: daily_sq,
            		daily_ord: daily_ord
        		};
            	$.ajax({
        			type: "post",
        			url: "day_sort_change",
        			data: sort_change,
        			async: false,
        			error: function(e){
        				console.log(e);
        			}
        		})//ajax
        	})//foreach
    		daily_date_change();
	        }//update
        });
        $("#alterlist").disableSelection();
        
        $('#plan_title').mouseover(function(){
        	if($(this).hasClass('on')){
        		$('#plan_title').css('background','');
        		$('#plan_title').css('background-color','#fff');
        	}else{
        		$('#plan_title').css('background','url("/res/img/workspace/new/title_edit_btn.png") no-repeat right 10px top 12px');
        		$('#plan_title').css('background-color','#ededed');
        	}

        });

        $('#plan_title').mouseout(function(){
        	$('#plan_title').css('background','');
        	$('#plan_title').css('background-color','#fff');
        });


        $('#plan_title').click(function(e){

            if($(e.target).is('.pn_title_chg_ok')){
        		 e.stopPropagation();
        			_this_val = $('#plan_title input').val();
        			var scd_sq = $('#scd_sq').val();

        			$.ajax({
        				type: 'post',
        				url: 'update_scd',
        				data: {
        					scd_sq:scd_sq 
        					,scd_title:_this_val
        				},
        				success: function(data) {
	        				$('#plan_title').html(_this_val);
	        				wsComms("update_scd", _this_val);
	        				('#plan_title').removeClass('on');
	        				return;
        				},         
        				error: function(e) {
        					console.log(e);
        				}
        			});

        			$('#plan_title').html(_this_val);
                    $('#plan_title').removeClass('on');
                    return;
        	}
            
        	if($(this).hasClass('on')){
        	}else{
        		$(this).addClass('on');
        		_this_txt = $(this).text();
        		_this_html = '<input type="text" value="'+_this_txt+'" class="pn_title_input_box"><div style="font-size: 10px;position:absolute;top: 22px;left: 325px;color:##808080" id="pl_title_cnt">'+_this_txt.length+'/20</div><button class="pn_title_chg_ok">확인</button>';
        		$('#plan_title').html(_this_html);
        	}
        });


        $('#plan_title').on('keydown', '.pn_title_input_box', function(){
        	title_cnt = $(this).val().length;
        	if(title_cnt > 20){
        		$(this).val($(this).val().substring(0,20));
        	}
        	if(title_cnt < 20){
        		$('#pl_title_cnt').html(title_cnt+'/20');
        	}else{
        		$('#pl_title_cnt').html('20/20');
        	}

        });
	}
	
	function whoWithShare(){
        var checkId = $('#shareId').val();
        if(checkId == ''){
           alert("일정을 함께 공유하실 분의 아이디를 입력해주세요.");
           return false;
        }
        $.ajax({
            type : "post",
            url : "addShareAuthority",
            data : {
   			  scd_sq : '${scd_sq}',
   			  searchId : checkId
        	},
            success : function(inform){
               alert(inform);
               $('#close_btn').trigger('click');
            },
            error : function(e){
               console.log(e);
            }
        });//ajax

     }

     function deleteElement(){
        document.getElementById('shareId').value = '';
        var html = '';
        $('#existId').html(html);
     }
  </script>
</head>
<body>
<input type="hidden" id="scd_sq" value="${scd_sq }">
<input type="hidden" id="areaCode" value="">
<input type="hidden" id="sigunguCode" value="">
<input type="hidden" id="day_city_name" value="">
<input type="hidden" id="init_start_ymd" value="${schedule.start_ymd }">
<input type="hidden" id="init_day_cnt" value="${schedule.day_cnt }">
<div class="header">
		<div class="fl" id="logoimg"><a href="./"><img src="./resources/image/logoedit.png" style="margin-top:5px;margin-left:20px;width:60px;height:50px;"></a></div>
		<div class="fl" style="width:410px;border-right:solid #ebebeb 1px;height:100%;font-size:22px;"><div class="fl" id="plan_title"></div><div class="clear"></div></div>
		<div class="fl" style="width:200px;height:62px;line-height:62px;border-right:solid #ebebeb 1px;text-align:center;color: #555555;font-size:16px;font-weight:bold;" id="plan_total_budget">
			KRW <span id="budget_total"></span>
		</div>
		<div class="fl" style="width:550px;">&nbsp;</div>
		<div class="fl" id="gnb_ci_name"></div>
		<div class="fr gnb_box">
		<div class="fr" style="margin-top:9px;margin-right:20px;">
			<div class="fl" id="plan_member_list_box">
			<div class="fl" style="margin-right:5px;"></div>
			<div class="clear"></div>
			</div>
			<a data-toggle="modal" href="#myModal"><div class="fl" id="plan_out_btn">공유하기</div></a>
			<a href="SC_12?scd_sq=${scd_sq }"><div class="fl" id="plan_out_btn">저장&닫기</div></a>
				<input type="button" id="connectChat" name="toggle" value="채팅창 보이기" />
			    <div id="chat_div"></div>
			<div class="clear"></div>
		</div>
		<div class="clear"></div>
</div>
</div>

<!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">일정에 초대 하실 분의 아이디를 입력해주세요</h4>
        </div>
        <div class="modal-body">
        <input type="text" name="shareId" class="form-control" id="shareId" placeholder="공유할 ID를 입력해주세요" />
        </div>
        <div class="modal-footer">
        <div id="existId" class="existId"></div>
         <button type="button" id="invite_btn" class="btn btn-default btn_invite" onclick="">Invite</button>
          <button type="button" id="close_btn" class="btn btn-default" data-dismiss="modal" onclick="deleteElement();">Close</button>
        </div>
      </div>
      
    </div>
  </div>

<div style="overflow:auto;" class="col-2 daylist" id="section1">
<input type="button" id="eddays" value="일정 수정하기" onclick="openAlt();" size="20">
<br>
<div id="days">
<div id="daylist"></div>
</div>
<input type="button" id="add_day" value="DAY 추가">
</div>

<div style="overflow:auto;" class="sidenav" id="alter_schedule">
<span>여행 시작일</span>
<input type="text" id="start_ymd" name="start_ymd" value="${start_ymd }" style="width:100%">
<br>
<div id="alterlist">
<div id="alterflag"></div>
</div>
<br>
<input type="button" id="alter_complete" value="수정 완료" style="width:100%" onclick="closeAlt()">
</div>

<div style="overflow:auto;" class="col-3" id="section2">
<div id="sortable">
<div id="my_location"></div>
</div>
</div>

<div class="sidenav" id="section3">
<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
<div id="search_menu" style="height:29%;">
<div>
<span id="city_name"></span> 
<input type="button" value="도시변경" onclick="javascript:openCitySearch();">
</div>
<div class="search_box">
<span>검색:</span>&nbsp; <input id="search">
</div>
<div class="theme_check">
    <label for="radio-1">자연</label>
    <input type="radio" class="radio" name="radio-1" id="radio-1" value="A01">
    <label for="radio-2">인문</label>
    <input type="radio" class="radio" name="radio-1" id="radio-2" value="A02">
    <label for="radio-3">레져</label>
    <input type="radio" class="radio" name="radio-1" id="radio-3" value="A03">
    <br>
    <label for="radio-4">쇼핑</label>
    <input type="radio" class="radio" name="radio-1" id="radio-4" value="A04">
    <label for="radio-5">음식</label>
    <input type="radio" class="radio" name="radio-1" id="radio-5" value="A05">
    <label for="radio-6">클립</label>
    <input type="radio" class="radio" name="radio-1" id="radio-6" value="clip">
</div>
<div id="theme2_select">
<select name="select-1" id="select-1" disabled="disabled">
<option value="" selected="selected">카테고리를 먼저 선택하세요.</option>
</select>
</div>
</div>
<div style="overflow:auto;height:71%;" id="location_info">
<div id="location_flag"></div>
</div>
</div>

<div style="overflow:auto;" class="sidenav" id="detail_info">
<a href="javascript:void(0)" class="closebtn" onclick="closeDtl()">&times;</a>
<div id="infolist"></div>
</div>

<div style="overflow:auto;" class="sidenav" id="budget_memo">
<a href="javascript:void(0)" class="closebtn" onclick="closeBgtMemo()">&times;</a>
<div id="bmlist"></div>
</div>

<div style="overflow:auto;" class="sidenav" id="city_change">
<a href="javascript:void(0)" class="closebtn" onclick="closeCitySearch()">&times;</a>
<div style="overflow:auto; height:7%;" id="change_search">
검색: <input id="searchCity">
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