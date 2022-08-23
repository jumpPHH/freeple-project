package com.sg.freeple.manager.login.mapper;

import com.sg.freeple.vo.FP_ManagerVo;

public interface ManagerRestSQLMapper {
	
	public FP_ManagerVo selectByIdAndPw(FP_ManagerVo managerVo);
}
