<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>


<table class="table table-striped table-bordered">
   <tr><td>글번호</td>
      <td>제목</td>
      <td>작성자</td>
      <td>작성일</td>
      <td>조회수</td>
      <td>좋아요</td></tr>
<c:if test="${empty list }">
   <tr><td colspan="6">데이터가 없습니다</td></tr>
</c:if>      
<c:if test="${not empty list }">

<c:forEach var="board" items="${list }">
<c:if test="${board.b_del != 'y'}">
   <tr><td>${board.b_num }</td>
<%--    <c:if test="${board.del == 'y'}">
      <td colspan="5">삭제된 글입니다</td>
   </c:if> --%>

      <td  title="${board.b_content}">
         <c:if test="${board.b_read_cnt > 30 }">
         <img src="${path }/resources/images/hot.gif" alt="" />
            </c:if>
         <a href="boardView.html?b_c_num=${cate.c_num}&b_num=${board.b_num}&pageNum=${pb.currentPage}"
            >${board.b_subject }</a></td>
      <td>${board.b_nick}</td>
      <td>${board.b_regdate }</td>
      <td>${board.b_read_cnt }</td>
      <td>${board.b_like_cnt }</td>
   </tr>
</c:if>   
</c:forEach>
</c:if>
</table>

<!-- 페이징 -->
<div align="center">
   <ul class="pagination">
      <c:if test="${pb.startPage > pb.pagePerBlock}">
         <li><a href="list.html?b_c_num=${cate.c_num }&pageNum=1&search=${board.search }&keyword=${board.keyword}">
                     <span class="glyphicon glyphicon-backward"></span>
               </a></li>
               
               <li><a href="list.html?b_c_num=${cate.c_num }&pageNum=${pb.startPage-1}&search=${board.search }&keyword=${board.keyword}">
                     <span class="glyphicon glyphicon-triangle-left"></span>
               </a></li>
            </c:if>
            
            <c:forEach var="i" begin="${pb.startPage }" end="${pb.endPage}">
               <c:if test="${i == pb.currentPage }">
                  <!-- 현재 페이지를 보고 있으면 active 효과 -->
                  <li class="active"><a href="list.html?b_c_num=${cate.c_num }&pageNum=${i}&search=${board.search }&keyword=${board.keyword}">${i}</a></li>
               </c:if>
               <c:if test="${i != pb.currentPage }">
                  <li><a href="list.html?b_c_num=${cate.c_num }&pageNum=${i}&search=${board.search }&keyword=${board.keyword}">${i}</a></li>
               </c:if>
            </c:forEach>
            <c:if test="${pb.endPage < pb.totalPage }">
               <li><a href="list.html?b_c_num=${cate.c_num }&pageNum=${pb.endPage+1}&search=${board.search }&keyword=${board.keyword}">
                     <span class="glyphicon glyphicon-triangle-right"></span>
               </a></li>
               <li><a href="list.html?b_c_num=${cate.c_num }&pageNum=${pb.totalPage}&search=${board.search }&keyword=${board.keyword}">
                     <span class="glyphicon glyphicon-triangle-forward"></span>
               </a></li>
            </c:if>
         </ul>
      </div>

</body>
</html>