package com.sg.freeple.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class FP_CafeCommentVo {
	
	private int cafeComment_no;
	private int cafeMember_no;
	private int writeBoard_no;
	private String cafeComment_content;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date cafeComment_date;
	
	public FP_CafeCommentVo() {
		super();
	}

	public FP_CafeCommentVo(int cafeComment_no, int cafeMember_no, int writeBoard_no, String cafeComment_content,
			Date cafeComment_date) {
		super();
		this.cafeComment_no = cafeComment_no;
		this.cafeMember_no = cafeMember_no;
		this.writeBoard_no = writeBoard_no;
		this.cafeComment_content = cafeComment_content;
		this.cafeComment_date = cafeComment_date;
	}

	public int getCafeComment_no() {
		return cafeComment_no;
	}

	public void setCafeComment_no(int cafeComment_no) {
		this.cafeComment_no = cafeComment_no;
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

	public String getCafeComment_content() {
		return cafeComment_content;
	}

	public void setCafeComment_content(String cafeComment_content) {
		this.cafeComment_content = cafeComment_content;
	}

	public Date getCafeComment_date() {
		return cafeComment_date;
	}

	public void setCafeComment_date(Date cafeComment_date) {
		this.cafeComment_date = cafeComment_date;
	}	
}
