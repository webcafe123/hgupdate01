package com.pr.project.dao;

import java.util.HashMap;
import java.util.List;
import com.pr.project.model.Board;
import com.pr.project.model.FileUpload;

public interface BoardDao {

	List<Board> list(Board board);
	int getTotal(Board board);
	int maxNum();
	int insert(Board board);
	void insertPhoto(List<FileUpload> fuPhotos);
	void updateReadCount(int b_num);
	Board select(int b_num);
	int update(Board board);
	int delete(int b_num);
	List<FileUpload> listPhoto(int b_num);
	List<FileUpload> photoFromList(int b_num);
	void updateLikeCount(HashMap<String, Object> param);
}
