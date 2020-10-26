<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<% request.setCharacterEncoding("utf-8"); %>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>쪽지함</title>

<script type="text/javascript">

$(function(){
	$('#selectAll').click(function(){
		if($("input:checkbox[id='selectAll']").prop("checked")) {
			$("input[type=checkbox]").prop("checked", true);
		}else{
			$("input[type=checkbox]").prop("checked", false);
		}
		
	});
	
});

function check(box){
	
	if(box.checked == true){
		var number = box.value;
		//alert(box.value + "체크됨" + number);
		
		 return number;
	}
	
}
function del(){
 	for(var i = 0; i < parseInt("${fn:length(sendlist)}"); i++) {
		if ($("#inlineCheckbox1_"+i).is(":checked") == true) {
			var sendData = 'm_num=' + $("#inlineCheckbox1_"+i).val();
			//alert(sendData);
			$.post('/rDelete.html', sendData, function(data) {
				
			//location.reload();
			});
		}
	} 
	alert("삭제 되었습니다");
 	location.reload();
}


</script>
</head>
<body>
<div >
	<p style="background-color:#03cf5d; padding-top:10px; padding-bottom:10px;color:white"> &nbsp; 쪽지함 </p>
</div>

<div class="container">

<section>
	<table >
		<tr > 
			<td style="cursor:pointer;padding-top:5px;font-size:13px"> 
			<span id="received" > <img src="${path }/resources/images/msgR.PNG"> 
			<a href="my_receivedMail.html" style="color:black"> 
			받은 쪽지함 </a></span>&nbsp; | &nbsp; </td> 
			<td style="cursor:default;font-weight:bolder; padding-top:5px;font-size:14px"> 
			<span id="send"> <img src="${path }/resources/images/msgS.PNG"> 
			<a href="sendMail.html" style="color:black"> 
			보낸 쪽지함 </a></span></td>	
			
			<td align="right"> 
				<div align="right">
				&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;
				<button class="btn btn-default btn-sm" onclick="del()">삭제</button>
				</div>
			</td>		
		</tr>
	</table>

	<hr style="border-top:1px solid #BDBDBD; border-bottom:1px"/>
	<table style="font-size:13px">
		<tr style="background-color:#EAEAEA; border-bottom:1px solid #8C8C8C"> 
			<td width=25 style="padding-top:10px;padding-bottom:10px;padding-left:5px;border-right:1px solid #8C8C8C"> 
			<input class="form-check-input" type="checkbox" id="selectAll" value="option1"> </td>
			<td width=80 style="border-right:1px solid #8C8C8C"> &nbsp; 받은 사람</td>
			<td width=285 style="border-right:1px solid #8C8C8C">&nbsp;  내용 </td>
			<td width=80 style="border-right:1px solid #8C8C8C"> &nbsp; 받은 날짜 </td>
		</tr>
		
		<!-- db 연동해서 추가될 부분 -->
		<!-- <tr style=" border-bottom:1px solid #8C8C8C"> -->
			<!-- <td width=25 style="padding-top:10px;padding-bottom:10px;padding-left:5px;border-right:1px solid #8C8C8C"> <input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="option1"> </td> -->
			<!-- <td width=80 style="border-right:1px solid #8C8C8C"> &nbsp; 길동쓰</td> -->
			<!-- <td width=285 style="border-right:1px solid #8C8C8C">&nbsp;  이거 테스트용이야</td> -->
			<!-- <td width=80 style="border-right:1px solid #8C8C8C"> &nbsp; 2020-10-20 </td> -->
		<!-- </tr> -->
		
		<c:if test="${empty sendlist }">
			<tr style=" border-bottom:1px solid #8C8C8C">
				<td colspan="4" style="padding-top:10px;padding-bottom:10px;padding-left:5px;border-right:1px solid #8C8C8C"> 보낸 쪽지가 없습니다. </td>
		</c:if>
		
		<c:if test="${not empty sendlist }">
			<c:forEach var="message" items="${sendlist }" varStatus="i">
			<c:if test="${message.m_sender_del != 'y' }">
				<tr style=" border-bottom:1px solid #8C8C8C">
					<td width=25 style="padding-top:10px;padding-bottom:10px;padding-left:5px;border-right:1px solid #8C8C8C"> 
					<input class="form-check-input" type="checkbox" id="inlineCheckbox1_${i.index}" value="${message.m_num }" onClick="check(this)"> </td>
					<td width=80 style="border-right:1px solid #8C8C8C"> &nbsp; ${message.m_receiver_nick }</td>
					<td width=285 style="border-right:1px solid #8C8C8C">&nbsp;  ${message.m_content }</td>
					<td width=80 style="border-right:1px solid #8C8C8C"> &nbsp; ${message.m_send_date } </td>
				</tr>
			</c:if>
			</c:forEach>
		</c:if>
	</table>
	</section>
</div>

<!-- 페이징 -->
<div align="center">
	<ul class="pagination">
		<c:if test="${pbm.startPage > pbm.pagePerBlock}">
			<li><a href="sendMail.html?pageNum=1">
				<span class="glyphicon glyphicon-backward"></span>
			</a></li>
			<li><a href="sendMail.html?pageNum=${pbm.startPage-1}">
				<span class="glyphicon glyphicon-triangle-left"></span>
			</a></li>
		</c:if>
		<c:forEach var="i" begin="${pbm.startPage}" end="${pbm.endPage}">
			<c:if test="${i==pbm.currentPage}">
				<li class="active"><a href="sendMail.html?pageNum=${i}">${i}</a></li>
			</c:if>
			<c:if test="${i!=pbm.currentPage}">
				<li><a href="sendMail.html?pageNum=${i}">${i}</a></li>
			</c:if>
		</c:forEach>
		<c:if test="${pbm.endPage < pbm.totalPage }">
			<li><a href="sendMail.html?pageNum=${pbm.endPage+1}">
				<span class="glyphicon glyphicon-triangle-right"></span>
			</a></li>
			<li><a href="sendMail.html?pageNum=${pbm.totalPage}">
				<span class="glyphicon glyphicon-forward"></span>
			</a></li>
		</c:if>
	</ul>
</div>
</body>
</html>