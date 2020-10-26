package com.pr.project.model;


import java.sql.Date;

import lombok.Data;

@Data
public class User {
	private String user_id; // pk
	private String user_nickname;
	private String user_name;
	private int user_age;
	// private String user_phone;
	private String user_email;
	private String user_ip;
	private int user_level;
	private String user_del;
	private Date user_regdate;
	private Date user_update;
	private String user_pwd;
}
