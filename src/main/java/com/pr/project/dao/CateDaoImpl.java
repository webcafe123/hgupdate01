package com.pr.project.dao;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pr.project.model.Cate;

@Repository
public class CateDaoImpl implements CateDao {
	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public List<Cate> list() {
		return sst.selectList("catens.list");	}
	@Override
	public int insert(Cate cate) {
		return sst.insert("catens.insert", cate);	}
	@Override
	public Cate select(int num) {
		return sst.selectOne("catens.select", num);	}
	@Override
	public int update(Cate cate) {
		return sst.update("catens.update", cate);	}
	@Override
	public int delete(int c_num) {
		return sst.update("catens.delete", c_num);	}
	@Override
	public int maxNum() {
		return sst.selectOne("catens.maxNum");	}
	@Override
	public void updateC_step(Cate cate) {
		sst.update("catens.updateC_step", cate);	}
	
}
