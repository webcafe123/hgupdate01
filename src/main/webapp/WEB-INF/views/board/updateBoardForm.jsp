<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>

<div class="container" align="center" style="margin-left:200px;width:900px;padding-top:20px;padding-bottom:20px;">
   <h2 class="text-primary">게시글 수정</h2>
<form action="updateBoard.html" method="post" enctype="multipart/form-data">
   <input type="hidden" name="b_num" value="${board.b_num }">
   <%-- <input type="hidden" name="b_c_num" value="${cate.c_num }"> --%>
<!-- 로그인 처리 작업 필요!!! -->   
   <input type="hidden" name="b_id" value="sunmin">

<table class="table table-hover ">
   <tr><td colspan="2" align="right">
      <input type="submit" value="수정" class="btn btn-sm btn-success">
      <a href="javascript:history.back()"   class="btn btn-sm btn-danger">취소</a>
      </td></tr>
   <tr><td colspan="2">
      <select name="b_c_num" class="form-control" id="sel1">
         <c:forEach var="category" items="${list }">
            <c:if test="${category.c_del != 'y'}">
               <c:if test="${category.c_level > 0 }">
                  <c:if test="${category.c_num==cate.c_num }">
                  <option title="${category.c_num }" value="${category.c_num }" 
                  selected="selected">${category.c_subject }</option>
                  </c:if>
                  <c:if test="${category.c_num!=cate.c_num }">
                  <option title="${category.c_num }" value="${category.c_num }" 
                  >${category.c_subject }</option>
                  </c:if>
               </c:if>
            </c:if>
         </c:forEach>      
      </select></td></tr>
   <tr><td >제목</td><td><input type="text" name="b_subject" class="form-control"
      required="required" autofocus="autofocus" value="${board.b_subject}"></td></tr>
   <tr><td>작성자</td><td><input type="text" name="b_nick" value="${board.b_nick }" class="form-control"
      readonly="readonly"></td></tr>
   <tr><td>내용</td><td><textarea rows="30" cols="49" name="b_content" class="form-control"
      required="required">${board.b_content}</textarea></td></tr>
   <tr><td>사진<span class="glyphicon glyphicon-picture"></span></td>
      <td><input type="file" name="file" multiple="multiple"></td></tr>
</table>
</form>
</div>   

</body>
</html>