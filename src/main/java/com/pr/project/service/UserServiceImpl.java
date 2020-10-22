package com.pr.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pr.project.dao.UserDao;
import com.pr.project.model.User;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao ud; // repository로 만들어진 객체가 autowired를 통해서 여기로 쏙 들어간다!

	@Override
	public User select(String user_id) {
		return ud.select(user_id);
	}

	@Override
	public User select1(String user_nickname) {
		return ud.select1(user_nickname);
	}

	@Override
	public int insert(User user) {
		return ud.insert(user);
	}
	
	
	//유정추가부분
	@Override
	public User selectN(String user_nickname) {
		
		return ud.selectN(user_nickname);
	}

	@Override
	public int updateN(User user) {
		
		return ud.updateN(user);
	}

}
