package com.sg.freeple.host.main.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sg.freeple.host.profile.service.HostProfileService;
import com.sg.freeple.vo.FP_MemberVo;

@Controller 
@RequestMapping("/host/main/*")
public class HostMainController {
	
	@Autowired
	HostProfileService hostProfileService;
	
	@RequestMapping("hostMainPage")
	public String hostMainPage(HttpSession session, Model model) {
			
		FP_MemberVo sessionUserInfo = (FP_MemberVo)session.getAttribute("sessionUserInfo");
		
		model.addAttribute("sessionUserInfo", sessionUserInfo);
		
		return "/host/main/hostMainPage";	
	}

}
