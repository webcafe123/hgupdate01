<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="guestBookForm" class="container" align="left" style="width:900px;height:160px;">
	<form action="insertGuestBook.html" method="post">
		<input type="hidden" name="r_num" value="0">	
		<input type="hidden" name="r_b_num" value="100">
		<c:if test="${empty r_ref || r_ref==0}">
			<input type="hidden" name="r_ref" value="0">
		</c:if>
		<c:if test="${not empty r_ref || r_ref!=0}">
			<input type="hidden" name="r_ref" value="${r_ref}">
		</c:if>
		<input type="hidden" name="r_id" value="tempid">
		<input type="hidden" name="r_nick" value="tempnick">
		
 		<table class="table table-bordered" style="float:left;width:840px;height:160px;border:#999999;">
			<tr>
				<td colspan="2" style="height:115px;padding-top:20px;padding-left:20px;">
					<textarea style="float:left;border:none;outline:none;width:800px;font-size:13px" name="r_content" cols="90" rows="5" placeholder="글을 입력해주세요"></textarea>
				</td>
			</tr>
			<tr>
				<td style="height:45px;width:770px;background-color:#f8f8f8;padding-top:10px">
					<p style="font-size:20px;color:#999999;">
						<span class="glyphicon glyphicon-camera" style="float:left;margin-left:10px;"></span>
						<span class="glyphicon glyphicon-facetime-video" style="float:left;margin-left:10px;"></span>
						<span class="glyphicon glyphicon-cog" style="float:left;margin-left:10px;"></span>
					</p>
				</td>
				<td style="padding:0px;">
					<button type="submit" style="height:100%;width:100%;border:none;outline:none;font-size:14px;background-color:#454545;color:white;">등록</button>
				</td>
			</tr>
		</table>
			
	</form>
</div>
</body>
</html>