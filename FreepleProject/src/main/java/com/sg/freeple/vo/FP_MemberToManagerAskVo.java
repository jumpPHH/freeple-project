package com.sg.freeple.vo;

import java.util.Date;

public class FP_MemberToManagerAskVo {

	private int mb_mng_ask_no;
	private int mb_no;
	private int mng_no;
	private String mb_mng_ask_title;
	private String mb_mng_ask_content;
	private String mb_mng_answer_content;
	private String mb_mng_ask_status;
	private Date mb_mng_ask_date;
	private Date mb_mng_answer_date;
	
	public FP_MemberToManagerAskVo() {
		super();
	}

	public FP_MemberToManagerAskVo(int mb_mng_ask_no, int mb_no, int mng_no, String mb_mng_ask_title,
			String mb_mng_ask_content, String mb_mng_answer_content, String mb_mng_ask_status, Date mb_mng_ask_date,
			Date mb_mng_answer_date) {
		super();
		this.mb_mng_ask_no = mb_mng_ask_no;
		this.mb_no = mb_no;
		this.mng_no = mng_no;
		this.mb_mng_ask_title = mb_mng_ask_title;
		this.mb_mng_ask_content = mb_mng_ask_content;
		this.mb_mng_answer_content = mb_mng_answer_content;
		this.mb_mng_ask_status = mb_mng_ask_status;
		this.mb_mng_ask_date = mb_mng_ask_date;
		this.mb_mng_answer_date = mb_mng_answer_date;
	}

	public int getMb_mng_ask_no() {
		return mb_mng_ask_no;
	}

	public void setMb_mng_ask_no(int mb_mng_ask_no) {
		this.mb_mng_ask_no = mb_mng_ask_no;
	}

	public int getMb_no() {
		return mb_no;
	}

	public void setMb_no(int mb_no) {
		this.mb_no = mb_no;
	}

	public int getMng_no() {
		return mng_no;
	}

	public void setMng_no(int mng_no) {
		this.mng_no = mng_no;
	}

	public String getMb_mng_ask_title() {
		return mb_mng_ask_title;
	}

	public void setMb_mng_ask_title(String mb_mng_ask_title) {
		this.mb_mng_ask_title = mb_mng_ask_title;
	}

	public String getMb_mng_ask_content() {
		return mb_mng_ask_content;
	}

	public void setMb_mng_ask_content(String mb_mng_ask_content) {
		this.mb_mng_ask_content = mb_mng_ask_content;
	}

	public String getMb_mng_answer_content() {
		return mb_mng_answer_content;
	}

	public void setMb_mng_answer_content(String mb_mng_answer_content) {
		this.mb_mng_answer_content = mb_mng_answer_content;
	}

	public String getMb_mng_ask_status() {
		return mb_mng_ask_status;
	}

	public void setMb_mng_ask_status(String mb_mng_ask_status) {
		this.mb_mng_ask_status = mb_mng_ask_status;
	}

	public Date getMb_mng_ask_date() {
		return mb_mng_ask_date;
	}

	public void setMb_mng_ask_date(Date mb_mng_ask_date) {
		this.mb_mng_ask_date = mb_mng_ask_date;
	}

	public Date getMb_mng_answer_date() {
		return mb_mng_answer_date;
	}

	public void setMb_mng_answer_date(Date mb_mng_answer_date) {
		this.mb_mng_answer_date = mb_mng_answer_date;
	}

	
	
	
}
