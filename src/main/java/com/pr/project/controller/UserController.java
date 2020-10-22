package com.pr.project.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pr.project.model.LoginIp;
import com.pr.project.model.User;
import com.pr.project.service.LoginIpService;
import com.pr.project.service.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService us;
	@Autowired
	private LoginIpService ls;

	@RequestMapping("user/joinForm")
	public String joinForm() {
		return "user/joinForm";
	}

	@RequestMapping(value = "user/idChk", produces = "text/html;charset=utf-8") // text를 html로 바꿔주고 한글은 utf-8로 받기
	@ResponseBody // jsp 통하지 말고 바로 문자로 전달
	public String idChk(String user_id, Model model) { // user_id가지고 데이터베이스 이동하기
		String msg = "";
		User user = us.select(user_id);
		if (user == null)
			msg = "사용 가능한 ID 입니다.";
		else
			msg = "사용 중인 ID 입니다.";
		// model.addAttribute("message", msg);
		return msg;
	}

	@RequestMapping(value = "user/nickChk", produces = "text/html;charset=utf-8")
	@ResponseBody
	public String nickChk(String user_nickname, Model model) { // user_nickname가지고 데이터베이스 이동하기
		String msg1 = "";
		User user = us.select1(user_nickname);
		if (user == null)
			msg1 = "사용 가능한 닉네임 입니다.";
		else
			msg1 = "사용 중인 닉네임 입니다.";
		model.addAttribute("message1", msg1);
		return msg1;
	}

	@RequestMapping("user/join")
	public String join(User user, Model model, HttpServletRequest request, HttpSession session) throws IOException {
		int result = 0;

		User ui = us.select(user.getUser_id());
		User un = us.select1(user.getUser_nickname());
		if (ui == null && un == null) { // 둘 다 중복 아닌 경우
			user.setUser_ip(request.getLocalAddr()); // ip setting
			result = us.insert(user);
		} else if (ui != null && un != null) { // 중복된 아이디 및 닉네임
			result = -3;
		} else if (ui != null && un == null) { // 중복된 아이디
			result = -1;
		} else if (ui == null && un != null) { // 중복된 닉네임
			result = -2;
		}
		model.addAttribute("result", result);
		return "user/join";
	}

	@RequestMapping("user/loginForm")
	public String loginForm() {
		return "user/loginForm";
	}

	@RequestMapping("user/login")
	public String login(User user, LoginIp loginip, Model model, HttpServletRequest request, HttpSession session) {
		int result = 0;
		User ur = us.select(user.getUser_id());
		
		if (ur == null || ur.getUser_del().equals("y"))
			result = -1; // 없거나 탈퇴한 회원이다.
		else if (user.getUser_pwd().equals(ur.getUser_pwd())) {
			result = 1; // 로그인 성공
			loginip.setI_id(user.getUser_id());
			loginip.setI_ip(request.getLocalAddr()); // ip setting
			ls.insert_ip(loginip);
			session.setAttribute("user_id", user.getUser_id()); // 로그인 상태 유지
			String a = (String) session.getAttribute("user_id");
			System.out.println("login: session user id : "+a);
			
			
			//유정 추가
			session.setAttribute("user", ur);
			System.out.println(ur);
			System.out.println(ur.getUser_nickname()); // 닉네임 가져옴
			session.setAttribute("user_nickname", ur.getUser_nickname());
			session.setAttribute("user_regdate", ur.getUser_regdate());
		}
		model.addAttribute("result", result);
		return "user/login";
	}

	@RequestMapping("user/logout")
	public String logout(HttpSession session) {
		String a = (String) session.getAttribute("user_id");
		System.out.println("logout/invalidate before : session user id : "+a);
		System.out.println();
		session.invalidate();
		return "user/logout";
	}
}
