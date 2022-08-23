package com.sg.freeple.member.signup.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sg.freeple.member.signup.mapper.SignUpRestSQLMapper;

@Service
public class SignUpRestService {

	@Autowired
	private SignUpRestSQLMapper signUpRestSQLMapper;
	
	//아이디 찾기 화면에서 이메일을 확인 하는 서비스 로직.
	public boolean isEmail(String mb_email) {
		String getEmail = signUpRestSQLMapper.getEmail(mb_email);
		if(getEmail == null) {
			return false;
		}else {
			return true;
		}
	}
	
	//아이디 중복처리 확인 하는 로직.
	public boolean isExistId(String mb_id) {
		int id_Count = signUpRestSQLMapper.selectCountById(mb_id);
		if(id_Count > 0) {			
			return true;
		}else {
			return false;	
		}
	}
	
	//닉네임 중복처리 확인 하는 로직.
	public boolean isExistNick(String mb_nick) {
		int nick_Count = signUpRestSQLMapper.selectCountByNick(mb_nick);
		if(nick_Count > 0) {			
			return true; 
		}else {
			return false;	
		}
	}
	
}
