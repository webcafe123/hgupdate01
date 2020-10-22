package com.pr.project.service;

import java.util.List;

import com.pr.project.model.Message;

public interface MessageService {

	int insert(Message message);

	List<Message> sendlist(Message message);

	List<Message> reclist(Message message);

	int getTotal(Message message);

	int getTotal_r(Message message);

	int delete(int m_num);

	int delete2(int m_num);

	

}
