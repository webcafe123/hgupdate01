<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%
	request.setCharacterEncoding("utf-8");
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet"
	href="${path}/resources2/cssmanage/cafe_admin_pop-1577769455000-41922.css"
	type="text/css">

<title>멤버등급 안내</title>
</head>
<body>
	<div id="pop_wrap" class="pop_staff_role" style="width: 700px">
		<div id="pop_header" class="blind">
			<h1>스탭 역할 한눈에 보기</h1>
		</div>
		<div id="pop_container">
			<div class="pop_content">
				<div class="bx_type" style="margin-top: 8px">
					<strong>${user_nickname } ( ${user_id } ) 님은 <span class="c_gn">꿀벌</span>입니다.
					</strong>
					<ul>
						<li class="fst">총 게시글 <em>0</em>개
						</li>
						<li>댓글 수 <em>0</em>개
						</li>
						<li>출석 수 <em>6</em>회
						</li>
						<li>가입일 ${user_regdate }</li>
					</ul>
				</div>
				<div class="txt_top">
					<strong>우리카페 등급안내</strong>
				</div>
				<table border="1" cellspacing="0" class="tbl_role">
					<caption>
						<span class="blind">카페의 등급 목록</span>
					</caption>
					<colgroup>
						<col width="155">
						<col width="*">
					</colgroup>
					<tbody>


						<tr>
							<th><strong><img
									src="https://cafe.pstatic.net//levelicon/1/1_1.gif" alt=""
									width="11" height="11">꿀벌</strong></th>
							<td>
								<div class="txt_cont">
									<p>영어꿀에 가입하고 막 활동을 시작하는 멤버, 화이팅!</p>






								</div>
							</td>
						</tr>



						<tr>
							<th><strong><img
									src="https://cafe.pstatic.net//levelicon/1/1_110.gif" alt=""
									width="11" height="11">꿀 1통</strong></th>
							<td>
								<div class="txt_cont">
									<p>영어꿀 1통 나쁘지 않아!</p>


									<ul>
										<li><span class="c_gn">자동등업 :</span> 게시글수 <em>3</em>개,
											댓글수 <em>5</em>개, 출석수 <em>0</em>회, 가입 <em>0</em>주 후 만족 시 등업 신청
											가능</li>
									</ul>




								</div>
							</td>
						</tr>



						<tr>
							<th><strong><img
									src="https://cafe.pstatic.net//levelicon/1/1_120.gif" alt=""
									width="11" height="11">꿀 2통</strong></th>
							<td>
								<div class="txt_cont">
									<p>어느새 영어꿀 2통이네!?</p>


									<ul>
										<li><span class="c_gn">자동등업 :</span> 게시글수 <em>10</em>개,
											댓글수 <em>20</em>개, 출석수 <em>0</em>회, 가입 <em>0</em>주 후 만족 시 등업
											신청 가능</li>
									</ul>




								</div>
							</td>
						</tr>



						<tr>
							<th><strong><img
									src="https://cafe.pstatic.net//levelicon/1/1_130.gif" alt=""
									width="11" height="11">꿀 3통</strong></th>
							<td>
								<div class="txt_cont">
									<p>영어꿀 3통이라면 꿀박스를 노려보자!</p>


									<ul>
										<li><span class="c_gn">자동등업 :</span> 게시글수 <em>20</em>개,
											댓글수 <em>30</em>개, 출석수 <em>0</em>회, 가입 <em>0</em>주 후 만족 시 등업
											신청 가능</li>
									</ul>




								</div>
							</td>
						</tr>



						<tr>
							<th><strong><img
									src="https://cafe.pstatic.net//levelicon/1/1_140.gif" alt=""
									width="11" height="11">꿀박스</strong></th>
							<td>
								<div class="txt_cont">
									<p>꿀박스 자료와 영어꿀 모든 자료를 볼 수 있다!</p>


									<ul>
										<li><span class="c_gn">자동등업 :</span> 게시글수 <em>30</em>개,
											댓글수 <em>50</em>개, 출석수 <em>0</em>회, 가입 <em>0</em>주 후 만족 시 등업
											신청 가능</li>
									</ul>




								</div>
							</td>
						</tr>



						<tr class="last">
							<th><strong><img
									src="https://cafe.pstatic.net//levelicon/1/1_150.gif" alt=""
									width="11" height="11">매니저</strong></th>
							<td>
								<div class="txt_cont">
									<p>영어꿀 매니저+스탭 등급입니다 :D</p>






								</div>
							</td>
						</tr>


					</tbody>
				</table>
				<div class="desc">
					<ul class="bu_lst_desc">
						<li>자동등업 : 매니저가 설정한 조건을 만족하면 신청 없이 등업이 됩니다.</li>
						<li>등업게시판 : 매니저가 설정한 조건을 만족하면 등업게시판에 등업 신청이 가능합니다. 매니저 수락을 거쳐
							등업됩니다.</li>
					</ul>
				</div>
			</div>
		</div>
		<div id="pop_footer">
			<a href="javascript:self.close();" class="btn_type"><strong>확인</strong></a>
		</div>
	</div>
</body>
</html>