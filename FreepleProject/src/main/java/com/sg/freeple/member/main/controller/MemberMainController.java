package com.sg.freeple.member.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member/main/*")
public class MemberMainController {
	
	@RequestMapping("mainPage")//메인페이지로 이동
	public String mainPage() {

		return "member/main/mainPage";
	}
}
