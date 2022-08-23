package com.sg.freeple.freep.service;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sg.freeple.freep.mapper.FreepRestSQLMapper;
import com.sg.freeple.freep.mapper.FreepSQLMapper;
import com.sg.freeple.member.coupon.mapper.MemberCouponSQLMapper;
import com.sg.freeple.vo.FP_FreepReviewLikeVo;
import com.sg.freeple.vo.FP_FreepReviewReplyVo;
import com.sg.freeple.vo.FP_MemberCouponVo;
import com.sg.freeple.vo.FreepReviewAllInfoVo;

@Service
public class FreepRestService {
	
	@Autowired
	private FreepRestSQLMapper freepRestSQLMapper;
	
	@Autowired
	private FreepSQLMapper freepSQLMapper;
	
	@Autowired
	private MemberCouponSQLMapper memberCouponSQLMapper; 
	
	public void doFreepReviewLike(FP_FreepReviewLikeVo fp_FreepReviewLikeVo) {
		
		if(freepRestSQLMapper.selectCountReviewLikeByReviewNoAndMbNo(fp_FreepReviewLikeVo) > 0) {
			
			freepRestSQLMapper.deleteReviewLike(fp_FreepReviewLikeVo);
		}else {		
			freepRestSQLMapper.insertReviewLike(fp_FreepReviewLikeVo);
		}
	}
	
	public ArrayList<Boolean> isReviewLiked(FP_FreepReviewLikeVo fp_FreepReviewLikeVo) {
	
		int freep_no = fp_FreepReviewLikeVo.getFreep_no();
		
		ArrayList<FreepReviewAllInfoVo> fpReviewAllInfoVos = freepSQLMapper.selectFreepReviewAllData(freep_no);
		
		ArrayList<Boolean> likePushOX = new ArrayList<Boolean>();
		
		for (FreepReviewAllInfoVo freepReviewAllInfoVo : fpReviewAllInfoVos) {
			
			int reviewNo = freepReviewAllInfoVo.getReview_no();
			fp_FreepReviewLikeVo.setReview_no(reviewNo);
			
			if(freepRestSQLMapper.selectCountReviewLikeByReviewNoAndMbNo(fp_FreepReviewLikeVo) > 0) {			
				 likePushOX.add(true);
				
			}else {			
				likePushOX.add(false);
			}			
		}
		
		return likePushOX;
	}
	
	
	public ArrayList<Integer> getCountReviewLikeByFreepNo(int freep_no) {
		
		ArrayList<FreepReviewAllInfoVo> fpReviewAllInfoVos = freepSQLMapper.selectFreepReviewAllData(freep_no);
		
		ArrayList<Integer> countList = new ArrayList<Integer>();
		
		for (FreepReviewAllInfoVo freepReviewAllInfoVo : fpReviewAllInfoVos) {
			int reviewNo = freepReviewAllInfoVo.getReview_no();

			int count =  freepRestSQLMapper.selectCountReviewLikeByFreepNo(reviewNo);
			
			countList.add(count);

		}
		
		return countList;
	}
	
	public void freepReviewReplyRegister(FP_FreepReviewReplyVo fp_FreepReviewReplyVo) {
		
		freepRestSQLMapper.insertFreepReviewReply(fp_FreepReviewReplyVo);
	}
	

	public String[] getReservationDates(int freep_no) {
		Date[] reservationDatesBeforeFormat = freepRestSQLMapper.selectAllJoinDateByFreepNo(freep_no);
		String[] reservationDatesAfterFormat = new String[reservationDatesBeforeFormat.length];
		for(int i=0 ; i<reservationDatesBeforeFormat.length ; i++ ) {
			reservationDatesAfterFormat[i] =new SimpleDateFormat("yyyy-M-d").format(reservationDatesBeforeFormat[i]);
		}
		
		return reservationDatesAfterFormat; 
	}
	
	public ArrayList<HashMap<String, Object>> getCouponList(int mb_no){
		ArrayList<HashMap<String, Object>> couponFullList = new ArrayList<HashMap<String,Object>>();
		
		ArrayList<FP_MemberCouponVo> couponList = memberCouponSQLMapper.selectAllCouponByMemberNo(mb_no);
		for(FP_MemberCouponVo fp_MemberCouponVo : couponList) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("fp_MemberCouponVo", fp_MemberCouponVo);
			map.put("couponPriceStringFormat", new DecimalFormat("###,###").format(fp_MemberCouponVo.getSale_price()));
			
			couponFullList.add(map);
		}
		
		return couponFullList;
	}
	
	public FP_MemberCouponVo getOneCoupon(int coupon_no) {
		return memberCouponSQLMapper.selectOneCouponByCouponNo(coupon_no);
	}
	
	
	
}
