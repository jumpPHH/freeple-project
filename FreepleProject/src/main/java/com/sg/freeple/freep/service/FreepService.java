package com.sg.freeple.freep.service;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sg.freeple.freep.mapper.FreepSQLMapper;
import com.sg.freeple.member.coupon.mapper.MemberCouponSQLMapper;
import com.sg.freeple.vo.FP_FreepCategoryVo;
import com.sg.freeple.vo.FP_FreepImageVo;
import com.sg.freeple.vo.FP_FreepReviewImageVo;
import com.sg.freeple.vo.FP_FreepReviewReplyVo;
import com.sg.freeple.vo.FP_FreepVo;
import com.sg.freeple.vo.FP_MemberCouponVo;
import com.sg.freeple.vo.FP_MemberVo;
import com.sg.freeple.vo.FP_PaymentVo;
import com.sg.freeple.vo.FP_SendMoneyVo;
import com.sg.freeple.vo.FreepReviewAllInfoVo;

@Service
public class FreepService {
	@Autowired
	private FreepSQLMapper freepSQLMapper;
	@Autowired
	private MemberCouponSQLMapper memberCouponSQLMapper;
	
	public ArrayList<FP_FreepCategoryVo> getAllCategoryList(){
		return freepSQLMapper.selectAllCategory();
	}
	
	public String getCategoryName(int freep_ctg_no) {
		return freepSQLMapper.selectCategoryNameByNo(freep_ctg_no);
	}
	 
	public int getNumerOfFreep(int freep_ctg_no,String searchWord) {
		return freepSQLMapper.countFreepByCategoryNoOrSearchWord(freep_ctg_no,searchWord);
	}
	
	public ArrayList<HashMap<String, Object>> getFreepList(int pageNum, int freep_ctg_no, String searchWord,String filterInOrderType) {
		ArrayList<HashMap<String, Object>> freepListContainingImage = new ArrayList<HashMap<String,Object>>();
		
		ArrayList<FP_FreepVo> freepVolist = freepSQLMapper.selectFreepByMultipleCase(pageNum,freep_ctg_no,searchWord,filterInOrderType);
		
		for(FP_FreepVo fP_FreepVo:freepVolist) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			FP_FreepImageVo fP_FreepImageVo = freepSQLMapper.selectFreepMainImageByFreepNo(fP_FreepVo.getFreep_no());
			

			//값은 오는데 에러뜸. 뭔대시발아
			try {
				double avgStarScore = freepSQLMapper.avgStarFromFreepReviewByFreepNo(fP_FreepVo.getFreep_no());
				avgStarScore = Math.round(avgStarScore*10)/10.0;
				map.put("avgStarScore", avgStarScore);//한 프립의 리뷰 평점
			}catch (Exception e) {
				map.put("avgStarScore", 0);
				//double엔 null이 안박힘.
				//리뷰가 없거나 star_status칼럼이 비어있으면 avg 계산을 안하고 null값이옴 -> double에 안들어감 -> 익셉션뜨는듯
			}
		
			int numberOfReview = freepSQLMapper.countFreepReviewByFreepNo(fP_FreepVo.getFreep_no());
			
			map.put("fP_FreepVo", fP_FreepVo);//한 프립의 정보
			map.put("fP_FreepImageVo", fP_FreepImageVo);//한 프립의 대표사진(프립등록할때 올린 제일 첫번째 사진)
			map.put("numberOfReview", numberOfReview);//한 프립의 리뷰 총갯수
			
			DecimalFormat decFormat = new DecimalFormat("###,###");
			String priceStringFormat = decFormat.format(fP_FreepVo.getFreep_price());
			map.put("priceStringFormat", priceStringFormat);
			
			freepListContainingImage.add(map);
		}
		
		return  freepListContainingImage;
	}
	
	public ArrayList<HashMap<String, Object>> getFreepReviewData(int freep_no) {
		
		ArrayList<HashMap<String, Object>> freepReviewAllData = new ArrayList<HashMap<String,Object>>();
		
		ArrayList<FreepReviewAllInfoVo> freepReviewList = freepSQLMapper.selectFreepReviewAllData(freep_no);
	
		for (FreepReviewAllInfoVo freepReviewAllInfoVo : freepReviewList) {
			HashMap<String, Object> map = new HashMap<String, Object>();
					
			int review_no = freepReviewAllInfoVo.getReview_no();
			int mb_no = freepReviewAllInfoVo.getMb_no();
			
			ArrayList<FP_FreepReviewImageVo> freepReivewImageList = freepSQLMapper.selectFreepReviewImageList(review_no);
			
			FP_FreepReviewImageVo freepReivewImgThumbnail = freepSQLMapper.selectFreepReviewImageThumbnail(freep_no,review_no);
			
			FP_FreepReviewReplyVo fp_FreepReviewReplyVo = new FP_FreepReviewReplyVo();
			fp_FreepReviewReplyVo.setFreep_no(freep_no);
			fp_FreepReviewReplyVo.setMb_no(mb_no);
			fp_FreepReviewReplyVo.setReview_no(review_no);
			
			ArrayList<FP_FreepReviewReplyVo> freepReviewReplyList = freepSQLMapper.selectFreepReviewReplyData(fp_FreepReviewReplyVo);

			map.put("freepReviewList", freepReviewAllInfoVo);
			map.put("freepReviewImageList", freepReivewImageList);
			map.put("freepReviewImgThumbnail", freepReivewImgThumbnail);
			map.put("freepReviewReplyList", freepReviewReplyList);
			
			try {
				double starScore = freepSQLMapper.starFromFreepReviewByReviewNo(review_no);
				starScore = Math.round(starScore*10)/10.0;
				map.put("starScore", starScore);
			}catch (Exception e) {
				map.put("starScore", 0);
			}
			
			try {
				double avgStarScore = freepSQLMapper.avgStarFromFreepReviewByFreepNo(freep_no);
				avgStarScore = Math.round(avgStarScore*10)/10.0;
				map.put("avgStarScore", avgStarScore);
			}catch (Exception e) {
				map.put("avgStarScore", 0);

			}

			freepReviewAllData.add(map);
		}
				
		return freepReviewAllData;
	}	
	
	public int getReviewCount(int freep_no)  {
		
		return freepSQLMapper.selectReviewCount(freep_no);
	}
	
	public FP_FreepVo getFreep(int freep_no) {
		return freepSQLMapper.selectFreepByFreepNo(freep_no);
	}
	public ArrayList<FP_FreepImageVo> getFreepImage(int freep_no) {
		return freepSQLMapper.selectFreepImageByFreepNo(freep_no);
	}
	
	public FP_MemberVo getFreepHostInfo(int freep_no) {
		
		return freepSQLMapper.selectFreepHostInfo(freep_no);
	}
	
	public FP_MemberVo getFreepSessionUserInfo(int mb_no , int freep_no) {
		
		return freepSQLMapper.selectFreepSessionUserInfo(mb_no,freep_no);
	}
	
	public ArrayList<FP_FreepReviewReplyVo> getFreepReviewReplyList(FP_FreepReviewReplyVo fp_FreepReviewReplyVo){
		
		return freepSQLMapper.selectFreepReviewReplyData(fp_FreepReviewReplyVo);
	}
	
	
	public void insertReservedFreep(FP_PaymentVo fP_PaymentVo,int loginUserMb_No) {
		int payment_no = freepSQLMapper.selectPaymentSequenceNumber();
		fP_PaymentVo.setPayment_no(payment_no);
		freepSQLMapper.insertPaymentByReservedFreep(fP_PaymentVo);// FP_Payment 추가
		freepSQLMapper.insertAcceptByReservedFreep(payment_no);	// FP_Accept 추가
		
		int freep_price = freepSQLMapper.selectFreepPriceByFreepNo(fP_PaymentVo.getFreep_no());
		int coupon_price=0;
		
		int coupon_No = fP_PaymentVo.getCoupon_no();
		if(coupon_No>0) {
			coupon_price = memberCouponSQLMapper.selectCouponPriceByCouponNo(coupon_No);
		}
		
		FP_SendMoneyVo fp_SendMoneyVo = new FP_SendMoneyVo();
		fp_SendMoneyVo.setPayment_no(payment_no);
		fp_SendMoneyVo.setSendMoney_sender(loginUserMb_No);
		fp_SendMoneyVo.setSendMoney_depositor(-1);//관리자한테 보내는것은 -1로 정함
		fp_SendMoneyVo.setSendMoney_money(freep_price-coupon_price);
				
		freepSQLMapper.insertSendMoney(fp_SendMoneyVo);// FP_SendMoney 추가
	}
	
	public ArrayList<HashMap<String, Object>> getReservedBeforeJoinFreepList(int mb_no){
		ArrayList<HashMap<String, Object>> myFreepList = new ArrayList<HashMap<String,Object>>();
		
		ArrayList<FP_PaymentVo> paymentList = freepSQLMapper.selectPaymentBeforJoinByMemberNo(mb_no);
		
		for(FP_PaymentVo fp_PaymentVo:paymentList) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			FP_FreepVo fP_FreepVo = freepSQLMapper.selectFreepByFreepNo(fp_PaymentVo.getFreep_no());
			int freepPrice = fP_FreepVo.getFreep_price();
			int couponPrice=0;
			if(fp_PaymentVo.getCoupon_no()>0) {
				couponPrice = memberCouponSQLMapper.selectCouponPriceByCouponNo(fp_PaymentVo.getCoupon_no());
			}
			FP_MemberCouponVo fp_MemberCouponVo = memberCouponSQLMapper.selectOneCouponByCouponNo(fp_PaymentVo.getCoupon_no());
			String resultPriceStringFormat = new DecimalFormat("###,###").format(freepPrice-couponPrice);
			FP_FreepImageVo fp_FreepImageVo = freepSQLMapper.selectFreepMainImageByFreepNo(fp_PaymentVo.getFreep_no());
			
			map.put("fp_PaymentVo", fp_PaymentVo);
			map.put("fp_MemberCouponVo", fp_MemberCouponVo);
			map.put("fP_FreepVo", fP_FreepVo);
			map.put("fP_FreepImageVo", fp_FreepImageVo);
			map.put("resultPriceStringFormat", resultPriceStringFormat);
			
			myFreepList.add(map);
		}
		
		return myFreepList;
	}
	
	public ArrayList<HashMap<String, Object>> getReservedAfterJoinFreepList(int mb_no){
		ArrayList<HashMap<String, Object>> myFreepList = new ArrayList<HashMap<String,Object>>();
		
		ArrayList<FP_PaymentVo> paymentList = freepSQLMapper.selectPaymentAfterJoinByMemberNo(mb_no);
		
		for(FP_PaymentVo fp_PaymentVo:paymentList) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			FP_FreepVo fP_FreepVo = freepSQLMapper.selectFreepByFreepNo(fp_PaymentVo.getFreep_no());
			int freepPrice = fP_FreepVo.getFreep_price();
			int couponPrice=0;
			if(fp_PaymentVo.getCoupon_no()>0) {
				couponPrice = memberCouponSQLMapper.selectCouponPriceByCouponNo(fp_PaymentVo.getCoupon_no());
			}
			String resultPriceStringFormat = new DecimalFormat("###,###").format(freepPrice-couponPrice);
			FP_FreepImageVo fp_FreepImageVo = freepSQLMapper.selectFreepMainImageByFreepNo(fp_PaymentVo.getFreep_no());
			
			map.put("fp_PaymentVo", fp_PaymentVo);
			map.put("fP_FreepVo", fP_FreepVo);
			map.put("fP_FreepImageVo", fp_FreepImageVo);
			map.put("resultPriceStringFormat", resultPriceStringFormat);
			
			myFreepList.add(map);
		}
		
		return myFreepList;
	}
	
}
