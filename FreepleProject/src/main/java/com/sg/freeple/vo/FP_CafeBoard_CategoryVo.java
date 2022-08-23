package com.sg.freeple.vo;

public class FP_CafeBoard_CategoryVo {
	
	private int cafeBoard_Category_no;
	private int cafe_no;
	private String cafeBoard_Category_name;
	
	public FP_CafeBoard_CategoryVo() {
		super();
	}

	public FP_CafeBoard_CategoryVo(int cafeBoard_Category_no, int cafe_no, String cafeBoard_Category_name) {
		super();
		this.cafeBoard_Category_no = cafeBoard_Category_no;
		this.cafe_no = cafe_no;
		this.cafeBoard_Category_name = cafeBoard_Category_name;
	}

	public int getCafeBoard_Category_no() {
		return cafeBoard_Category_no;
	}

	public void setCafeBoard_Category_no(int cafeBoard_Category_no) {
		this.cafeBoard_Category_no = cafeBoard_Category_no;
	}

	public int getCafe_no() {
		return cafe_no;
	}

	public void setCafe_no(int cafe_no) {
		this.cafe_no = cafe_no;
	}

	public String getCafeBoard_Category_name() {
		return cafeBoard_Category_name;
	}

	public void setCafeBoard_Category_name(String cafeBoard_Category_name) {
		this.cafeBoard_Category_name = cafeBoard_Category_name;
	}
}
