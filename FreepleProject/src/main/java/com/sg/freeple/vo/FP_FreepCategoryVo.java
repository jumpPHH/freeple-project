package com.sg.freeple.vo;

public class FP_FreepCategoryVo {
	private int freep_ctg_no;
	private String freep_ctg_name;
	private String freep_ctg_fileName;
	
	public FP_FreepCategoryVo() {
		// TODO Auto-generated constructor stub
	}

	public FP_FreepCategoryVo(int freep_ctg_no, String freep_ctg_name, String freep_ctg_fileName) {
		super();
		this.freep_ctg_no = freep_ctg_no;
		this.freep_ctg_name = freep_ctg_name;
		this.freep_ctg_fileName = freep_ctg_fileName;
	}

	public int getFreep_ctg_no() {
		return freep_ctg_no;
	}

	public String getFreep_ctg_name() {
		return freep_ctg_name;
	}

	public String getFreep_ctg_fileName() {
		return freep_ctg_fileName;
	}

	public void setFreep_ctg_no(int freep_ctg_no) {
		this.freep_ctg_no = freep_ctg_no;
	}

	public void setFreep_ctg_name(String freep_ctg_name) {
		this.freep_ctg_name = freep_ctg_name;
	}

	public void setFreep_ctg_fileName(String freep_ctg_fileName) {
		this.freep_ctg_fileName = freep_ctg_fileName;
	}

}
