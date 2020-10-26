<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>

<div class="container">
	<input type="hidden" name="c_num" value="${cate.c_num}">
</div>

<c:if test="${result > 0 }">
	<script type="text/javascript">
		alert("카테고리 삭제 완료");
		location.href="${path}/cate/cateList.html"; 
	</script>
</c:if>
<c:if test="${result == 0 }">
	<script type="text/javascript">
		alert("삭제 실패");
		history.go(-1);
	</script>
</c:if>


</body>
</html>