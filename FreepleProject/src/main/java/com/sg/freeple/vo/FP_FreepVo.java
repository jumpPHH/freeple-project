package com.sg.freeple.vo;

import java.util.Date;

public class FP_FreepVo {
	
	private int freep_no;
	private int mb_no;
	private int freep_ctg_no;
	private String freep_onoff;
	private String freep_title;
	private String freep_time;
	private int freep_price;
	private Date freep_sale_start_date;
	private Date freep_sale_end_date;
	private String freep_content;
	private String freep_tag;
	private Date freep_writedate;
	
	public FP_FreepVo() {
		super();
	}

	public FP_FreepVo(int freep_no, int mb_no, int freep_ctg_no, String freep_onoff, String freep_title,
			String freep_time, int freep_price, Date freep_sale_start_date, Date freep_sale_end_date,
			String freep_content, String freep_tag, Date freep_writedate) {
		super();
		this.freep_no = freep_no;
		this.mb_no = mb_no;
		this.freep_ctg_no = freep_ctg_no;
		this.freep_onoff = freep_onoff;
		this.freep_title = freep_title;
		this.freep_time = freep_time;
		this.freep_price = freep_price;
		this.freep_sale_start_date = freep_sale_start_date;
		this.freep_sale_end_date = freep_sale_end_date;
		this.freep_content = freep_content;
		this.freep_tag = freep_tag;
		this.freep_writedate = freep_writedate;
	}

	public int getFreep_no() {
		return freep_no;
	}

	public void setFreep_no(int freep_no) {
		this.freep_no = freep_no;
	}

	public int getMb_no() {
		return mb_no;
	}

	public void setMb_no(int mb_no) {
		this.mb_no = mb_no;
	}

	public int getFreep_ctg_no() {
		return freep_ctg_no;
	}

	public void setFreep_ctg_no(int freep_ctg_no) {
		this.freep_ctg_no = freep_ctg_no;
	}

	public String getFreep_onoff() {
		return freep_onoff;
	}

	public void setFreep_onoff(String freep_onoff) {
		this.freep_onoff = freep_onoff;
	}

	public String getFreep_title() {
		return freep_title;
	}

	public void setFreep_title(String freep_title) {
		this.freep_title = freep_title;
	}

	public String getFreep_time() {
		return freep_time;
	}

	public void setFreep_time(String freep_time) {
		this.freep_time = freep_time;
	}

	public int getFreep_price() {
		return freep_price;
	}

	public void setFreep_price(int freep_price) {
		this.freep_price = freep_price;
	}

	public Date getFreep_sale_start_date() {
		return freep_sale_start_date;
	}

	public void setFreep_sale_start_date(Date freep_sale_start_date) {
		this.freep_sale_start_date = freep_sale_start_date;
	}

	public Date getFreep_sale_end_date() {
		return freep_sale_end_date;
	}

	public void setFreep_sale_end_date(Date freep_sale_end_date) {
		this.freep_sale_end_date = freep_sale_end_date;
	}

	public String getFreep_content() {
		return freep_content;
	}

	public void setFreep_content(String freep_content) {
		this.freep_content = freep_content;
	}

	public String getFreep_tag() {
		return freep_tag;
	}

	public void setFreep_tag(String freep_tag) {
		this.freep_tag = freep_tag;
	}

	public Date getFreep_writedate() {
		return freep_writedate;
	}

	public void setFreep_writedate(Date freep_writedate) {
		this.freep_writedate = freep_writedate;
	}
}
