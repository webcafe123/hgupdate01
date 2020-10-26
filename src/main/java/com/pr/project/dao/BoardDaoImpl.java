package com.pr.project.dao;

import java.util.HashMap;
import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.pr.project.model.Board;
import com.pr.project.model.FileUpload;

@Repository // DAO객체 생성
public class BoardDaoImpl implements BoardDao {
	@Autowired // mybatis 연결
	private SqlSessionTemplate sst;

	@Override
	public List<Board> list(Board board) {
		return sst.selectList("boardns.list", board);
	}
	@Override
	public int getTotal(Board board) {
		return sst.selectOne("boardns.getTotal", board);
	}
	@Override
	public int maxNum() {
		return sst.selectOne("boardns.maxNum");
	}
	@Override
	public int insert(Board board) {
		return sst.insert("boardns.insert", board);
	}
	@Override
	public void insertPhoto(List<FileUpload> fuPhotos) {
		sst.insert("boardns.insertPhoto", fuPhotos);
	}
	@Override
	public void updateReadCount(int b_num) {
		sst.update("boardns.updateReadCount", b_num);
	}
	public void updateLikeCount(int b_num) {		
		sst.update("boardns.updateLikeCount",b_num);
	}
	@Override
	public Board select(int b_num) {
		return sst.selectOne("boardns.select", b_num);
	}
	public int update(Board board) {
		return sst.update("boardns.update",board);
	}
	public int delete(int b_num) {
		return sst.update("boardns.delete",b_num);
	}
	@Override
	public List<FileUpload> listPhoto(int b_num) {
		return sst.selectList("boardns.listPhoto", b_num);
	}
	@Override
	public List<FileUpload> photoFromList(int b_num) {
		return sst.selectList("boardns.photoFromList", b_num);
	}
	@Override
	public void updateLikeCount(HashMap<String, Object> param) {
		sst.update("boardns.updateLikeCount", param);
	}
}
