package com.sg.freeple.manager.ask.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sg.freeple.manager.ask.mapper.ManagerAskSQLMapper;
import com.sg.freeple.vo.FP_MemberToManagerAskVo;
import com.sg.freeple.vo.FP_MemberVo;

@Service
public class ManagerAskService {

	@Autowired
	private ManagerAskSQLMapper managerAskSQLMapper;
	
	public ArrayList<HashMap<String, Object>> getAskDataList(int pageNum){
			ArrayList<HashMap<String, Object>> dataList = new ArrayList<HashMap<String, Object>>();
			ArrayList<FP_MemberToManagerAskVo> askList = managerAskSQLMapper.selectAll(pageNum);
			for(FP_MemberToManagerAskVo askVo : askList) {
				
				int mb_no = askVo.getMb_no();
				
				FP_MemberVo memberVo = managerAskSQLMapper.selectNo(mb_no);
				
				HashMap<String, Object> myAskMap = new HashMap<String, Object>();
				
				myAskMap.put("memberVo", memberVo);
				myAskMap.put("askVo", askVo);
				dataList.add(myAskMap);
			}
			
			
			return dataList;
		}
	
	public int selectCount() {
		return managerAskSQLMapper.selectAskCount();
	}
	
	public void insertMngAnswer(FP_MemberToManagerAskVo manager_answer) {
		managerAskSQLMapper.updateVo(manager_answer);
	}
}
