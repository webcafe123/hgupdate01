package com.pr.project.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pr.project.model.Reply;

@Repository
public class ReplyDaoImpl implements ReplyDao{
	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public int insert(Reply reply) {
		return sst.insert("replyns.insert", reply);
	}

	@Override
	public int maxNum() {
		return sst.selectOne("replyns.maxNum");
	}

	@Override
	public int selectOrigin(int r_ref) {
		return sst.selectOne("replyns.selectOrigin", r_ref);
	}
	
	@Override
	public int selectLevel(int r_ref) {
		return sst.selectOne("replyns.selectLevel", r_ref);
	}

	@Override
	public int selectStep(int r_ref) {
		return sst.selectOne("replyns.selectStep", r_ref);
	}

	@Override
	public void updateStep(Reply reply) {
		sst.update("replyns.updateStep", reply);
	}

	@Override
	public int update(Reply reply) {
		return sst.update("replyns.update", reply);
	}

	@Override
	public int delete(int r_num) {
		return sst.update("replyns.delete", r_num);
	}

	@Override
	public List<Reply> list(int r_b_num) {
		return sst.selectList("replyns.list", r_b_num);
	}

	@Override
	public List<Reply> list2(Reply reply) {
		return sst.selectList("replyns.list2", reply);
	}
	
	@Override
	public int selectMaxStep(int r_b_num) {
		return sst.selectOne("replyns.selectMaxStep", r_b_num);
	}

	@Override
	public int count(int r_b_num) {
		return sst.selectOne("replyns.count", r_b_num);
	}

	@Override
	public List<Reply> list3(int r_num) {
		return sst.selectList("replyns.list3", r_num);
	}

	@Override
	public Reply getReply(int r_num) {
		return sst.selectOne("replyns.getReply", r_num);
	}

}
