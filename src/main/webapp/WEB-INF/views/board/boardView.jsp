<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
<title>Insert title here</title>
<style>
/* .clearfix:after {
  content: "";
  display: table;
  clear: both;
} */



</style>

<!-- <script type="text/javascript">
   $(function(){
      $('#boardListDisp').load('freeBoardList.html','pageNum=${pageNum}');
   })
</script> -->

<script type="text/javascript">
   function delchk() {
      result = confirm("삭제하시겠습니까?");
      if (result == true) {
         location.href = "deleteBoard.html?b_c_num=${cate.c_num}&b_num=${board.b_num}&pageNum=${pageNum}";
      } else
         return false;
   }
   
   function addHeart(a){
      var heart = $(a).attr("class");
   //   console.log(하트);
      //좋아요를 눌렀을때
      if(heart == "far fa-heart"){
         $("#heartIcon").attr("class","fas fa-heart");
         $("#heartIcon").val("1");
      //취소했을떄
      }else{
         $("#heartIcon").attr("class","far fa-heart");
         $("#heartIcon").val("0");
      }
      var param = { "b_num" : "${board.b_num}" , "b_like_cnt" : $("#heartIcon").val() };
      
       // ajax 호출
       $.ajax({
              type:  'post',
              url:   'updateLikeCount.html',
              data:  param ,
              async: false,
              dataType:"application/json",
              success:function(data) {
                     alert("좋아요");
              },
              error:function(request,status,error){
          //    alert('[' + request.status +error+ '] 에러가 발생하였습니다.', '에러발생');
        }
       });
   }
   
</script>
</head>
<body>
   <div style="float:right; padding:10px;">
      <a href="list.html?b_c_num=${cate.c_num}&b_num=${board.b_num}&pageNum=${pageNum}"
         class="btn btn-info">게시글 목록</a>
      <a href="updateBoardForm.html?b_c_num=${cate.c_num}&b_num=${board.b_num}&pageNum=${pageNum}"
         class="btn btn-warning">수정</a>
      <a href="deleteBoard.html?b_c_num=${cate.c_num}&b_num=${board.b_num}&pageNum=${pageNum}"
         onclick="return delchk();" class="btn btn-danger">삭제</a>
   </div>
   <!-- <div class="container" align="center" style="float:left; width:800px; margin:20px"> -->
   <div style="margin-left: 220px; width: 860px; padding-top: 10px; padding-bottom: 20px; border: 0.3px solid lightgray;">
      <table  style=" width: 820px; margin-left: 10px;  "> <!-- class="table" -->

         <tr>
            <td colspan="2" align="right"></td>
         </tr>

         <tr>
            <td colspan="2">
            	<a href="${path}/board/list.html?b_c_num=${cate.c_num}&pageNum=${pageNum}"  
				style="color: #00cc00">${cate.c_subject } > </a></td>
         </tr>
         <tr>
            <td colspan="2" style="font-size: 30px;">${board.b_subject}</td>
         </tr>
         <tr>
            <td>
               <div class="WriterInfo" style="margin:15px; float:left;">
                  <div style="width: 500px;">
                     <a href=""> 
                         <img src="https://ssl.pstatic.net/static/cafe/cafe_pc/default/cafe_profile_77.png?type=c77_77"
                        alt="프로필 사진" width="40" height="40" style="float: left;">
                     </a>
                     <div class="nick_box" style="margin:10px; padding-left: 45px;">
                        <a id="writerInfocallingio" href="#" role="button" style="font-weight: bold">
                           ${board.b_nick}</a><span style="font-size:14px;">&nbsp;&nbsp;${user.user_level} 회원등급</span> 
                           <img src="https://cafe.pstatic.net/levelicon/1/1_140.gif" class="icon_level">
                        <a href="#" class="link_talk" style="color:black; border:1px;">&nbsp;1:1채팅</a>
                        <br>
                        <span class="date">${board.b_regdate}</span> <span class="count">&nbsp;&nbsp;
                        조회 ${board.b_read_cnt}</span>
                      </div>
                  </div>   
               </div>
               <!-- 헤더 -->
            </td>
            <td>
               <button type="button" onclick="location.href='replyView.jsp'" style="font-size:13px; border:none; background-color:white;">
                  <img width=20 height=20 src="${path }/resources/images/b1.png" alt="">&nbsp;댓글&nbsp;${board.b_reply_cnt }</button>
                  <span style="font-size:14px;">&nbsp;&nbsp;URL&nbsp;복사</span>
            </td>
         </tr>
         <%-- <tr>
            <td>${board.b_regdate } </td>
            <td align="right"><i class="">조회수</i> ${board.b_read_cnt } <i class="far fa-comment-dots">댓글</i> ${board.b_reply_cnt }</td>
            </tr> --%>
      </table>
         
      <div style="border: 0.3px solid lightgray; width: 95%; margin-bottom: 15px;"></div>
         
      <table style=" width: 820px; margin-left: 10px; "> <!-- class="table" -->
         <tr>
            <td colspan="2">
               <div align="center">
                  <c:forEach var="fu" items="${list}">
                     <img alt="" src="/resources/upload/${fu.f_filename}" width="200">
                  </c:forEach>
               </div>

               <div style="padding-top: 20px;">
                  <p>${board.b_content }</p>
               </div>
            </td>
         </tr>
         <tr>
            <td>
               <div style="margin-top: 50px;margin-bottom: 10px; ">
                  <a href=""  style="color:black;"> <!-- <span class="thumb"> -->
                     <img src="https://ssl.pstatic.net/static/cafe/cafe_pc/default/cafe_profile_77.png?type=c77_77"
                        alt="프로필 사진" width="36" height="36" style="margin-bottom:13px;"> <!-- </span> -->
                           <strong class="user">${board.b_nick }</strong>님의 게시글 더보기
                        
                     
                  </a>
               </div>
            </td>
         </tr>
         <tr>
            <td>
               <div>
               <i id='heartIcon' class="far fa-heart" onclick="addHeart(this);" style="cursor: pointer; color: red;margin-top:5px;float:left;"  value="0" ></i>&nbsp;좋아요

               <button type="button" onclick="location.href='replyView.jsp'" style="font-size:13px; border:none; background-color:white;">
                  <img width=20 height=20 src="${path }/resources/images/b1.png" alt="">&nbsp;댓글&nbsp;${board.b_reply_cnt }</button>
               </div>   
            </td>
         </tr>
      </table>
      <!-- <div id="boardListDisp"></div> -->
   </div>



</body>
</html>