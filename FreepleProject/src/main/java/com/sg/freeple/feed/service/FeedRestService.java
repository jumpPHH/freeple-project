package com.sg.freeple.feed.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sg.freeple.feed.mapper.FeedRestSQLMapper;
import com.sg.freeple.vo.FP_FreepFeedCommentVo;
import com.sg.freeple.vo.FP_MemberVo;


@Service
public class FeedRestService {
	
	@Autowired
	private FeedRestSQLMapper feedRestSQLMapper;
	
	
	public void writeFeedComment(FP_FreepFeedCommentVo fp_FreepFeedCommentVo) {
		feedRestSQLMapper.insertFeedComment(fp_FreepFeedCommentVo);
		
	}
	
	public ArrayList<HashMap<String, Object>> getFeedCommentList(int review_no){
		ArrayList<HashMap<String, Object>> datas = new ArrayList<HashMap<String,Object>>();
		
		ArrayList<FP_FreepFeedCommentVo> fp_FreepFeedCommentList = feedRestSQLMapper.selectFeedCommentList(review_no);
		
		for(FP_FreepFeedCommentVo fp_FreepFeedCommentVo : fp_FreepFeedCommentList){
			int mb_no = fp_FreepFeedCommentVo.getMember_no();
			FP_MemberVo fp_MemverVo = feedRestSQLMapper.selectMemberByNo(mb_no);
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("fp_FreepFeedCommentVo", fp_FreepFeedCommentVo);
			map.put("fp_MemverVo", fp_MemverVo);
			datas.add(map);
		}
		
		return datas;
		
	}
	
	public void deleteFeedComment(int comment_no) {
		feedRestSQLMapper.deleteFeedComment(comment_no);
	}
	
	public void updateFeedComment(FP_FreepFeedCommentVo fp_FreepFeedCommentVo) {
		feedRestSQLMapper.updateFeedComment(fp_FreepFeedCommentVo);
	}
	
	public boolean isExistId(String mbId) {
		
		if(feedRestSQLMapper.selectCountById(mbId)>0) {
			return true;
		}else {
			return false;
		}
			
	}
}