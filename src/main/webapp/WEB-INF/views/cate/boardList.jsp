<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function() { 
		$('#boardListDisp').load('${path}/board/list.html',"b_c_num=${cate.c_num}");
	});  
</script> 
</head><body>

<div class="container" align="left">
	<h2 align="left" class="text-primary">${cate.c_subject }</h2>
<table class="table table-bordered">
	<tr><td><pre>${cate.c_intro }</pre></td></tr>
</table>
<div id="boardListDisp"></div>
<%-- <jsp:include page="../board/list.jsp"></jsp:include> --%>
</div>

</body>
</html>