package com.sg.freeple.feed.mapper;

import java.util.ArrayList;

import com.sg.freeple.vo.FP_FreepFeedCommentVo;
import com.sg.freeple.vo.FP_MemberVo;

public interface FeedRestSQLMapper {
	
	//댓글
	public void insertFeedComment(FP_FreepFeedCommentVo fp_FreepFeedCommentVo);
	public ArrayList<FP_FreepFeedCommentVo> selectFeedCommentList(int review_no);
	public void deleteFeedComment(int comment_no);
	public void updateFeedComment(FP_FreepFeedCommentVo fp_FreepFeedCommentVo);
	
	public int selectCountById(String mbId);
	
	public FP_MemberVo selectMemberByNo(int mb_no);
	
	
	
}
