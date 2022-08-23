package com.sg.freeple.member.signup.mapper;

import com.sg.freeple.vo.FP_MailAuthVo;
import com.sg.freeple.vo.FP_MemberVo;

public interface SignUpSQLMapper {

	//회원가입 할때 쓰이는 등록 쿼리
	public void insertMember(FP_MemberVo fp_MemberVo);
	
	//회원가입 할때 멤버의 넘버 PK를 생성.
	public int createMemberPK();

	//가입 버튼 누를시 등록되는 쿼리.  
	public void insertMailAuth(FP_MailAuthVo fp_MailAuthVo);
	
	//이메일에서 링크 버튼을 누를시 업데이트되는 쿼리.
	public void updateCompleteO(String auth_key);

}
