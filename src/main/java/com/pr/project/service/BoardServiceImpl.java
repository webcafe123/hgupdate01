package com.pr.project.service;

import java.util.HashMap;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.pr.project.dao.BoardDao;
import com.pr.project.model.Board;
import com.pr.project.model.FileUpload;

@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	private BoardDao bd;

	@Override
	public List<Board> list(Board board) {
		return bd.list(board) ;
	}
	@Override
	public int getTotal(Board board) {
		return bd.getTotal(board);
	}
	@Override
	public int insert(Board board) {
		return bd.insert(board);
	}
	@Override
	public Board select(int b_num) {
		return bd.select(b_num);
	}
	@Override
	public void updateReadCount(int b_num) {
		bd.updateReadCount(b_num);
	}
	@Override
	public int maxNum() {
		return bd.maxNum();
	}
	public int update(Board board) {
		return bd.update(board);
	}
	@Override
	public int delete(int b_num) {
		return bd.delete(b_num);
	}
	@Override
	public void insertPhoto(List<FileUpload> fuPhotos) {
		bd.insertPhoto(fuPhotos);
	}
	@Override
	public List<FileUpload> listPhoto(int b_num) {
		return bd.listPhoto(b_num);
	}
	@Override
	public List<FileUpload> photoFromList(int b_num) {
		return bd.photoFromList(b_num);
	}
	@Override
	public void updateLikeCount(HashMap<String, Object> param) {
		bd.updateLikeCount(param);
	}
	
}
