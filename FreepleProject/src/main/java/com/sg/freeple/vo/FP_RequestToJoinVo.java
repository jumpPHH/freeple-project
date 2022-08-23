package com.sg.freeple.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class FP_RequestToJoinVo {
	
	private int requestToJoin_no;
	private int cafe_no;
	private int mb_no;
	private String requestToJoin_approval;
	private String requestToJoin_coment;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date requestToJoin_date;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date accpetToJoin_date;
	
	public FP_RequestToJoinVo() {
		super();
	}

	public FP_RequestToJoinVo(int requestToJoin_no, int cafe_no, int mb_no, String requestToJoin_approval,
			String requestToJoin_coment, Date requestToJoin_date, Date accpetToJoin_date) {
		super();
		this.requestToJoin_no = requestToJoin_no;
		this.cafe_no = cafe_no;
		this.mb_no = mb_no;
		this.requestToJoin_approval = requestToJoin_approval;
		this.requestToJoin_coment = requestToJoin_coment;
		this.requestToJoin_date = requestToJoin_date;
		this.accpetToJoin_date = accpetToJoin_date;
	}

	public int getRequestToJoin_no() {
		return requestToJoin_no;
	}

	public void setRequestToJoin_no(int requestToJoin_no) {
		this.requestToJoin_no = requestToJoin_no;
	}

	public int getCafe_no() {
		return cafe_no;
	}

	public void setCafe_no(int cafe_no) {
		this.cafe_no = cafe_no;
	}

	public int getmb_no() {
		return mb_no;
	}

	public void setmb_no(int mb_no) {
		this.mb_no = mb_no;
	}

	public String getRequestToJoin_approval() {
		return requestToJoin_approval;
	}

	public void setRequestToJoin_approval(String requestToJoin_approval) {
		this.requestToJoin_approval = requestToJoin_approval;
	}

	public String getRequestToJoin_coment() {
		return requestToJoin_coment;
	}

	public void setRequestToJoin_coment(String requestToJoin_coment) {
		this.requestToJoin_coment = requestToJoin_coment;
	}

	public Date getRequestToJoin_date() {
		return requestToJoin_date;
	}

	public void setRequestToJoin_date(Date requestToJoin_date) {
		this.requestToJoin_date = requestToJoin_date;
	}

	public Date getAccpetToJoin_date() {
		return accpetToJoin_date;
	}

	public void setAccpetToJoin_date(Date accpetToJoin_date) {
		this.accpetToJoin_date = accpetToJoin_date;
	}	
}

