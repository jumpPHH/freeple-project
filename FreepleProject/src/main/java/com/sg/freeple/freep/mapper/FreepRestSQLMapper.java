package com.sg.freeple.freep.mapper;

import java.util.ArrayList;
import java.util.Date;

import com.sg.freeple.vo.FP_FreepReviewLikeVo;
import com.sg.freeple.vo.FP_FreepReviewReplyVo;
import com.sg.freeple.vo.FP_MemberCouponVo;

public interface FreepRestSQLMapper {
	
	
	//종아요 T
	public void insertReviewLike(FP_FreepReviewLikeVo fp_FreepReviewLikeVo);
	public void deleteReviewLike(FP_FreepReviewLikeVo fp_FreepReviewLikeVo);
	public int selectCountReviewLikeByFreepNo(int review_no);
	public int selectCountReviewLikeByReviewNoAndMbNo(FP_FreepReviewLikeVo fp_FreepReviewLikeVo);
	
	//결제 모달 관련 쿼리.
	public Date[] selectAllJoinDateByFreepNo(int freep_no);

	
	public void insertFreepReviewReply(FP_FreepReviewReplyVo fp_FreepReviewReplyVo);
	
}
