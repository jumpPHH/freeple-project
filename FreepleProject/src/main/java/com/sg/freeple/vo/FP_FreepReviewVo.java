package com.sg.freeple.vo;

import java.util.Date;

public class FP_FreepReviewVo {

	private int review_no;
	private int freep_no;
	private int mb_no;
	private int star_status;
	private String comment_content;
	private Date comment_writedate;
	
	public FP_FreepReviewVo() {
		super();
	}

	public FP_FreepReviewVo(int review_no, int freep_no, int mb_no, int star_status, String comment_content,
			Date comment_writedate) {
		super();
		this.review_no = review_no;
		this.freep_no = freep_no;
		this.mb_no = mb_no;
		this.star_status = star_status;
		this.comment_content = comment_content;
		this.comment_writedate = comment_writedate;
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

	public int getMb_no() {
		return mb_no;
	}

	public void setMb_no(int mb_no) {
		this.mb_no = mb_no;
	}

	public int getStar_status() {
		return star_status;
	}

	public void setStar_status(int star_status) {
		this.star_status = star_status;
	}

	public String getComment_content() {
		return comment_content;
	}

	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}

	public Date getComment_writedate() {
		return comment_writedate;
	}

	public void setComment_writedate(Date comment_writedate) {
		this.comment_writedate = comment_writedate;
	}
	
}
