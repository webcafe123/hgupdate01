<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>회원 정보 수정</title>
<script type="text/javascript">

/* 팝업 창 닫기 */
function winClose(){
	window.open('', '_self').close();
}

/* 닉네임 중복확인  */
function checking(){
	
	$.post("nickNoChk.html","user_nickname="+updateSuccess.user_nickname.value, 
			function(data) {
		$('#err').html(data);
	})
}

//var radioVal = $(':radio[name="inlineRadioOptions"]:checked').val();

 
</script>
</head>
<body>

<div >
	<p style="background-color:#03cf5d; padding-top:10px; padding-bottom:10px;color:white"> &nbsp; 프로필 설정 </p>
</div>
<span style="padding-bottom:7px"> &nbsp;</span>
<div class="container" >
	<div >
	<form name="updateSuccess" action="updateSuccess.html"  method="post">
		<table style="background-color:#EAEAEA;" align="center">
		<tr style="padding-left:10px"> 
			<td style="padding-left:30px;padding-right:30px;padding-top:10px;font-size:13px;font-weight:bolder"> 별명 </td>
			<td style="padding-top:10px;padding-right:30px"> <input type="text"  name="user_nickname" value="${user_nickname }" >  
			<a id="nickChk" href="#" role="button"  onclick="checking()" ><img src="https://ssl.pstatic.net/static/cafe/myinfo/btn_confirm.gif" alt="중복확인"></a>	
			</td>
			
		</tr>
		<tr> 
			<td style="font-size:13px;">  </td>
			<td style="font-size:11px;color:red;padding-right:10px;padding-top:3px"> 
			
				 <div id="err" class="err" style="padding-bottom:1px">  </div>
			</td>
		</tr>
		<tr> 
			<td style="font-size:13px;">  </td>
			<td style="font-size:11px;color:gray;padding-right:10px;padding-bottom:20px;padding-top:3px"> 
				 * 한글 1~10자, 영문 대소문자 2~20자, 숫자를 사용할 수 있습니다.(혼용가능) <br>
				 * 중복되지 않은 별명으로 변경해주세요.
			</td>
		</tr>
		</table>
		
		<br>
		
		<table style="background-color:#EAEAEA;width:469px" align="center">
			<%-- <tr style="padding-left:10px"> 
			<td style="padding-left:30px;padding-top:10px;font-size:12px;font-weight:bolder"> 프로필<br />이미지 </td>
			<td colspan="3" style="padding-top:10px;"> <img id="" src="${path }/resources/images/noimage.jpg"> 
			<a id="" href="#" role="button"><img src="https://ssl.pstatic.net/static/cafe/myinfo/btn_profile_img_change.png" alt="이미지변경"></a>	
			</td>
			
		</tr> --%>
		
		<tr>
			<td style="padding-left:30px;padding-top:10px;font-size:12px;font-weight:bolder"> 프로필<br />이미지 </td>
			<td style="padding-top:15px;"> 
				<div class="form-check form-check-inline" align="center">
  				<label class="form-check-label" for="inlineRadio1">
  				<img id="" width=100 height=100 src="${path }/resources/images/profile1.png"> 
  				</label>
  				<br>
  				<input class="form-check-input" type="radio" name="inlineRadioOptions" id="profile1" value="profile1" checked>
				</div>
			</td>
			<td style="padding-top:15px;"> 
				<div class="form-check form-check-inline" align="center">
  				<label class="form-check-label" for="inlineRadio1">
  				<img id="" width=100 height=100 src="${path }/resources/images/profile2.png"> 
  				
  				</label>
  				<br>
  				<input class="form-check-input" type="radio" name="inlineRadioOptions" id="profile2" value="profile2" >
				</div>
			</td>
			<td style="padding-top:15px;"> 
				<div class="form-check form-check-inline" align="center">
  				<label class="form-check-label" for="inlineRadio1">
  				<img id="" width=100 height=100 src="${path }/resources/images/profile3.png"> 
  				</label>
  				<br>
  				<input class="form-check-input" type="radio" name="inlineRadioOptions" id="profile3" value="profile3" >
				</div>
			</td>
			
			
		</tr>
		
		<tr> 
			<td>  </td>
			<td colspan="3" style="font-size:11px;color:gray;padding-right:10px;padding-bottom:20px;padding-top:3px"> 
			<br>
				 * 이미지 선택해주세요. 
				 <a id="" href="#" role="button"><img src="https://ssl.pstatic.net/static/cafe/myinfo/btn_profile_img_change.png" alt="이미지변경"></a>
				 
			</td>
		</tr>
		
		</table>
		
		<div class="contiainer" align="center" style="padding-top:30px">
		<a href="javascript:winClose();" class="btn btn-default">취소</a>
		<a href="javascript:updateSuccess.submit();" class="btn " style="background-color:#03cf5d;"><span style="color:white"> 확인</span></a> &nbsp; 
	
		</div>
		</form>
	</div>
</div>

	 
</body>
</html>