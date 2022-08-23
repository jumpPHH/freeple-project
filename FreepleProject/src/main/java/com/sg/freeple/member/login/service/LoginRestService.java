package com.sg.freeple.member.login.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sg.freeple.member.login.mapper.LoginRestSQLMapper;

@Service
public class LoginRestService {
	
	@Autowired
	private LoginRestSQLMapper loginRestSQLMapper;

	//아이디 찾기 화면에서 이메일을 확인 하는 서비스 로직.
	public boolean isEmail(String mb_email) {
		String getEmail = loginRestSQLMapper.getEmail(mb_email);
		if(getEmail == null) {
			return false;
		}else {
			return true;
		}
	}
	
	//이메일 인증번호가 맞는지 확인 하는 서비스 로직.
	public boolean isEmailKey(String auth_key) {	
		String getAuthKey = loginRestSQLMapper.getAuthKey(auth_key);
		if(getAuthKey == null) {
			return false;
		}else {
			return true;
		}
	}
	
	//아이디가 맞는지 체크하는 서비스 로직
	public boolean isExistId(String mb_id) {	
		String getId = loginRestSQLMapper.getId(mb_id);

		if(getId == null) {
			return false;
		}else {
			return true;
		}
	}
	
	//패스워드가 맞는지 체크하는 서비스 로직
	public boolean isExistPw(String mb_pw) {	
		int getPw = loginRestSQLMapper.getPw(mb_pw);

		if(getPw == 0) {
			return false;
		}else {
			return true;
		}
	}
	
	
}
