package com.sg.freeple.member.login.mapper;

public interface LoginRestSQLMapper {

	// 이메일이 있는지 조회하는 쿼리.
	public String getEmail(String mb_email);
	
	// 이메일 인증번호가 맞는지 확인하는 쿼리.
	public String getAuthKey(String auth_key);
	
	// 아이디가 맞는지 확인하는 쿼리.
	public String getId(String mb_id);
	
	// 패스워드가 맞는지 확인하는 쿼리.
	public int getPw(String mb_pw);

}
