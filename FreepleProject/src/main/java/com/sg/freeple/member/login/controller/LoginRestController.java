package com.sg.freeple.member.login.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sg.freeple.member.login.service.LoginRestService;
import com.sg.freeple.member.login.service.LoginService;
import com.sg.freeple.vo.FP_MemberVo;

@RestController
@RequestMapping("/member/login/*")
public class LoginRestController {

	@Autowired
	private LoginRestService loginRestService;
	
	@Autowired
	private LoginService loginService;
	
	//@이메일 찾기 기능
	@RequestMapping("findEmailInDB")
	public HashMap<String, Object> findEmailInDB(String mb_email) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("result", "success");
		map.put("data", loginRestService.isEmail(mb_email));
		return map;
	}
	
	//@이메일 인증번호 확인 기능
	@RequestMapping("authKeyCheck")
	public HashMap<String, Object> authKeyCheck(String auth_key) {
		HashMap<String, Object> map = new HashMap<String, Object>(); 
		map.put("result", "success");
		map.put("data", loginRestService.isEmailKey(auth_key));
		return map;
	}
	
	//@아이디,비밀번호 확인
	@RequestMapping("isExistIdAndPwCheck")
	public HashMap<String, Object> isExistIdAndPwCheck(String mb_id,String mb_pw) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("result", "success");
		map.put("idCheck", loginRestService.isExistId(mb_id));
		map.put("pwCheck", loginRestService.isExistPw(mb_pw));

		return map;
	}
	
	//@세션의 정보를 확인
	@RequestMapping("getUserNo")
	public HashMap<String, Object> getUserNo(HttpSession session){ // 로그인한 사용자의 번호.
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		FP_MemberVo fp_MemberVo = (FP_MemberVo)session.getAttribute("sessionUserInfo");
		
		if(fp_MemberVo == null) {
			map.put("result", "fail");
			map.put("reason", "로그인 하지않았습니다.");
		}else {
			map.put("result", "success");
			map.put("data", fp_MemberVo.getMb_no());
		}
		
		return map;
	}
	
	@RequestMapping("checking")
	public HashMap<String, Object> checking(int mb_no){
		HashMap<String, Object> map = new HashMap<String, Object>();
		int cleanUserChecking = loginService.mb_status(mb_no);
		//FP_ReportVo reportVo = loginRestService.reportReason(mb_no);
		
		String user="";
		
		if(cleanUserChecking>0) {
			user = "제재유저입니다";
		}
		if(cleanUserChecking==0) {
			user = "클린유저입니다";
		}
		map.put("user", user);
		//map.put("reportVo", reportVo);
		
		return map;
	}

	

	
}
