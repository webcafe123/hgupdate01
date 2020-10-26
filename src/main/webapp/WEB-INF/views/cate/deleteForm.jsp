<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>

<div class="container" align="center">
	<h2 class="text-primary">카테고리 삭제 확인</h2>
<form action="deleteCate.html" name="frm">
	<input type="hidden" name="c_num" value="${cate.c_num}">
<table class="table table-bordered">
	<tr><td align="center">
		<input type="submit" class="btn btn-sm btn-warning" 
			value="삭제확인">
		<a href="javascript:history.back()"
			class="btn btn-sm btn-danger">취소</a></td></tr>	
</table>
</form>
</div>

</body>
</html>