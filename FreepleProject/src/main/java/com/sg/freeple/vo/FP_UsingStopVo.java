package com.sg.freeple.vo;

import java.util.Date;

public class FP_UsingStopVo {

	private int usingstop_no;
	private int reported_person_mb_no;
	private int manager_no;
	private String mb_status;
	private Date usingstop_date;
	
	public FP_UsingStopVo() {
		super();
	}

	public FP_UsingStopVo(int usingstop_no, int reported_person_mb_no, int manager_no, String mb_status,
			Date usingstop_date) {
		super();
		this.usingstop_no = usingstop_no;
		this.reported_person_mb_no = reported_person_mb_no;
		this.manager_no = manager_no;
		this.mb_status = mb_status;
		this.usingstop_date = usingstop_date;
	}

	public int getUsingstop_no() {
		return usingstop_no;
	}

	public void setUsingstop_no(int usingstop_no) {
		this.usingstop_no = usingstop_no;
	}

	public int getReported_person_mb_no() {
		return reported_person_mb_no;
	}

	public void setReported_person_mb_no(int reported_person_mb_no) {
		this.reported_person_mb_no = reported_person_mb_no;
	}

	public int getManager_no() {
		return manager_no;
	}

	public void setManager_no(int manager_no) {
		this.manager_no = manager_no;
	}

	public String getMb_status() {
		return mb_status;
	}

	public void setMb_status(String mb_status) {
		this.mb_status = mb_status;
	}

	public Date getUsingstop_date() {
		return usingstop_date;
	}

	public void setUsingstop_date(Date usingstop_date) {
		this.usingstop_date = usingstop_date;
	}

		
}
