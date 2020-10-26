package com.pr.project.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import com.pr.project.model.Message;
import com.pr.project.model.User;
import com.pr.project.service.MessageService;
import com.pr.project.service.MyPageService;
import com.pr.project.service.PagingBean_msg;
import com.pr.project.service.UserService;

@Controller
public class MyPageController {

	@Autowired private UserService us;
	 
	@Autowired
	private MyPageService mps;
	@Autowired
	private MessageService msgs;
	
	
	@RequestMapping("home_yj")
	public String home_yj( Model model,HttpSession session) throws IOException {
		
		//user_id = "pyj078";
		//user_nickname="유댕ㅎㅎ";
		//user_regdate = "2020.10.16."; //Date 로 바꿔줘야함 (위에도)
		
		//model.addAttribute("user_id", user_id);
		//model.addAttribute("user_nickname", user_nickname);
		//model.addAttribute("user_regdate",user_regdate);
		
		Object profile = session.getAttribute("profile");
		//String user_nickname = (String) session.getAttribute("user_nickname");
		//String user_regdate = (String)session.getAttribute("user_regdate");
		
		model.addAttribute("profile", profile);
		//model.addAttribute("user_nickname", user_nickname);
		//model.addAttribute("user_regdate", user_regdate);
		
		System.out.println("메인화면의 : " + profile);
		//System.out.println("session user_nickname" + user_nickname);
		//System.out.println("session user_regdate" + user_regdate);
		
		return "main";
	}
	
	@RequestMapping("myPageTab/memberLevelInfo")
	public String memberLevelInfo( Model model) {
		
		/*
		 * user_id = "pyj078"; user_nickname="유댕ㅎㅎ"; user_regdate = "2020.10.16.";
		 * //Date 로 바꿔줘야함 (위에도)
		 * 
		 * model.addAttribute("user_id", user_id); model.addAttribute("user_nickname",
		 * user_nickname); model.addAttribute("user_regdate",user_regdate);
		 */
		
		
		return "myPageTab/memberLevelInfo";
	}
	
	@RequestMapping("myPageTab/sendmessagePopup")
	public String sendmessagePopup( String m_receiver_nick, Model model, Message message, HttpSession session) {
		
		//user_id = "pyj078";
		
		//model.addAttribute("user_id", user_id);
		String user_id = (String)session.getAttribute("user_id");
		//user.setUser_id(user_id);
		message.setM_sender_id(user_id);
		System.out.println("m_sender_id" + message.getM_sender_id());
		
		
		String user_nickname= (String)session.getAttribute("user_nickname");
		message.setM_sender_nick(user_nickname);
		System.out.println("m_sender_nick" + message.getM_sender_nick());
		
		//user.setUser_nickname(user_nickname);
		//message.setM_receiver_id(m_receiver_id);
		
		return "myPageTab/sendmessagePopup";
	}
	
	@RequestMapping("myPageTab/msgSuccess")
	public String msgSuccess(Message message, Model model, HttpSession session) throws IOException{
		
		
		String user_id = (String)session.getAttribute("user_id");
		message.setM_sender_id(user_id);
		System.out.println("m_sender_id" + message.getM_sender_id());
		
		
		String user_nickname= (String)session.getAttribute("user_nickname");
		message.setM_sender_nick(user_nickname);
		System.out.println("m_sender_nick" + message.getM_sender_nick());
		
		
		int result = 0;
		result = msgs.insert(message);
		
		model.addAttribute("result",  result);
		model.addAttribute("message", message);
		return "myPageTab/msgSuccess";
	}
	
	@RequestMapping("myPageTab/userInfoUpdateForm")
	public String userInfoUpdateForm( Model model, HttpServletRequest req, HttpSession session)throws Exception {
		
		//User user = us.selectN(user_nickname);
		//model.addAttribute("user", user);
		
		//user_nickname="유댕ㅎㅎ";
		//model.addAttribute("user_nickname", user_nickname);
		
		String user_id = (String)session.getAttribute("user_id");
		model.addAttribute("user_id", user_id);
		
		return "myPageTab/userInfoUpdateForm";
	}
	
	@RequestMapping("myPageTab/updateSuccess")
	public String updateSuccess(User user, Model model, @RequestParam("inlineRadioOptions") String profile, HttpServletRequest req, HttpSession session) throws IOException{
		String user_id = (String)session.getAttribute("user_id");
		user.setUser_id(user_id);
		
		int result = us.updateN(user);
		
		model.addAttribute("result", result);
		model.addAttribute("user", user);
		model.addAttribute("profile", profile);
		
		//req.setAttribute("profile", profile);
		session.setAttribute("profile", profile);
	
		
		System.out.print(profile);
		System.out.println(user.getUser_nickname() ); // 바꾼걸로 나옴
		
		session.setAttribute("user_nickname", user.getUser_nickname());
		
		return "myPageTab/updateSuccess";
	}
	
	@RequestMapping(value="/myPageTab/nickNoChk", 
			produces="text/html;charset=utf-8")
	@ResponseBody
	public String nickNoChk(String user_nickname) {
		String msg = "";
		User user = us.selectN(user_nickname);
		if (user == null) msg="사용 가능";
		else if (user.getUser_nickname().equals(user_nickname)) msg = "사용 중이니 다른 닉네임을 사용하시오";
		//else msg="사용 가능";
		return msg;
	}
	
	
	

	
	@RequestMapping("myPageTab/my_receivedMail")
	public String my_receivedMail(String pageNum, Message message, Model model, HttpSession session) {
		
		int rowPerPage = 5;
		// 페이지가 지정되지 않으면 1페이지를 보여줘라
		if (pageNum==null || pageNum.equals(""))
			pageNum="1";
		int currentPage = Integer.parseInt(pageNum);
		int total = msgs.getTotal_r(message);  // 받은쪽지 토탈
		int startRow = (currentPage - 1)*rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		message.setStartRow(startRow);
		message.setEndRow(endRow);
		
		//System.out.println("starRow= "+startRow);
		//System.out.println("endRow="+endRow);
		
		PagingBean_msg pbm = new PagingBean_msg(currentPage,rowPerPage,total); //보낸쪽지 
		
		//List<Message> sendlist = msgs.sendlist(message); //보낸쪽지 리스트
		
		
		String user_id = (String)session.getAttribute("user_id");
		message.setM_receiver_id(user_id);
		System.out.println("받은메일에서 m_receiver_id :" + message.getM_receiver_id());
		
		
		String user_nickname= (String)session.getAttribute("user_nickname");
		message.setM_receiver_nick(user_nickname);
		System.out.println("받은메일에서 m_receiver_nick" + message.getM_receiver_nick());
		
		
		
		 List<Message> reclist = msgs.reclist(message); //받은쪽지 리스트
		
		 
		
		//model.addAttribute("sendlist", sendlist);
		 model.addAttribute("reclist", reclist);
		
		model.addAttribute("pbm", pbm); //보낸쪽지
		
		//System.out.println("starRow= "+startRow);
		//System.out.println("endRow="+endRow);
		
		return "myPageTab/my_receivedMail";
	}
	
	@RequestMapping("myPageTab/sendMail")
	public String sendMail(String pageNum, Message message, Model model, HttpSession session) {
		
		int rowPerPage = 5;
		// 페이지가 지정되지 않으면 1페이지를 보여줘라
		if (pageNum==null || pageNum.equals(""))
			pageNum="1";
		int currentPage = Integer.parseInt(pageNum);
		int total = msgs.getTotal(message);  // 보낸쪽지 토탈
		int startRow = (currentPage - 1)*rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		message.setStartRow(startRow);
		message.setEndRow(endRow);
		
		//System.out.println("starRow= "+startRow);
		//System.out.println("endRow="+endRow);
		
		PagingBean_msg pbm = new PagingBean_msg(currentPage,rowPerPage,total); //보낸쪽지 
		
		
		
		String user_id = (String)session.getAttribute("user_id");
		message.setM_sender_id(user_id);
		System.out.println("보낸메일에서 m_sender_id" + message.getM_sender_id());
		
		
		String user_nickname= (String)session.getAttribute("user_nickname");
		message.setM_sender_nick(user_nickname);
		System.out.println("보낸메일에서 m_sender_nick" + message.getM_sender_nick());
		
		
		List<Message> sendlist = msgs.sendlist(message); //보낸쪽지 리스트
		
		// List<Message> reclist = msgs.reclist(message); //받은쪽지 리스트
		
		
		model.addAttribute("sendlist", sendlist);
		// model.addAttribute("reclist", reclist);
		
		model.addAttribute("pbm", pbm); //보낸쪽지
		
		return "myPageTab/sendMail";
	}
	

	// 보낸메일삭제
	@RequestMapping("/rDelete")
	public String rDelete (Message message) {
		System.out.println("delete 불러옴");
		msgs.delete(message.getM_num());
		return "redirect:/myPageTab/sendMail";
	}
	
	//받은메일삭제
	@RequestMapping("/rDelete2")
	public String rDelete2 (Message message) {
		System.out.println("delete 불러옴");
		msgs.delete2(message.getM_num());
		return "redirect:/myPageTab/my_receivedMail";
	}
}
