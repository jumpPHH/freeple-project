package com.sg.freeple.manager.main.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sg.freeple.manager.login.service.ManagerService;

@Controller
@RequestMapping("/manager/main/*")
public class ManagerMainController {
	
	@Autowired
	private ManagerService managerService;
	
	@RequestMapping("managerMainPage")
	public String managerMainPage() {
		return "manager/main/managerMainPage";
	}
	
	
	
}
