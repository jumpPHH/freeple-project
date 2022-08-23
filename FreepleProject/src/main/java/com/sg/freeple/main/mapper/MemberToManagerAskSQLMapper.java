package com.sg.freeple.main.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.sg.freeple.vo.FP_MemberToManagerAskVo;
import com.sg.freeple.vo.FP_MemberVo;

public interface MemberToManagerAskSQLMapper {
	
	public void insertToManagerAsk(FP_MemberToManagerAskVo param);
	
	public ArrayList<FP_MemberToManagerAskVo> selectAll(@Param("pageNum") int pageNum , 
														@Param("mb_no") int mb_no);
	
	public int selectAskCount(int mb_no);
	
	public FP_MemberVo selectNo(int mb_no);
	
	public FP_MemberToManagerAskVo selectAsk(int mb_mng_ask_no);
	
	public void deleteNo(int mb_mng_ask_no);
	
	public void updateNo(FP_MemberToManagerAskVo param);
}
