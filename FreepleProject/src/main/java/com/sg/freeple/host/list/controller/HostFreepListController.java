package com.sg.freeple.host.list.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sg.freeple.host.list.service.HostFreepListService;
import com.sg.freeple.vo.FP_MemberVo;

@Controller
@RequestMapping("/host/list/*")
public class HostFreepListController {

	@Autowired
	HostFreepListService freepListService;
	
	@RequestMapping("hostFreepListPage")
	public String hostFreepListPage(Model model, HttpSession session, String searchType, String searchWord) {
		
		//로그인한 -> 호스트의 프립 목록을 띄워야 되니 세션의 (mb_no가 필요)
		FP_MemberVo sessionUserInfo = (FP_MemberVo)session.getAttribute("sessionUserInfo");	
		
		model.addAttribute("sessionUserInfo",sessionUserInfo);
		model.addAttribute("hostFreepDataList",freepListService.getHostFreepDataList(sessionUserInfo,searchType,searchWord));
		model.addAttribute("hostFreepImagDataList",freepListService.getHostFreepImagDataList(sessionUserInfo, searchType, searchWord)); 
		model.addAttribute("freepVoCount",freepListService.getHostFreepVoCount(sessionUserInfo, searchType, searchWord)); 
		model.addAttribute("getThumbnail",freepListService.getThumbnail(sessionUserInfo, searchType, searchWord));
		
		return "host/list/hostFreepListPage";
	}
}
