package com.sg.freeple.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class FP_PaymentVo {
	private int payment_no;
	private int freep_no;
	private int mb_no;
	private int coupon_no;
	private String payment_method;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date payment_freepJoin_date;
	private Date payment_date;
	
	public FP_PaymentVo() {
		// TODO Auto-generated constructor stub
	}

	public FP_PaymentVo(int payment_no, int freep_no, int mb_no, int coupon_no, String payment_method,
			Date payment_freepJoin_date, Date payment_date) {
		super();
		this.payment_no = payment_no;
		this.freep_no = freep_no;
		this.mb_no = mb_no;
		this.coupon_no = coupon_no;
		this.payment_method = payment_method;
		this.payment_freepJoin_date = payment_freepJoin_date;
		this.payment_date = payment_date;
	}

	public int getPayment_no() {
		return payment_no;
	}

	public int getFreep_no() {
		return freep_no;
	}

	public int getMb_no() {
		return mb_no;
	}

	public int getCoupon_no() {
		return coupon_no;
	}

	public String getPayment_method() {
		return payment_method;
	}

	public Date getPayment_freepJoin_date() {
		return payment_freepJoin_date;
	}

	public Date getPayment_date() {
		return payment_date;
	}

	public void setPayment_no(int payment_no) {
		this.payment_no = payment_no;
	}

	public void setFreep_no(int freep_no) {
		this.freep_no = freep_no;
	}

	public void setMb_no(int mb_no) {
		this.mb_no = mb_no;
	}

	public void setCoupon_no(int coupon_no) {
		this.coupon_no = coupon_no;
	}

	public void setPayment_method(String payment_method) {
		this.payment_method = payment_method;
	}

	public void setPayment_freepJoin_date(Date payment_freepJoin_date) {
		this.payment_freepJoin_date = payment_freepJoin_date;
	}

	public void setPayment_date(Date payment_date) {
		this.payment_date = payment_date;
	}
	
	
}
