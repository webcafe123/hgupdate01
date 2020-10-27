<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<% request.setCharacterEncoding("utf-8"); %>


<!-- popup -->
<script type="text/javascript">

/* 창 크기 설정 + 가운데 띄우기*/
function setting(w, h){
	var popupWidth = w;
	var popupHeight = h;
	
	var popupX = Math.ceil(window.screen.width - popupWidth) / 2 ;
	// 만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음

	var popupY= Math.ceil(window.screen.height - popupHeight) /2 ;
	// 만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음
	
	var option = "width="+ w +",height="+ h + ",left=" + popupX + ",top=" + popupY + ",screenX=" + popupX + ",screenY=" + popupY + "resizable=no;scrollbars=no";
	
	return option;
	
}

/* 멤버등급 안내 버튼 이벤트*/
function popupOpen(){
	var popUrl="${path}/myPageTab/memberLevelInfo.html";
	
	var popupWidth = 740;
	var popupHeight = 575;
	
	var popupX = Math.ceil(window.screen.width - popupWidth) / 2 ;
	// 만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음

	var popupY= Math.ceil(window.screen.height - popupHeight) /2 ;
	// 만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음

	
	//window.open(popUrl, '', 'status=no, height=575, width=740, left='+ popupX + ', top='+ popupY + ', screenX='+ popupX + ', screenY= '+ popupY);
	
	var newOption = setting(740,575);
	
	window.open(popUrl,'',newOption);

}

/* 쪽지쓰기 버튼 이벤트 */
function sendmessagePopup(){
	var url="${path}/myPageTab/sendmessagePopup.html";
	
	//var option = "width=300, height=300;";
	
	//window.open(url,"",option);
	
	var newOption = setting(504,413);
	
	window.open(url,"",newOption);
	
}

/* 회원정보수정 버튼 이벤트 */
function userInfoPopup(){
	var url = "${path}/myPageTab/userInfoUpdateForm.html";
	
	var newOption = setting(500,500);
	
	window.open(url,"",newOption);
}

/* 내 쪽지함 버튼 이벤트 */
function myMsgsPopup(){
	var url = "${path}/myPageTab/my_receivedMail.html";
	
	var newOption = setting(500,471);
	
	window.open(url,"",newOption);
}



</script>


<div style="height:187px;">
<!-- myacti_span -->

<table style="border-bottom:1px solid #ededed;font-size:11px">
<tr style="color:#7d7d7d"> 
	<td style="padding-bottom:7px"> 

	<!-- 프로필 바꾸는 곳 -->
	<c:if test="${profile == null }">	
		<img id="profile" name="profile" width=64 height=64 alt="" src="${path }/resources/images/basic_profile.png">
	</c:if>
	<c:if test="${profile == 'profile1' }">	
		<img id="profile" name="profile" width=64 height=64 alt="" src="${path }/resources/images/profile1.png">
	</c:if>
	<c:if test="${profile == 'profile2' }">	
		<img id="profile" name="profile" width=64 height=64 alt="" src="${path }/resources/images/profile2.png">
	</c:if>
	<c:if test="${profile == 'profile3' }">	
		<img id="profile" name="profile" width=64 height=64 alt="" src="${path }/resources/images/profile3.png">
	</c:if>
	 </td>
	<td style="padding-left:5px;padding-bottom:7px">
		<p style="font-size:13px;color:black;font-weight:bolder; padding-top:5px">  ${user_nickname } </p> 
		 가입 ${user_regdate } <br> 
		
		
	 </td>
</tr>
</table>

<table width="180px">
<tr style="font-size:13px">
	<td style="padding-top:10px;padding-bottom:10px;color:#7d7d7d;"> <img alt="" src="${path }/resources/images/level1.png">  새싹 </td>
	<td align="right" style="font-size:11px;"> <a href="javascript:popupOpen();" style="color:black"> 멤버등급 안내</a> </td>
</tr>

<tr >
						<td style="padding-bottom:5px">
							<a href="javascript:userInfoPopup();" style="font-size:11px;color:#7d7d7d">
								<img src="${path }/resources/images/z1.png" alt="" />회원 정보 수정 
							</a>
						</td>
						
					</tr>
<tr style="padding-top:10px">
						<td style="padding-bottom:5px">
							<a href="" style="font-size:11px;color:#7d7d7d">
								<img src="${path }/resources/images/z2.png" alt="" />내가 쓴 글
							</a>
						</td>
						<td align="right" style="padding-bottom:5px">
							<a href="" style="font-size:11px;color:#7d7d7d">0개</a>
						</td>
					</tr>
					<tr >
						<td style="padding-bottom:5px">
							<a href="" style="font-size:11px;color:#7d7d7d">
								<img src="${path }/resources/images/z3.png" alt="" />내가 쓴 댓글
							</a>
						</td>
						<td align="right" style="padding-bottom:5px">
							<a href="" style="font-size:11px;color:#7d7d7d">2개</a>
						</td>
					</tr>
					
					<tr >
						<td style="padding-top:5px">
							<a href="javascript:myMsgsPopup();" style="font-size:13px;color:#7d7d7d">
								<img src="${path }/resources/images/msg.png" alt="" />쪽지함
								<img src="${path }/resources/images/i3.jpg" alt="" />
							</a>
						</td>
						<td align="right" >
							<a href="javascript:sendmessagePopup();" style="font-size:13px;color:#7d7d7d">쪽지쓰기</a>
						</td>
					</tr>
</table>



</div>

