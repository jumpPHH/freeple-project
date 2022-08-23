package com.sg.freeple.cafe.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.sg.freeple.vo.FP_CafeBoard_CategoryVo;
import com.sg.freeple.vo.FP_CafeMemberVo;
import com.sg.freeple.vo.FP_CafeVo;
import com.sg.freeple.vo.FP_MemberVo;
import com.sg.freeple.vo.FP_RequestToJoinVo;
import com.sg.freeple.vo.FP_WriteBoardVo;

public interface CafeSQLMapper {
	
	//카페멤버
	public int createCafeMemberPK();
	
	public void insertCafeMember(FP_CafeMemberVo cafeMemberVo);
	
	public FP_CafeMemberVo selectCafeMemberByNo(int no);
	
	public FP_CafeMemberVo selectCafeMemberByMemberNo(@Param("cafe_no")int cafe_no,@Param("mb_no") int mb_no);
	
	public ArrayList<FP_CafeMemberVo> allCafeMemberList(int cafe_no);
	
	public int countCafeMember(int no); //멤버 회원수
	
	//카페멤버 중복확인
	public int cafeMemberCount(FP_RequestToJoinVo requestToJoinVo);
	
	//카페 멤버 가입일 확인
	public FP_RequestToJoinVo selectAcceptDate(FP_RequestToJoinVo requestToJoinVo);
	
	//카페생성
	public int createCafePK();
	
	public void createCafe(FP_CafeVo cafeVo);
	
	public ArrayList<FP_CafeVo> allCafeList();
	
	public FP_CafeVo selectCafeByNo(int cafeNo);
	
	//가입요청
	public void insertRequestToJoin(FP_RequestToJoinVo requestToJointVo);
	
	public ArrayList<FP_RequestToJoinVo> selectRequestToJoin(int cafeNo);
	
	public void updateAcceptDate(FP_CafeMemberVo cafeMemberVo);
	
	public FP_RequestToJoinVo selectRequestToJoinByNo(int joinNo);
	
	public int requestTojoinCount(int cafeNo);
	
	//멤버NO로 정보찾기
	public FP_MemberVo selectByMemberNo(int memberNo);
	
	//멤버가 쓴 게시글 수 
	public int countBoardByCafeMember(@Param("cafe_no")int cafe_no,@Param("cafeMember_no") int cafeMember_no);
	
	//멤버가 쓴 댓글 수
	public int countCommnetByMember(@Param("cafe_no")int cafe_no,@Param("cafeMember_no") int cafeMember_no);
}










