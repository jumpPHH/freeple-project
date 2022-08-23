package com.sg.freeple.member.coupon.mapper;

import java.util.ArrayList;

import com.sg.freeple.vo.FP_MemberCouponVo;

public interface MemberCouponSQLMapper {

	public ArrayList<FP_MemberCouponVo> selectAllCouponByMemberNo(int mb_no);
	public FP_MemberCouponVo selectOneCouponByCouponNo(int coupon_no);
	public int selectCouponPriceByCouponNo(int coupon_no);
	public void updateCouponUnavailableByCouponNo(int coupon_no);
}
