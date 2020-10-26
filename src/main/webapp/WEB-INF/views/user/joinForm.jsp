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
	
<title>꿀카페 : 회원가입</title>

<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->

<script type="text/javascript">

    /*  아이디 입력 했는지의 여부와 입력 시 중복 확인 여부로 넘김 */
	function idChk() {
		var user_id = frm.user_id.value;
		if (!frm.user_id.value) {
			alert("아이디 입력 후 중복체크 버튼을 눌러주세요!");
			frm.user_id.focus();
			return false;
		}
		$.post('idChk.html', 'user_id=' + frm.user_id.value, function(data) {
			$('#idChk').html(data);
			//alert(data);
		});
	}
	
<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->

   /* 닉네임 입력 했는지의 여부와 입력 시 중복 확인 여부로 넘김 */
   function nickChk() {
		var user_nickname = frm.user_nickname.value;
		if (!frm.user_nickname.value) {
			alert("닉네임 입력 후 중복체크 버튼을 눌러주세요!");
			frm.user_nickname.focus();
			return false;
		}
		$.post('nickChk.html', 'user_nickname=' + frm.user_nickname.value,
				function(data) {
					$('#nickChk').html(data);
					//alert(data);
				});
	}
<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->

    /* 비밀번호 조건에 맞게 입력 + 비밀번호 확인이 서로 일치해야 가입이 이뤄짐 */
	function pwChk() {

    	// /^: 시작,  $/: 끝, []: 속에 글자 중에 하나
		// .*(?=.{4,8}) 점을 포함한 한글자 이상을 사용하는 4~8이내
		// (?=.*[0-9]) 숫자 하나는 포함
		// (?=.*[a-zA-Z]) 소문자/대문자 구별없이 한글자 이상
		// (?=.*[@!#$*()_&]) []속의 글자(특수문자) 하나는 있어야한다
	
		var user_pwd = /^.*(?=.{10,16})(?=.*[0-9])(?=.*[a-zA-Z])(?=.*[@!#$*()_&]).*$/;
		if (!user_pwd.test(frm.user_pwd.value)) {
			alert("비밀번호 조건에 맞지 않습니다.");
			frm.user_pwd.focus();
			return false;
		} else if (frm.user_pwd.value != frm.user_pwd2.value) {
			alert("비밀번호와 비밀번호 확인이 서로 일치하지 않습니다.");
			frm.user_pwd.value = "";
			frm.user_pwd.focus();
			return false;
		}
		return true;
	}
</script>

<style>
html, body {
	height: 100%;
}

body {
	display: -ms-flexbox;
	display: flex;
	-ms-flex-align: center;
	align-items: center;
	padding-top: 40px;
	padding-bottom: 40px; <%--
	background-color: #f5f5f5; --%>
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

.form-signin .form-control2 {
	position: relative;
	box-sizing: border-box;
	height: auto;
	font-size: 16px;
}

.form-signin .form-control {
	position: relative;
	box-sizing: border-box;
	height: auto;
	padding: 2px;
	font-size: 16px;
}

.form-signin .form-control:focus {
	z-index: 2;
}

.form-signin input[type="number"] {
	padding-top: 7px;
	padding-bottom: 7px;
	border-bottom-right-radius: 0;
	border-bottom-left-radius: 0;
}

.form-signin input[type="email"] {
	padding-top: 7px;
	padding-bottom: 7px;
	border-bottom-right-radius: 0;
	border-bottom-left-radius: 0;
}

.form-signin input[type="password"] {
	padding-top: 7px;
	padding-bottom: 7px;
	border-top-left-radius: 0;
	border-top-right-radius: 0;
}

.form-signin input[type="text"] {
	padding-top: 7px;
	padding-bottom: 7px;
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

	<form class="form-signin" action="join.html" method="post" enctype="multipart/frm-data" name="frm" onsubmit="return pwChk()">

        <!-- 로그인 로고를 넣고 로고에 꿀카페 홈페이지 연동시키기 -->
		<div id="header" >
			<a href="../main.html"><img class="mb-4" src="${path }/resources/images/logo/join_logo2.png"></a>
		</div>

<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->

        <!-- 아이디 -->
		<label for="input1" class="sr-only">ID</label>
	    
	    <!-- 사용 가능한 ID인 경우 / 중복된 ID인 경우-->
		<c:choose>
			<c:when test="${not empty user_id }"> 
				<span class="form-control" style="border: 1px solid #ced4da;">
					<input type="text" name="user_id" style="border: 1px solid white; margin: 0px; outline: none;"
					size="30" class="form-control" value="${user_id }"
					placeholder="아이디" required="required" autofocus="autofocus"> &nbsp; 
					<span> <img height="23" width="23" src="${path }/resources/images/logo/confirm_logo.png" onclick="idChk()">
				</span>
				</span>

			</c:when>
		
			<c:when test="${empty user_id }">
				<span class="form-control" style="border: 1px solid #ced4da;">
					<input type="text" name="user_id" style="border: 1px solid white; outline: none;" size="30"
					required="required" placeholder="아이디" autofocus="autofocus">&nbsp;
					<span> 
					<img height="23" width="23" src="${path }/resources/images/logo/confirm_logo.png" onclick="idChk()">
				   </span>
				</span>
			</c:when>
		</c:choose>
		
		<!-- 아이디 사용 가능 여부 문구 -->
		<div id="idChk" class="err" style="font-family: verdana; font-size: 15px; color: red;">
		</div>
		<!-- 칸 사이의 간격 주기 -->
		<div style="padding-bottom: 10px"></div>
		 
<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->

        <!-- 닉네임 -->
		<label for="input2" class="sr-only">Nickname</label>
		<c:choose>
			<c:when test="${not empty user_nickname }">
				<span class="form-control"> <input type="text"
					name="user_nickname"
					style="border: 1px solid white; margin: 0px; outline: none;"
					size="30" class="form-control" value="${user_nickname }"
					placeholder="닉네임" required="required" autofocus="autofocus">
					&nbsp; <span> <img height="23" width="23"
						src="${path }/resources/images/logo/confirm_logo.png"
						onclick="nickChk()">
				</span>
				</span>
			</c:when>

			<c:when test="${empty user_nickname }">
				<span class="form-control"> <input type="text"
					name="user_nickname"
					style="border: 1px solid white; outline: none;" size="30"
					required="required" placeholder="닉네임" autofocus="autofocus">&nbsp;
					<span> <img height="23" , width="23"
						src="${path }/resources/images/logo/confirm_logo.png"
						onclick="nickChk()">
				</span></span>
			</c:when>
		</c:choose>

		<!-- 닉네임 사용 가능 여부 문구 -->
		<div id="nickChk" class="err"
			style="font-family: verdana; font-size: 15px; color: ${textColor}"></div>
		
		<!-- 칸 사이의 간격 주기 -->
		<div style="padding-bottom: 10px"></div>

<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
		
		<!-- 이름 -->
		<label for="input5" class="sr-only">Name</label> <input type="text"
			name="user_name" class="form-control" placeholder="  이름" required>
		<%-- 	<c:if test="${errors.name }">이름을 입력하세요.</c:if> --%>

<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
	
	    <!-- 비밀번호 -->
		<div style="padding-bottom: 10px"></div>
		<label for="input3" class="sr-only">Password</label> <input
			type="password" name="user_pwd" class="form-control"
			placeholder="  비밀번호" required>
			
	    <!-- 비밀번호 조건 표기하기 -->
		<p
			style="padding-top: 10px; color: gray; font-size: 11px; margin: 0px">
			※ 영문 대소문자/숫자/특수문자를 조합, 10~16자로 설정※</p>
		<%-- <c:if test="${errors.password }">암호를 입력하세요.</c:if>--%>
	
	    <!-- 칸 사이의 간격 주기 -->
		<div style="padding-bottom: 10px"></div>
		
		
		<!-- 비밀번호 확인 -->
		<label for="input4" class="sr-only">Password2</label> <input
			type="password" name="user_pwd2" class="form-control"
			placeholder="  비밀번호 확인" required>
        
        <!-- 나이 -->
		<div style="padding-bottom: 10px"></div>
		<label for="input6" class="sr-only">Age</label> <input type="number"
			name="user_age" min="14" max="100" class="form-control"
			placeholder="  나이" required="required">

        <!-- 이메일 -->
		<div style="padding-bottom: 10px"></div>
		<label for="input7" class="sr-only">Email</label> <input type="email"
			name="user_email" class="form-control" placeholder="  이메일" required>

		<p></p>

<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
		
		<!-- HOME과 로그인(SIGN IN) 버튼 -->
		<p>
		  | <a href="../main.html">HOME</a> <img src="${path }/resources/images/logo/honeyj3.png" height="20" width="22"></a> |
				<a href="loginForm.html">SIGN IN</a>  
				<img src="${path }/resources/images/logo/honey3.png" height="20" width="20"> | 
		</p>
		
		<!-- 가입하기 버튼  -->
		<button class="btn btn-lg btn-primary btn-block" type="submit">가입하기</button>

	</form>
</body>
</html>