<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	request.setCharacterEncoding("utf-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link
	href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Jua&display=swap"
	rel="stylesheet">
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<title>꿀카페 :: 로그인</title>

<style>
html, body {
	height: 100%;
	background-color: white;
}

body {
	display: -ms-flexbox;
	display: flex;
	-ms-flex-align: center;
	align-items: center;
	padding-top: 40px;
	padding-bottom: 40px;
	background-color: white;
}

.form-signin {
	width: 100%;
	max-width: 330px;
	padding: 15px;
	margin: auto;
}

.form-signin .checkbox {
	font-weight: 400;
}

.form-signin .form-control {
	position: relative;
	box-sizing: border-box;
	height: auto;
	padding: 10px;
	font-size: 16px;
}

.form-signin .form-control:focus {
	z-index: 2;
}

.form-signin input[type="email"] {
	margin-bottom: -1px;
	border-bottom-right-radius: 0;
	border-bottom-left-radius: 0;
}

.form-signin input[type="password"] {
	margin-bottom: 10px;
	border-top-left-radius: 0;
	border-top-right-radius: 0;
}

.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}
</style>
</head>

<body class="text-center">

	<form class="form-signin" action="login.html" method="post" align="center">
		
		 <!-- 로그인 로고를 넣고 로고에 꿀카페 홈페이지 연동시키기 -->
		<div id="header" >
			<a href="../main.html"><img class="mb-4" src="${path }/resources/images/logo/login_logo2.png"></a>
		</div>
		
<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->

		<!-- 아이디 -->
		<label for="inputUser_id" class="sr-only">아이디</label> 
		<input type="text" name="user_id" class="form-control" placeholder="아이디" required
			autofocus>
			
		<!-- 비밀번호 -->
		<label for="user_pwd" class="sr-only">Password</label>
		<input type="password" name="user_pwd" class="form-control"
			placeholder="비밀번호" required autofocus>
		<p> </p>
		
<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
		
		<!-- HOME과 회원가입(SIGN UP) 버튼 -->
		<p>
			| <a href="../main.html">HOME</a> <img src="${path }/resources/images/logo/honeyj3.png" height="20" width="22"> | 
			<a href="joinForm.html">SIGN UP</a> <img src="${path }/resources/images/logo/honey2.png" height="20" width="20"> |
		</p>
		
		<!-- 로그인 버튼 -->
		<button class="btn btn-lg btn-primary btn-block" type="submit">LOGIN</button>
		</form>
</body>
</html>