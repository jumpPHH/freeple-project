package com.sg.freeple.freep.controller;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.apache.commons.text.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sg.freeple.freep.service.FreepService;
import com.sg.freeple.member.coupon.service.MemberCouponService;
import com.sg.freeple.vo.FP_FreepImageVo;
import com.sg.freeple.vo.FP_FreepVo;
import com.sg.freeple.vo.FP_MemberVo;
import com.sg.freeple.vo.FP_PaymentVo;

@Controller
@RequestMapping("/freep/*")
public class FreepController {
	@Autowired
	private FreepService freepService;

	@Autowired
	private MemberCouponService memberCouponService;
	
	@RequestMapping("freepListPage")
	public String freepListPage(Model model, @RequestParam(value = "freep_ctg_no", defaultValue = "0") int freep_ctg_no,
			@RequestParam(value = "searchWord", defaultValue = "") String searchWord,
			@RequestParam(value = "filterInOrderType", defaultValue = "inOrderMoreReview") String filterInOrderType,
			@RequestParam(value = "pageNum", defaultValue = "1") int pageNum) {

		// System.out.println("카테고리넘버 : "+freep_ctg_no);
		// System.out.println("검색어 : "+searchWord);
		// System.out.println("필터정렬타입 : "+filterInOrderType);
		int numberOfFreep = freepService.getNumerOfFreep(freep_ctg_no, searchWord);// 가져온 프립의 갯수

		if (freep_ctg_no > 0) { // 카테고리넘버 값이 넘어왔을때
			String categoryName = freepService.getCategoryName(freep_ctg_no);
			model.addAttribute("categoryName", categoryName);
			model.addAttribute("freep_ctg_no", freep_ctg_no);
		} else if (searchWord.equals("") == false) { // 검색키워드 값이 넘어왔을때
			model.addAttribute("searchWord", searchWord);
		}
		model.addAttribute("filterInOrderType", filterInOrderType);

		ArrayList<HashMap<String, Object>> freepList = freepService.getFreepList(pageNum, freep_ctg_no, searchWord,
				filterInOrderType);
		int numberOfFreepDevideFour = (int) Math.ceil(freepList.size() / 4);
		if (freepList.size() < 20)
			numberOfFreepDevideFour++;

		model.addAttribute("numberOfFreep", numberOfFreep);
		model.addAttribute("numberOfFreepDevideFour", numberOfFreepDevideFour);
		model.addAttribute("freepList", freepList);

		int totalPageCount = (int) Math.ceil(numberOfFreep / 20.0);
		int startPage = ((pageNum - 1) / 10) * 10 + 1;
		int endPage = ((pageNum - 1) / 10) * 10 + 10;
		if (endPage > totalPageCount)
			endPage = totalPageCount; 

		model.addAttribute("totalPageCount", totalPageCount);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("currentPageNum", pageNum);

		return "freep/freepListPage";
	}

	@RequestMapping("freepContentPage")
	public String freepContentPage(Model model, int freep_no) {
		FP_FreepVo fp_FreepVo = freepService.getFreep(freep_no);
		String priceStringFormat = new DecimalFormat("###,###").format(fp_FreepVo.getFreep_price());
		ArrayList<FP_FreepImageVo> freepImageList = freepService.getFreepImage(freep_no);

		String content = fp_FreepVo.getFreep_content();
		content = StringEscapeUtils.escapeHtml4(content);
		content = content.replaceAll(" ", "&nbsp;");
		content = content.replaceAll("\n", "<br>");
		fp_FreepVo.setFreep_content(content);

		model.addAttribute("fp_FreepVo", fp_FreepVo);
		model.addAttribute("priceStringFormat", priceStringFormat);
		model.addAttribute("freepImageList", freepImageList);

		FP_MemberVo fp_MemberVo = freepService.getFreepHostInfo(freep_no);
		model.addAttribute("hostInfo", fp_MemberVo);

		ArrayList<HashMap<String, Object>> freepReviewDataList = freepService.getFreepReviewData(freep_no);
		
		model.addAttribute("freepReviewDataList", freepReviewDataList);
		
		// 총 리뷰의 갯수 
		int reviewCount = freepService.getReviewCount(freep_no);
		
		model.addAttribute("reviewCount",reviewCount);
		
		
	   
		return "freep/freepContentPage";
	}

	@RequestMapping("freepHostProfilePage")
	public String freepHostProfilePage(Model model, int freep_no) {
		FP_MemberVo fp_MemberVo = freepService.getFreepHostInfo(freep_no);

		String content = fp_MemberVo.getMb_host_info();
		content = StringEscapeUtils.escapeHtml4(content);
		content = content.replaceAll(" ", "&nbsp;");
		content = content.replaceAll("\n", "<br>");
		fp_MemberVo.setMb_host_info(content);

		model.addAttribute("hostInfo", fp_MemberVo);

		return "freep/freepHostProfilePage";
	}
	
	@RequestMapping("freepReviewListPage")
	public String freepReviewListPage(Model model, int freep_no, HttpSession session,
			@RequestParam(value = "filterInOrderType", defaultValue = "inOrderByDesc") String filterInOrderType,
			@RequestParam(value = "pageNum", defaultValue = "1") int pageNum) {

		FP_FreepVo fp_FreepVo = freepService.getFreep(freep_no);

		model.addAttribute("fp_FreepVo", fp_FreepVo);

		ArrayList<HashMap<String, Object>> freepReviewDataList = freepService.getFreepReviewData(freep_no);
		model.addAttribute("freepReviewDataList", freepReviewDataList);
		

		// 총 리뷰의 갯수 
		int reviewCount = freepService.getReviewCount(freep_no);
		model.addAttribute("reviewCount",reviewCount);
		
		int totalPageCount = (int)Math.ceil(reviewCount /10.0);

		int startPage = ((pageNum - 1) / 5) * 5 + 1;
		int endPage = ((pageNum - 1) / 5 + 1) * 5;
		
		if (endPage > totalPageCount) {
			endPage = totalPageCount;
		}
		
		model.addAttribute("startPage",startPage);
		model.addAttribute("endPage",endPage);
		model.addAttribute("currentPageNum",pageNum); 
		model.addAttribute("totalPageCount",totalPageCount);
			
		FP_MemberVo sessionUserInfo = (FP_MemberVo)session.getAttribute("sessionUserInfo");
		int sessionUserInfoMb_No = sessionUserInfo.getMb_no();
		
		FP_MemberVo freepHostInfo = freepService.getFreepHostInfo(freep_no);
		int freepHostInfoMb_no = freepHostInfo.getMb_no();
		
		model.addAttribute("freepHostInfo",freepHostInfo);
		
		
		if (sessionUserInfoMb_No == freepHostInfoMb_no) {
			
			FP_MemberVo freepSessionuserInfo = freepService.getFreepSessionUserInfo(sessionUserInfoMb_No,freep_no);
			
			model.addAttribute("freepSessionuserInfo",freepSessionuserInfo);
		}
		
		FP_MemberVo fp_MemberVo = freepService.getFreepHostInfo(freep_no);
		model.addAttribute("hostInfo", fp_MemberVo);

		

		
		return "freep/freepReviewListPage";
	}
	
	
	
	@RequestMapping("reserveFreepProcess")
	public String reserveFreepProcess(FP_PaymentVo fP_PaymentVo,HttpSession httpSession) {
		FP_MemberVo loginUser_MemberVo = (FP_MemberVo)httpSession.getAttribute("sessionUserInfo");
				
		//1.
		//FP_PaymentVo를 완성시켜서 DB에 저장.
		//FP_Accept 를 완성시켜서 DB에 저장. 만들땐 N
		//FP_SendMoney를 완성시켜서 DB에 저장. -> 관리자에게 송금
		fP_PaymentVo.setMb_no(loginUser_MemberVo.getMb_no());
		freepService.insertReservedFreep(fP_PaymentVo,loginUser_MemberVo.getMb_no());
		
		//2. 사용된 쿠폰 FP_MemberCoupon DB에서 Y -> N으로 바꿈
		memberCouponService.updateCouponUnavailableByCouponNo(fP_PaymentVo.getCoupon_no());
				
		return "redirect:../main/myReservedFreepListPage";
	}

}
