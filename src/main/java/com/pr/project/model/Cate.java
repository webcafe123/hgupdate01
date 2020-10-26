package com.pr.project.model;
import java.sql.Date;
import lombok.Data;

@Data
public class Cate {
    private int c_num;				// key
    private String c_subject;		// 카테고리명
    private String c_id;			// 생성자 c_id
    private String c_intro;       	// 카테고리 설명 
    private Date c_regdate;			// 작성일
    private String c_del;           // 삭제여부
    private int ref;				// cate끼리 묶음
    private int c_step;				// ref 내의 순서
    private int c_level;			// 들여쓰기
}