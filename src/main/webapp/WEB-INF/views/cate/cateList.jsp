<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<script type="text/javascript">
	var cate_num = ${cate.c_num};
	function insertCate() {
		$('#insertCateForm').load('${path}/cate/insertCateForm.html');
		$('#insertHr').attr('style','display:active;padding-left:10px;padding-right:10px;');
	}
 	function c_board(c_num) {
 		$('#cBoardClick').load('${path}/cate/cBoard.html?c_num='+c_num);
		$('#insertHr').attr('style','display:active;padding-left:10px;padding-right:10px;');
	} 
	/* 창 크기 설정 + 가운데 띄우기*/
	function setting(w, h){
	   var popupWidth = w;
	   var popupHeight = h;
	   var popupX = Math.ceil(window.screen.width - popupWidth) / 2 ;
	   // 만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음
	   var popupY= Math.ceil(window.screen.height - popupHeight) /2 ;
	   // 만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음
	   var option = "width="+ w +",height="+ h + ",left=" + popupX + ",top=" + popupY + ",screenX=" + popupX + ",screenY=" + popupY + "resizable=no;";
	   return option;
	}
 	/* 게시판 상세 버튼 이벤트 
	function cBoardPopup(c_num){
	   var url = "${path}/cate/cBoard.html?c_num="+c_num;
	   var newOption = setting(900,300);
	   window.open(url,"",newOption);
	} 	 */
</script> 

</head><body>

<div id="cBoardClick"></div>
<div id="insertCateForm"></div>
<div class="container" align="center" style="float:left;margin-top:20px;margin-left:20px;width:860px;padding-top:20px;padding-bottom:20px;">
<hr id="insertHr" style="display:none;padding-left:10px;padding-right:10px;"/>

<h2 class="text-primary">카테고리 관리</h2> 
<table class="table table-striped">
	<tr><td colspan="3">
		<div align="right">
			<a class="btn btn-info glyphicon glyphicon-plus" onclick="insertCate()"> 카테고리 입력</a>
				<!-- <i class="fas fa-folder-plus" style="font-size:27px;"></i>-->
			<a href="" class="btn btn-warining">
				<i class="fas fa-backspace" style="font-size:27px;">
				</i></a></div></td></tr> 
<c:if test="${empty list }">
	<tr><td>데이터가 없습니다</td></tr>
</c:if>		
<c:if test="${not empty list }">
<c:forEach var="cat" items="${list }">
	<tr>
	<c:if test="${cat.c_del == 'y'}">
		<td colspan="3" align="center">삭제된 카테고리입니다</td>
	</c:if>
	<c:if test="${cat.c_del != 'y'}">
		<td align="center" width="5%">
		<c:if test="${!(cat.c_level > 0) }">♬</c:if></td>
		<td title="${cat.c_intro}">
		
		<c:if test="${!(cat.c_level > 0) }">
			${cat.c_subject }
		</c:if>
		
		<c:if test="${cat.c_level > 0 }">
			<img src="images/level.gif" alt="" height="5"
				width="${cat.c_level*10}">
<!-- 여기 url 입력 어떻게? -->
			<a href="${path}/board/list.html?b_c_num=${cat.c_num}"  
				class="btn">${cat.c_subject }</a>
		</c:if>	
		</td>
		
		<td title="${cat.c_num}" align="center" width="5%">
			<%-- <a href="${path}/cate/cBoard.html?c_num=${cat.c_num }" class="glyphicon glyphicon-cog"></a> --%>
			<a href="javascript:window.scrollTo(100,100)" class="glyphicon glyphicon-cog" onclick="c_board(${cat.c_num})"></a>
			<%-- <a href="javascript:cBoardPopup(${cat.c_num});" class="glyphicon glyphicon-cog" style="font-size:11px;color:#7d7d7d"></a> --%>		
			</td>		 
	</c:if>
	</tr>
</c:forEach>
</c:if>
</table>

</div>


</body>
</html>