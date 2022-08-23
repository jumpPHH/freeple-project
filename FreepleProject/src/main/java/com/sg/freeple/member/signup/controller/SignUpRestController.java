package com.sg.freeple.member.signup.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sg.freeple.member.signup.service.SignUpRestService;

@RestController
@RequestMapping("/member/signup/*")
public class SignUpRestController {
	
	@Autowired
	private SignUpRestService signUpRestService;
	
	//@아이디 중복 확인 기능
	@RequestMapping("isExistId")
	public HashMap<String, Object> isExistId(String mb_id) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("result", "success");
		map.put("data", signUpRestService.isExistId(mb_id));
		
		return map;
	}
	
	//@닉네임 중복 확인 기능
	@RequestMapping("isExistNick")
	public HashMap<String, Object> isExistNick(String mb_nick) {
		HashMap<String, Object> map = new HashMap<String, Object>();
	
		map.put("result", "success");
		map.put("data", signUpRestService.isExistNick(mb_nick));
		
		return map;
	}
	
	//@이메일 찾기 기능
	@RequestMapping("isExistEamil")
	public HashMap<String, Object> isExistEamil(String mb_email) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("result", "success");
		map.put("data", signUpRestService.isEmail(mb_email));
		return map;
	}
	

	
}
