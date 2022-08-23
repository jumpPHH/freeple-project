package com.sg.freeple.vo;

public class FP_FreepImageVo {
	
	private int freep_image_no;
	private int freep_no;
	private String freep_image_link;
	private String freep_image_original_filename;
	
	public FP_FreepImageVo() {
		super();
	}

	public FP_FreepImageVo(int freep_image_no, int freep_no, String freep_image_link,
			String freep_image_original_filename) {
		super();
		this.freep_image_no = freep_image_no;
		this.freep_no = freep_no;
		this.freep_image_link = freep_image_link;
		this.freep_image_original_filename = freep_image_original_filename;
	}

	public int getFreep_image_no() {
		return freep_image_no;
	}

	public void setFreep_image_no(int freep_image_no) {
		this.freep_image_no = freep_image_no;
	}

	public int getFreep_no() {
		return freep_no;
	}

	public void setFreep_no(int freep_no) {
		this.freep_no = freep_no;
	}

	public String getFreep_image_link() {
		return freep_image_link;
	}

	public void setFreep_image_link(String freep_image_link) {
		this.freep_image_link = freep_image_link;
	}

	public String getFreep_image_original_filename() {
		return freep_image_original_filename;
	}

	public void setFreep_image_original_filename(String freep_image_original_filename) {
		this.freep_image_original_filename = freep_image_original_filename;
	}
}
