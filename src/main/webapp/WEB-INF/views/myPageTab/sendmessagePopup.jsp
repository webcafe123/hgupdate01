<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>쪽지쓰기</title>
<script type="text/javascript">

/* 팝업 창 닫기 */
function winClose(){
	window.open('', '_self').close();
}

</script>
</head>
<body>
<div class="container">
 <form name="msgSuccess" action="msgSuccess.html" method="post">
	<div style="padding:10px">
	<br/>
 		<span style="font-weight:bolder;font-size:14px">받는 사람</span> &nbsp; 
 		<span>
 			<input type="text" name="m_receiver_nick" >
 			<button class="btn btn-sm btn-default" type="submit">확인</button> 
 		</span>
 		<!-- <span style="font-size:14px"> 닉네임(pyj0**) </span>  -->
		<hr style="border-top:1px solid #BDBDBD"/>		
		<div>
			<textarea class="form-control" rows="8" name="m_content"></textarea>
		</div>
		<p style="color:gray;font-size:12px;padding-top:7px"> 보낸 쪽지는 쪽지함에 자동으로 저장됩니다. </p>
	</div>
	
	<div class="contiainer" align="center" style="padding-top:10px">
	<!-- <a href="" class="btn btn-default submit">보내기</a> &nbsp; --> 
	<a href="javascript:msgSuccess.submit();" class="btn btn-default submit">보내기</a> &nbsp; 	
	<a href="javascript:winClose();" class="btn btn-default">취소</a>
	<!-- <input type="submit" value="확인"> -->
	</div>

	</form>
</div>
</body>
</html>