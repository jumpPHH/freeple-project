package com.sg.freeple.vo;

import java.util.Date;

public class FP_FreepFeedCommentVo {
	
	private int comment_no;
	private int review_no;
	private int freep_no;
	private int member_no;
	private String feed_comment; 
	private Date feed_commentwritedate	;
	
	public FP_FreepFeedCommentVo() {
		super();
	}

	public FP_FreepFeedCommentVo(int comment_no, int review_no, int freep_no, int member_no, String feed_comment,
			Date feed_commentwritedate) {
		super();
		this.comment_no = comment_no;
		this.review_no = review_no;
		this.freep_no = freep_no;
		this.member_no = member_no;
		this.feed_comment = feed_comment;
		this.feed_commentwritedate = feed_commentwritedate;
	}

	public int getComment_no() {
		return comment_no;
	}

	public int getReview_no() {
		return review_no;
	}

	public int getFreep_no() {
		return freep_no;
	}

	public int getMember_no() {
		return member_no;
	}

	public String getFeed_comment() {
		return feed_comment;
	}

	public Date getFeed_commentwritedate() {
		return feed_commentwritedate;
	}

	public void setComment_no(int comment_no) {
		this.comment_no = comment_no;
	}

	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}

	public void setFreep_no(int freep_no) {
		this.freep_no = freep_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public void setFeed_comment(String feed_comment) {
		this.feed_comment = feed_comment;
	}

	public void setFeed_commentwritedate(Date feed_commentwritedate) {
		this.feed_commentwritedate = feed_commentwritedate;
	}

	
	
}
