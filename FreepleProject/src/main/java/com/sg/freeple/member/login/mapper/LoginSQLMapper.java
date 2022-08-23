package com.sg.freeple.member.login.mapper;

import com.sg.freeple.vo.FP_MailAuthVo;
import com.sg.freeple.vo.FP_MemberVo;

public interface LoginSQLMapper {
	
	//ID,PW를 찾는 쿼리
	public FP_MemberVo selectByIdAndPw(FP_MemberVo memberVo);
	
	//입력한 이메일로 멤버 넘버를 찾는 쿼리. 
	public int selectEmailMemberFK(String mb_email);
	
	//메일 인증번호 버튼 누를시 등록되는 쿼리.  
	public void insertMailAuth(FP_MailAuthVo fp_MailAuthVo);
	
	//아이디 찾기 버튼을 누를시 업데이트되는 쿼리.
	public void updateCompleteY(String auth_key);
	
	//입력한 인증번호로 멤버 넘버를 찾는 쿼리. 
	public int selectAuthKeyMemberFK(String auth_key);
	
	//인증번호 업데이트가 끝나고 (N -> Y) 인증이 확인된것에서 유저의 정보를 찾아주는 쿼리.
	public FP_MemberVo selectFindUser(FP_MemberVo fp_MemberVo);
	
	//'Y'로 인증받은 것을 초기화 시키는 쿼리. (한번 찾는다는 보장은 없기 때문에)
	public void deleteFindUser(int mb_no);
	
	//비밀번호 재설정 쿼리.
	public void updateChangeUserPw(FP_MemberVo fp_MemberVo);
	
	public int selectStatus(int mb_no);
	
	//
	public FP_MemberVo selectByNo(int no);
	//
}
