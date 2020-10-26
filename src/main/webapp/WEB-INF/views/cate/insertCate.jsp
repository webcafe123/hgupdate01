<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>

<c:if test="${result > 0 }">
	<script type="text/javascript">
	alert("새로운 카테고리가 입력되었습니다");
	location.href="${path}/cate/cateList.html"; 
	/* 자식창 닫으면서 부모창 새로고침 */
	opener.parent.location.reload();
	window.close();
	
	
	</script>
</c:if>
<c:if test="${result == 0 }">
	<script type="text/javascript">
	alert("입력 실패");
	history.go(-1);
	</script>
</c:if>


</body>
</html>