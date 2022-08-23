package com.sg.freeple.freep.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.sg.freeple.vo.FP_FreepCategoryVo;
import com.sg.freeple.vo.FP_FreepImageVo;
import com.sg.freeple.vo.FP_FreepReviewImageVo;
import com.sg.freeple.vo.FP_FreepReviewReplyVo;
import com.sg.freeple.vo.FP_FreepVo;
import com.sg.freeple.vo.FP_MemberVo;
import com.sg.freeple.vo.FP_PaymentVo;
import com.sg.freeple.vo.FP_SendMoneyVo;
import com.sg.freeple.vo.FreepReviewAllInfoVo;

public interface FreepSQLMapper {
	public ArrayList<FP_FreepCategoryVo> selectAllCategory();
	public String selectCategoryNameByNo(int freep_ctg_no);
	public int countFreepByCategoryNoOrSearchWord(@Param("freep_ctg_no") int freep_ctg_no,
												  @Param("searchWord") String searchWord);
	public ArrayList<FP_FreepVo> selectFreepByMultipleCase(@Param("pageNum") int pageNum,
														 @Param("freep_ctg_no") int freep_ctg_no,
														 @Param("searchWord") String searchWord,
														 @Param("filterInOrderType") String filterInOrderType);
	public FP_FreepImageVo selectFreepMainImageByFreepNo(int freep_no);
	public double avgStarFromFreepReviewByFreepNo(int freep_no);
	public int countFreepReviewByFreepNo(int freep_no);
	
	public FP_FreepVo selectFreepByFreepNo(int freep_no);
	public ArrayList<FP_FreepImageVo> selectFreepImageByFreepNo(int freep_no);
	
	public int selectFreepPriceByFreepNo(int freep_no);
	public int selectPaymentSequenceNumber();
	public void insertPaymentByReservedFreep(FP_PaymentVo fP_PaymentVo);
	public void insertAcceptByReservedFreep(int payment_no);
	public void insertSendMoney(FP_SendMoneyVo fp_SendMoneyVo);
	public ArrayList<FP_PaymentVo> selectPaymentBeforJoinByMemberNo(int mb_no);
	public ArrayList<FP_PaymentVo> selectPaymentAfterJoinByMemberNo(int mb_no);
	
	//프립 상세보기에 따른 프립넘버로 호스트 정보를 출력.
	public FP_MemberVo selectFreepHostInfo(int freep_no);
	
	public ArrayList<FreepReviewAllInfoVo> selectFreepReviewAllData(int freep_no);
	
	public int selectReviewCount(int freep_no);
	
	public ArrayList<FP_FreepReviewImageVo> selectFreepReviewImageList(int review_no);
	
	public FP_FreepReviewImageVo selectFreepReviewImageThumbnail(@Param("freep_no")int freep_no,@Param("review_no")int review_no);
	
	public double starFromFreepReviewByReviewNo(int review_no);
	
	public FP_MemberVo selectFreepSessionUserInfo(@Param("mb_no")int mb_no,@Param("freep_no")int freep_no);
	
	public ArrayList<FP_FreepReviewReplyVo> selectFreepReviewReplyData(FP_FreepReviewReplyVo fp_FreepReviewReplyVo);

}
