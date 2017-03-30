<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="./resources/js/jquery-3.1.1.js"></script>
<title>Insert title here</title>
<script>
var city_count = 0;
var day_citylist = [];
var daycount = 1;

$(function(){
	$("#add_city").on('click', function() {
		city_count++;
		var name = 'areaCode'+city_count;
		var days = 'days'+city_count;
		var city = '';
		city += '<tr>'
			+ '<td>도시 </td>'
			+ '<td><input type="radio" name="'+name+'" value="1">서울'
			+	'<input type="radio" name="'+name+'" value="2">인천'
			+	'<input type="radio" name="'+name+'" value="6">부산'
			+	'<input type="radio" name="'+name+'" value="39">제주'			
			+ '</td>'
			+ '</tr>'
			+ '<tr>'	
			+ 	'<td>일수 </td>'
			+ 	'<td><input type="text" id="'+days+'" name="days" placeholder="일수 입력"></td>'
			+ '</tr>'
			+ '<tr><td>-----</td></tr>';
		$("#citylist").before(city);
	});
});

function add_citylist(){
	var start_ymd = new Date($('#start_ymd').val());
	for(var i=1; i<=city_count; i++){
		var daysSearch = '#days'+i;
		var areCodeSearch = 'input[type=radio][name=areaCode'+i+']:checked';
		var days = $(daysSearch).val();
		var areaCode = $(areCodeSearch).val();
		for(var j=0; j<days; j++){
			var date = new Date();
			date.setDate(start_ymd.getDate() + j);
			console.log(date);
			var day_city = {
				daily_ord: daycount,
				daily_ymd: date,
				areaCode: areaCode
			}
			day_citylist.push(day_city);
			daycount++;
		}
	}
	console.log(day_citylist);
	return true;
}
</script>
</head>
<body>
<h1>[ 일정 만들기 ]</h1>
<input type="button" id="add_city" value="도시추가">
<form action="create_schedule" method="post" onsubmit="return add_citylist();">
<table>
	<input type="hidden" id="user_id" name="user_id" value="1" placeholder="ID">
	
	<div id="citylist"></div>
	
	<tr>	
		<td>여행제목</td>
		<td><input type="text" id="scd_title" name="scd_title" placeholder="제목 입력"></td>
	</tr>
	<tr>
		<td>출발일</td>
		<td><input type="text" id="start_ymd" name="start_ymd" placeholder="YYYY/MM/DD"></td>
	</tr>
	<tr>
		<td>테마</td>
		<td><input type="radio" name="scd_theme" value="alone" checked="checked">나홀로
			<input type="radio" name="scd_theme" value="couple">커플
			<input type="radio" name="scd_theme" value="family">가족
			<input type="radio" name="scd_theme" value="group">단체</td>
	</tr>
	<tr>
		<td>계절</td>
		<td><input type="radio" name="scd_season" value="spring" checked="checked">봄
			<input type="radio" name="scd_season" value="summer">여름
			<input type="radio" name="scd_season" value="fall">가을
			<input type="radio" name="scd_season" value="winter">겨울</td>
	</tr>
	<tr>
		<td>설명</td>
		<td><input type="text" id="scd_desc" name="scd_desc" placeholder="설명 입력"></td>
	</tr>
</table>
<input type="submit" value="제출">
<input type="reset" value="다시 쓰기">
</form>
</body>
</html>