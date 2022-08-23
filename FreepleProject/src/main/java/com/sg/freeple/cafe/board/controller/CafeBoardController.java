package com.sg.freeple.cafe.board.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.apache.commons.text.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.sg.freeple.cafe.board.service.CafeBoardServiceImpl;
import com.sg.freeple.cafe.service.CafeServiceImpl;
import com.sg.freeple.vo.FP_CafeBoardImageVo;
import com.sg.freeple.vo.FP_CafeBoard_CategoryVo;
import com.sg.freeple.vo.FP_CafeMemberVo;
import com.sg.freeple.vo.FP_CafeVo;
import com.sg.freeple.vo.FP_MemberVo;
import com.sg.freeple.vo.FP_WriteBoardVo;

@RequestMapping("cafe/cafeBoard/*")
@Controller
public class CafeBoardController {
	
	@Autowired
	private CafeServiceImpl cafeService;
	@Autowired
	private CafeBoardServiceImpl cafeBoardService;
	
	//게시판 카테고리
	@RequestMapping("cafeBoardPage")
	public String cafeBoardPage(Model model, int cafe_no, HttpSession session) {
		FP_MemberVo memberVo = (FP_MemberVo) session.getAttribute("sessionUserInfo");
		FP_CafeMemberVo cafeMemberVo = cafeService.getCafeMemberDataByMemberNo(cafe_no, memberVo.getMb_no());
     	FP_CafeVo cafeVo2 = cafeService.getCafeData(cafe_no);
     	cafeVo2.setCafeMember_limit(cafeService.currentCafeMemberCount(cafe_no));
     	ArrayList<HashMap<String, Object>> memberList = cafeService.getCafeMemberList(cafe_no);
     	
		ArrayList<HashMap<String, Object>> dataList = cafeBoardService.getCafeBoardCategoryList(cafe_no);
		
		FP_CafeVo cafeVo = cafeService.getCafeData(cafe_no);
		model.addAttribute("cafeVo", cafeVo);
		model.addAttribute("cafeMemberVo", cafeMemberVo);
		model.addAttribute("dataList", dataList);
		model.addAttribute("cafeVo2", cafeVo2);
		
		return "cafe/cafeBoard/cafeBoardPage";
	}
	
	//카페 게시판
	@RequestMapping("boardByCategoryPage")
	public String boardByCategoryPage(Model model, FP_CafeBoard_CategoryVo cafeBoard_CategoryVo, HttpSession session) {
		
		FP_MemberVo memberVo= (FP_MemberVo) session.getAttribute("sessionUserInfo");
		FP_CafeMemberVo cafeMemberVo= cafeService.getCafeMemberDataByMemberNo(cafeBoard_CategoryVo.getCafe_no(), memberVo.getMb_no());
		FP_CafeBoard_CategoryVo cafe= cafeBoardService.getBoardCategoryData(cafeBoard_CategoryVo);
		FP_CafeVo cafeVo = cafeService.getCafeData(cafeBoard_CategoryVo.getCafe_no());
     	FP_CafeVo cafeVo2 = cafeService.getCafeData(cafeBoard_CategoryVo.getCafe_no());
     	cafeVo2.setCafeMember_limit(cafeService.currentCafeMemberCount(cafeBoard_CategoryVo.getCafe_no()));
     	ArrayList<HashMap<String, Object>> memberList = cafeService.getCafeMemberList(cafeBoard_CategoryVo.getCafe_no());
		
		ArrayList<HashMap<String, Object>> dataList = cafeBoardService.getCafeboardList(cafeBoard_CategoryVo.getCafeBoard_Category_no());
		ArrayList<HashMap<String, Object>> categoryList = cafeBoardService.getCafeBoardCategoryList(cafeBoard_CategoryVo.getCafe_no());
		
		model.addAttribute("dataList", dataList);
		model.addAttribute("cafeBoard_CategoryVo", cafe);
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("cafeVo", cafeVo);
		model.addAttribute("memberVo", memberVo);
		model.addAttribute("cafeMemberVo", cafeMemberVo);
		model.addAttribute("cafeVo2", cafeVo2);
		model.addAttribute("countText", cafeBoardService.getCountTextByCategory(cafeBoard_CategoryVo.getCafe_no(), cafeBoard_CategoryVo.getCafeBoard_Category_no()));
		model.addAttribute("memberList", memberList);
		
		return "cafe/cafeBoard/boardByCategoryPage";
	}
	
	//게시글 작성페이지
	@RequestMapping("writeBoardPage")
	public String writeBoardPage(Model model,FP_CafeBoard_CategoryVo cafeBoard_CategoryVo, HttpSession session) {
		
		FP_MemberVo memberVo = (FP_MemberVo) session.getAttribute("sessionUserInfo");
		FP_CafeMemberVo cafeMemberVo = cafeService.getCafeMemberDataByMemberNo(cafeBoard_CategoryVo.getCafe_no(),memberVo.getMb_no());
		FP_CafeVo cafeVo = cafeService.getCafeData(cafeBoard_CategoryVo.getCafe_no());
     	FP_CafeVo cafeVo2 = cafeService.getCafeData(cafeBoard_CategoryVo.getCafe_no());
     	cafeVo2.setCafeMember_limit(cafeService.currentCafeMemberCount(cafeBoard_CategoryVo.getCafe_no()));
     	ArrayList<HashMap<String, Object>> memberList = cafeService.getCafeMemberList(cafeBoard_CategoryVo.getCafe_no());
		
		//ArrayList<HashMap<String, Object>> categoryList = cafeBoardService.getCafeboardList(cafeBoard_CategoryVo.getCafe_no());
		ArrayList<HashMap<String, Object>> categoryList = cafeBoardService.getCafeBoardCategoryList(cafeBoard_CategoryVo.getCafe_no());
		
		FP_CafeBoard_CategoryVo cafe= cafeBoardService.getBoardCategoryData(cafeBoard_CategoryVo);
		
		model.addAttribute("cafeBoard_CategoryVo", cafe);
		model.addAttribute("cafeMemberVo", cafeMemberVo);
		model.addAttribute("cafeVo", cafeVo);
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("cafeVo2", cafeVo2);
		model.addAttribute("memberList", memberList);
		
		return "cafe/cafeBoard/writeBoardPage";
	}
	
	//게시글 작성페이지-다시만듦
	@RequestMapping("writeCafeBoardPage")
	public String writeCafeBoardPage(Model model,HttpSession session, int cafe_no) {
		FP_MemberVo memberVo = (FP_MemberVo) session.getAttribute("sessionUserInfo");
		FP_CafeMemberVo cafeMemberVo = cafeService.getCafeMemberDataByMemberNo(cafe_no,memberVo.getMb_no());
		FP_CafeVo cafeVo = cafeService.getCafeData(cafe_no);
		ArrayList<HashMap<String, Object>> categoryList = cafeBoardService.getCafeBoardCategoryList(cafe_no);
     	FP_CafeVo cafeVo2 = cafeService.getCafeData(cafe_no);
     	cafeVo2.setCafeMember_limit(cafeService.currentCafeMemberCount(cafe_no));
     	ArrayList<HashMap<String, Object>> memberList = cafeService.getCafeMemberList(cafe_no);
     	
		model.addAttribute("memberVo", memberVo);
		model.addAttribute("cafeMemberVo", cafeMemberVo);
		model.addAttribute("cafeVo", cafeVo);
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("cafeVo2", cafeVo2);
		model.addAttribute("memberList", memberList);
		
		return "cafe/cafeBoard/writeCafeBoardPage";
	}
	
	@RequestMapping("writeBoardProcess")
	public String writeBoardProcess(FP_WriteBoardVo writeBoardVo, MultipartFile[] files) {
		
		ArrayList<FP_CafeBoardImageVo> ImageList = new ArrayList<FP_CafeBoardImageVo>();
		for(MultipartFile file : files) {
			if(file.isEmpty()) {
				continue;
			}
			
			String rootFilePath = "C:/uploadFiles/";
			
			String origimalFilename = file.getOriginalFilename();
			String randomName = UUID.randomUUID().toString();
			randomName += "_" + System.currentTimeMillis();
			
			String ext = origimalFilename.substring(origimalFilename.lastIndexOf("."));
			randomName += ext;
			
			Date today = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd/");
			String todayFolderName = sdf.format(today);
			
			File todayFolder = new File(rootFilePath + todayFolderName);
			if(!todayFolder.exists()) {
				todayFolder.mkdirs();
			}
			
			try {
				file.transferTo(new File(rootFilePath + todayFolderName + randomName));
			}catch(Exception e) {
				e.printStackTrace();
			}
			FP_CafeBoardImageVo cafeBoardImageVo = new FP_CafeBoardImageVo();
			cafeBoardImageVo.setCafeBoImage_link(todayFolderName +randomName);
			cafeBoardImageVo.setCafeBoImage_original_filename(origimalFilename);
			
			ImageList.add(cafeBoardImageVo);
		}
		
		 FP_CafeBoard_CategoryVo cafeBoard_CategoryVo= cafeBoardService.getSelectCategoryByNo(writeBoardVo.getCafeBoard_Category_no());
		cafeBoardService.writeBoardContent(writeBoardVo, ImageList);
		
		return "redirect:./boardByCategoryPage?cafe_no="+cafeBoard_CategoryVo.getCafe_no()
		+"&cafeBoard_Category_no="+ writeBoardVo.getCafeBoard_Category_no();
	}
	
	@RequestMapping("cafeBoardViewPage")
	public String cafeBoardViewPage(Model model,int writeBoard_no, HttpSession session) {
		cafeBoardService.increaseReadCount(writeBoard_no);
		
		HashMap<String, Object> data = cafeBoardService.getCafeBoardData(writeBoard_no);
		FP_MemberVo memberVo = (FP_MemberVo)session.getAttribute("sessionUserInfo");
		
		FP_WriteBoardVo writeBoardVo = cafeBoardService.getCafeBoardDataByNo(writeBoard_no);
		FP_CafeBoard_CategoryVo cafeBoard_CategoryVo = cafeBoardService.getSelectCategoryByNo(writeBoardVo.getCafeBoard_Category_no());
		FP_CafeVo cafeVo = cafeService.getCafeData(cafeBoard_CategoryVo.getCafe_no());
		ArrayList<HashMap<String, Object>> categoryList = cafeBoardService.getCafeBoardCategoryList(cafeBoard_CategoryVo.getCafe_no());
		FP_CafeMemberVo cafeMemberVo = cafeService.getCafeMemberDataByMemberNo(cafeVo.getCafe_no(),memberVo.getMb_no());
     	FP_CafeVo cafeVo2 = cafeService.getCafeData(cafeBoard_CategoryVo.getCafe_no());
     	cafeVo2.setCafeMember_limit(cafeService.currentCafeMemberCount(cafeBoard_CategoryVo.getCafe_no()));
     	ArrayList<HashMap<String, Object>> memberList = cafeService.getCafeMemberList(cafeBoard_CategoryVo.getCafe_no());
		
		String content = writeBoardVo.getWriteBoard_cotent();
		content = StringEscapeUtils.escapeHtml4(content);
		content = content.replace(" ","&nbsp");
		content = content.replace("\n", "<br>");
		writeBoardVo.setWriteBoard_cotent(content);
		
		model.addAttribute("cafeMemberVo", cafeMemberVo);
		model.addAttribute("cafeBoard_CategoryVo", cafeBoard_CategoryVo);
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("cafeVo", cafeVo);
		model.addAttribute("data", data);
		model.addAttribute("cafeVo2", cafeVo2);
		model.addAttribute("memberList", memberList);
		model.addAttribute("countComment", cafeBoardService.getCountCommentByBoardNo(writeBoard_no));
		
		return "cafe/cafeBoard/cafeBoardViewPage";
	}
	
	@RequestMapping("updateWritePage")
	public String updateWritePage(Model model, int writeBoard_no, HttpSession session) {
		HashMap<String, Object> data = cafeBoardService.getCafeBoardData(writeBoard_no);
		
		FP_MemberVo memberVo = (FP_MemberVo)session.getAttribute("sessionUserInfo");
		FP_WriteBoardVo writeBoardVo = cafeBoardService.getCafeBoardDataByNo(writeBoard_no);
		FP_CafeBoard_CategoryVo cafeBoard_CategoryVo = cafeBoardService.getSelectCategoryByNo(writeBoardVo.getCafeBoard_Category_no());
		FP_CafeVo cafeVo = cafeService.getCafeData(cafeBoard_CategoryVo.getCafe_no());
		FP_CafeMemberVo cafeMemberVo = cafeService.getCafeMemberDataByMemberNo(cafeVo.getCafe_no(),memberVo.getMb_no());
		ArrayList<HashMap<String, Object>> categoryList = cafeBoardService.getCafeBoardCategoryList(cafeBoard_CategoryVo.getCafe_no());
     	FP_CafeVo cafeVo2 = cafeService.getCafeData(cafeBoard_CategoryVo.getCafe_no());
     	cafeVo2.setCafeMember_limit(cafeService.currentCafeMemberCount(cafeBoard_CategoryVo.getCafe_no()));
     	ArrayList<HashMap<String, Object>> memberList = cafeService.getCafeMemberList(cafeBoard_CategoryVo.getCafe_no());
		
		model.addAttribute("cafeMemberVo", cafeMemberVo);
		model.addAttribute("cafeBoard_CategoryVo", cafeBoard_CategoryVo);
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("cafeVo", cafeVo);
		model.addAttribute("data", data);
		model.addAttribute("cafeVo2", cafeVo2);
		model.addAttribute("memberList", memberList);
		
		return "cafe/cafeBoard/updateWritePage";
	}
	@RequestMapping("updateBoardProcess")
	public String updateBoardProcess(FP_WriteBoardVo writeBoardVo) {
		cafeBoardService.updateCafeBoard(writeBoardVo);
		
		return "redirect:./cafeBoardViewPage?writeBoard_no="+writeBoardVo.getWriteBoard_no();
	}
	
	//전체글 보기
	@RequestMapping("fullCafeBoardPage")
	public String fullCafeBoardPage(Model model, int cafe_no, HttpSession session) {
		FP_MemberVo memberVo= (FP_MemberVo) session.getAttribute("sessionUserInfo");
		FP_CafeMemberVo cafeMemberVo= cafeService.getCafeMemberDataByMemberNo(cafe_no, memberVo.getMb_no());
		FP_CafeVo cafeVo = cafeService.getCafeData(cafe_no);
     	FP_CafeVo cafeVo2 = cafeService.getCafeData(cafe_no);
     	cafeVo2.setCafeMember_limit(cafeService.currentCafeMemberCount(cafe_no));
		ArrayList<HashMap<String, Object>> categoryList = cafeBoardService.getCafeBoardCategoryList(cafe_no);
		ArrayList<HashMap<String, Object>> memberList = cafeService.getCafeMemberList(cafe_no);
		
		ArrayList<HashMap<String, Object>> boardList = cafeBoardService.getFullTextByCafe(cafe_no);
		
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("cafeMemberVo",cafeMemberVo);
		model.addAttribute("cafeVo", cafeVo);
		model.addAttribute("boardList", boardList);
		model.addAttribute("cafeVo2", cafeVo2);
		model.addAttribute("countText", cafeBoardService.getCountTotalText(cafe_no));
		model.addAttribute("memberList", memberList);
		
		return "cafe/cafeBoard/fullCafeBoardPage"; 
	}
	
	@RequestMapping("cafeBoardSettingPage")
	public String cafeBoardSetting(Model model, int cafe_no, HttpSession session) {
		
		FP_MemberVo memberVo = (FP_MemberVo) session.getAttribute("sessionUserInfo");
		FP_CafeMemberVo cafeMemberVo = cafeService.getCafeMemberDataByMemberNo(cafe_no, memberVo.getMb_no());
		ArrayList<HashMap<String, Object>> categoryList = cafeBoardService.getCafeBoardCategoryList(cafe_no);
		FP_CafeVo cafeVo2 = cafeService.getCafeData(cafe_no);
		cafeVo2.setCafeMember_limit(cafeService.currentCafeMemberCount(cafe_no));
		ArrayList<HashMap<String, Object>> memberList = cafeService.getCafeMemberList(cafe_no);
		
		FP_CafeVo cafeVo = cafeService.getCafeData(cafe_no);
		model.addAttribute("cafeVo", cafeVo);
		model.addAttribute("cafeMemberVo", cafeMemberVo);
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("cafeVo2", cafeVo2);
		model.addAttribute("memberList", memberList);
		
		return "cafe/cafeBoard/cafeBoardSettingPage"; 
	}
}














