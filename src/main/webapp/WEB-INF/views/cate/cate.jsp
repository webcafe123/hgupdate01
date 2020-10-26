<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>

<!-- <div class="container" 
	style="float:left; width: 230px; height: 40px; "> -->
	<p style="text-align:center;background-color:#555555;width:200px;height:35px;color:white;border-radius:1px;border:1px solid #c2c2c2;font-size:20px;margin-top:10px;">카테고리</p>
	<!-- <h4 class="text-primary" >카테고리</h4> --> 
<table class="table">
	<tr><td colspan="3">
		<div align="right"><a href="${path}/cate/cateList.html" 
		class="btn btn-info, glyphicon glyphicon-edit">.edit</a></div></td></tr> 
<c:if test="${empty list }">
	<tr><td>데이터가 없습니다</td></tr>
</c:if>		

	<tr><td>♬</td><td>영꿀친목 꿀단지</td></tr>
	<tr><td></td><td><a href="${path}/guestBookView.html?r_b_num=100">가입 인사</a></td></tr>
	<tr><td></td><td><a href="${path}/board/list.html?b_c_num=0">자유 게시판</a></td></tr>
	
<c:if test="${not empty list }">
<c:forEach var="cate" items="${list }">
	<tr>
	<c:if test="${cate.c_del != 'y'}">
		<td align="center" width="5%">
		<c:if test="${!(cate.c_level > 0) }">♬</c:if></td>
		<td title="${cate.c_intro}">
		
		<c:if test="${!(cate.c_level > 0) }">
			${cate.c_subject }
		</c:if>
		
		<c:if test="${cate.c_level > 0 }">
			<%-- <img src="images/level.gif" alt="" height="5"
				width="${cate.c_level*10}"> --%>
<!-- 여기 url 입력 어떻게? -->
			<a href="${path}/board/list.html?b_c_num=${cate.c_num}"  
				class="btn">${cate.c_subject }</a>	
		</c:if>	
		</td>
	</c:if>
	</tr>
</c:forEach>
</c:if>
</table>

<!-- </div> -->


</body>
</html>