<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
  
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<style>
div.gallery {
  margin: 5px;
  border: none;
  float: left;
  width: 180px;
  height: 280px;
}
div.gallery:hover {
   border: none;
}
div.gallery img {
  width: 100%;
  height: 180px;
}
div.desc {
  padding: 15px;
  text-align: center;
}
* {
  box-sizing: border-box;
}
.responsive {
  padding: 0 6px;
  float: left;
  width: 24.99999%;
}
@media only screen and (max-width: 700px) {
  .responsive {
    width: 49.99999%;
    margin: 6px 0;
  }
}
@media only screen and (max-width: 500px) {
  .responsive {
    width: 100%;
  }
}
.clearfix:after {
  content: "";
  display: table;
  clear: both;
}
</style>	
</head><body>

<div class="container" align="center" style="margin-left:200px;width:900px;padding-top:20px;padding-bottom:20px;">
	<div>
	
	<!-- 카테고리 -->
	<div>
		<h2 align="left" class="sub-tit-color">${cate.c_subject }</h2>
		<table class="table">
		   <tr><td><pre style="font-size: 20">${cate.c_intro }</pre></td></tr>
		</table>
	</div>
	
	
	
	<!-- 앨범,목록 선택 -->
	<div id="boardChoose" align="right">
	  <a href="${path}/board/listWithPhoto.html?b_c_num=${cate.c_num}&pageNum=${pb.currentPage}&search=${board.search}&keyword=${board.keyword}"
	     class="btn btn-info glyphicon glyphicon-th-large ">.앨범형</a>
	  <a href="${path}/board/list.html?b_c_num=${cate.c_num}&pageNum=${pb.currentPage}&search=${board.search}&keyword=${board.keyword}"
	     class="btn btn-info glyphicon glyphicon-th-list ">.목록형</a>   
	</div>	
	
	<!-- 앨범형 게시판  -->
<!-- <div class="container" align="center" style="margin-left:200px;width:900px;padding-top:20px;padding-bottom:20px;"> -->
   <section id="body">
      <div style="float:right;width:880px;padding-top:20px;padding-bottom:20px">
         <div class="container" style="width:850px;height:910px;padding-top:20px;padding-bottom:20px;border:4px solid #ededed;">
            
            <div class="container" style="padding-top:15px;padding-left:25px;background-color:#ededed;width:815;height:860;">
<div>	
<table>
	<c:forEach var="board" items="${list }">
		<c:if test="${board.b_del != 'y' }">
		
			<div class="gallery">
				<a href="boardView.html?b_c_num=${cate.c_num}&b_num=${board.b_num}&pageNum=${pb.currentPage}">
				   	<c:forEach var="fu" items="${photolist}">
						<img alt="" src="${path }/upload/${fu.f_filename}" width="600" height="20">
					</c:forEach> 
				   
				   <img src="${path }/upload/${fu.f_filename}" alt="${fu.f_filename}" alt="" >
				</a>

			  
			  <div class="desc" style="align-self: left" >
			  	<p style="line-height:10px;"><a href="boardView.html?b_c_num=${cate.c_num}&b_num=${board.b_num}&pageNum=${pb.currentPage}"
									class="tit" onclick="clickcr(this, 'gnr.ititle','','',event);">
								<span class="inner"><span class="ellipsis">${board.b_subject}</span></span></a> 
								<a href="${path}/replyList.html?r_b_num=100"	class="m-tcol-p">
								<span class="num">[${board.b_reply_cnt}]</span></a></p>
			  	<p style="line-height:10px;"><a href="#" class="m-tcol-c">
							${board.b_nick}</a></p>
			  	<p style="line-height:10px;"><span class="date">${board.b_regdate}</span> <span class="num">. 조회 ${board.b_read_cnt}</span>	</p>
			  </div>
			</div>
			
		</c:if>
	</c:forEach>
</table>
</div>	
            </div>
               
         
         </div>   
      </div>
   </section>
<!-- </div> -->





<div>	
	<!-- 버튼         
	<div align="center">
	<a href="${path}/board/insertBoardForm.html?b_c_num=${cate.c_num}" class="btn btn-info">게시글 입력</a> 
	</div>--> 
	
	<!-- 페이징 -->
	<div align="center">
	   <ul class="pagination">
	      <c:if test="${pb.startPage > pb.pagePerBlock}">
	         <li><a href="listWithPhoto.html?b_c_num=${cate.c_num }&pageNum=1&search=${board.search }&keyword=${board.keyword}">
	                     <span class="glyphicon glyphicon-backward"></span>
	               </a></li>
	               
	               <li><a href="listWithPhoto.html?b_c_num=${cate.c_num }&pageNum=${pb.startPage-1}&search=${board.search }&keyword=${board.keyword}">
	                     <span class="glyphicon glyphicon-triangle-left"></span>
	               </a></li>
	            </c:if>
	            
	            <c:forEach var="i" begin="${pb.startPage }" end="${pb.endPage}">
	               <c:if test="${i == pb.currentPage }">
	                  <!-- 현재 페이지를 보고 있으면 active 효과 -->
	                  <li class="active"><a href="list.html?b_c_num=${cate.c_num }&pageNum=${i}&search=${board.search }&keyword=${board.keyword}">${i}</a></li>
	               </c:if>
	               <c:if test="${i != pb.currentPage }">
	                  <li><a href="listWithPhoto.html?b_c_num=${cate.c_num }&pageNum=${i}&search=${board.search }&keyword=${board.keyword}">${i}</a></li>
	               </c:if>
	            </c:forEach>
	            <c:if test="${pb.endPage < pb.totalPage }">
	               <li><a href="listWithPhoto.html?b_c_num=${cate.c_num }&pageNum=${pb.endPage+1}&search=${board.search }&keyword=${board.keyword}">
	                     <span class="glyphicon glyphicon-triangle-right"></span>
	               </a></li>
	               <li><a href="listWithPhoto.html?b_c_num=${cate.c_num }&pageNum=${pb.totalPage}&search=${board.search }&keyword=${board.keyword}">
	                     <span class="glyphicon glyphicon-triangle-forward"></span>
	               </a></li>
	            </c:if>
	         </ul>
	      </div>
	
	<!-- 검색 + 글 입력 버튼 -->
	<form action="listWithPhoto.html">
	<div class="input-group"> 
	   <input type="hidden" name="b_c_num" value="${cate.c_num }"/>
	   <input type="hidden" name="pageNum" value="1" />
	      <select name="search" class="btn btn-default">
	         <c:forTokens var="item" items="b_nick,b_subject,b_content,subcon" delims=","
	            varStatus="i">
	            
	            <c:if test="${board.search==item }">
	               <option value="${item }" selected="selected">${tit[i.index]}</option>
	            </c:if>
	            <c:if test="${board.search!=item }">
	               <option value="${item }" >${tit[i.index]}</option>
	            </c:if>
	         </c:forTokens>              
	      </select>
	      
	      <input class="btn btn-default" type="text" placeholder="검색어를 입력하세요" name="keyword" value="${board.keyword }"/>
	      <!-- <input class="btn btn-info" type="submit" value="확인" /> -->
	      <button class="btn btn-default btn-lg" type="submit">
	        <i class="glyphicon glyphicon-search"></i>
	      </button> &nbsp&nbsp
	      <a href="${path}/board/insertBoardForm.html?b_c_num=${cate.c_num}" class="btn btn-info">게시글 입력</a>
	</div>
		  
	</form>
</div>

</div>
</div>
</body>
</html>