package com.sg.freeple.manager.ask.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sg.freeple.manager.ask.service.ManagerAskService;
import com.sg.freeple.vo.FP_MemberToManagerAskVo;

@Controller
@RequestMapping("/manager/ask/*")
public class ManagerAskController {

	@Autowired
	private ManagerAskService managerAskService;
	
	@RequestMapping("askCenterPage")
	public String askCenterPage() {
		
		return "manager/ask/askCenterPage";
	}
	
	
	@RequestMapping("memberAskListPage")
	public String memberAskListPage(@RequestParam(value = "pageNum" , defaultValue = "1") int pageNum ,
			 HttpSession session , Model model) {
		ArrayList<HashMap<String, Object>> dataList = managerAskService.getAskDataList(pageNum);
		model.addAttribute("dataList" , dataList);
		int askCount = managerAskService.selectCount();
		int totalPageCount = (int)Math.ceil(askCount/10.0);
		//밑에 네이게이션 페이지바를 커팅 1 2 3 4 5 , 6 7 8 9 10
		
		int startPage = ((pageNum-1)/5)*5 + 1;
		int endPage = ((pageNum-1)/5+1)*5;
		if(endPage > totalPageCount) { //....16 17 18 19 20 만약에 페이지가18까지면 엔드페이지가 20이 나오면 안되기 때문에 나온 if문
			endPage = totalPageCount;
		}
		
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("currentPageNum", pageNum);
		model.addAttribute("totalPageCount", totalPageCount);
		
		return "manager/ask/memberAskListPage";
	}
	
	@RequestMapping("memberAskListProcess")
	public String memberAskListProcess(FP_MemberToManagerAskVo manager_answer) {
		
		managerAskService.insertMngAnswer(manager_answer);
		
		return "redirect:./memberAskListPage";
	}
	
	@RequestMapping("hostAskListPage")
	public String hostAskListPage() {
		return "manager/ask/hostAskListPage";
	}
	
	
	
	
}
