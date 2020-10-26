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

<div style="display:inline-block;width:800px;min-height:60px;background-color:#f2f2f2;border:none;padding-top:10px;padding-bottom:10px;margin-bottom:20px;border-bottom:1px dotted #d9d9d9;">
	<table style="width:760px;background-color:transparent;margin-left:20px;margin-bottom:0px;padding-left:10px;">
		<c:forEach var="gbrl" items="${gbReplyList }">
			<c:if test="${gbrl.r_del=='y'}">
				<tr style="border-top:1px solid #d9d9d9;">
					<c:if test="${gbrl.r_level-1>0 }"><td colspan="${gbrl.r_level-1}"></td></c:if>
					<td colspan="10-${gbrl.r_level-1}" style="font-size:14px;padding-top:5px;padding-bottom:5px;">
						<%-- <c:if test="${gbrl.r_level>0 }">┕</c:if> --%>
						삭제된 댓글입니다.
					</td>
				</tr>
			</c:if>
			<c:if test="${gbrl.r_del!='y'}">
				<tr id="gbRerepl_${gbrl.r_num}" style="border-top:1px solid #d9d9d9;">
					<c:if test="${gbrl.r_level-1>0 }"><td colspan="${gbrl.r_level-1}"></td></c:if>
					<td style="width:50px;padding:0px;">
						<img src="/resources/images/i13.jpg" alt="" style="float:left;margin-top:10px;margin-bottom:10px;width:50px;"/>
					</td>
					<td colspan="9-${gbrl.r_level-1}" style="padding-top:2px;">
						<p style="float:left;padding-left:7px;font-size:13px;font-weight:bolder;line-height:10%;">${gbrl.r_nick }</p>
						<p style="float:left;padding-top:1px;padding-left:7px;font-size:10px;color:#8f8f8f;font-weight:normal;line-height:10%;">${gbrl.r_update }</p>
						<c:if test="${gbrl.r_level-1<8}">
							<p id="gbrKey_${gbrl.r_num }" style="float:left;font-size:9px;color:#737373;cursor:pointer;margin-left:5px;font-weight:bolder;line-height:10%;" onclick="gbReplKey(${gbrl.r_num},${gbrl.r_level})">┕답글</p>
						</c:if>
						<c:if test="${gbrl.r_level-1>=8}">							
							<p style="float:left;font-size:9px;color:#8f8f8f;margin-left:5px;font-weight:bolder;line-height:50%;">더 댓글을 달 수 없는 댓글입니다.</p>
						</c:if>
						<p style="float:right;padding-right:7px;font-size:6px;color:#919191;font-weight:bold;line-height:10%;cursor:pointer;">신고</p>
						<p style="float:right;padding-right:7px;font-size:6px;color:#919191;font-weight:bold;line-height:10%;"> | </p>
						<p style="float:right;padding-right:7px;font-size:6px;color:#919191;font-weight:bold;line-height:10%;cursor:pointer;" onclick="gbDelete(${gbrl.r_b_num},${gbrl.r_num})">삭제</p>
						<p style="float:right;padding-right:7px;font-size:6px;color:#919191;font-weight:bold;line-height:10%;"> | </p>
						<p id="gbrUp_${gbrl.r_num}" style="float:right;padding-right:7px;font-size:6px;color:#919191;font-weight:bold;line-height:10%;cursor:pointer;" onclick="gbrUpdate(${gbrl.r_num})">수정</p>
						<textarea cols="${98-(gbrl.r_level-1)*7}" rows="2" style="margin-left:10px;outline:none;border:none;background-color:transparent;resize:none;font-size:13px;">${gbrl.r_content}</textarea>
					</td>
				</tr>
				<tr>
					<td colspan="10">
						<hr id="unfold2line_${gbrl.r_num}" style="display:none;border:1px dotted #d9d9d9;margin-top:0px;margin-bottom:0px;margin-right:20px;"/>
						<div id="unfold2_${gbrl.r_num}" style="display:none;"></div>
					</td>
				</tr>
			</c:if>
		</c:forEach>
	</table>	
</div>
</body>
</html>