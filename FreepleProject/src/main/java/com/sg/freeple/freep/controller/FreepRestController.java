package com.sg.freeple.freep.controller;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sg.freeple.freep.service.FreepRestService;
import com.sg.freeple.vo.FP_FreepReviewLikeVo;
import com.sg.freeple.vo.FP_FreepReviewReplyVo;
import com.sg.freeple.vo.FP_MemberCouponVo;
import com.sg.freeple.vo.FP_MemberVo;

@RestController
@RequestMapping("/freep/*")
public class FreepRestController {

	@Autowired
	private FreepRestService freepRestService;
	
	@RequestMapping("doFreepReviewLike")
	public HashMap<String, Object> doFreepReviewLike(FP_FreepReviewLikeVo fp_FreepReviewLikeVo, HttpSession session){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		FP_MemberVo fp_MemberVo = (FP_MemberVo)session.getAttribute("sessionUserInfo");
		int mb_no = fp_MemberVo.getMb_no();
		
		fp_FreepReviewLikeVo.setMb_no(mb_no);
		
		freepRestService.doFreepReviewLike(fp_FreepReviewLikeVo);
		
		map.put("result", "success");
		
		return map;
	}
	
	
	@RequestMapping("getCountReviewLikeByFreepNo")
	public HashMap<String, Object> getCountReviewLikeByFreepNo(int freep_no){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<Integer> count = freepRestService.getCountReviewLikeByFreepNo(freep_no);
		
		map.put("result","success");
		map.put("count", count);
		map.put("countSize", count.size());
		
		return map;
	}
	
	
	@RequestMapping("isReviewLiked")
	public HashMap<String, Object> isReviewLiked(FP_FreepReviewLikeVo fp_FreepReviewLikeVo,HttpSession session){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		FP_MemberVo fp_MemberVo = (FP_MemberVo)session.getAttribute("sessionUserInfo");
		int mb_no = fp_MemberVo.getMb_no();
		fp_FreepReviewLikeVo.setMb_no(mb_no);
		
		map.put("result","success");
		map.put("likePushOX", freepRestService.isReviewLiked(fp_FreepReviewLikeVo));
		
		return map;
	}
	
	// 결제 관련 모달 에이작스 로직	
	@RequestMapping("getReservationDates")
	public HashMap<String, Object> getReservationDates(int freep_no){
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		String[] reservationDates = freepRestService.getReservationDates(freep_no);
		
		map.put("reservationDates", reservationDates);
		
		return map;
	}
	
	@RequestMapping("getCouponList")
	public HashMap<String, Object> getCouponList(HttpSession session){
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		ArrayList<HashMap<String, Object>> couponList = freepRestService.getCouponList(((FP_MemberVo) session.getAttribute("sessionUserInfo")).getMb_no());
				
		map.put("couponList", couponList);
		map.put("couponListSize", couponList.size());
		
		return map;
	}
	
	@RequestMapping("getOneCoupon")
	public HashMap<String, Object> getOneCoupon(int coupon_no){
		HashMap<String, Object> map = new HashMap<String, Object>();
		FP_MemberCouponVo fp_MemberCouponVo = freepRestService.getOneCoupon(coupon_no);
		
		map.put("fp_MemberCouponVo",fp_MemberCouponVo);
		map.put("couponPriceStringFormat", new DecimalFormat("###,###").format(fp_MemberCouponVo.getSale_price()));
		
		return map;
	}
	
	@RequestMapping("freepReviewReply")
	public HashMap<String, Object> freepReviewReply(FP_FreepReviewReplyVo fp_FreepReviewReplyVo){
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		freepRestService.freepReviewReplyRegister(fp_FreepReviewReplyVo);
		
		map.put("result","success");

		return map;
	}
	

	
}
