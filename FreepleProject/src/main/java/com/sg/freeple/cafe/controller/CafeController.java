package com.sg.freeple.cafe.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.sg.freeple.cafe.board.service.CafeBoardServiceImpl;
import com.sg.freeple.cafe.service.CafeServiceImpl;
import com.sg.freeple.vo.FP_CafeMemberVo;
import com.sg.freeple.vo.FP_CafeVo;
import com.sg.freeple.vo.FP_MemberVo;
import com.sg.freeple.vo.FP_RequestToJoinVo;

@Controller
@RequestMapping("/cafe/*")
public class CafeController {
	
	@Autowired
	private CafeServiceImpl cafeService;
	@Autowired
	private CafeBoardServiceImpl cafeBoardService;
	
	@RequestMapping("createCafePage")
	public String createCafePage() {
		return "cafe/createCafePage";
	}
	
	@RequestMapping("createCafeProcess") //카페생성
	public String createCafeProcess(FP_CafeVo cafeVo, MultipartFile file, HttpSession session) {
		//System.out.println("가입 시:"+file);
		String rootFilePath = "C:/uploadFiles/";
		String originalFilename = file.getOriginalFilename();
		
		String randomName = UUID.randomUUID().toString();
		randomName += "_"+System.currentTimeMillis();
		
		String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
		randomName += ext;
		
		Date today = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd/");
		String todayFolderName = sdf.format(today);
		
		File todayFoler = new File(rootFilePath + todayFolderName);
		if(!todayFoler.exists()) {
			todayFoler.mkdirs();
		}
		try {
			file.transferTo(new File(rootFilePath + todayFolderName + randomName));
		}catch (Exception e) {
			e.printStackTrace();
		}
		cafeVo.setCafe_image_link(todayFolderName + randomName);
		cafeVo.setCafe_image_original_filename(originalFilename);
		cafeService.toCreateCafe(cafeVo);
		
		return "redirect: ./completePage?cafe_no=" + cafeVo.getCafe_no();
	}
	
	@RequestMapping("completePage")
	public String completePage(Model model,int cafe_no) {
		
		FP_CafeVo cafeVo = cafeService.getCafeData(cafe_no);
		model.addAttribute("cafeVo", cafeVo);
		return "cafe/completePage";
	}
	
	@RequestMapping("addcafeMemberProcess")
	public String addcafeMemberProcess(FP_CafeMemberVo cafeMemberVo) {
		cafeService.addCafeMemberTable(cafeMemberVo);
		
		return "redirect: ./cafePage?cafe_no="+cafeMemberVo.getCafe_no();
	}
	
	
	@RequestMapping("registerCafeMemberPage")
	public String registerCafeMemberPage(Model model, int cafe_no, HttpSession session) {
		
		FP_MemberVo memberVo = (FP_MemberVo) session.getAttribute("sessionUserInfo");
		int memberNo = memberVo.getMb_no();
		FP_RequestToJoinVo requestToJoinVo = new FP_RequestToJoinVo();
		requestToJoinVo.setmb_no(memberNo);
		requestToJoinVo.setCafe_no(cafe_no);
     	FP_CafeVo cafeVo2 = cafeService.getCafeData(cafe_no);
     	cafeVo2.setCafeMember_limit(cafeService.currentCafeMemberCount(cafe_no));
     	ArrayList<HashMap<String, Object>> memberList = cafeService.getCafeMemberList(cafe_no);
     	
		if(cafeService.cafeMemberRegisterCheck(requestToJoinVo) > 0) {
			
			return "redirect: ./alarmRegisterPage?cafe_no="+cafe_no;
		}else {
			FP_CafeVo cafeVo = cafeService.getCafeData(cafe_no);
			model.addAttribute("cafeVo", cafeVo);
			model.addAttribute("cafeVo2", cafeVo2);
			model.addAttribute("memberList", memberList);
			
			return "cafe/registerCafeMemberPage";
		}
	}
		
	@RequestMapping("requestToJoinPage")
	public String requestToJoinPage(Model model,int cafe_no, HttpSession session) {
		
	FP_MemberVo memberVo= (FP_MemberVo) session.getAttribute("sessionUserInfo");
		FP_CafeMemberVo cafeMemberVo = cafeService.getCafeMemberDataByMemberNo(cafe_no, memberVo.getMb_no());
		
		FP_CafeVo cafeVo = cafeService.getCafeData(cafe_no);
		ArrayList<HashMap<String, Object>> dataList =cafeService.getRequestTojoinList(cafe_no);
     	FP_CafeVo cafeVo2 = cafeService.getCafeData(cafe_no);
     	cafeVo2.setCafeMember_limit(cafeService.currentCafeMemberCount(cafe_no));
     	FP_CafeVo cafeVo3 = cafeService.getCafeData(cafe_no);
     	cafeVo3.setCafeMember_limit(cafeService.getRequestTojoinCount(cafe_no));
     	ArrayList<HashMap<String, Object>> memberList = cafeService.getCafeMemberList(cafe_no);
     	
		model.addAttribute("dataList", dataList);
		model.addAttribute("cafeVo", cafeVo);
		model.addAttribute("cafeMemberVo", cafeMemberVo);
		model.addAttribute("memberVo", memberVo);
		model.addAttribute("cafeVo2", cafeVo2);
		model.addAttribute("cafeVo3", cafeVo3);
		model.addAttribute("memberList", memberList);
		
		return "cafe/requestToJoinPage";
	}
	
	@RequestMapping("cafeListPage")
	public String cafeListPage(Model model) {
		
		ArrayList<HashMap<String, Object>> dataList = cafeService.getCafeList();
		model.addAttribute("dataList",dataList);
		return "cafe/cafeListPage";
	}
	
	@RequestMapping("TransferCafeProcess")
	public String TransferCafeProcess(int cafe_no) {
		
		FP_CafeVo cafeVo = cafeService.getCafeData(cafe_no);
		int cafeNo = cafeVo.getCafe_no();
		return "redirect: ./cafePage?cafe_no=" +cafeNo;
	}                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
	
	@RequestMapping("cafePage")
	public String cafePage(Model model, int cafe_no, HttpSession session) {
		
		FP_CafeVo cafeVo = cafeService.getCafeData(cafe_no);
	 	FP_MemberVo memberVo = (FP_MemberVo) session.getAttribute("sessionUserInfo");
	 	int mb_no = memberVo.getMb_no();
		FP_CafeMemberVo cafeMemberVo = cafeService.getCafeMemberDataByMemberNo(cafe_no, mb_no);
     	ArrayList<HashMap<String, Object>> categoryList = cafeBoardService.getCafeBoardCategoryList(cafe_no);
     	ArrayList<HashMap<String, Object>> boardList = cafeBoardService.getFullTextByCafe(cafe_no);
     	FP_CafeVo cafeVo2 = cafeService.getCafeData(cafe_no);
     	cafeVo2.setCafeMember_limit(cafeService.currentCafeMemberCount(cafe_no));
     	ArrayList<HashMap<String, Object>> memberList = cafeService.getCafeMemberList(cafe_no);
	
		model.addAttribute("cafeVo", cafeVo);
		model.addAttribute("cafeMemberVo", cafeMemberVo);
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("boardList", boardList);
		model.addAttribute("memberVo", memberVo);
		model.addAttribute("cafeVo2", cafeVo2);
		model.addAttribute("memberList", memberList);
		
		return "cafe/cafePage";
	}
	
	@RequestMapping("registerCompletePage")
	public String registerCompletePage(Model model, int cafe_no) {
		
		FP_CafeVo cafeVo = cafeService.getCafeData(cafe_no);
		model.addAttribute("cafeVo", cafeVo);
		
		return "cafe/registerCompletePage";
	}
	
	@RequestMapping("alarmRegisterPage")
	public String alarmRegisterPage(Model model, int cafe_no) {
		FP_CafeVo cafeVo = cafeService.getCafeData(cafe_no);
     	FP_CafeVo cafeVo2 = cafeService.getCafeData(cafe_no);
     	cafeVo2.setCafeMember_limit(cafeService.currentCafeMemberCount(cafe_no));
     	ArrayList<HashMap<String, Object>> memberList = cafeService.getCafeMemberList(cafe_no);
		
		model.addAttribute("cafeVo", cafeVo);
		model.addAttribute("cafeVo2", cafeVo2);
		model.addAttribute("memberList", memberList);
		
		return "cafe/alarmRegisterPage";
	}
	
	@RequestMapping("cafeMemberManagePage")
	public String cafeMemberManagePage(Model model,int cafe_no, HttpSession session) {
		FP_MemberVo memberVo = (FP_MemberVo) session.getAttribute("sessionUserInfo");
		FP_CafeMemberVo cafeMemberVo = cafeService.getCafeMemberDataByMemberNo(cafe_no, memberVo.getMb_no());
		FP_CafeVo cafeVo = cafeService.getCafeData(cafe_no);
		FP_CafeVo cafeVo2 = cafeService.getCafeData(cafe_no);
		ArrayList<HashMap<String, Object>> dataList = cafeService.getCafeMemberList(cafe_no);
		cafeVo2.setCafeMember_limit(cafeService.currentCafeMemberCount(cafe_no));
		ArrayList<HashMap<String, Object>> memberList = cafeService.getCafeMemberList(cafe_no);
		
		model.addAttribute("dataList", dataList);
		model.addAttribute("cafeVo", cafeVo);
		model.addAttribute("cafeVo2", cafeVo2);
		model.addAttribute("memberVo", memberVo);
		model.addAttribute("cafeMemberVo", cafeMemberVo);
		model.addAttribute("memberList", memberList);
		
		return "cafe/cafeMemberManagePage";
	}
	
	@RequestMapping("alramMemberLimitePage")
	public String alramMemberLimitePage(Model model,int cafe_no) {
		FP_CafeVo cafeVo = cafeService.getCafeData(cafe_no);
     	FP_CafeVo cafeVo2 = cafeService.getCafeData(cafe_no);
     	cafeVo2.setCafeMember_limit(cafeService.currentCafeMemberCount(cafe_no));
     	ArrayList<HashMap<String, Object>> memberList = cafeService.getCafeMemberList(cafe_no);
		
		model.addAttribute("cafeVo", cafeVo);
		model.addAttribute("cafeVo2", cafeVo2);
		model.addAttribute("memberList", memberList);
		return "cafe/alramMemberLimitePage";
	}
}

