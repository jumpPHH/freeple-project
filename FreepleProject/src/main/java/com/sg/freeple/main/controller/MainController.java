package com.sg.freeple.main.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.apache.commons.text.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.sg.freeple.freep.service.FreepService;
import com.sg.freeple.main.service.MemberToManagerAskService;
import com.sg.freeple.member.coupon.service.MemberCouponService;
import com.sg.freeple.vo.FP_MemberCouponVo;
import com.sg.freeple.vo.FP_MemberToManagerAskVo;
import com.sg.freeple.vo.FP_MemberVo;

@Controller
@RequestMapping("/main/*")
public class MainController {
	
	@Autowired
	private MemberToManagerAskService memberToManagerAskService;
	@Autowired
	private FreepService freepService;
	@Autowired
	private MemberCouponService memberCouponService;
	
	@RequestMapping("mainPage")//메인페이지로 이동
	public String mainPage() {
		
		
		return "main/mainPage";
	}
	
	@RequestMapping("myPage")//마이페이지로 이동
	public String myPage() {
		
		return "main/myPage";
	}
	
	@RequestMapping("askWriteListPage")
	public String askWriteListPage(@RequestParam(value = "pageNum" , defaultValue = "1") int pageNum , HttpSession session , Model model) {
		FP_MemberVo sessionUser = (FP_MemberVo)session.getAttribute("sessionUserInfo");
		int mb_no = sessionUser.getMb_no();
		
		HashMap<String, Object> dataMap = memberToManagerAskService.getAskDataList(pageNum , mb_no);
		
		model.addAttribute("dataMap" , dataMap);
		
		int askCount = memberToManagerAskService.selectCount(mb_no);
		
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
		
		return "main/askWriteListPage";
	}
	
	@RequestMapping("askWriteContentProcess")
	public String askWriteContentProcess(FP_MemberToManagerAskVo param, MultipartFile file, HttpSession session) {
		//질문자의 member_no폴인키 넣어주기.
		FP_MemberVo sessionUser = (FP_MemberVo)session.getAttribute("sessionUserInfo");
		int mb_no = sessionUser.getMb_no();
		param.setMb_no(mb_no);
		
		memberToManagerAskService.writeContent(param);
		
		return "redirect:./askWriteListPage";
	}
	
	@RequestMapping("askReadPage")
	public String askReadPage(int mb_mng_ask_no , Model model) {
		
		HashMap<String, Object> data = memberToManagerAskService.getAskData(mb_mng_ask_no);
		
		FP_MemberToManagerAskVo memberToManagerAsk = (FP_MemberToManagerAskVo)data.get("memberToManagerAsk");
		String content = memberToManagerAsk.getMb_mng_ask_content();
		content = StringEscapeUtils.escapeHtml4(content);
		content = content.replaceAll(" ", "&nbsp");
		content = content.replaceAll("\n", "<br>");
		memberToManagerAsk.setMb_mng_ask_content(content);
		
		model.addAttribute("data", data);
		
		return "main/askReadPage";
	}
	
	@RequestMapping("askReadProcess")
	public String askReadProcess() {
		
		
		return "main/askReadPage";
	}
	
	@RequestMapping("deleteAskContentProcess")
	public String deleteAskContentProcess(int mb_mng_ask_no) {
		
		memberToManagerAskService.deleteAsk(mb_mng_ask_no);
		
		return "redirect:./askWriteListPage";
	}
	
	@RequestMapping("updateAskContentPage")
	public String updateAskContentPage(int mb_mng_ask_no, Model model) {
		HashMap<String , Object> data = memberToManagerAskService.getAskData(mb_mng_ask_no);
		model.addAttribute("data", data);
		
		return "main/updateAskContentPage";
	}
	
	@RequestMapping("updateAskContentProcess")
	public String updateAskContentProcess(FP_MemberToManagerAskVo param) {
		
		memberToManagerAskService.updateAsk(param);
		
		return "redirect:./askWriteListPage";
	}
	
	
	//민주
	@RequestMapping("myReservedFreepListPage")
	public String myReservedFreepListPage(HttpSession httpSession,Model model) {
		
		FP_MemberVo loginUser_MemberVo=(FP_MemberVo)httpSession.getAttribute("sessionUserInfo");
		
//		1. 예약하고 완료전 프립목록(예약 프립목록)
		model.addAttribute("beforeJoinFreepList",freepService.getReservedBeforeJoinFreepList(loginUser_MemberVo.getMb_no()));
		
//		2. 예약하고 완료후 프립목록(완료 프립목록)
		model.addAttribute("afterJoinFreepList",freepService.getReservedAfterJoinFreepList(loginUser_MemberVo.getMb_no()));

		
		return "main/myReservedFreepListPage";
	}
	
	@RequestMapping("myReservedFreepPage")
	public String myReservedFreepPage() {
		return "main/myReservedFreepPage";
	}
	
	@RequestMapping("myCouponListPage")
	public String myCouponListPage(HttpSession httpSession,Model model) {
		int mb_no = ((FP_MemberVo)httpSession.getAttribute("sessionUserInfo")).getMb_no();
		
		ArrayList<FP_MemberCouponVo> couponList = memberCouponService.getAllCouponListByLoginUserMbNo(mb_no);
		model.addAttribute("couponList",couponList);
		
		return "main/myCouponListPage";
	}
	
}









