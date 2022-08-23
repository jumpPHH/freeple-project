package com.sg.freeple.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class FP_WriteBoardVo {

	private int writeBoard_no;
	private int cafeBoard_Category_no;
	private int cafeMember_no;
	private String writeBoard_title;
	private String writeBoard_cotent;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date writeBoard_date;
	
	private int writeBoard_readcount;
	
	public FP_WriteBoardVo() {
		super();
	}

	public FP_WriteBoardVo(int writeBoard_no, int cafeBoard_Category_no, int cafeMember_no, String writeBoard_title,
			String writeBoard_cotent, Date writeBoard_date, int writeBoard_readcount) {
		super();
		this.writeBoard_no = writeBoard_no;
		this.cafeBoard_Category_no = cafeBoard_Category_no;
		this.cafeMember_no = cafeMember_no;
		this.writeBoard_title = writeBoard_title;
		this.writeBoard_cotent = writeBoard_cotent;
		this.writeBoard_date = writeBoard_date;
		this.writeBoard_readcount = writeBoard_readcount;
	}

	public int getWriteBoard_no() {
		return writeBoard_no;
	}

	public void setWriteBoard_no(int writeBoard_no) {
		this.writeBoard_no = writeBoard_no;
	}

	public int getCafeBoard_Category_no() {
		return cafeBoard_Category_no;
	}

	public void setCafeBoard_Category_no(int cafeBoard_Category_no) {
		this.cafeBoard_Category_no = cafeBoard_Category_no;
	}

	public int getCafeMember_no() {
		return cafeMember_no;
	}

	public void setCafeMember_no(int cafeMember_no) {
		this.cafeMember_no = cafeMember_no;
	}

	public String getWriteBoard_title() {
		return writeBoard_title;
	}

	public void setWriteBoard_title(String writeBoard_title) {
		this.writeBoard_title = writeBoard_title;
	}

	public String getWriteBoard_cotent() {
		return writeBoard_cotent;
	}

	public void setWriteBoard_cotent(String writeBoard_cotent) {
		this.writeBoard_cotent = writeBoard_cotent;
	}

	public Date getWriteBoard_date() {
		return writeBoard_date;
	}

	public void setWriteBoard_date(Date writeBoard_date) {
		this.writeBoard_date = writeBoard_date;
	}

	public int getWriteBoard_readcount() {
		return writeBoard_readcount;
	}

	public void setWriteBoard_readcount(int writeBoard_readcount) {
		this.writeBoard_readcount = writeBoard_readcount;
	}
}
