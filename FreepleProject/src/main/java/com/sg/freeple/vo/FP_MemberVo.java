package com.sg.freeple.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class FP_MemberVo {

	private int mb_no; 
	private String mb_id; 
	private String mb_pw; 
	private String mb_nick; 
	private String mb_gender; 
	private String mb_phone;
	private String mb_email; 
	private String mb_image_link; 
	private String mb_image_original_filename;
	private String mb_host_info; 
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date mb_birth; 
	
	private Date mb_joindate; 
	private Date mb_logindate; 
	
	public FP_MemberVo() {
		super();
	}

	public FP_MemberVo(int mb_no, String mb_id, String mb_pw, String mb_nick, String mb_gender, String mb_phone, String mb_email,
			String mb_image_link, String mb_image_original_filename, String mb_host_info, Date mb_birth,
			Date mb_joindate, Date mb_logindate) {
		super();
		this.mb_no = mb_no;
		this.mb_id = mb_id;
		this.mb_pw = mb_pw;
		this.mb_nick = mb_nick;
		this.mb_gender = mb_gender;
		this.mb_phone = mb_phone;
		this.mb_email = mb_email;
		this.mb_image_link = mb_image_link;
		this.mb_image_original_filename = mb_image_original_filename;
		this.mb_host_info = mb_host_info;
		this.mb_birth = mb_birth;
		this.mb_joindate = mb_joindate;
		this.mb_logindate = mb_logindate;
	}

	public int getMb_no() {
		return mb_no;
	}

	public void setMb_no(int mb_no) {
		this.mb_no = mb_no;
	}

	public String getMb_id() {
		return mb_id;
	}

	public void setMb_id(String mb_id) {
		this.mb_id = mb_id;
	}

	
	public String getMb_pw() {
		return mb_pw;
	}

	public void setMb_pw(String mb_pw) {
		this.mb_pw = mb_pw;
	}

	public String getMb_nick() {
		return mb_nick;
	}

	public void setMb_nick(String mb_nick) {
		this.mb_nick = mb_nick;
	}

	public String getMb_gender() {
		return mb_gender;
	}

	public void setMb_gender(String mb_gender) {
		this.mb_gender = mb_gender;
	}

	public String getMb_phone() {
		return mb_phone;
	}

	public void setMb_phone(String mb_phone) {
		this.mb_phone = mb_phone;
	}

	public String getMb_email() {
		return mb_email;
	}

	public void setMb_email(String mb_email) {
		this.mb_email = mb_email;
	}

	public String getMb_image_link() {
		return mb_image_link;
	}

	public void setMb_image_link(String mb_image_link) {
		this.mb_image_link = mb_image_link;
	}

	public String getMb_image_original_filename() {
		return mb_image_original_filename;
	}

	public void setMb_image_original_filename(String mb_image_original_filename) {
		this.mb_image_original_filename = mb_image_original_filename;
	}

	public String getMb_host_info() {
		return mb_host_info;
	}

	public void setMb_host_info(String mb_host_info) {
		this.mb_host_info = mb_host_info;
	}

	public Date getMb_birth() {
		return mb_birth;
	}

	public void setMb_birth(Date mb_birth) {
		this.mb_birth = mb_birth;
	}

	public Date getMb_joindate() {
		return mb_joindate;
	}

	public void setMb_joindate(Date mb_joindate) {
		this.mb_joindate = mb_joindate;
	}

	public Date getMb_logindate() {
		return mb_logindate;
	}

	public void setMb_logindate(Date mb_logindate) {
		this.mb_logindate = mb_logindate;
	}
}
