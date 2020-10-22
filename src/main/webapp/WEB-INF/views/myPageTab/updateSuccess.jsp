<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>회원 정보 수정 결과</title>


</head>
<body>
<c:if test="${result>0 }">
<script type="text/javascript"> 
alert("정보 수정 완료~!" );
//location.href="userInfoUpdateForm.html";
//location.href="../home_yj.html";


/* 자식창 닫으면서 부모창 새로고침 */
opener.parent.location.reload();
window.close();

</script>
</c:if>

<c:if test="${result==0 }">
<script type="text/javascript"> 
alert("수정실패,,,,,,,,,,,,");
history.go(-1);
</script>
</c:if>



</body>
</html>