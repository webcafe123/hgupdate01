<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function(){
		$('#replyFormDisp').load('replyForm.html?r_ref=0');
	});
 	function rDelete(r_b_num, r_num){
		  if(confirm("정말 삭제하시겠습니까 ?") == true){
		        alert("삭제되었습니다");
		        $(location).attr('href', 'deleteReply.html?r_b_num='+r_b_num+'&r_num='+r_num); 
		        window.history.back();
		    }
		    else{
		        return;
		    }
	} 
	function rUpdate(r_b_num, r_num, r_level){
		// 데이터를 읽을 때 input/textarea는 form형식 -> val()
		// td/span 같이 form 형식이 아닐 때 -> text()
		var txt = $('#rCont_'+r_num).text();
		var rows = 3 /* 3+0.5*r_level; */
		var cols = 90 /* 100-r_level*8; */
		// 읽은 글을 편집 할 수 있도록 textarea에 넣어야 함
		$('#replRow_'+r_num).html('<td id="replCol_'+r_num+'" colspan="12" style="height:120px;padding-top:13px;"></td>');	
		$('#replCol_'+r_num).html('<div class="container" style="float:left;width:780px">'+
			'<div class="container" style="float:left;width:760px;border:2px solid #e5e5e5;border-radius:10px;padding-top:10px;padding-bottom:1px;">'+
			'<table><tr><td><p style="float:left;font-size:13px;font-weight:bold;padding-top:1px;line-height:1px;" onclick="">tempnick</p></td></tr><tr><td>'+
			'<textarea id="rCont2_'+r_num+'" rows="'+rows+'" cols="'+cols+'" style="float:left;border:none;outline:none;width:720px;font-size:12px"'+ 
			'name="r_content" cols="90" rows="3">'+txt+'</textarea></td></tr><tr><td><p><img src="${path }/resources/images/i8.jpg"'+
			'alt="" style="float:left;cursor:pointer" onclick=""/><img src="${path }/resources/images/i9.jpg" alt="" style="float:left;cursor:pointer"'+
			'onclick=""/><button type="button" style="float:right;border-radius:6px;border:none;outline:none;margin-right:10px;font-size:13px;'+
			'background-color:#e0f8eb;color:#009f47;font-weight:bold;" onclick="up('+r_b_num+','+r_num+')">수정</button>'+
			'<button type="button" style="float:right;border-radius:6px;border:none;outline:none;font-size:13px;background-color:transparent;'+
			'color:#a3a3a3;font-weight:bold;" onclick="lst('+r_b_num+','+r_num+')">취소</button></p></td></tr></table></div></div></div>'
		);
	}
 	function up(r_b_num, r_num){
 		alert("수정되었습니다");
/*      $(location).attr('href', 'udpateReply.html?r_content='+$('#rCont2_'+r_num).val()+'&r_b_num='+r_b_num+'&r_num='+r_num);  */
 		window.history.back();
	}
	function lst(r_b_num){
/* 		$(location).attr('href', 'replyList.html?r_b_num='+r_b_num); */
		window.history.back();
	} 
	function modKey(r_num){
		$('#tab_pop_'+r_num).appendTo('#modIcon_'+r_num);
		$('#tab_pop_'+r_num).attr('style','display:active;position:absolute;');
	}
	function stopModKey(r_num){
		$('#tab_pop_'+r_num).attr('style','display:none;');
	}
	function replKey(r_num,r_level){
		$('#replDiv_'+r_num).attr('style','display:active;width:780px;');
  		$('#replInDiv_'+r_num).load('replyForm.html?r_ref='+r_num);		
	}
	function iconDown(r_num){
		$('#replIcon_'+r_num).attr('class','glyphicon glyphicon-circle-arrow-up');
	}
	function stopIconDown(r_num){
		$('#replIcon_'+r_num).attr('class','glyphicon glyphicon-circle-arrow-Down');
	}
	function iconUp(r_num){
		$('#replDiv_'+r_num).attr('style','display:none;');
	}

</script>

</head>
<body>
<div id="replyWhole" class="container" align="center" style="margin-left:200px;width:900px;padding-top:30px;padding-bottom:20px;">

	<div id="repListDisp" class="container" align="left" style="width:900px;">
			<p align="left" style="margin-top:24px;margin-left:10px;font-size:20px;font-weight:bolder">댓글 
				<a href="" style="margin-left:10px;font-size:15px;color:#333333;font-weight:bolder">등록순</a> 
				<a href="" style="margin-left:10px;font-size:14px;color:#bdbdbd;font-weight:bolder">최신순</a>
			</p>
			<table class="table" style="float:left;width:850px;">
			<c:if test="${not empty replyList }">
				<c:forEach var="rl" items="${replyList }">
					<c:if test="${rl.r_del=='y'}">
						<tr>
							<c:if test="${rl.r_level>0 }"><td colspan="${rl.r_level}"></td></c:if>
							<td colspan="12-${rl.r_level}" style="font-size:14px;line-height:50%;">
								<%-- <c:if test="${rl.r_level>0 }">┕</c:if> --%>
								삭제된 댓글입니다.</td>
						</tr>
					</c:if>
					<c:if test="${rl.r_del!='y'}">
						<tr id="replRow_${rl.r_num}" style="border-top:1px solid #cdcdcd;">
							<c:if test="${rl.r_level>0 }"><td colspan="${rl.r_level}"></td></c:if>
							<td style="width:60px;padding-top:20px;">
								<span class="glyphicon glyphicon-user" style="float:left;color:#dfe1e5;font-size:40px"></span>
							</td>
							<td colspan="11-${rl.r_level}">
								<p style="padding-top:10px;font-size:13px;font-weight:bolder;cursor:pointer;margin-bottom:1px;line-height:1px;">${rl.r_nick }
									<span id="modIcon_${rl.r_num}" style="float:right;color:#bdbdbd;cursor:pointer;margin:5px;" class="glyphicon glyphicon-cog" onmouseover="modKey(${rl.r_num})" onmouseout="stopModKey(${rl.r_num})"></span>
					
								 	<div id="tab_pop_${rl.r_num}" style="display:none">	
											<c:if test="${rl.r_id==rl.r_id }">	
												<div style="width:80px;height:100px;padding-top:7px;padding-bottom:7px;border:1px solid #cdcdcd;">
													<table class="table table-hover" style="text-align:center;font-size:14px;color:#8c8c8c;">
														<tr>
															<td style="padding:10px;cursor:pointer;" onclick="rUpdate(${rl.r_b_num},${rl.r_num},${rl.r_level });">수정</td>
														</tr>
														<tr>
															<td style="padding:10px;border-bottom:1px solid #cdcdcd;cursor:pointer" onclick="rDelete(${rl.r_b_num},${rl.r_num })">삭제</td>
														</tr>
													</table>
												</div>			
											</c:if>
											<c:if test="${rl.r_id!=rl.r_id }">
												<div style="width:80px;height:60px;padding-top:8px;border:1px solid #cdcdcd;">
													<table class="table table-hover" style="text-align:center;font-size:14px;color:#8c8c8c;">
														<tr>
															<td style="padding:10px;border-bottom:1px solid #cdcdcd;cursor:pointer;" onclick="">신고</td>
														</tr>
													</table>
												</div>
											</c:if>
									</div>
								
								</p>
								<textarea id="rCont_${rl.r_num }" style="border:none;outline:none;resize:none;font-size:14px;margin-top:1px;margin-bottom:0px;height:100%;" cols="${100-rl.r_level*8}" readonly="readonly">${rl.r_content }</textarea><br />
								<p style="float:left;font-size:11px;color:#979797;margin-bottom:2px;">${rl.r_update }&nbsp&nbsp
								<c:if test="${rl.r_level<10}">
									<p id="rKey_${rl.r_num }" style="float:left;font-size:10px;color:#979797;cursor:pointer;margin-bottom:0px;" onclick="replKey(${rl.r_num},${rl.r_level})">답글쓰기</p>
								</c:if>
								<c:if test="${rl.r_level>=10}">							
									<p style="float:left;font-size:5px;color:#979797;margin-bottom:0px;">더 댓글을 달 수 없는 댓글입니다.</p>
								</c:if>
								</p>
							</td>
						</tr>
						<tr id="replDiv_${rl.r_num}" style="display:none;width:800px;">
	 						<td style="float:left;width:50px;height:120px;padding-top:25px;">
								<span id="replIcon_${rl.r_num}" onmouseover="iconDown(${rl.r_num})" onclick="iconUp(${rl.r_num})" onmouseout="stopIconDown(${rl.r_num})"
								 class="glyphicon glyphicon-circle-arrow-down" style="cursor:pointer;float:right;font-size:25px;color:#d6d6d6"></span>
							</td> 
							<td colspan="11" id="replInDiv_${rl.r_num}" align="left" style="width:650px;height:120px;padding-top:13px;">
							</td>
							
						</tr>
						
					</c:if>
				</c:forEach>
			</c:if>	
			<tr><td colspan="12" style="padding-top:20px;">
			
			<div id="replyFormDisp" style="width:800px"></div>
			
			</td></tr>
		</table>
	</div>
				
</div>
</body>
</html>