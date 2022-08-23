package com.sg.freeple.host.profile.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sg.freeple.host.profile.mapper.HostProfileSQLMapper;
import com.sg.freeple.vo.FP_MemberVo;

@Service
public class HostProfileService {

	@Autowired
	HostProfileSQLMapper hostProfileSQLMapper;
	
	
	public void updateHostProfileProcess(FP_MemberVo fp_MemberVo) {
		
		hostProfileSQLMapper.updateHostProfileDate(fp_MemberVo);
	}

}
