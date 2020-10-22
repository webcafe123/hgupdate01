package com.pr.project.service;

import com.pr.project.model.User;

public interface UserService {

	User select(String user_id);

	User select1(String user_nickname);

	int insert(User user);

	//유정추가부분
	User selectN(String user_nickname);

	int updateN(User user);
}
