package com.sg.freeple.host.register.mapper;

import java.util.ArrayList;

import com.sg.freeple.vo.FP_FreepCategoryVo;
import com.sg.freeple.vo.FP_FreepImageVo;
import com.sg.freeple.vo.FP_FreepVo;

public interface HostFreepRegisterSQLMapper {
	
	//프립 카테고리 가져오는 쿼리.
	public ArrayList<FP_FreepCategoryVo> selectFreepCategory();
	
	//프립 넘버 생성 쿼리.
	public int createFreepPK();
	
	//프립 등록 쿼리.
	public void insertFreep(FP_FreepVo fp_FreepVo);
	
	//프립 이미지 등록 쿼리.
	public void insetFreepImage(FP_FreepImageVo fp_FreepImageVo);
}
