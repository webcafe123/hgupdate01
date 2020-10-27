<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
 	/* $(function() {
		$('#cateListDisp').load('cateList.html');
	});  */
	function delchk() {
		result = confirm("삭제하시겠습니까?");
		if (result == true){
			location.href="deleteCate.html?c_num=${cate.c_num}";
		} else 
		     return false;
	}
</script>
<script type="text/javascript">
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
	/* 정보수정 버튼 이벤트 */
	function cateUpdatePopup(){
	   var url = "${path}/cate/updateForm.html?c_num=${cate.c_num }";
	   var newOption = setting(900,300);
	   window.open(url,"",newOption);
	}
	/* 카테고리추가 버튼 이벤트 */
	function cateInsertPopup(){
	   var url = "${path}/cate/insertCateForm.html?nm=${cate.c_num }";
	   var newOption = setting(900,300);
	   window.open(url,"",newOption);
	}
</script>
</head><body>
<div class="container" align="center" style="padding:10px;float:left;margin-left:20px;height:270px;width:840px;padding-top:20px;padding-bottom:30px;margin:20px;">
<div>
	<h2 class="text-primary">${cate.c_subject }</h2>
<table class="table table-striped table-bordered">
	<tr><td>번호</td><td width="30%">${cate.c_subject }</td></tr>
	<tr><td>생성자</td><td>${cate.c_id }</td></tr>
	<tr><td>intro</td><td><pre>${cate.c_intro }</pre></td></tr>
	<tr><td>생성일</td><td>${cate.c_regdate }</td></tr>
	<tr><td colspan="2" align="right">
		<a href="${path}/cate/cateList.html" class="btn btn-info">카테고리 관리</a>
		<a href="javascript:cateUpdatePopup();" class="btn btn-warning">수정</a>
		<%-- <a href="${path}/cate/updateForm.html?c_num=${cate.c_num }" class="btn btn-warning">수정</a> --%>
		<a href="${path}/cate/deleteCate.html?c_num=${cate.c_num }" 
			onclick="return delchk();" class="btn btn-danger">삭제</a>
		<c:if test="${!(cate.c_level > 0) }">
		<a href="javascript:cateInsertPopup();" class="btn btn-success">카테고리 항목 추가</a>
		</c:if>			
		<%-- <a href="${path}/cate/insertCateForm.html?nm=${cate.c_num }" class="btn btn-success">카테고리 항목 추가</a> --%>
	</td></tr>
</table>
</div>
<!-- <div id="cateListDisp"></div> -->
</div>
</body>
</html>