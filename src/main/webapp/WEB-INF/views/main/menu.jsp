<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
$(function(){
	
	$('#bmi').attr('src',"/resources/images/s1.jpg");
	$('#bmi').click(function() {
		if($('#bmi').attr("src")=="/resources/images/s1.jpg"){
			alert("즐겨찾는 카페 추가");	
			$('#bmi').attr('src','/resources/images/s2.jpg');
		}else{
			alert("즐겨찾는 카페 해제");
			$('#bmi').attr('src','/resources/images/s1.jpg');	
		}
	});
	
	
	$('#myacti').click(function(){
		$('#cinfo').attr('style','font-size:13px;color:#bfbfbf;padding-top:6px;padding-right:10px;cursor:pointer;font-weight:normal');
			$('#myacti').attr('style','font-size:13px;color:black;padding-top:6px;cursor:default;font-weight:bolder');
			$('#cinfo_span').attr('style','display:none;padding-top:7px;padding-bottom:7px;height:210px');
		$('#myacti_span').attr('style','display:active;padding-top:7px;padding-bottom:7px;height:210px');
	});
	
	$('#cinfo').click(function(){
		$('#cinfo').attr('style','font-size:13px;color:black;padding-top:6px;padding-right:10px;cursor:default;font-weight:bolder');
		$('#myacti').attr('style','font-size:13px;color:#bfbfbf;padding-top:6px;cursor:pointer');
		$('#myacti_span').attr('style','display:none;padding-top:7px;padding-bottom:7px;height:210px');
		$('#cinfo_span').attr('style','display:active;padding-top:7px;padding-bottom:7px;height:210px');
	});
});	
</script>

</head>
<body>

<div style="float:left;width:200px;padding-top:20px;padding-left:10px;">
	<div style="height:40px;padding-top:3px;border-top:2px solid black;border-bottom:1px solid #ededed;">
	<table>
		<tr>
			<td><img id="bmi" src="/resources/images/s1.jpg" alt="" style="cursor:pointer;padding-right:10px;padding-bottom:2px"/></td>
			<td><p id="cinfo" style="font-size:13px;color:black;padding-top:6px;padding-right:10px;cursor:default;font-weight:bolder">카페정보</p></td>
			<td><p id="myacti" style="font-size:13px;color:#bfbfbf;padding-top:6px;cursor:pointer;">나의활동</p></td>
		</tr>
	</table>
	</div>
	<div id="cinfo_span" style="height:210px;padding-top:7px;padding-bottom:7px">
		<table style="border-bottom:1px solid #ededed;">
			<tr>
				<td style="padding-bottom:7px"><img src="/resources/images/m3.jpg" alt="" /></td>
				<td style="padding-left:5px;padding-bottom:7px">
					<img src="/resources/images/m4.jpg" alt="" /><a href="" style="font-size:13px;font-weight:bolder;color:black">인텐시브</a><br />
					<a href="" style="font-size:11px;color:#7d7d7d">since 2012.11.24</a><br />
					<a href="" style="font-size:11px;color:#7d7d7d">카페소개</a>
				</td>
			</tr>
		</table>
		<table width="180px">
			<tr>
				<td colspan="2" style="padding-top:10px;padding-bottom:5px" >
					<a href="" style="font-size:13px;color:#7d7d7d"><img src="/resources/images/i1.jpg" alt="" />가지5단계</a>
				</td>
			</tr>
			<tr>
				<td style="padding-bottom:3px">
					<a href="" style="font-size:13px;color:#7d7d7d">
						<img src="/resources/images/i2.jpg" alt="" />118,601
						<img src="/resources/images/i3.jpg" alt="" />
					</a>
				</td>
				<td align="right" style="padding-bottom:3px">
					<a href="" style="font-size:13px;color:#7d7d7d">초대하기</a>
				</td>
			</tr>
			<tr>
				<td style="padding-bottom:1px">
					<a href="" style="font-size:11px;color:#7d7d7d">
						<img src="/resources/images/i4.jpg" alt="" />즐겨찾는 멤버
					</a>
				</td>
				<td align="right" style="padding-bottom:1px">
					<a href="" style="font-size:11px;color:#7d7d7d">18,783명</a>
				</td>
			</tr>
			<tr>
				<td style="padding-bottom:1px">
					<a href="" style="font-size:11px;color:#7d7d7d">
						<img src="/resources/images/i5.jpg" alt="" />게시판 구독수
					</a>
				</td>
				<td align="right" style="padding-bottom:1px">
					<a href="" style="font-size:11px;color:#7d7d7d">2,842회</a>
				</td>
			</tr>
			<tr>
				<td style="padding-bottom:1px">
					<a href="" style="font-size:11px;color:#7d7d7d">
						<img src="/resources/images/i6.jpg" alt="" />우리 카페앱 수
					</a>
				</td>
				<td align="right" style="padding-bottom:1px">
					<a href="" style="font-size:11px;color:#7d7d7d">1,248회</a>
				</td>
			</tr>
		</table>
	</div>
	<div id="myacti_span" style="height:210px;display:none;padding-top:7px;padding-bottom:7px">
		
						
		<%-- <u:mypagetag> </u:mypagetag> --%>
		<jsp:include page="../myPageTab/mypage.jsp"></jsp:include>
		
		
	</div>
	<button href="" style="text-align:center;background-color:#555555;width:200px;height:35px;color:white;border-radius:1px;border:1px solid #c2c2c2;font-size:13px;margin-top:10px;">카페 가입하기</button>
	<button href="" style="text-align:center;background-color:white;width:200px;height:35px;border-radius:1px;border:1px solid #c2c2c2;margin-top:10px;margin-bottom:10px;font-size:13px;">카페 채팅
		<img src="/resources/images/i7.jpg" alt="" style="margin-bottom:2px"/></button>
	<form action="" method="post" class="form-horizontal">
		<div class="form-inline form-group" style="padding-left:15px;padding-right:5px">
			<input type="text" id="search" style="float:left;width:160px;height:25px;border-radius:1px;border:1px solid #c2c2c2;"/>
			<input type="submit" value="검색" style="float:right;width:40px;height:25px;color:white;background-color:#24c932;border-radius:1px;border:1px solid #24c932;font-size:12px;margin-bottom:4px;"/>
		</div>
	</form>
	
	<!-- 게시판 category -->
	
	<section id="categorybar">
	<div style="height:40px;padding-top:3px;border-top:2px solid black;border-bottom:1px solid #ededed;">
	
	<u:categoriestag />
	<a href="replyList.html?r_b_num=100">시험용</a><br />
	<a href="guestBookView.html?r_b_num=100">시험용2</a><br />
	</div>
	</section>
</div>


</body>
</html>