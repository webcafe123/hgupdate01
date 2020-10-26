package com.pr.project.model;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Board {
	private int b_num;		 	// 글번호
	private int b_c_num;		// 카테고리번호
	private String b_subject;  	// 주제
	private String b_id;		// 작성자 아이디
	private String b_nick; 		// 작성자 별명
	private String b_content;	// 내용
	private int b_read_cnt;	 	// 조회수
	private int b_reply_cnt;	// 댓글수
	private int b_like_cnt;	 	// 좋아요수
	private Date b_regdate;	 	// 작성일
	private Date b_update;	 	// 수정일
	private String b_ip;		// 작성자 ip
	private String b_notice;	// 공지 여부
	private String b_del;		// 삭제 여부
    private String b_filename;	// 파일이름
	
	private MultipartFile file;	// upload 사진용
	
	// 페이징용
	private int startRow;
	private int endRow;
	// 검색용
	private String search;
	private String keyword;
}	



