package com.sg.freeple.main.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sg.freeple.main.mapper.MemberToManagerAskSQLMapper;
import com.sg.freeple.vo.FP_MemberToManagerAskVo;
import com.sg.freeple.vo.FP_MemberVo;

@Service
public class MemberToManagerAskService {
	
	@Autowired
	private MemberToManagerAskSQLMapper memberToManagerAskSQLMapper;

	public void writeContent(FP_MemberToManagerAskVo param) {
		memberToManagerAskSQLMapper.insertToManagerAsk(param);
	}
	
	public HashMap<String, Object> getAskDataList(int pageNum , int mb_no){
		
		HashMap<String, Object> myAskMap = new HashMap<String, Object>();
		
		ArrayList<FP_MemberToManagerAskVo> myAskList = memberToManagerAskSQLMapper.selectAll(pageNum , mb_no);
		FP_MemberVo memberVo = memberToManagerAskSQLMapper.selectNo(mb_no);
		
		myAskMap.put("memberVo", memberVo);
		myAskMap.put("myAskList", myAskList);
		
		return myAskMap;
	}

	public int selectCount(int mb_no) {
		return memberToManagerAskSQLMapper.selectAskCount(mb_no);
	}
	
	public HashMap<String, Object> getAskData(int mb_mng_ask_no) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		//내가 누른 문의글 번호에 해당하는 문의정보. 허나 멤버에 대한정보도 필요...그래서
		FP_MemberToManagerAskVo memberToManagerAsk = memberToManagerAskSQLMapper.selectAsk(mb_mng_ask_no);
		int mb_no = memberToManagerAsk.getMb_no();
		FP_MemberVo memberVo = memberToManagerAskSQLMapper.selectNo(mb_no);
		
		map.put("memberToManagerAsk", memberToManagerAsk);
		map.put("memberVo", memberVo);
		
		return map;  
	}
	
	public void deleteAsk(int mb_mng_ask_no) {
		memberToManagerAskSQLMapper.deleteNo(mb_mng_ask_no);
	};
	
	public void updateAsk(FP_MemberToManagerAskVo param) {
		memberToManagerAskSQLMapper.updateNo(param);
	}
}
