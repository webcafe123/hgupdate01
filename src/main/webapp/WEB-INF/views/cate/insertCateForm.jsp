<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
 <!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<!-- <script type="text/javascript">
	$(function() {
		$('#cateListDisp').load('${path}/cate/cateList.html');
	});
</script> -->
<script type="text/javascript">
function windowClosePopup(){
	window.open('', '_self').close();
}

</script>
</head><body>

<div class="container" style="padding:10px;float:left;margin-left:20px;height:270px;width:840px;padding-top:20px;padding-bottom:30px;">
	<c:if test="${c_num != 0 }">
		<h2 class="text-primary">카테고리 추가</h2>
	</c:if>
	<c:if test="${c_num == 0 }">
		<h2 class="text-primary">카테고리 입력</h2>
	</c:if>
<form action="insertCate.html" method="post" name="frm">
	<input type="hidden" name="c_num" value="${c_num }">
	<input type="hidden" name="ref" value="${ref }">
	<input type="hidden" name="re_level" value="${re_level }">
	<input type="hidden" name="re_step" value="${re_step }">
	<input type="hidden" name="c_id" value="${c_id }">
<table class="table table-hover">
<c:if test="${c_num == 0 }">
	<tr><td>카테고리명</td><td><input type="text" name="c_subject" class="form-control"
		required="required" autofocus="autofocus"></td></tr>
</c:if>
<c:if test="${c_num != 0 }">
	<tr><td>카테고리명</td><td><input type="text" name="c_subject" class="form-control"
		required="required" autofocus="autofocus" value=""></td></tr> 
</c:if>
	<!-- <tr><td>생성자</td><td><input type="text" name="c_id"></td></tr> -->
	<tr><td>intro</td><td><textarea rows="5" cols="49" name="c_intro" class="form-control"></textarea></td></tr>
	<tr><td colspan="2" align="center">
	<c:if test="${c_num != 0 }">
		<input type="submit" value="추가" class="btn btn-sm btn-success"> 
	</c:if>
	<c:if test="${c_num == 0 }">
		<input type="submit" value="입력" class="btn btn-sm btn-success"> 
	</c:if>
		<a href="javascript:windowClosePopup();" class="btn btn-sm btn-danger">취소</a>
		<%-- <a href="${path}/cate/cateList.html" class="btn btn-sm btn-danger"> 취소</a></td></tr> --%>
		</td></tr>
		
		
</table>
</form>
<!-- <div id="cateListDisp"></div> -->
</div>


</body>
</html>