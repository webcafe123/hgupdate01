<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>쪽지 보내기 완료</title>
</head>
<body>

<c:if test="${result>0 }">
<script type="text/javascript"> 
alert("쪽지 보내기 완료~!");
location.href="sendmessagePopup.html";

//location.href="empSelect.html?empno=${emp.empno}";
</script>
</c:if>

<c:if test="${result==0 }">
<script type="text/javascript"> 
alert("입력실패,,,,,,,,,,,,");
history.go(-1);
</script>
</c:if>

<%-- <div class="container" align="center" style="padding-top:30px">
<img width=150, height=150, src="${path }/resources/images/suc.png"> 

 </div>
 
 <h2 align="center">쪽지 보내기 완료</h2> --%>
</body>
</html>