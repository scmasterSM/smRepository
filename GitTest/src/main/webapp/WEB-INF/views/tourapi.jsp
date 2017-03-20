<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <title>kto 데이터 가져오기</title>
</head>
<body>

    <!-- 지도를 표시할 div 입니다 -->
    <div id="map_canvas" style="width:100%;height:800px;"></div>

    <button type="button" id="btnKto" onClick="Javascript:l_Data();">위치기반조회</button>
    <button type="button" id="btnKto" onClick="Javascript:d_Data();">공통정보조회</button>
</body>

<script type="text/javascript"
	src="<c:url value="/resources/js/jquery-3.1.1.js"/>"></script>

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
        function l_Data(){
            var key = "fHPwwCqceBLnLCExz65uYIYEAdiAs6xOwv79o6FcLHh7x6iPmxITE9Wk7TqH1q%2F1%2FeSw9j%2FUxPbGiQYcnVa0zw%3D%3D";

            var lat = 37.566535;
            var lng = 126.97796919999999;
            var radius = 500;

            var url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/locationBasedList?ServiceKey="+key;
            url += "&mapX=" + lng +"&mapY=" + lat + "&radius=" + radius;
            url += "&pageNo=1&numOfRows=1000&listYN=Y&arrange=A&MobileOS=ETC&MobileApp=AppTesting&_type=json";

            /* 특정 타입만 보고 싶을 때 type기입 관광지:12, 문화시설: 14 축제 : 15 코스25 레포츠 28 숙박32 쇼핑 38 음식39
            if( contentTypeID != "ALL" ){
                url += ("&contentTypeId=" + contentTypeID);
            }
            */

            console.log(url);
            $.getJSON(url, function(data) {
                console.log('sucess', data);
                for( var i = 0 ; i < data.response.body.totalCount ; i++){
                    console.log( data.response.body.items.item[i] );
                }   
            });
        }

        function d_Data(){
            var key = "fHPwwCqceBLnLCExz65uYIYEAdiAs6xOwv79o6FcLHh7x6iPmxITE9Wk7TqH1q%2F1%2FeSw9j%2FUxPbGiQYcnVa0zw%3D%3D";

            var contentId = 232229;

            var url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?ServiceKey="+key;
            url += "&contentId=" + contentId + "&defaultYN=Y&addrinfoYN=Y&overviewYN=Y";
            url += "&MobileOS=ETC&MobileApp=AppTesting&_type=json";

            $.getJSON(url, function(data) {
                console.log('sucess detail data');
                resultDetailData = data;
                console.log(data.response.body.items.item);
            });
        }

    </script>
</html>
