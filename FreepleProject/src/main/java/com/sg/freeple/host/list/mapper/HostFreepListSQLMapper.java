package com.sg.freeple.host.list.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.sg.freeple.vo.FP_FreepImageVo;
import com.sg.freeple.vo.FP_FreepVo;

public interface HostFreepListSQLMapper {

	
	public ArrayList<FP_FreepVo> selectHostFreepList(
			@Param("searchType")String searchType , 
			@Param("searchWord")String searchWord , 
			@Param("mb_no") int mb_no);
	
	public int selectHostFreepListCount(
			@Param("searchType")String searchType , 
			@Param("searchWord")String searchWord ,
			@Param("mb_no") int mb_no);
	
	public ArrayList<FP_FreepImageVo> selectThumbnail(
			@Param("searchType")String searchType , 
			@Param("searchWord")String searchWord ,
			@Param("mb_no") int mb_no,
			@Param("freep_no") int freep_no);

	public int selectHostFreepImageCount(int freep_no);
	
	public ArrayList<FP_FreepVo> selectGetHostFreepNo(int mb_no);
	
	public ArrayList<FP_FreepImageVo> selectHostFreepImageList(int freep_no);
	

}
