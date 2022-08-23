package com.sg.freeple.manager.user.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.sg.freeple.vo.FP_MemberVo;
import com.sg.freeple.vo.FP_ReportVo;
import com.sg.freeple.vo.FP_UsingStopVo;

public interface ManagerUserSQLMapper {

	public ArrayList<FP_MemberVo> selectList();
	
	public ArrayList<FP_ReportVo> selectReported();
	
	public FP_MemberVo selectReportedNo(int reported_person_mb_no);
	
	public FP_MemberVo selectReportNo(int report_mb_no);
	
	public int reportedCount(int reported_person_mb_no);
	
	public void updateNo(int reported_person_mb_no);
	
	public void insertStopNo3(@Param(value = "reported_person_mb_no")int reported_person_mb_no ,
							 @Param(value = "mng_no" ) int mng_no);
	
	public void insertStopNo7(@Param(value = "reported_person_mb_no")int reported_person_mb_no ,
							  @Param(value = "mng_no" ) int mng_no);
	
	public void insertStopNo15(@Param(value = "reported_person_mb_no")int reported_person_mb_no ,
			 				  @Param(value = "mng_no" ) int mng_no);
	
	public ArrayList<FP_UsingStopVo> stopUser();
	
	public void deleteStopUserbyMbNo(int reported_person_mb_no);
	
	//public void deleteReportedByMbNo(int reported_person_mb_no);
}
