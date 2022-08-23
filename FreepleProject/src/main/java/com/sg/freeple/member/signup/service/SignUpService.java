package com.sg.freeple.member.signup.service;

import java.util.UUID;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.sg.freeple.member.signup.mapper.SignUpSQLMapper;
import com.sg.freeple.vo.FP_MailAuthVo;
import com.sg.freeple.vo.FP_MemberVo;

@Service
public class SignUpService {

	@Autowired
	private SignUpSQLMapper signUpSQLMapper;
	
	@Autowired
	private JavaMailSender javaMailSender;
	
	//회원가입 로직 처리 
	public void signupRegister(FP_MemberVo fp_MemberVo) {
		
		//회원가입 하면서 멤버의 넘버를 생성
		int memberPK = signUpSQLMapper.createMemberPK();
		//생성된 멤버 넘버 PK 세팅.
		fp_MemberVo.setMb_no(memberPK);

		//세팅된 멤버 넘버로 회원가입.
		signUpSQLMapper.insertMember(fp_MemberVo);
		
		try {
			
			MimeMessage mimeMessage = javaMailSender.createMimeMessage();
			MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage,true,"UTF-8");
			
			mimeMessageHelper.setSubject("[Freeple] - 프립 홈페이지 회원가입을 축하드립니다.");
			
			String uuid = UUID.randomUUID().toString();
			String text = "";
			text += "<h1>[Freeple]회원가입을 진심으로 축하드립니다.</h1><br>";
			text += "아래 인증하기 링크를 클릭하셔서 인증 후 사이트 이용이 가능합니다. <br>";
			text += "<a href='http://localhost:8181/freeple/member/signup/signupEmailAuthProcess?auth_key="+uuid+"'>";
			text += "이메일 인증하기";
			text += "</a>";

			mimeMessageHelper.setText(text , true);
			
			mimeMessageHelper.setFrom("Admin", "Freeple 관리자 (박한희)");
			mimeMessageHelper.setTo(fp_MemberVo.getMb_email());
					
			new MailSenderThread(javaMailSender, mimeMessage).start();
			
			FP_MailAuthVo fp_MailAuthVo = new FP_MailAuthVo();
			fp_MailAuthVo.setMb_no(memberPK);
			fp_MailAuthVo.setAuth_key(uuid);
			signUpSQLMapper.insertMailAuth(fp_MailAuthVo);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

   //메일 인증번호 확인이 되고 난뒤 아이디 찾기 버튼을 눌렀을때 서비스 로직.
   public void mailAuth(String auth_key){
	
	   //이메일 인증 완료 쿼리. (X->O)
	   signUpSQLMapper.updateCompleteO(auth_key);
	} 
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
