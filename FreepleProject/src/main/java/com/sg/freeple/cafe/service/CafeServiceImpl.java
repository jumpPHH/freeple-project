package com.sg.freeple.cafe.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sg.freeple.cafe.mapper.CafeSQLMapper;
import com.sg.freeple.vo.FP_CafeMemberVo;
import com.sg.freeple.vo.FP_CafeVo;
import com.sg.freeple.vo.FP_MemberVo;
import com.sg.freeple.vo.FP_RequestToJoinVo;

@Service
public class CafeServiceImpl {
	
	@Autowired
	private CafeSQLMapper cafeSQLMapper;
	

	//카페 만들기
	public void toCreateCafe(FP_CafeVo cafeVo) {
		int cafePK = cafeSQLMapper.createCafePK();
		cafeVo.setCafe_no(cafePK);
		cafeSQLMapper.createCafe(cafeVo);
	}
	//카페 만들고 매니저, 회원테이블에 넣기
	public void addCafeMemberTable(FP_CafeMemberVo cafeMemberVo) {
		int cafeMemberPK=cafeSQLMapper.createCafeMemberPK();
		cafeMemberVo.setCafeMember_no(cafeMemberPK);
		cafeSQLMapper.insertCafeMember(cafeMemberVo);
	}
	
	public ArrayList<HashMap<String, Object>> getCafeList(){//카페목록
		
		ArrayList<HashMap<String, Object>> dataList = new ArrayList<HashMap<String,Object>>();
		ArrayList<FP_CafeVo> cafeList= cafeSQLMapper.allCafeList();
		
		for(FP_CafeVo cafeVo : cafeList) {
			
			FP_CafeVo cafeVo2 = new FP_CafeVo();
			 int countCurrentMember = cafeSQLMapper.countCafeMember(cafeVo.getCafe_no());
			 cafeVo2.setCafeMember_limit(countCurrentMember);
			 
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			map.put("cafeVo", cafeVo);
			map.put("CurrentMember", cafeVo2);
			
			dataList.add(map);
		}
		return dataList;
	}
	
	//카페 가입 요청
	public void RequestToJoinMember(FP_RequestToJoinVo requestToJointVo) {
		cafeSQLMapper.insertRequestToJoin(requestToJointVo);
	}
	
	public ArrayList<HashMap<String, Object>> getRequestTojoinList(int cafeNo){
		
		ArrayList<HashMap<String, Object>> dataList = new ArrayList<HashMap<String,Object>>();
		ArrayList<FP_RequestToJoinVo> joinList = cafeSQLMapper.selectRequestToJoin(cafeNo);
		
		for(FP_RequestToJoinVo requestToJointVo : joinList) {
			
			int memberNo = requestToJointVo.getmb_no();
			FP_MemberVo memberVo = cafeSQLMapper.selectByMemberNo(memberNo);
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			map.put("memberVo", memberVo);
			map.put("requestToJointVo", requestToJointVo);
			dataList.add(map);
		}
		return dataList;
	}
	
	public void acceptDateUpdate(FP_CafeMemberVo cafeMemberVo) {
		cafeSQLMapper.updateAcceptDate(cafeMemberVo);
	}
	
	public FP_RequestToJoinVo selectRequestToJoin(int requestToJoin_no) {
		return cafeSQLMapper.selectRequestToJoinByNo(requestToJoin_no);
	}
	
	public int getRequestTojoinCount(int cafe_no) {
		return cafeSQLMapper.requestTojoinCount(cafe_no);
	}
		
	
	//이거,,  가입요청 하고나서 수락버튼누르면 이거 사용하게!!!! 처음 가입 아님@@
	public void registerCafeMember(FP_CafeMemberVo cafeMemberVo) {
		int cafeMemberPK = cafeSQLMapper.createCafeMemberPK();
		cafeMemberVo.setCafeMember_no(cafeMemberPK);
		cafeSQLMapper.insertCafeMember(cafeMemberVo);
	}
	
	//가입 중복확인
	public int cafeMemberRegisterCheck(FP_RequestToJoinVo requestToJoinVo) {
		return cafeSQLMapper.cafeMemberCount(requestToJoinVo);
	}

	public FP_CafeVo getCafeData(int cafeNo) {
		return cafeSQLMapper.selectCafeByNo(cafeNo);
	}
	
	public FP_CafeMemberVo getCafeMemberData(int cafeMemberNo) {
		return cafeSQLMapper.selectCafeMemberByNo(cafeMemberNo);
	}
	
	public FP_CafeMemberVo getCafeMemberDataByMemberNo(int cafe_no, int mb_no) {
		return cafeSQLMapper.selectCafeMemberByMemberNo(cafe_no, mb_no);
	}
	
	//가입한 카페회원 목록
	public ArrayList<HashMap<String, Object>> getCafeMemberList(int cafe_no){
		ArrayList<HashMap<String, Object>> dataList = new ArrayList<HashMap<String,Object>>();
		ArrayList<FP_CafeMemberVo> cafeMemberList = cafeSQLMapper.allCafeMemberList(cafe_no);
		
		for(FP_CafeMemberVo cafeMemberVo : cafeMemberList) {
			int MemberNo = cafeMemberVo.getMb_no();
			FP_MemberVo memberVo = cafeSQLMapper.selectByMemberNo(MemberNo);
			FP_CafeMemberVo cafeMemberVo2 = cafeSQLMapper.selectCafeMemberByMemberNo(cafe_no, MemberNo);
			cafeMemberVo2.setCafe_grade(cafeSQLMapper.countBoardByCafeMember(cafe_no, cafeMemberVo.getCafeMember_no()));
			FP_CafeMemberVo cafeMemberVo3 = cafeSQLMapper.selectCafeMemberByMemberNo(cafe_no, MemberNo);
			cafeMemberVo3.setCafe_grade(cafeSQLMapper.countCommnetByMember(cafe_no, cafeMemberVo.getCafeMember_no()));
			
			FP_RequestToJoinVo requestToJoinVo = new FP_RequestToJoinVo();
			requestToJoinVo.setCafe_no(cafe_no);
			requestToJoinVo.setmb_no(MemberNo);
			FP_RequestToJoinVo requestToJoinVo2 = cafeSQLMapper.selectAcceptDate(requestToJoinVo);
			

			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("cafeMemberVo", cafeMemberVo);
			map.put("memberVo", memberVo);
			map.put("requestToJoinVo", requestToJoinVo2);
			map.put("cafeMemberVo2", cafeMemberVo2);
			map.put("cafeMemberVo3", cafeMemberVo3);
			dataList.add(map);	
		}
		return dataList;
	}
	
	//가입한 현재카페 회원 수
	public int currentCafeMemberCount(int cafe_no) {
		return cafeSQLMapper.countCafeMember(cafe_no);
	}

	public int cafeMemberCount(int cafe_no) {
		return cafeSQLMapper.countCafeMember(cafe_no);
	}
	
	

}
