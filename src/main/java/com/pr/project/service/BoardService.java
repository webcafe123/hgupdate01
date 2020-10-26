package com.pr.project.service;

import java.util.HashMap;
import java.util.List;
import com.pr.project.model.Board;
import com.pr.project.model.FileUpload;

public interface BoardService {

	List<Board> list(Board board);
	int getTotal(Board board);
	int insert(Board board);
	Board select(int b_num);		
	void updateReadCount(int b_num);
	int maxNum();
	int update(Board board);
	int delete(int b_num);
	void insertPhoto(List<FileUpload> fuPhotos);
	List<FileUpload> listPhoto(int b_num);
	List<FileUpload> photoFromList(int b_num);
	void updateLikeCount(HashMap<String, Object> param);
}
