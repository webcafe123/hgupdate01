package com.pr.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pr.project.dao.ReplyDao;
import com.pr.project.model.Reply;

@Service
public class ReplyServiceImpl implements ReplyService{
	@Autowired
	private ReplyDao rd;

	@Override
	public int insert(Reply reply) {
		return rd.insert(reply);
	}

	@Override
	public int maxNum() {
		return rd.maxNum();
	}
	
	@Override
	public int selectOrigin(int r_ref) {
		return rd.selectOrigin(r_ref);
	}
	
	@Override
	public int selectLevel(int r_ref) {
		return rd.selectLevel(r_ref);
	}
	
	@Override
	public int selectStep(int r_ref) {
		return rd.selectStep(r_ref);
	}

	@Override
	public void updateStep(Reply reply) {
		rd.updateStep(reply);
	}

	@Override
	public int update(Reply reply) {
		return rd.update(reply);
	}

	@Override
	public int delete(int r_num) {
		return rd.delete(r_num);
	}

	@Override
	public List<Reply> list(int r_b_num) {
		return rd.list(r_b_num);
	}
	
	@Override
	public List<Reply> list2(Reply reply) {
		return rd.list2(reply);
	}

	@Override
	public int selectMaxStep(int r_b_num) {
		return rd.selectMaxStep(r_b_num);
	}

	@Override
	public int count(int r_b_num) {
		return rd.count(r_b_num);
	}

	@Override
	public List<Reply> list3(int r_num) {
		return rd.list3(r_num);
	}

	@Override
	public Reply getReply(int r_num) {
		return rd.getReply(r_num);
	}

}
