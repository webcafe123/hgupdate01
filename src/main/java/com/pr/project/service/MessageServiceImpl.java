package com.pr.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pr.project.dao.MessageDao;
import com.pr.project.model.Message;

@Service
public class MessageServiceImpl implements MessageService{

	@Autowired
	private MessageDao msgd;

	
	public int insert(Message message) {
		
		return msgd.insert(message);
	}


	public List<Message> sendlist(Message message) {
		
		return msgd.sendlist(message);
	}


	public List<Message> reclist(Message message) {
		
		return msgd.reclist(message);
	}

	public int getTotal(Message message) {
		
		return msgd.getTotal(message);
	}


	public int getTotal_r(Message message) {
		
		return msgd.getTotal_r(message);
	}


	public int delete(int m_num) {
		
		return msgd.delete(m_num);
	}


	public int delete2(int m_num) {
		
		return msgd.delete2(m_num);
	}


	
}
