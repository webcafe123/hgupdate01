package com.pr.project.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pr.project.model.Message;

@Repository
public class MessageDaoImpl implements MessageDao{

	@Autowired SqlSessionTemplate sst;

	
	public int insert(Message message) {
	
		return sst.insert("messagens.insert",message);
	}

	public List<Message> sendlist(Message message) {
		
		return sst.selectList("messagens.sendlist",message);
	}


	public List<Message> reclist(Message message) {
		
		return sst.selectList("messagens.reclist",message);
	}


	public int getTotal(Message message) {
		
		return sst.selectOne("messagens.getTotal",message);
	}


	public int getTotal_r(Message message) {
		
		return sst.selectOne("messagens.getTotal_r",message);
	}

	public int delete(int m_num) {
		
		return sst.delete("messagens.delete", m_num);
	}


	public int delete2(int m_num) {
		
		return sst.delete("messagens.delete2",m_num);
	}


	
}
