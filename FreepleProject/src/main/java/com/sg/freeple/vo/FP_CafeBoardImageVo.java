package com.sg.freeple.vo;

public class FP_CafeBoardImageVo {

	private int cafeBoardImage_no;
	private int writeBoard_no;
	private String cafeBoImage_link;
	private String cafeBoImage_original_filename;
	
	public FP_CafeBoardImageVo() {
		super();
	}

	public FP_CafeBoardImageVo(int cafeBoardImage_no, int writeBoard_no, String cafeBoImage_link,
			String cafeBoImage_original_filename) {
		super();
		this.cafeBoardImage_no = cafeBoardImage_no;
		this.writeBoard_no = writeBoard_no;
		this.cafeBoImage_link = cafeBoImage_link;
		this.cafeBoImage_original_filename = cafeBoImage_original_filename;
	}

	public int getCafeBoardImage_no() {
		return cafeBoardImage_no;
	}

	public void setCafeBoardImage_no(int cafeBoardImage_no) {
		this.cafeBoardImage_no = cafeBoardImage_no;
	}

	public int getWriteBoard_no() {
		return writeBoard_no;
	}

	public void setWriteBoard_no(int writeBoard_no) {
		this.writeBoard_no = writeBoard_no;
	}

	public String getCafeBoImage_link() {
		return cafeBoImage_link;
	}

	public void setCafeBoImage_link(String cafeBoImage_link) {
		this.cafeBoImage_link = cafeBoImage_link;
	}

	public String getCafeBoImage_original_filename() {
		return cafeBoImage_original_filename;
	}

	public void setCafeBoImage_original_filename(String cafeBoImage_original_filename) {
		this.cafeBoImage_original_filename = cafeBoImage_original_filename;
	}
}
