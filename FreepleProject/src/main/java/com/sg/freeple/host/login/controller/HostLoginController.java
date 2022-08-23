package com.sg.freeple.host.login.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sg.freeple.member.login.service.LoginService;
import com.sg.freeple.vo.FP_MemberVo;

@Controller
@RequestMapping("/host/login/*")
public class HostLoginController {
	
	@Autowired
	private LoginService loginService;
	
	@RequestMapping("hostLoginPage")
	public String hostLoginPage() {
		
		return "/host/login/hostLoginPage";
	}
	
	//@로그아웃 기능 
	@RequestMapping("logoutProcess")// 로그아웃 -> 무조건 메인페이지로감
	public String logoutProcess(HttpSession session) {
		
		session.removeAttribute("sessionUserInfo");
		
		return "redirect:../../host/main/hostMainPage";
	}
	
	@RequestMapping("loginProcess")
	public String loginProcess(FP_MemberVo memberVo, Model model, HttpSession session) {
		FP_MemberVo sessionUserInfo = loginService.loginProcess(memberVo);
		
		if(sessionUserInfo == null) {
			
			return "host/login/hostLoginFailPage";
		}else {
			
			session.setAttribute("sessionUserInfo", sessionUserInfo);

			return "redirect:../../host/main/hostMainPage";
		}
		
	}
	
	
}
