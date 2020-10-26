<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<!-- <script type="text/javascript">
	$(function() {
		$('#cateListDisp').load('cateList.html');
	});
</script> -->
<script type="text/javascript">
	//----------------------------------------------
	// 수정 (팝업창에 있는 함수)
	//----------------------------------------------
	function updateBtn() {
	    opener.reloadPage();
	    self.close();
	    window.close();
	}
	//----------------------------------------------
	// 페이지를 갱신시킨다. (자식창에서 호출하는 함수 )
	//----------------------------------------------
	function reloadPage() {
	    location.reload();
	}
</script>
</head><body>

<div class="container" align="center" style="padding:10px;float:left;margin-left:20px;height:270px;width:840px;padding-top:20px;padding-bottom:20px;">
	<h2 class="text-primary">카테고리 수정</h2>
<form action="updateCate.html" method="post" name="frm">
	<input type="hidden" name="c_num" value="${cate.c_num}">
<table class="table table-hover table-bordered">
	<tr><td>카테고리명</td><td><input type="text" name="c_subject" class="form-control"
		required="required" autofocus="autofocus"
		value="${cate.c_subject}"></td></tr>
	<tr><td>intro</td><td><textarea rows="5" cols="49" name="c_intro" class="form-control">${cate.c_intro}</textarea></td></tr>
		
	<tr><td colspan="2" align="center">
		<input type="submit" value="수정" class="btn btn-sm btn-success" onClick="return updateBtn()"> 
		<input id="" type="button" value="취소" class="btn btn-danger" onClick="window.close()">
		<!-- <a href="javascript:history.back()" class="btn btn-sm btn-danger">취소</a> -->		
		</td></tr>
		
</table>
</form>
<!-- <div id="cateListDisp"></div> -->
</div>


</body>
</html>