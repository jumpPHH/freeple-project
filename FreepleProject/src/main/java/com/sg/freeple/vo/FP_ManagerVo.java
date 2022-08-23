package com.sg.freeple.vo;

public class FP_ManagerVo {
	private int mng_no;
	private	String mng_id;
	private String mng_pw;
	private String mng_nick;
	private String mng_email;
	private String mng_phone;
	
	public FP_ManagerVo() {
		// TODO Auto-generated constructor stub
	}

	public FP_ManagerVo(int mng_no, String mng_id, String mng_pw, String mng_nick, String mng_email, String mng_phone) {
		super();
		this.mng_no = mng_no;
		this.mng_id = mng_id;
		this.mng_pw = mng_pw;
		this.mng_nick = mng_nick;
		this.mng_email = mng_email;
		this.mng_phone = mng_phone;
	}

	public int getMng_no() {
		return mng_no;
	}

	public String getMng_id() {
		return mng_id;
	}

	public String getMng_pw() {
		return mng_pw;
	}

	public String getMng_nick() {
		return mng_nick;
	}

	public String getMng_email() {
		return mng_email;
	}

	public String getMng_phone() {
		return mng_phone;
	}

	public void setMng_no(int mng_no) {
		this.mng_no = mng_no;
	}

	public void setMng_id(String mng_id) {
		this.mng_id = mng_id;
	}

	public void setMng_pw(String mng_pw) {
		this.mng_pw = mng_pw;
	}

	public void setMng_nick(String mng_nick) {
		this.mng_nick = mng_nick;
	}

	public void setMng_email(String mng_email) {
		this.mng_email = mng_email;
	}

	public void setMng_phone(String mng_phone) {
		this.mng_phone = mng_phone;
	}
	
	
}
