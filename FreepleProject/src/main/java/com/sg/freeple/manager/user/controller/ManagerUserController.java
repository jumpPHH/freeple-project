package com.sg.freeple.manager.user.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sg.freeple.manager.user.service.ManagerUserService;
import com.sg.freeple.vo.FP_ManagerVo;
import com.sg.freeple.vo.FP_MemberVo;

@Controller
@RequestMapping("/manager/user/*")
public class ManagerUserController {

	@Autowired
	private ManagerUserService managerUserService;
	
	@RequestMapping("totalUserListPage")
	public String totalUserListPage(Model model) {
		
		ArrayList<FP_MemberVo> memberList = managerUserService.selectMember();
		
		model.addAttribute("memberList", memberList);
		
		
		
		return "manager/user/totalUserListPage";
	}
	
	@RequestMapping("reportUserListPage")
	public String reportUserListPage(Model model) {
		
		ArrayList<HashMap<String, Object>> dataList = managerUserService.memberReportList();
		
		model.addAttribute("dataList", dataList);
		
		return "manager/user/reportUserListPage";
	}
	
	@RequestMapping("deleteReportedProcess")
	public String deleteReportedProcess(int reported_person_mb_no , HttpSession session) {
		FP_ManagerVo managerVo = (FP_ManagerVo)session.getAttribute("sessionManagerInfo");
		int mng_no = managerVo.getMng_no();
		
		//제제하기 누르면 update되고 insert가 동시에 됌.
		managerUserService.updateReported(reported_person_mb_no);
		managerUserService.insertStopUser(reported_person_mb_no , mng_no);
		
		return "redirect:./reportUserListPage";
	}
	
	@RequestMapping("stopUserListPage")
	public String stopUserListPage(Model model) {
				
		ArrayList<HashMap<String, Object>> stopList = managerUserService.selectStopUser();
		
		model.addAttribute("stopList", stopList);
		
		return "manager/user/stopUserListPage";
				
	}
	
	@RequestMapping("stopUserClearlingProcess")
	public String stopUserClearlingProcess(int reported_person_mb_no) {
		
		managerUserService.deleteStopUsing(reported_person_mb_no);
		//managerUserService.deleteReported(reported_person_mb_no);
		
		return "redirect:./stopUserListPage";
	}
	
	
}
