package com.sg.freeple.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class FP_CafeVo {

	private int cafe_no;
	private int cafeMember_no;
	private String cafe_name;
	private String cafeIntroduce_content;
	private int cafeMember_limit;
	private String cafe_image_link;
	private String cafe_image_original_filename;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date cafe_date;
	
	public FP_CafeVo() {
		super();
	}

	public FP_CafeVo(int cafe_no, int cafeMember_no, String cafe_name, String cafeIntroduce_content,
			int cafeMember_limit, String cafe_image_link, String cafe_image_original_filename, Date cafe_date) {
		super();
		this.cafe_no = cafe_no;
		this.cafeMember_no = cafeMember_no;
		this.cafe_name = cafe_name;
		this.cafeIntroduce_content = cafeIntroduce_content;
		this.cafeMember_limit = cafeMember_limit;
		this.cafe_image_link = cafe_image_link;
		this.cafe_image_original_filename = cafe_image_original_filename;
		this.cafe_date = cafe_date;
	}

	public int getCafe_no() {
		return cafe_no;
	}

	public void setCafe_no(int cafe_no) {
		this.cafe_no = cafe_no;
	}

	public int getCafeMember_no() {
		return cafeMember_no;
	}

	public void setCafeMember_no(int cafeMember_no) {
		this.cafeMember_no = cafeMember_no;
	}

	public String getCafe_name() {
		return cafe_name;
	}

	public void setCafe_name(String cafe_name) {
		this.cafe_name = cafe_name;
	}

	public String getCafeIntroduce_content() {
		return cafeIntroduce_content;
	}

	public void setCafeIntroduce_content(String cafeIntroduce_content) {
		this.cafeIntroduce_content = cafeIntroduce_content;
	}

	public int getCafeMember_limit() {
		return cafeMember_limit;
	}

	public void setCafeMember_limit(int cafeMember_limit) {
		this.cafeMember_limit = cafeMember_limit;
	}

	public String getCafe_image_link() {
		return cafe_image_link;
	}

	public void setCafe_image_link(String cafe_image_link) {
		this.cafe_image_link = cafe_image_link;
	}

	public String getCafe_image_original_filename() {
		return cafe_image_original_filename;
	}

	public void setCafe_image_original_filename(String cafe_image_original_filename) {
		this.cafe_image_original_filename = cafe_image_original_filename;
	}

	public Date getCafe_date() {
		return cafe_date;
	}

	public void setCafe_date(Date cafe_date) {
		this.cafe_date = cafe_date;
	}
}
