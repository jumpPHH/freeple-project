package com.sg.freeple.feed.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sg.freeple.feed.service.FeedRestService;
import com.sg.freeple.vo.FP_FreepFeedCommentVo;
import com.sg.freeple.vo.FP_MemberVo;

@RestController
@RequestMapping("/feed/*")
public class FeedRestController {
	
	@Autowired
	private FeedRestService feedRestService;
	
	@RequestMapping("writeFeedComment")
	public HashMap<String, Object> writefeedComment(FP_FreepFeedCommentVo param , HttpSession session){
		
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		FP_MemberVo sessionUser = (FP_MemberVo)session.getAttribute("sessionUserInfo");
		int member_no = sessionUser.getMb_no();
		
		param.setMember_no(member_no);
		
		feedRestService.writeFeedComment(param);
		
		return map;
	}
	
	@RequestMapping("getFeedCommentList")
	public HashMap<String, Object> getFeedCommentList(int review_no){
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("result", "success");
		map.put("data", feedRestService.getFeedCommentList(review_no));
		
		return map;
	}
	
	@RequestMapping("deleteFeedComment")
	public HashMap<String, Object> deleteFeedComment(int comment_no){
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		feedRestService.deleteFeedComment(comment_no);
		
		map.put("result", "success");
		
		return map;
	}
	@RequestMapping("updateFeedComment")
	public HashMap<String, Object> updateFeedComment(FP_FreepFeedCommentVo param){
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		feedRestService.updateFeedComment(param);
		
		map.put("result", "success");
		
		return map;
	}
}

