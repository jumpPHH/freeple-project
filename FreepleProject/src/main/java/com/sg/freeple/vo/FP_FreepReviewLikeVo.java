package com.sg.freeple.vo;

import java.util.Date;

public class FP_FreepReviewLikeVo {
	
	private int review_like_no;
	private int mb_no;
	private int review_no;
	private int freep_no;
	private Date review_like_date;
	
	public FP_FreepReviewLikeVo() {
		super();
	}

	public FP_FreepReviewLikeVo(int review_like_no, int mb_no, int review_no, int freep_no, Date review_like_date) {
		super();
		this.review_like_no = review_like_no;
		this.mb_no = mb_no;
		this.review_no = review_no;
		this.freep_no = freep_no;
		this.review_like_date = review_like_date;
	}

	public int getReview_like_no() {
		return review_like_no;
	}

	public void setReview_like_no(int review_like_no) {
		this.review_like_no = review_like_no;
	}

	public int getMb_no() {
		return mb_no;
	}

	public void setMb_no(int mb_no) {
		this.mb_no = mb_no;
	}

	public int getReview_no() {
		return review_no;
	}

	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}

	public int getFreep_no() {
		return freep_no;
	}

	public void setFreep_no(int freep_no) {
		this.freep_no = freep_no;
	}

	public Date getReview_like_date() {
		return review_like_date;
	}

	public void setReview_like_date(Date review_like_date) {
		this.review_like_date = review_like_date;
	}
}
