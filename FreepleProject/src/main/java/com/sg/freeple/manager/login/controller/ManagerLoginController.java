package com.sg.freeple.manager.login.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sg.freeple.manager.login.service.ManagerService;
import com.sg.freeple.vo.FP_ManagerVo;

@Controller
@RequestMapping("/manager/login/*")
public class ManagerLoginController {
	
	@Autowired
	private ManagerService managerService;
	
	//무조건 관리자페이지는 여기 로그인페이지부터 들어와서 로그인세션을 받아서 넘어감.
	//인터셉터 필수
	@RequestMapping("managerLoginPage")
	public String managerLoginPage(HttpSession session) {
		session.removeAttribute("sessionManagerInfo");

		return "manager/login/managerLoginPage";	
	}
	
//	@RequestMapping("managerLoginProcess")
//	public String managerLoginProcess(HttpSession session, FP_ManagerVo managerVo) {
//		FP_ManagerVo sessionManagerInfo = managerService.loginProcess(managerVo);
//		if(sessionManagerInfo==null) {
//			return "redirect:./managerLoginPage";
//		}else {
//			session.setAttribute("sessionManagerInfo", sessionManagerInfo);
//			return "redirect:../main/managerMainPage";
//		}
//	}
	

	@RequestMapping("managerLogoutProcess")
	public String managerLogoutProcess(HttpSession session) {
		session.removeAttribute("sessionManagerInfo");
		
		return "redirect:./managerLoginPage";
	}
	
}
