package com.sg.freeple.vo;

public class FP_MemberCouponVo {
	private int coupon_no;
	private int mb_no;
	private int sale_price;
	private String coupon_is;
	private String coupon_expiration;
	
	public FP_MemberCouponVo() {
		// TODO Auto-generated constructor stub
	}

	public FP_MemberCouponVo(int coupon_no, int mb_no, int sale_price, String coupon_is, String coupon_expiration) {
		super();
		this.coupon_no = coupon_no;
		this.mb_no = mb_no;
		this.sale_price = sale_price;
		this.coupon_is = coupon_is;
		this.coupon_expiration = coupon_expiration;
	}

	public int getCoupon_no() {
		return coupon_no;
	}

	public int getMb_no() {
		return mb_no;
	}

	public int getSale_price() {
		return sale_price;
	}

	public String getCoupon_is() {
		return coupon_is;
	}

	public String getCoupon_expiration() {
		return coupon_expiration;
	}

	public void setCoupon_no(int coupon_no) {
		this.coupon_no = coupon_no;
	}

	public void setMb_no(int mb_no) {
		this.mb_no = mb_no;
	}

	public void setSale_price(int sale_price) {
		this.sale_price = sale_price;
	}

	public void setCoupon_is(String coupon_is) {
		this.coupon_is = coupon_is;
	}

	public void setCoupon_expiration(String coupon_expiration) {
		this.coupon_expiration = coupon_expiration;
	}
	
	
}
