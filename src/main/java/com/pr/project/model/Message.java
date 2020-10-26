package com.pr.project.model;

import java.sql.Date;

import lombok.Data;

@Data
public class Message {
	
	private int m_num;  //pk
	private String m_sender_id; //fk
	private String m_sender_nick;
	private String m_sender_ip;
	private String m_sender_del;
	private String m_receiver_id; //fk
	private String m_receiver_nick;
	private String m_receiver_del;
	private String m_subject;
	private String m_content;
	private Date m_send_date;
	
	// 페이징용
	private int startRow;
	private int endRow;
	
	
}

