package com.pr.project.service;

import java.util.List;

import com.pr.project.model.Reply;

public interface ReplyService {

	int insert(Reply reply);

	int maxNum();

	int selectOrigin(int r_ref);
	
	int selectLevel(int r_ref);

	int selectStep(int r_ref);

	void updateStep(Reply reply);

	int update(Reply reply);

	int delete(int r_num);

	List<Reply> list(int r_b_num);
	
	List<Reply> list2(Reply reply);

	int selectMaxStep(int r_b_num);

	int count(int r_b_num);

	List<Reply> list3(int r_num);

	Reply getReply(int r_num);


}
