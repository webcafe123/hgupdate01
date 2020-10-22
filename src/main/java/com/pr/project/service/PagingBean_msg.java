package com.pr.project.service;

import lombok.Data;

@Data
public class PagingBean_msg {

	private int currentPage;	private int rowPerPage;
	private int total;			private int totalPage;
	private int pagePerBlock = 5;
	private int startPage;		private int endPage;
	public PagingBean_msg(int currentPage, int rowPerPage, int total) {
		this.currentPage = currentPage; 
		this.rowPerPage = rowPerPage;
		this.total = total;
		// 페이지 	Math.ceil(개수/페이지당 개수)			
		totalPage = (int)Math.ceil((double)total/rowPerPage);
		// 시작페이지	현재페이지 - (현재페이지 - 1)%pagePerBlock				
		startPage = currentPage - (currentPage - 1) % pagePerBlock;
		// 끝페이지	시작페이지 + 블록당페이지 수 -1			
		endPage = startPage + pagePerBlock - 1;
		//  마지막 블럭의 page조정
		if (endPage > totalPage) endPage = totalPage;
	}

}
