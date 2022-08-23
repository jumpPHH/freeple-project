package com.sg.freeple.host.register.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sg.freeple.host.register.mapper.HostFreepRegisterSQLMapper;
import com.sg.freeple.vo.FP_FreepCategoryVo;
import com.sg.freeple.vo.FP_FreepImageVo;
import com.sg.freeple.vo.FP_FreepVo;


@Service
public class HostFreepRegisterService {
	
	@Autowired
	private HostFreepRegisterSQLMapper registerSQLMapper;
	
	//카테고리 리스트를 가져오는 로직.
	public ArrayList<FP_FreepCategoryVo> getCategoryList(){
		
		 return registerSQLMapper.selectFreepCategory();
	} 
	
	//프립 등록 로직.
	public void freepRegister(FP_FreepVo fp_FreepVo,ArrayList<FP_FreepImageVo> freepImageVoList) {
		
		int freepPK = registerSQLMapper.createFreepPK();
		fp_FreepVo.setFreep_no(freepPK);
		
		registerSQLMapper.insertFreep(fp_FreepVo);
		

		
		for(FP_FreepImageVo fp_FreepImageVo : freepImageVoList) {
			
	
			fp_FreepImageVo.setFreep_no(freepPK);
			registerSQLMapper.insetFreepImage(fp_FreepImageVo);
			
		}
	}
	
	
	
	
}
