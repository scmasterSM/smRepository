<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">

<link rel='stylesheet prefetch' href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,500,700,900|RobotoDraft:400,100,300,500,700,900'>
<link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css'>
<link rel="stylesheet" href="./resources/css/style_login.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<script type="text/javascript">


$(function() {

$("#submit_button").on("click", function() {

	var user_id1 = $("#user_id").val();
	var password1 = $("#password").val();

	if (user_id1.length == 0) {
		alert('아이디를 입력해주세요');
		return false;
	}
	if (password1.length == 0) {
		alert('비밀번호를 입력해주세요');
		return false;
	}

	$.ajax({
		type : "post",
		url : "login",
		data : {
			user_id : user_id1,
			password : password1
		},
		dataType : 'text',

		success : function(data) {
			if (data == "success") {
				window.location.href = "./";

			} else {
				alert("비밀번호가 맞지 않습니다.");
			}
		},
		error : function(e) {
			console(e);
		}
	})
});


//조인

$("#submit_join").on("click", function() {

	var user_id2 = $("#user_id1").val();
	var password2 = $("#password1").val();
	var password3 = $("#password2").val();
	var email1 = $("#email").val();
	var user_sex1 = $("#user_sex").val();

	var sung = "선택";

	//alert(user_sex1);
	//$('#user_sex option:selected').val();
	//$('select[name=user_sex]').val();

	if (user_id2.length == 0) {
		alert('아이디를 입력해주세요');
		return false;
	}
	if (password2.length == 0) {
		alert('비밀번호를 입력해주세요');
		return false;
	}
	if (email1.length == 0) {
		alert('이메일을 입력해주세요');
		return false;
	}

	if (user_sex1 == sung) {
		alert('성별을 입력해주세요');
		return false;
	}

	if (password2 != password3) {
		alert('비밀번호 확인 시 비밀번호가 일치하지 않습니다.');
		return false;
	}

	$.ajax({
		type : "post",
		url : "join",
		data : {
			user_id : user_id2,
			password : password2,
			email : email1,
			user_sex : user_sex1
		},
		dataType : 'text',

		success : function(data) {
			console.log(data);
			if (data == "success") {
				alert("가입처리가 완료 되었습니다.");
				$('#myModal').modal('hide');
				window.location.href = "./";
			} else {
				alert("가입 처리가 되지 않았습니다.");
			}
		},
		error : function(e) {
			console(e);
		}
	})
});






});

</script>








</head>
<body>

<div class="pen-title">
  <h1>Travel Maker</h1>
</div>
<!-- Form Module-->
<div class="module form-module">
  <div class="toggle"><i class="fa fa-times fa-pencil"></i>
    <div class="tooltip">Click Me</div>
  </div>
  <div class="form">
    <h2>Login to your account</h2>
    <form>
      <input type="text" placeholder="Username" id="user_id"/>
      <input type="password" placeholder="Password" id="password"/>
      <button type="button" id="submit_button">Login</button>
    </form>
  </div>
  <div class="form">
    <h2>Create an account</h2>
    <form>
      <input type="text" placeholder="ID"/>
      <select class="form-control" name="user_sex" id="user_sex">
		<option value="선택">선택</option>
		<option value="m">남성</option>
		<option value="f">여성</option>
		</select>
      <input type="password" placeholder="Password"/>
      <input type="email" placeholder="Email Address"/>
      <button>Register</button>
    </form>
  </div>
  <div class="cta"><a href="home">NikoNikoNi</a></div>
</div>
 <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

 <script src="./resources/js/index_login.js"></script>

</body>
</html>

</body>
</html>