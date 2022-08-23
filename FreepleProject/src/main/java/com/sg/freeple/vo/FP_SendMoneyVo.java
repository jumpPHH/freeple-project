package com.sg.freeple.vo;

import java.util.Date;

public class FP_SendMoneyVo {
	private int sendMoney_no;
	private int payment_no;
	private int sendMoney_sender;
	private int sendMoney_depositor;
	private int sendMoney_money;
	private Date sendMoney_date;	
	
	public FP_SendMoneyVo() {
		// TODO Auto-generated constructor stub
	}

	public FP_SendMoneyVo(int sendMoney_no, int payment_no, int sendMoney_sender, int sendMoney_depositor,
			int sendMoney_money, Date sendMoney_date) {
		super();
		this.sendMoney_no = sendMoney_no;
		this.payment_no = payment_no;
		this.sendMoney_sender = sendMoney_sender;
		this.sendMoney_depositor = sendMoney_depositor;
		this.sendMoney_money = sendMoney_money;
		this.sendMoney_date = sendMoney_date;
	}

	public int getSendMoney_no() {
		return sendMoney_no;
	}

	public int getPayment_no() {
		return payment_no;
	}

	public int getSendMoney_sender() {
		return sendMoney_sender;
	}

	public int getSendMoney_depositor() {
		return sendMoney_depositor;
	}

	public int getSendMoney_money() {
		return sendMoney_money;
	}

	public Date getSendMoney_date() {
		return sendMoney_date;
	}

	public void setSendMoney_no(int sendMoney_no) {
		this.sendMoney_no = sendMoney_no;
	}

	public void setPayment_no(int payment_no) {
		this.payment_no = payment_no;
	}

	public void setSendMoney_sender(int sendMoney_sender) {
		this.sendMoney_sender = sendMoney_sender;
	}

	public void setSendMoney_depositor(int sendMoney_depositor) {
		this.sendMoney_depositor = sendMoney_depositor;
	}

	public void setSendMoney_money(int sendMoney_money) {
		this.sendMoney_money = sendMoney_money;
	}

	public void setSendMoney_date(Date sendMoney_date) {
		this.sendMoney_date = sendMoney_date;
	}
	
}