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
	public String joinForm(HttpSession session, Model model) {
		return "user/joinForm";
	}

	
	@RequestMapping(value = "user/idChk", produces = "text/html;charset=utf-8") // text를 html로 바꿔주고 한글은 utf-8로 받기
	@ResponseBody // jsp 통하지 말고 바로 문자로 전달
	public String idChk(String user_id, Model model) { // user_id가지고 데이터베이스 이동하기
		
		/* result = 0 이면 db에 있는 값이고 , 1이면 없는 값 */
		String result = "0";
		User user = us.select(user_id);			
		if (user == null)
			result = "1";
		return result;
	}
	

	@RequestMapping(value = "user/nickChk", produces = "text/html;charset=utf-8")
	@ResponseBody
	public String nickChk(String user_nickname, Model model) { // user_nickname가지고 데이터베이스 이동하기
		
		/* result = 0 이면 db에 있는 값이고 , 1이면 없는 값 */
		String result = "0";
		User user = us.select1(user_nickname);
		if (user == null)
			result = "1";
		return result;
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
		}
		model.addAttribute("result", result);
		return "user/login";
	}

	@RequestMapping("user/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "user/logout";
	}
}
