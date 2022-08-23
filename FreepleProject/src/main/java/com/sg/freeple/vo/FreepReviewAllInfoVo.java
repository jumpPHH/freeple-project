package com.sg.freeple.vo;

import java.util.Date;

public class FreepReviewAllInfoVo {
	
	private int review_no;
	private int mb_no;
	private int freep_no;
	private String comment_content;
	private int star_status;
	private String mb_nick;
	private String mb_image_link;
	private Date comment_writedate;
	
	public FreepReviewAllInfoVo() {
		super();
	}

	public FreepReviewAllInfoVo(int review_no, int mb_no, int freep_no, String comment_content, int star_status,
			String mb_nick, String mb_image_link, Date comment_writedate) {
		super();
		this.review_no = review_no;
		this.mb_no = mb_no;
		this.freep_no = freep_no;
		this.comment_content = comment_content;
		this.star_status = star_status;
		this.mb_nick = mb_nick;
		this.mb_image_link = mb_image_link;
		this.comment_writedate = comment_writedate;
	}

	public int getReview_no() {
		return review_no;
	}

	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}

	public int getMb_no() {
		return mb_no;
	}

	public void setMb_no(int mb_no) {
		this.mb_no = mb_no;
	}

	public int getFreep_no() {
		return freep_no;
	}

	public void setFreep_no(int freep_no) {
		this.freep_no = freep_no;
	}

	public String getComment_content() {
		return comment_content;
	}

	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}

	public int getStar_status() {
		return star_status;
	}

	public void setStar_status(int star_status) {
		this.star_status = star_status;
	}

	public String getMb_nick() {
		return mb_nick;
	}

	public void setMb_nick(String mb_nick) {
		this.mb_nick = mb_nick;
	}

	public String getMb_image_link() {
		return mb_image_link;
	}

	public void setMb_image_link(String mb_image_link) {
		this.mb_image_link = mb_image_link;
	}

	public Date getComment_writedate() {
		return comment_writedate;
	}

	public void setComment_writedate(Date comment_writedate) {
		this.comment_writedate = comment_writedate;
	}
}
