package com.sg.freeple.review.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.sg.freeple.review.service.ReviewService;
import com.sg.freeple.vo.FP_FreepReviewImageVo;
import com.sg.freeple.vo.FP_FreepReviewVo;
import com.sg.freeple.vo.FP_MemberVo;

@Controller
@RequestMapping("/review/*")
public class ReviewController {
	
	@Autowired
	private ReviewService reviewService;
	
	
	@RequestMapping("reviewWritePage")
	public String reviewWritePage() {
		
		
		return "review/reviewWritePage";
	}
	
	@RequestMapping("myReviewPage")
	public String myReviewPage(Model model) {
		
		ArrayList<HashMap<String, Object>>  reviewDataList = reviewService.getReviewDataList();
		model.addAttribute("reviewDataList",reviewDataList);
		
		
		return "review/myReviewPage";
	}
	
	
	@RequestMapping("reviewMainPage")
	public String reviewMainPage(Model model, HttpServletRequest request) {
		
		ArrayList<HashMap<String, Object>>  reviewDataList = reviewService.getReviewDataList();
		model.addAttribute("reviewDataList",reviewDataList);
		
		return "review/reviewMainPage";
	}
	
	
	
	
	@RequestMapping("reviewWriteProcess")
	public String reviewWriteProcess (FP_FreepReviewVo fp_FreepReviewVo , MultipartFile [] files , HttpSession session) {
		
		ArrayList<FP_FreepReviewImageVo> fP_FreepReviewImageVoList = new ArrayList<FP_FreepReviewImageVo>();
		
		for(MultipartFile file : files) {
			if(file.isEmpty()) {
				continue;
			}
			
			String rootFilePath = "C:/uploadFiles/freep/freepImage/";
			
			String originalFilename = file.getOriginalFilename();
			
			String randomName = UUID.randomUUID().toString();
			randomName += "_" + System.currentTimeMillis();
			
			String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
			randomName += ext;
			
			Date today = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd/");
			String todayFolderName = sdf.format(today);
			
			
			File todayFolder = new File(rootFilePath + todayFolderName);
			if(!todayFolder.exists()) {
				todayFolder.mkdirs();
			}
			try{
				//실질적 저장 API...
				file.transferTo(new File(rootFilePath + todayFolderName + randomName));
			}catch(Exception e) {
				e.printStackTrace();
			}
			FP_FreepReviewImageVo fp_FreepReviewImageVo = new FP_FreepReviewImageVo(); 
			fp_FreepReviewImageVo.setReview_image_link(todayFolderName+randomName);
			fp_FreepReviewImageVo.setReview_image_original_filename(originalFilename);
			
			
			fP_FreepReviewImageVoList.add(fp_FreepReviewImageVo);
			
		}
			FP_MemberVo sessionUser = (FP_MemberVo)session.getAttribute("sessionUserInfo");
			int mb_no = sessionUser.getMb_no();
			
			fp_FreepReviewVo.setMb_no(mb_no);
			
			reviewService.reviewRegister(fp_FreepReviewVo , fP_FreepReviewImageVoList);
		
		return "redirect:../review/reviewMainPage";
	}
	
	@RequestMapping("deleteMyReviewProcess")
	public String deleteMyReviewProcess(int review_no) {
		
		reviewService.deleteMyReview(review_no);
		
		return "redirect:../review/myReviewPage";
	}
	@RequestMapping("deleteReviewImageProcess")
	public String deleteReviewImageProcess(int review_image_no,int review_no){
		
		reviewService.deleteReviewImage(review_image_no);
		reviewService.selectReviewImageNo();	
		return "redirect: ../review/updateReviewPage?review_no="+review_no;
	}
	@RequestMapping("updateReviewPage")
	public String updateReviewPage(int review_no, Model model, HttpSession session) {
		
		HashMap<String, Object> reviewdata = reviewService.getReviewUpdateDataList(review_no);
		model.addAttribute("reviewdata" , reviewdata);
			
		return "review/updateReviewPage";
	}
	
	@RequestMapping("updateReviewProcess")
	public String updateReviewProcess(FP_FreepReviewVo fp_FreepReviewVo , MultipartFile [] files , HttpSession session) {
		ArrayList<FP_FreepReviewImageVo> fP_FreepReviewImageVoList = new ArrayList<FP_FreepReviewImageVo>();
		
			for(MultipartFile file : files) {
				if(file.isEmpty()) {
					continue;
				}
				
				String rootFilePath = "C:/uploadFiles/freep/freepImage/";
				
				String originalFilename = file.getOriginalFilename();
				
				String randomName = UUID.randomUUID().toString();
				randomName += "_" + System.currentTimeMillis();
				
				String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
				randomName += ext;
				
				Date today = new Date();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd/");
				String todayFolderName = sdf.format(today);
				
				
				File todayFolder = new File(rootFilePath + todayFolderName);
				if(!todayFolder.exists()) {
					todayFolder.mkdirs();
				}
				try{
					//실질적 저장 API...
					file.transferTo(new File(rootFilePath + todayFolderName + randomName));
				}catch(Exception e) {
					e.printStackTrace();
				}
				FP_FreepReviewImageVo fp_FreepReviewImageVo = new FP_FreepReviewImageVo(); 
				fp_FreepReviewImageVo.setReview_image_link(todayFolderName+randomName);
				fp_FreepReviewImageVo.setReview_image_original_filename(originalFilename);
				fp_FreepReviewImageVo.setReview_no(fp_FreepReviewVo.getReview_no());
				
				fP_FreepReviewImageVoList.add(fp_FreepReviewImageVo);
				
			}
				FP_MemberVo sessionUser = (FP_MemberVo)session.getAttribute("sessionUserInfo");
				int mb_no = sessionUser.getMb_no();
				
				fp_FreepReviewVo.setMb_no(mb_no);
				
				reviewService.updateReviewData(fp_FreepReviewVo , fP_FreepReviewImageVoList);
			
			return "redirect:../review/myReviewPage";
	}
}

