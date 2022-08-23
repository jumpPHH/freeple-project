package com.sg.freeple.member.coupon.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sg.freeple.member.coupon.mapper.MemberCouponSQLMapper;
import com.sg.freeple.vo.FP_MemberCouponVo;

@Service
public class MemberCouponService {
	
	@Autowired
	private MemberCouponSQLMapper memberCouponSQLMapper;
	
	public void updateCouponUnavailableByCouponNo(int coupon_no) {
		memberCouponSQLMapper.updateCouponUnavailableByCouponNo(coupon_no);
	}
	
	public ArrayList<FP_MemberCouponVo> getAllCouponListByLoginUserMbNo(int mb_no) {
		return memberCouponSQLMapper.selectAllCouponByMemberNo(mb_no);		
	}
}
