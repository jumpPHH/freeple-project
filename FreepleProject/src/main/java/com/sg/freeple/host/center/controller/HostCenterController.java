package com.sg.freeple.host.center.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sg.freeple.vo.FP_MemberVo;

@Controller
@RequestMapping("/host/center/*")
public class HostCenterController {

	@RequestMapping("hostCenterPage")
	public String hostCenterPage(HttpSession session, Model model) {
		
		FP_MemberVo sessionUserInfo = (FP_MemberVo)session.getAttribute("sessionUserInfo");
		   
		model.addAttribute("sessionUserInfo",sessionUserInfo);
		
		return "/host/center/hostCenterPage";	
	}
	
	
}
