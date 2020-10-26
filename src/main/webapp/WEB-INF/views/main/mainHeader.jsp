<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>

<div class="container" align="center">
	<div style="width:1080px;height:35px;font-size:12px;">
		<a href="http://www.naver.com"><img align="left" src="${path }/resources/images/n1.jpg" alt="" /></a>
		<p align="right" style="padding-top:8px;color:#dedede">
			<a href="${path}/main.html" style="color:black;padding-right:10px">카페홈</a>|
			<a href="" style="color:black;padding-left:5px;padding-right:10px">새글</a>|
			<a href="" style="color:black;padding-left:5px;padding-right:10px">내소식</a>|
			<a href="" style="color:black;padding-left:5px;padding-right:10px">채팅</a>|&nbsp;
			<!-- <a href="user/loginForm.html" class="btn btn-xs btn-default">로그인</a> -->
      
      <!-- 아이디가 세션에 있는 경우 -->
				<c:if test="${not empty sessionScope.user_id}">
					<a href="user/logout.html" class="btn btn-xs btn-default">로그아웃</a>
				</c:if>
				<c:if test="${empty sessionScope.user_id}">
					<a href="user/loginForm.html" class="btn btn-xs btn-default">로그인</a>
				</c:if>
		</p>
	</div>
	<img src="${path }/resources/images/main.png" alt="" />
	<div class="container" align="left"
			style="width: 1080px; height: 45; margin-top: 11px; padding-top: 11px; border: 1px solid #ededed; font-size: 13">
      <a href=""
				style="color: black; padding-left: 5px; padding-right: 10px">[영꿀]추천
				미드/영화</a>· <a href=""
				style="color: black; padding-left: 5px; padding-right: 10px">[꿀팁]미드/영화</a>·
			<a href=""
				style="color: black; padding-left: 5px; padding-right: 10px">[꿀팁]영어공부</a>·
			<a href=""
				style="color: black; padding-left: 5px; padding-right: 10px">[정보]유아영어</a>·
			<a href=""
				style="color: black; padding-left: 5px; padding-right: 10px">[친목]두런두런</a>
	</div>

	</div>
</body>
</html>