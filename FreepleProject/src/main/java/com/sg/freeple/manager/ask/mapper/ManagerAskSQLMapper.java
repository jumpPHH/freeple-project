package com.sg.freeple.manager.ask.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.sg.freeple.vo.FP_MemberToManagerAskVo;
import com.sg.freeple.vo.FP_MemberVo;

public interface ManagerAskSQLMapper {

	public ArrayList<FP_MemberToManagerAskVo> selectAll(@Param("pageNum") int pageNum);

	public FP_MemberVo selectNo(int mb_no);
	
	public int selectAskCount();
	
	public void updateVo(FP_MemberToManagerAskVo manager_answer);
	
}
