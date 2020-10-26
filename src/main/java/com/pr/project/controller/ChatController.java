package com.pr.project.controller;

import org.springframework.web.bind.annotation.RequestMapping;

public class ChatController {
	@RequestMapping("chat/chat")
	public String chat() {
		return "chat/chat";
	}

}
