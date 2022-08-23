package com.sg.freeple.feed.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sg.freeple.review.service.ReviewService;

@Controller
@RequestMapping("/feed/*")
public class FeedController {
	
	@Autowired
	private ReviewService reviewService; 
	
	@RequestMapping("feedMainPage")
	public String feedMainPage (Model model) {
		
		ArrayList<HashMap<String, Object>> reviewDataList = reviewService.getReviewDataList();
		model.addAttribute("reviewDataList",reviewDataList);
		
		
		return "feed/feedMainPage";
	}
	
	@RequestMapping("feedCommentWritePage")
	public String feedCommentWritePage(Model model, int review_no, HttpSession session) {
		
		ArrayList<HashMap<String, Object>> reviewDataList = reviewService.getReviewDataList();
		model.addAttribute("reviewDataList",reviewDataList);
		model.addAttribute("review_no" , review_no);
		
		return "feed/feedCommentWritePage";
	}
}
	


