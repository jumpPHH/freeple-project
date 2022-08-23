package com.sg.freeple.cafe.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sg.freeple.cafe.board.service.CafeBoardServiceImpl;
import com.sg.freeple.cafe.service.CafeServiceImpl;
import com.sg.freeple.vo.FP_CafeMemberVo;
import com.sg.freeple.vo.FP_CafeVo;
import com.sg.freeple.vo.FP_MemberVo;
import com.sg.freeple.vo.FP_RequestToJoinVo;

@RestController
@RequestMapping("/cafe/*")
public class RestCafeController {

	@Autowired
	private CafeServiceImpl cafeService;
	@Autowired
	private CafeBoardServiceImpl cafeBoardService;
	
	@RequestMapping("getUserNo") //로그인한 사용자의 번호
	public HashMap<String, Object> getUserNo(HttpSession session, int cafe_no){
		HashMap<String, Object> map = new HashMap<String, Object>();
		
	FP_MemberVo memberVO = (FP_MemberVo) session.getAttribute("sessionUserInfo");
	FP_CafeMemberVo cafeMemberVo = cafeService.getCafeMemberDataByMemberNo(cafe_no, memberVO.getMb_no());
		
		if(cafeMemberVo == null) {
			map.put("result", "fail");
			map.put("reason", "가입 하지 않음");
		}else {
			map.put("result", "success");
			map.put("data", cafeMemberVo.getMb_no());
		}
	
		return map;
	}
	
	
	//가입요청 목록 
	@RequestMapping("requestToJoinList")
	public HashMap<String, Object> requestToJoinList(int cafe_no){
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("result", "success");
		
		return map; 
	}
	
	//가입요청 수락
	@RequestMapping("acceptRequestToJoin")
	public HashMap<String, Object> acceptRequestToJoin(FP_CafeMemberVo cafeMemberVo, int requestToJoin_no){
		int cafeNo = cafeMemberVo.getCafe_no();
		FP_CafeVo cafeVo = cafeService.getCafeData(cafeNo);

		HashMap<String, Object> map = new HashMap<String, Object>();
		
		if(cafeService.cafeMemberCount(cafeNo) >= (cafeVo.getCafeMember_limit()+1)){
			map.put("result","fail");
			map.put("reason", "최대 회원 수 초과");
		}else {
			cafeService.acceptDateUpdate(cafeMemberVo);
			cafeService.registerCafeMember(cafeMemberVo);
			map.put("result", "success");
		}
		return map;
	}
	
	@RequestMapping("registerCafeProcess")
	public HashMap<String, Object> registerCafeProcess(FP_RequestToJoinVo requestToJoinVo){
		HashMap<String, Object> map = new HashMap<String, Object>();
		cafeService.RequestToJoinMember(requestToJoinVo);
		map.put("result", "sucess");
		return map;
	}
}
