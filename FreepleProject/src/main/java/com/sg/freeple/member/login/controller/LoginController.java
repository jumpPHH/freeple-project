package com.sg.freeple.member.login.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sg.freeple.member.login.service.LoginService;
import com.sg.freeple.vo.FP_MemberVo;

@Controller
@RequestMapping("/member/login/*")
public class LoginController {

	@Autowired
	private LoginService loginService;
	
	//@로그인 페이지
	@RequestMapping("loginPage") // 로그인 페이지 이동
	public String loginPage() { 
		
		return "member/login/loginPage";
	}
	
	@RequestMapping("loginProcess")
	public String loginProcess(FP_MemberVo memberVo, HttpSession session,Model model) {
		FP_MemberVo sessionUserInfo = loginService.loginProcess(memberVo);
		
		if(sessionUserInfo == null) {
			return "member/login/loginFailPage";
		}else {
			int mb_no = sessionUserInfo.getMb_no();
			int statusCount = loginService.mb_status(mb_no);
			if(statusCount > 0) {
				model.addAttribute("sessionUserInfo", sessionUserInfo);
				return "member/login/loginFailPage";
			}
			session.setAttribute("sessionUserInfo", sessionUserInfo);
			return "redirect:../../main/mainPage";
		}
	}
	
	//@로그아웃 기능 
	@RequestMapping("logoutProcess")// 로그아웃 -> 무조건 메인페이지로감
	public String logoutProcess(HttpSession session) {
		
		session.removeAttribute("sessionUserInfo");
		
		return "redirect:../../main/mainPage";
	}
	
	//@아이디 찾기 페이지 1 
	@RequestMapping("firstFindIdPage")
	public String firstFindIdPage() {
		
		return "member/login/firstFindIdPage";
	}
	
	//@아이디 찾기 페이지 2 (기능 : 이메일-> 인증번호 보내기)
	@RequestMapping("secondFindIdPage")
	public String secondFindIdPage(String mb_email) {
		
		//입력한 메일로 인증번호 발송
		loginService.findIdSendEmailKeyProcess(mb_email);
		
		return "member/login/secondFindIdPage";
	}
	
	//@아이디 찾기 페이지 3 (기능 : 인증 번호확인-> 아이디 찾아주기)
	@RequestMapping("lastFindIdPage")
	public String lastFindIdPage(FP_MemberVo fp_MemberVo,String auth_key, Model model) {

		//메일 인증번호 확인이 되고 난뒤 아이디 찾기 버튼을 눌렀을때 서비스 로직. 
		loginService.mailAuth(auth_key); 
		
		model.addAttribute("UserInfo", loginService.getUser(fp_MemberVo, auth_key));
		
		return "member/login/lastFindIdPage";
	}
	
	//@아이디 찾기 끝난 뒤 로그인 버튼 누를시 기존 정보 초기화
	@RequestMapping("closeUserProcess") // 로그인 페이지 이동
	public String closeUserProcess(int mb_no) {
			
		loginService.closeUserProcess(mb_no);
		
		return "member/login/loginPage";
	}
	
	//@비밀번호 찾기 페이지1
	@RequestMapping("firstFindPwPage") 
	public String firstFindPwPage() {
		
		return "member/login/firstFindPwPage";
	}
	
	//@비밀번호 찾기 페이지 2 (기능 : 이메일-> 메일 인증 링크 보냈다는 페이지)
	@RequestMapping("secondFindPwPage")
	public String secondFindPwPage(String mb_email) {
		
		//입력한 메일로 인증번호 발송
		loginService.findPwSendEmailKeyProcess(mb_email);
		
		return "member/login/secondFindPwPage";
	}
	
	//@비밀번호 찾기 - 이메일 인증 처리 -> 비밀번호 재설정 화면으로.
	@RequestMapping("mailAuthProcess")
	public String mailAuthProcess(FP_MemberVo fp_MemberVo,String auth_key, Model model) {
		
		//메일 인증번호 확인이 되고 난뒤 아이디 찾기 버튼을 눌렀을때 서비스 로직. 
		loginService.mailAuth(auth_key);
		
		model.addAttribute("maileKey", auth_key);	
		return "member/login/changePwPage";
	}
	
	//@비밀번호 찾기 3 - 비밀번호 재설정 기능 -> 성공화면 출력.
	@RequestMapping("changePwCompletProcess")
	public String changePwCompletProcess(FP_MemberVo fp_MemberVo, String auth_key, Model model) {
		
		//사용자가 입력한 비밀번호 재설정  
		loginService.ChangeUserPwProcess(fp_MemberVo,auth_key);
		
		model.addAttribute("UserInfo", loginService.getUser(fp_MemberVo, auth_key));
		
		return "member/login/changePwCompletPage";
	}
	
}


