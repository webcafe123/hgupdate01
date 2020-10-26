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

<div id="replyForm" class="container" align="left" style="width:780px;">
	<form action="insertReply.html" method="post">
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
		
		<div class="container" style="float:left;width:760px;border:2px solid #e5e5e5;border-radius:10px;padding-top:10px;padding-bottom:1px;">
	 		<table>
				<tr>
					<td><p style="float:left;font-size:13px;font-weight:bold;padding-top:1px;line-height:1px;" onclick="">tempnick</p></td>
				</tr>
				<tr>
					<td>
						<textarea style="float:left;border:none;outline:none;width:720px;font-size:12px" name="r_content" cols="90" rows="3" placeholder="댓글을 남겨보세요"></textarea>
					</td>
				</tr>
				<tr>
					<td>
						<p>
							<img src="${path }/resources/images/i8.jpg" alt="" style="float:left;cursor:pointer" onclick=""/>
							<img src="${path }/resources/images/i9.jpg" alt="" style="float:left;cursor:pointer" onclick=""/>
							<input style="float:right;border-radius:6px;border:none;outline:none;margin-right:10px;font-size:13px;background-color:transparent;color:#a3a3a3;font-weight:bold" type="submit" value="등록"></input>
						</p>
					</td>
				</tr>
			</table>
		</div>
	</form>
</div>

</body>
</html>