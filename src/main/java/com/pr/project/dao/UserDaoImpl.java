package com.pr.project.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pr.project.model.User;

@Repository // Dao객체 생성
public class UserDaoImpl implements UserDao {

	// mybatis 연결
	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public User select(String user_id) {
		return sst.selectOne("userns.select", user_id);
	}

	@Override
	public User select1(String user_nickname) {
		return sst.selectOne("userns.select1", user_nickname);
	}

	@Override
	public int insert(User user) {
		return sst.insert("userns.insert", user);
	}
	
	
	//유정추가부분
	@Override
	public User selectN(String user_nickname) {
		
		return sst.selectOne("userns.selectN",user_nickname);
	}

	@Override
	public int updateN(User user) {
		
		return sst.update("userns.updateN",user);
	}
}

