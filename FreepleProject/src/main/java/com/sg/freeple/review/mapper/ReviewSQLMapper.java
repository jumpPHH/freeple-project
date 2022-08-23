package com.sg.freeple.review.mapper;

import java.util.ArrayList;

import com.sg.freeple.vo.FP_FreepReviewImageVo;
import com.sg.freeple.vo.FP_FreepReviewVo;
import com.sg.freeple.vo.FP_MemberVo;

public interface ReviewSQLMapper {
	
	//리뷰등록쿼리
	public int createReviewPk();
	
	public void insertReview(FP_FreepReviewVo param);
	public void insertReviewImage(FP_FreepReviewImageVo fP_FreepReviewImageVo);

	public FP_FreepReviewVo selectReviewByNo(int review_no);
	public FP_MemberVo selectMemberByNo(int mb_no);
	
	public void deleteMyReviewByNo(int review_no);
	public void deleteReviewImageByReviewNo(int review_no);
	public void updateReviewData(FP_FreepReviewVo fp_FreepReviewVo);
	
	public void deleteReviewImageByNo(int review_image_no);
	
	public ArrayList<FP_FreepReviewVo> selectReviewAll();
	public ArrayList<FP_FreepReviewImageVo> selectReviewImageAll(); 
	public ArrayList<FP_FreepReviewImageVo> selectImageByNo(int review_no);
	
	//댓글 
	
	
	

	
}
