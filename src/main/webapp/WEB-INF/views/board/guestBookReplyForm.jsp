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
<div id="gbRepl_${r_num}" style="display:inline-block;width:800px;min-height:120px;background-color:#f2f2f2;border:none;padding-top:20px;margin-top:0px;margin-left:10px;margin-right:10px;margin-bottom:10px;">
	<form action="insertGuestBook.html">
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
	
		<textarea name="r_content" cols="92" rows="3" style="float:left;outline:none;border:1px solid #e6e6e6;resize:none;margin-left:20px;font-size:13px;"></textarea>
		<input type="submit" value="등록" style="float:left;background-color:white;outline:none;border:1px solid #c9c9c9;width:90px;height:58px;margin-left:5px;font-size:13px;font-weight:bold;color:#949494;"/>
	</form>
	<p style="float:left;font-size:13px;color:#a8a8a8;margin-top:10px;margin-left:20px;">
		<span class="glyphicon glyphicon-camera" style="margin-left:5px;cursor:pointer;"><span style="margin:2px;"></span>스티커</span>
		<span class="glyphicon glyphicon-camera" style="margin-left:5px;cursor:pointer;"><span style="margin:2px;"></span>사진</span>
	</p>
</div>
</body>
</html>