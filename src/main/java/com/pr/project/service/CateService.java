package com.pr.project.service;

import java.util.List;

import com.pr.project.model.Cate;

public interface CateService {
	List<Cate> list();
	int insert(Cate cate);
	Cate select(int num);
	int update(Cate cate);
	int delete(int c_num);
	int maxNum();
	void updateC_step(Cate cate);
	
}
