package com.sg.freeple.member.signup.mapper;

public interface SignUpRestSQLMapper {

	//아이디 중복 체크
	public int selectCountById(String mb_id);
	
	//닉네임 중복 체크
	public int selectCountByNick(String mb_nick);
	
	// 이메일 중복 체크
	public String getEmail(String mb_email);
	
}
