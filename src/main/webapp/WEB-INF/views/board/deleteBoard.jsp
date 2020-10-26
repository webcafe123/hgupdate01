<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
</head>
<body>

<div class="container">
			<input type="hidden" name="b_num" value="${board.b_num}" />
			<input type="hidden" name="pageNum" value="${pageNum}" /> 
			<%-- <input type="hidden" name="b_c_num" value="${cate.c_num}" />  --%>
</div>

<c:if test="${result > 0}">
	<script type="text/javascript">
		alert("삭제 되었습니다");
		location.href="list.html?b_c_num=${cate.c_num }";
	</script>
</c:if>
<c:if test="${result == 0}">
	<script type="text/javascript">
		alert("삭제 실패");
		history.back();
	</script>
</c:if>



</body>
</html>