package com.sg.freeple.manager.login.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sg.freeple.manager.login.mapper.ManagerRestSQLMapper;
import com.sg.freeple.vo.FP_ManagerVo;

@Service
public class ManagerRestService {
	@Autowired
	private ManagerRestSQLMapper managerRestSQLMapper;
	
	public FP_ManagerVo loginProcess(FP_ManagerVo managerVo) {		
		return managerRestSQLMapper.selectByIdAndPw(managerVo);
	}
}
