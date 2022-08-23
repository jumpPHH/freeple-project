package com.sg.freeple.manager.user.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sg.freeple.manager.user.mapper.ManagerUserSQLMapper;
import com.sg.freeple.vo.FP_MemberVo;
import com.sg.freeple.vo.FP_ReportVo;
import com.sg.freeple.vo.FP_UsingStopVo;

@Service
public class ManagerUserService {

	@Autowired
	private ManagerUserSQLMapper managerUserSQLMapper;
	
	public ArrayList<FP_MemberVo> selectMember() {
	
		return managerUserSQLMapper.selectList();
	}
	
	public ArrayList<HashMap<String, Object>> memberReportList() {
		
		ArrayList<HashMap<String, Object>> dataList = new ArrayList<HashMap<String, Object>>(); 
		
		ArrayList<FP_ReportVo> list = managerUserSQLMapper.selectReported();
		
		for(FP_ReportVo reportVo : list) {
			
			int reported_person_mb_no = reportVo.getReported_person_mb_no();
			FP_MemberVo reportedMemberVo = managerUserSQLMapper.selectReportedNo(reported_person_mb_no);
			int reportedCount = managerUserSQLMapper.reportedCount(reported_person_mb_no);
			
			int report_mb_no = reportVo.getReport_mb_no();
			FP_MemberVo reportMemberVo = managerUserSQLMapper.selectReportNo(report_mb_no);
			
			HashMap<String, Object> dataMap = new HashMap<String, Object>();
			dataMap.put("reportedMemberVo", reportedMemberVo);
			dataMap.put("reportMemberVo", reportMemberVo);
			dataMap.put("reportVo", reportVo);
			dataMap.put("reportedCount", reportedCount);
			dataList.add(dataMap);
			
		}
		
		return dataList;
	}
	
	public void updateReported(int reported_person_mb_no) {
		managerUserSQLMapper.updateNo(reported_person_mb_no);
	}
	
	public void insertStopUser(int reported_person_mb_no , int mng_no) {
		int reportedCount = managerUserSQLMapper.reportedCount(reported_person_mb_no);
		
		if(reportedCount >= 3 && reportedCount < 8) {
			managerUserSQLMapper.insertStopNo3(reported_person_mb_no , mng_no);
		}else if(reportedCount >= 7 && reportedCount < 15) {
			managerUserSQLMapper.insertStopNo7(reported_person_mb_no , mng_no);
		}
		else {
			managerUserSQLMapper.insertStopNo15(reported_person_mb_no , mng_no);
		}
		
	}
	
	public ArrayList<HashMap<String, Object>> selectStopUser() {
		
		ArrayList<HashMap<String, Object>> stopList = new ArrayList<HashMap<String, Object>>();
		
		ArrayList<FP_UsingStopVo> List = managerUserSQLMapper.stopUser();
		
		for(FP_UsingStopVo usingStopVo : List) {
			int reported_person_mb_no = usingStopVo.getReported_person_mb_no();
			FP_MemberVo memberVo = managerUserSQLMapper.selectReportedNo(reported_person_mb_no);
			
			int reportedCount = managerUserSQLMapper.reportedCount(reported_person_mb_no);
			HashMap<String, Object> stopMap = new HashMap<>();
			stopMap.put("usingStopVo", usingStopVo);
			stopMap.put("memberVo", memberVo);
			stopMap.put("reportedCount", reportedCount);
			
			stopList.add(stopMap);
		}
		
		return stopList;
	}
	
	public void deleteStopUsing(int reported_person_mb_no) {
		managerUserSQLMapper.deleteStopUserbyMbNo(reported_person_mb_no);
	}
	
//	public void deleteReported(int reported_person_mb_no) {
//		managerUserSQLMapper.deleteReportedByMbNo(reported_person_mb_no);
//	}



}

