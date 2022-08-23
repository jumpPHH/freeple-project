package com.sg.freeple.vo;

import java.util.Date;

public class FP_ReportVo {

	private int report_no;
	private int report_mb_no;
	private int reported_person_mb_no;
	private String reported_person_status;
	private String report_reason;
	private Date report_date;
	
	public FP_ReportVo() {
		super();
	}

	public FP_ReportVo(int report_no, int report_mb_no, int reported_person_mb_no, String reported_person_status,
			String report_reason, Date report_date) {
		super();
		this.report_no = report_no;
		this.report_mb_no = report_mb_no;
		this.reported_person_mb_no = reported_person_mb_no;
		this.reported_person_status = reported_person_status;
		this.report_reason = report_reason;
		this.report_date = report_date;
	}

	public int getReport_no() {
		return report_no;
	}

	public void setReport_no(int report_no) {
		this.report_no = report_no;
	}

	public int getReport_mb_no() {
		return report_mb_no;
	}

	public void setReport_mb_no(int report_mb_no) {
		this.report_mb_no = report_mb_no;
	}

	public int getReported_person_mb_no() {
		return reported_person_mb_no;
	}

	public void setReported_person_mb_no(int reported_person_mb_no) {
		this.reported_person_mb_no = reported_person_mb_no;
	}

	public String getReported_person_status() {
		return reported_person_status;
	}

	public void setReported_person_status(String reported_person_status) {
		this.reported_person_status = reported_person_status;
	}

	public String getReport_reason() {
		return report_reason;
	}

	public void setReport_reason(String report_reason) {
		this.report_reason = report_reason;
	}

	public Date getReport_date() {
		return report_date;
	}

	public void setReport_date(Date report_date) {
		this.report_date = report_date;
	}
	
	
}
