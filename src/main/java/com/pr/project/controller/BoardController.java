package com.pr.project.controller;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.pr.project.model.Board;
import com.pr.project.model.Cate;
import com.pr.project.model.FileUpload;
import com.pr.project.service.BoardService;
import com.pr.project.service.CateService;
import com.pr.project.service.PagingBean;

@Controller
public class BoardController {
   
   @Autowired
   private BoardService bs;
   @Autowired
   private CateService cs;
   
   @RequestMapping("board/list")
   public String list(Board board, String pageNum, Model model) {
      
      int rowPerPage = 10;
      if(pageNum == null || pageNum.equals("")) //페이지가 지정되지 않으면 1페이지를 보여줘라
         pageNum="1";
      int currentPage = Integer.parseInt(pageNum);
      int total = bs.getTotal(board);
      int startRow = (currentPage - 1)*rowPerPage + 1;
      int endRow = startRow + rowPerPage - 1;
      int no = total - startRow + 1; 			// 페이지별 시작번호
      board.setStartRow(startRow);
      board.setEndRow(endRow);
      
      List<Board> list = bs.list(board);
      
      PagingBean pb = new PagingBean(currentPage, rowPerPage, total);
      
      String[] tit = {"작성자", "제목", "내용", "제목+내용"};
      model.addAttribute("tit",tit);
      model.addAttribute("list",list);
      model.addAttribute("board",board);
      model.addAttribute("pb", pb);
      model.addAttribute("no", no);
      
      Cate cate = cs.select(board.getB_c_num());
      model.addAttribute("cate",cate);
      
      return "/board/list";
   }
   @RequestMapping("board/listWithPhoto")
   public String listWithPhoto(Board board, String pageNum, Model model, 
		   HttpSession session) {

	  bs.updateReadCount(board.getB_num());
 	   
      int rowPerPage = 12;
      if(pageNum == null || pageNum.equals("")) //페이지가 지정되지 않으면 1페이지를 보여줘라
         pageNum="1";
      int currentPage = Integer.parseInt(pageNum);
      int total = bs.getTotal(board);
      int startRow = (currentPage - 1)*rowPerPage + 1;
      int endRow = startRow + rowPerPage - 1;
      int no = total - startRow + 1; 			// 페이지별 시작번호
      board.setStartRow(startRow);
      board.setEndRow(endRow);
      
      List<Board> list = bs.list(board);
      Board bd = bs.select(board.getB_num());
      List<FileUpload> photolist = bs.photoFromList(board.getB_num());
      
      PagingBean pb = new PagingBean(currentPage, rowPerPage, total);
      
      String[] tit = {"작성자", "제목", "내용", "제목+내용"};
      model.addAttribute("bd", bd);
      model.addAttribute("tit",tit);
      model.addAttribute("list",list);
      model.addAttribute("board",board);
      model.addAttribute("pb", pb);
      model.addAttribute("no", no);
      model.addAttribute("photolist", photolist);      
      
      Cate cate = cs.select(board.getB_c_num());
      model.addAttribute("cate",cate);	   
      
	  return "/board/listWithPhoto";
   }	   
   @RequestMapping("board/insertBoardForm")
   public String insertBoardForm(Board board, Model model) {
     
	   Cate cate = cs.select(board.getB_c_num());
	   model.addAttribute("cate",cate);
	   List<Cate> list = cs.list();
	   model.addAttribute("list", list);
     
	   model.addAttribute("board", board); 
	   //System.out.println("cate c num = " + board.getB_c_num());
	   return "/board/insertBoardForm";
   }
   @RequestMapping("board/insertBoard")
   public String insertBoard(Board board, String pageNum, Model model,
         HttpServletRequest request, HttpSession session,  
         MultipartHttpServletRequest mhsr) throws IOException {

      board.setB_num(bs.maxNum());
      board.setB_ip(request.getLocalAddr()); // ip setting      
      int result = bs.insert(board);
      
      String real = session.getServletContext().getRealPath("/upload");
      List<MultipartFile> list = mhsr.getFiles("file");
      //System.out.println("photo size="+list.size());

      List<FileUpload> fuPhotos = new ArrayList<>();
      for (MultipartFile mf : list) {
         FileUpload fu = new FileUpload();
         String filename = mf.getOriginalFilename();
         
         if (filename != null && !filename.equals("")) {
        	 fu.setF_filename(filename);
	         fu.setF_b_num(board.getB_num());
	         //System.out.println("b_num="+fu.getF_b_num());
	         //fuPhotos 안에 그림 여러장 들어 있음
	         fuPhotos.add(fu);
	         FileOutputStream fos = new FileOutputStream(
	            new File(real+"/"+filename));
	         fos.write(mf.getBytes());
	         fos.close();
         	}
         	if (fuPhotos.size() !=0 )
         		bs.insertPhoto(fuPhotos);
            //model.addAttribute("result", result);	
         }
      	model.addAttribute("pageNum", pageNum);
      	model.addAttribute("result", result);       
      
      	Cate cate = cs.select(board.getB_c_num());
      	model.addAttribute("cate",cate);
   
       return "board/insertBoard";
   }   
   @RequestMapping("board/boardView")
	public String view(int b_num, String pageNum, Model model) {
		
		bs.updateReadCount(b_num);
				
		Board board = bs.select(b_num);
		List<FileUpload> list = bs.listPhoto(b_num);
		
		model.addAttribute("board",board);
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("list",list);
		
		Cate cate = cs.select(board.getB_c_num());
		model.addAttribute("cate",cate);
		
		return "/board/boardView";
	}
	
	@RequestMapping("board/updateBoardForm")
	public String updateForm(int b_num,String pageNum, Model model) {
		
		Cate cate = cs.select(b_num);
		model.addAttribute("cate",cate);
		List<Cate> list = cs.list();
		model.addAttribute("list", list);
		
		Board board = bs.select(b_num);
		model.addAttribute("board",board);
		model.addAttribute("pageNum",pageNum);
      
		return "/board/updateBoardForm";
	}
   @RequestMapping("board/updateBoard")
   public String updateBoard(Board board,String pageNum, Model model) {
      
      int result = bs.update(board);
      
      model.addAttribute("result", result);
      model.addAttribute("board", board);
      model.addAttribute("pageNum", pageNum);
      
      Cate cate = cs.select(board.getB_c_num());
      model.addAttribute("cate",cate);
      
      return "/board/updateBoard";
   }

//	@RequestMapping("board/updateBoard")
//	public String updateBoard(Board board,String pageNum, Model model,
//	         HttpServletRequest request, HttpSession session,  
//	         MultipartHttpServletRequest mhsr) throws IOException {
//	
//		board.setB_num(bs.maxNum());
//		board.setB_ip(request.getLocalAddr()); // ip setting   
//		int result = bs.update(board);
////		String real = session.getServletContext().getRealPath("/upload");
////		List<MultipartFile> list = mhsr.getFiles("file");
////		
////		List<FileUpload> fuPhotos = new ArrayList<>();
////		for (MultipartFile mf : list) {
////			FileUpload fu = new FileUpload();
////			String filename = mf.getOriginalFilename();
////         
////			if (filename != null && !filename.equals("")) {
////				fu.setF_filename(filename);
////				fu.setF_b_num(board.getB_num());
////				//fuPhotos 안에 그림 여러장 들어 있음
////				fuPhotos.add(fu);
////				FileOutputStream fos = new FileOutputStream(
////						new File(real+"/"+filename));
////				fos.write(mf.getBytes());
////				fos.close();
////         		}
////         	if (fuPhotos.size() !=0 )
////         		bs.insertPhoto(fuPhotos);
////         }
//		model.addAttribute("result", result);
//		model.addAttribute("board", board);
//		model.addAttribute("pageNum", pageNum);
//		Cate cate = cs.select(board.getB_c_num());
//		model.addAttribute("cate",cate);
//		return "board/updateBoard";
//	}
	
	/*
	 * @RequestMapping("board/deleteFreeBoardForm")
	 * public String deleteForm(int b_num, String pageNum, Model model) {
	 * 
	 * Board board = bs.select(b_num);
	 * model.addAttribute("board", board);
	 * model.addAttribute("pageNum", pageNum);
	 * 
	 * return "board/deleteFreeBoardForm"; }
	 */
	
	
	  @RequestMapping("board/deleteBoard")
	  public String deleteBoard(int b_num, String pageNum, Model model) {
	  
	  Board board = bs.select(b_num);  
	  int result = bs.delete(b_num);
	  
	  model.addAttribute("board", board);
	  model.addAttribute("pageNum",pageNum);	  
	  model.addAttribute("result", result);
	  
	  Cate cate = cs.select(board.getB_c_num());
	  model.addAttribute("cate",cate);
	  
	  return "board/deleteBoard";
	  
	  }
   
//      /*
//       * @RequestMapping("cate/boardList") public String boardList(int c_num, Model
//       * model) { //System.out.println("c_num="+c_num); List<Board> list =
//       * bs.list(c_num); System.out.println("cate="); model.addAttribute("list",
//       * list); return "cate/boardList"; }
//       */

	  @RequestMapping(value="board/updateLikeCount.html", method=RequestMethod.POST)
	     public String updateLikeCount(HttpServletResponse response
	           , @RequestParam("b_num") String b_num
	           , @RequestParam("b_like_cnt") String b_like_cnt ) {
	        System.out.println(b_num);
	        System.out.println(b_like_cnt);
	        
	        HashMap<String , Object> param = new HashMap<String, Object>();
	        
	        param.put("b_num", b_num);
	        param.put("b_like_cnt", b_like_cnt);
	        
	        bs.updateLikeCount(param);
	        
	        
	        return b_like_cnt;
	     }
    
   
   
} 













