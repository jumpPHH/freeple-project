package com.sg.freeple.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class FP_CafeBoard_LikeVo {

	private int like_no;
	private int cafeMember_no;
	private int writeBoard_no;
	private int cafe_no;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date like_date;
	
	public FP_CafeBoard_LikeVo() {
		super();
	}

	public int getLike_no() {
		return like_no;
	}

	public void setLike_no(int like_no) {
		this.like_no = like_no;
	}

	public int getCafeMember_no() {
		return cafeMember_no;
	}

	public void setCafeMember_no(int cafeMember_no) {
		this.cafeMember_no = cafeMember_no;
	}

	public int getWriteBoard_no() {
		return writeBoard_no;
	}

	public void setWriteBoard_no(int writeBoard_no) {
		this.writeBoard_no = writeBoard_no;
	}

	public int getCafe_no() {
		return cafe_no;
	}

	public void setCafe_no(int cafe_no) {
		this.cafe_no = cafe_no;
	}

	public Date getLike_date() {
		return like_date;
	}

	public void setLike_date(Date like_date) {
		this.like_date = like_date;
	}
}

