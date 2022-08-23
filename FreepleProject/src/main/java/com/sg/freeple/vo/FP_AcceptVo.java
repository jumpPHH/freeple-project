package com.sg.freeple.vo;

import java.util.Date;

public class FP_AcceptVo {
	private int accept_no;
	private int payment_no;
	private String accept_state;
	private Date accept_acceptDate; //구매자가 프립완료 누른 날짜(Y로 변경된 시점)
	private Date accept_reservedDate; //구매자가 구입한날짜. (N으로 생성된 시점)
	
	public FP_AcceptVo() {
		// TODO Auto-generated constructor stub
	}

	public FP_AcceptVo(int accept_no, int payment_no, String accept_state, Date accept_acceptDate,
			Date accept_reservedDate) {
		super();
		this.accept_no = accept_no;
		this.payment_no = payment_no;
		this.accept_state = accept_state;
		this.accept_acceptDate = accept_acceptDate;
		this.accept_reservedDate = accept_reservedDate;
	}

	public int getAccept_no() {
		return accept_no;
	}

	public int getPayment_no() {
		return payment_no;
	}

	public String getAccept_state() {
		return accept_state;
	}

	public Date getAccept_acceptDate() {
		return accept_acceptDate;
	}

	public Date getAccept_reservedDate() {
		return accept_reservedDate;
	}

	public void setAccept_no(int accept_no) {
		this.accept_no = accept_no;
	}

	public void setPayment_no(int payment_no) {
		this.payment_no = payment_no;
	}

	public void setAccept_state(String accept_state) {
		this.accept_state = accept_state;
	}

	public void setAccept_acceptDate(Date accept_acceptDate) {
		this.accept_acceptDate = accept_acceptDate;
	}

	public void setAccept_reservedDate(Date accept_reservedDate) {
		this.accept_reservedDate = accept_reservedDate;
	}
	
	
	
}
