package com.sg.freeple.manager.login.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sg.freeple.manager.login.service.ManagerRestService;
import com.sg.freeple.vo.FP_ManagerVo;

@RestController
@RequestMapping("/manager/login/*")
public class ManagerRestLoginController {
	
	@Autowired
	private ManagerRestService managerRestService;
	
	@RequestMapping("managerLoginProcess")
	public HashMap<String, Object> managerLoginProcess(HttpSession session, FP_ManagerVo managerVo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		FP_ManagerVo sessionManagerInfo = managerRestService.loginProcess(managerVo);
		if(sessionManagerInfo==null) {
			map.put("isManager", false);
		}else {
			session.setAttribute("sessionManagerInfo", sessionManagerInfo);
			map.put("isManager", true);
		}
		
		return map;
	}
}
