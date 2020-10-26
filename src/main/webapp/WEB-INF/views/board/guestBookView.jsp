<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">

@charset "UTF-8";

.blind, .d-none {
	position: absolute;
	clip: rect(0 0 0 0);
	width: 1px;
	height: 1px;
	margin: -1px;
	overflow: hidden;
}

.warning_message {
	font-family: "Apple SD Gothic Neo", "맑은 고딕", "Malgun Gothic", 돋움, dotum, sans-serif;
	letter-spacing: 0;
}

.toggle_switch {
	width: 30px;
}

.toggle_switch .switch_input:checked + .switch_slider {
	background-color: #03c75a;
}

.toggle_switch .switch_input:checked + .switch_slider:before {
	-webkit-transform: translateX(14px);
	-ms-transform: translateX(14px);
	transform: translateX(14px);
}

.toggle_switch .switch_slider {
	position: relative;
	display: block;
	height: 16px;
	padding: 1px;
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
	border-radius: 30px;
	background-color: #e3e3e3;
	cursor: pointer;
}

.toggle_switch .switch_slider:before {
	content: '';
	display: block;
	width: 14px;
	height: 14px;
	background-color: #fff;
	-webkit-transition: all 0.2s ease;
	transition: all 0.2s ease;
	border-radius: 50%;
	cursor: pointer;
}

.alarm_switch {
	padding-left: 15px;
	float: left;
	line-height: 16px;
	font-size:14px;
}

.alarm_switch .alarm_txt {
	display: inline-block;
	vertical-align: top;
}

.alarm_switch .alarm_txt .point {
	color: #03c75a;
	font-weight: normal;
}

.alarm_switch .switch_box {
	display: inline-block;
	vertical-align: top;
}

.alarm_switch .layer_alarm {
	position: absolute;
	left: 0;
	z-index: 10;
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
	min-width: 360px;
	padding: 14px 16px;
	border: 1px solid rgba(3, 15, 43, 0.2);
	-webkit-box-shadow: 1px 1px 2px 0 rgba(0, 0, 0, 0.1);
	box-shadow: 1px 1px 2px 0 rgba(0, 0, 0, 0.1);
	background: #ebf1ff;
	color: #222;
}

.alarm_switch .layer_alarm .btn_close {
	position: absolute;
	top: 50%;
	right: 7px;
	padding: 5px;
	-webkit-transform: translateY(-50%);
	-ms-transform: translateY(-50%);
	transform: translateY(-50%);
}

.alarm_switch .layer_alarm .btn_close:before {
	content: '';
	background-position: -4px -226px;
	width: 16px;
	height: 16px;
}


</style>


<script type="text/javascript">
	var r_b_num= '${r_b_num}';
	$(function(){
		/* var r_b_num= '${r_b_num}'; */

		$('#bmi2').attr('src',"/resources/images/s3.jpg");
		$('#bmi2').click(function() {
			if($('#bmi2').attr("src")=="/resources/images/s3.jpg"){
				alert("즐겨찾는 게시판 추가");	
				$('#bmi2').attr('src','/resources/images/s4.jpg');
			}else{
				alert("즐겨찾는 게시판 해제");
				$('#bmi2').attr('src','/resources/images/s3.jpg');	
			}
		});
		$('#guestBookFormDisp').load('guestBookForm.html?r_ref=0');
 		$('#guestBookListDisp').load('guestBookList.html?r_b_num='+r_b_num+'&startNum=1');
	
	});

	function more(r_b_num, startNum, endNum){
		var newStartNum = endNum+1;
  		var sendData = 'r_b_num='+r_b_num+'&startNum='+newStartNum;
  		$.post('/guestBookList.html', sendData, function(data){
  			$('#gbList_'+startNum).append(data);
  		});
		$('#moreKey_'+endNum).attr('style','display:none');
	}
	
	function getGbRepl(gbReply, r_num){
  		var sendData2 = 'r_num='+r_num+'&r_ref='+r_num;
  		$.post('/guestBookReplyForm.html', sendData2, function(data){
  			$('#unfold_'+r_num).append(data);
  		});
  		$('#unfold_'+r_num).attr('style','display:active;');
 		if(gbReply>0){
			var sendData = 'r_num='+r_num;
	  		$.post('/guestBookReplyList.html', sendData, function(data){
	  			$('#gbRepl_'+r_num).prepend(data);
	  		});
		}
		$('#clickGbRepl_'+r_num).attr('onclick','removeGbRepl('+gbReply+','+r_num+')');
		return false;
	}
	function removeGbRepl(gbReply, r_num){
		$('#gbRepl_'+r_num).remove();
		$('#clickGbRepl_'+r_num).attr('onclick','getGbRepl('+gbReply+','+r_num+')');
		return false;
	}
	function gbReplKey(r_num){
		var sendData2 = 'r_num='+r_num+'&r_ref='+r_num;
  		$.post('/guestBookRereplyForm.html', sendData2, function(data){
  			$('#unfold2_'+r_num).append(data);
  		});	
  		$('#unfold2line_'+r_num).attr('style','display:active;border:1px dotted #d9d9d9;margin-top:0px;margin-bottom:0px;margin-right:20px;');
  		$('#unfold2_'+r_num).attr('style','display:active;');
		$('#gbrKey_'+r_num).text('┕답글취소');
		$('#gbrKey_'+r_num).attr('onclick', 'removeGbReplKey('+r_num+')');
	}
	function removeGbReplKey(r_num){
		$('#gbrKey_'+r_num).text('┕답글');
		$('#gbrKey_'+r_num).attr('onclick','gbReplKey('+r_num+')');
		$('#unfold2line_'+r_num).attr('style','display:none;');
		$('#unfold2_'+r_num).empty();
 		$('#unfold2_'+r_num).attr('style','display:none;');
	}
 	function gbUpdate(r_num){
 		$('#guestBookDisp').load('guestBookUpdateForm.html?r_num='+r_num);
	}

	function gbDelete(r_b_num,r_num){
		if(confirm('정말 삭제하시겠습니까?')==true){
			$(location).attr('href', 'deleteGuestBook.html?r_b_num='+r_b_num+'&r_num='+r_num); 
  			alert('삭제되었습니다');
  			window.history.back();
		} else {
			return;
		}
	}

 	function gbrUpdate(r_num){
 		$('#gbrUp_'+r_num).text('수정취소');
 		$('#gbrUp_'+r_num).attr('onclick','removeGbrUpdate('+r_num+')');
 		var txt = $('#gbRerepl_'+r_num).find('textarea:first').val();
 		$('#gbRerepl_'+r_num).find('textarea:first').attr('style','float:left;margin-left:10px;outline:none;font-size:12px;resize:none;');
 		$('#gbRerepl_'+r_num).find('textarea:first').attr('id','upRtxt_'+r_num);
 		$('#gbRerepl_'+r_num).find('textarea:first').after('<button id="upRbtn_'+r_num+'" onclick="upR('+r_num+')" type="button" style="float:left;background-color:white;outline:none;border:1px solid #c9c9c9;width:40px;height:32px;margin-left:5px;font-size:12px;font-weight:bold;color:#949494;">수정</button>');
 	}
 	
 	function upR(r_num){
 		var txt = $('#upRtxt_'+r_num).val();
 		var sendData = 'r_num='+r_num+'&r_content='+txt;
 		$.post('gbReplyUpdate.html', sendData, function(data){
  			alert('수정되었습니다');
			location.href="guestBookView.html?r_b_num="+r_b_num;
  			
/*  			$.post('getReply.html', 'r_num='+r_num, function(data){
  				alert(data);
   				var rnum = data.r_origin;
  				alert("rnum : " + rnum);
  				$('#gbListTd_'+rnum).scrollTop();	 
  			}); */
  			
  		});
 	}
 	
 	function removeGbrUpdate(r_num){
 		$('#gbrUp_'+r_num).text('수정');
 		$('#gbrUp_'+r_num).attr('onclick','gbrUpdate('+r_num+')');
 		$('#gbRerepl_'+r_num).find('textarea:first').attr('style','margin-left:10px;outline:none;border:none;background-color:transparent;resize:none;font-size:13px;');	
 		$('#upRbtn_'+r_num).remove();
 	}
 	
</script>
</head>
<body>

<div id="guestBookWhole" class="container" align="left" style="margin-left:200px;width:900px;padding-top:20px;padding-bottom:20px;">
		
		<p style="font-size:20px;font-weight:bold;padding-top:5px;padding-left:30px;line-height:0px">1.스터디신청 <img id="bmi2" src="/resources/images/s3.jpg" style="cursor:pointer;margin-bottom:5px;" alt="" /></p>
		<p style="color:#949494;padding-left:30px;">여행영어 스터디 신청하세요!</p>
	<div id="guestBookDisp" class="container" align="left" style="width:900px;">
		<div class="alarm_switch">
		        새글 구독
		    <div class="switch_box">
		        <div class="toggle_switch">
		            <input type="checkbox" id="inputSwitch_album" class="switch_input blind" data-identifier="alarm-switch-checkbox">
		            <label class="switch_slider _click(ArticleAlarmConfig|Toggle)" for="inputSwitch_album" data-identifier="alarm-switch-btn"><span class="blind">등록</span></label>
		        </div>
		    </div>
		    <div class="layer_alarm" style="display: none;" data-identifier="alarm-switch-notice">
		        <div class="layer_inner">
		          	<p class="layer_txt">이 게시판의 글을 새글피드에서 볼 수 있습니다.</p>  
		        </div>
		        <button type="button" class="btn_close _click(ArticleAlarmConfig|ClosePopup)"><span class="blind">닫기</span></button>
		    </div>
		</div>

		<br /><br />
		<div id="guestBookFormDisp" align="left" style="width:900px;padding:0px;"></div>
		<div id="guestBookListDisp" align="left" style="width:900px;padding-left:15px;"></div>

	</div>
</div>


</body>
</html>
