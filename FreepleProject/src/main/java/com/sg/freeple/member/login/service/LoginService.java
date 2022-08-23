package com.sg.freeple.member.login.service;

import java.util.UUID;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.sg.freeple.member.login.mapper.LoginSQLMapper;
import com.sg.freeple.vo.FP_MailAuthVo;
import com.sg.freeple.vo.FP_MemberVo;

@Service
public class LoginService {

	@Autowired
	private LoginSQLMapper loginSQLMapper;
	
	@Autowired
	private JavaMailSender javaMailSender;

	//로그인 할때 ID,PW를 확인 하는 서비스 로직.
	public FP_MemberVo loginProcess(FP_MemberVo fp_MemberVo) {
		
		return loginSQLMapper.selectByIdAndPw(fp_MemberVo);
	}
	
	//아이디 찾기를 할때 이메일에 인증번호를 발송 하는 로직.
	public void findIdSendEmailKeyProcess(String mb_email) {
			
		//이메일을 입력한 유저의 멤버 넘버를 찾는 쿼리.
		int memberFK = loginSQLMapper.selectEmailMemberFK(mb_email);
		
		try {
			MimeMessage mimeMessage = javaMailSender.createMimeMessage();
			MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage,true,"UTF-8");
			
			mimeMessageHelper.setSubject("[Freeple] - 아이디 찾기 인증번호 발송");
			
			String uuid = UUID.randomUUID().toString();
			String text = "";
			text += "<h1>[Freeple] 메일 인증 번호</h1><br>";
			text += "인증 번호 : " + uuid + "<br>"; 
			text += "인증번호를 입력해주세요.<br> Freeple을 이용해주셔서 감사합니다.";

			mimeMessageHelper.setText(text , true);
			
			mimeMessageHelper.setFrom("Admin", "Freeple 관리자 (박한희)");
			mimeMessageHelper.setTo(mb_email);
					
			new MailSenderThread(javaMailSender, mimeMessage).start();
			
			FP_MailAuthVo fp_MailAuthVo = new FP_MailAuthVo();
			fp_MailAuthVo.setMb_no(memberFK);
			fp_MailAuthVo.setAuth_key(uuid);
			loginSQLMapper.insertMailAuth(fp_MailAuthVo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//비밀번호 찾기를 할때 이메일에 인증링크를 발송 하는 로직.
	public void findPwSendEmailKeyProcess(String mb_email) {
			
		//이메일을 입력한 유저의 멤버 넘버를 찾는 쿼리.
		int memberFK = loginSQLMapper.selectEmailMemberFK(mb_email);
		
		try {
			MimeMessage mimeMessage = javaMailSender.createMimeMessage();
			MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage,true,"UTF-8");
			
			mimeMessageHelper.setSubject("[Freeple] - 비밀번호 재설정 인증링크 발송");
			
			String uuid = UUID.randomUUID().toString();
			String text = "";
			text += "<h1>[Freeple] 메일 인증 링크</h1><br>";
			text += "아래 인증하기 링크를 클릭하셔서 비밀번호 재설정 해주세요.<br>";
			text += "<a href='http://localhost:8181/freeple/member/login/mailAuthProcess?auth_key="+uuid+"'>";
			text += "비밀번호 재설정";
			text += "</a>";

			mimeMessageHelper.setText(text , true);
			
			mimeMessageHelper.setFrom("Admin", "Freeple 관리자 (박한희)");
			mimeMessageHelper.setTo(mb_email);
					
			new MailSenderThread(javaMailSender, mimeMessage).start();
			
			FP_MailAuthVo fp_MailAuthVo = new FP_MailAuthVo();
			fp_MailAuthVo.setMb_no(memberFK);
			fp_MailAuthVo.setAuth_key(uuid);
			loginSQLMapper.insertMailAuth(fp_MailAuthVo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
		
		
	//메일 인증번호 확인이 되고 난뒤 아이디 찾기 버튼을 눌렀을때 서비스 로직.
	public void mailAuth(String auth_key ){
		
		//이메일 인증 완료 쿼리. (N->Y)
		loginSQLMapper.updateCompleteY(auth_key);
	
	}
	
	//인증 받은 키를 토대로 인증이 완료된 'Y' 인 유저의 아이디를 찾아주는 로직. 
	public FP_MemberVo getUser(FP_MemberVo fp_MemberVo,String auth_key) {
		
		//메일 인증 번호를 입력한 유저의 멤버 넘버를 찾는 쿼리.
		int memberFK =loginSQLMapper.selectAuthKeyMemberFK(auth_key);
		fp_MemberVo.setMb_no(memberFK);
		
		return loginSQLMapper.selectFindUser(fp_MemberVo);
	}
	
	//유저가 한번만 찾고 안잊는다는 법은 없기때문에 초기화 해준다.
	public void closeUserProcess(int mb_no) {
		
		loginSQLMapper.deleteFindUser(mb_no);
	}
	
	//비밀번호 재설정 로직.
	public void ChangeUserPwProcess(FP_MemberVo fp_MemberVo,String auth_key) {
		
		//기존에 인증링크를 통해 받은 멤버의 넘버를 찾아 멤버에 세팅 해줘야됨. 
		int mb_no = loginSQLMapper.selectAuthKeyMemberFK(auth_key);
		fp_MemberVo.setMb_no(mb_no);
		
		//그 녀석의 비밀번호를 바꿔줘야됨. 
		loginSQLMapper.updateChangeUserPw(fp_MemberVo);
	}

	public int mb_status(int mb_no) {
		return loginSQLMapper.selectStatus(mb_no);
	}
	
	
	class MailSenderThread extends Thread{
		
		private JavaMailSender javaMailSender;
		private MimeMessage mimeMessage;
		
		public MailSenderThread(JavaMailSender javaMailSender, MimeMessage mimeMessage) {
			this.javaMailSender = javaMailSender;
			this.mimeMessage = mimeMessage;
		} 

		public void run(){
			javaMailSender.send(mimeMessage);
		}
	
	}
	
}
