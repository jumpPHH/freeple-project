package com.sg.freeple.vo;

public class FP_FreepReviewImageVo {
	
	private int review_image_no;
	private int review_no;
	private int mb_no;
	private String review_image_link;
	private String review_image_original_filename;
	
	public FP_FreepReviewImageVo() {
		super();
	}

	public FP_FreepReviewImageVo(int review_image_no, int review_no, int mb_no, String review_image_link,
			String review_image_original_filename) {
		super();
		this.review_image_no = review_image_no;
		this.review_no = review_no;
		this.mb_no = mb_no;
		this.review_image_link = review_image_link;
		this.review_image_original_filename = review_image_original_filename;
	}

	public int getReview_image_no() {
		return review_image_no;
	}

	public void setReview_image_no(int review_image_no) {
		this.review_image_no = review_image_no;
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

	public String getReview_image_link() {
		return review_image_link;
	}

	public void setReview_image_link(String review_image_link) {
		this.review_image_link = review_image_link;
	}

	public String getReview_image_original_filename() {
		return review_image_original_filename;
	}

	public void setReview_image_original_filename(String review_image_original_filename) {
		this.review_image_original_filename = review_image_original_filename;
	}

	
}
