package com.sg.freeple.vo;

public class FP_BoardImageVo {
	
	private int image_no;
	private int board_no;
	private String image_link;
	private String image_original_filename;
	
	public FP_BoardImageVo() {
		super();
	}

	public FP_BoardImageVo(int image_no, int board_no, String image_link, String image_original_filename) {
		super();
		this.image_no = image_no;
		this.board_no = board_no;
		this.image_link = image_link;
		this.image_original_filename = image_original_filename;
	}

	public int getImage_no() {
		return image_no;
	}

	public void setImage_no(int image_no) {
		this.image_no = image_no;
	}

	public int getBoard_no() {
		return board_no;
	}

	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}

	public String getImage_link() {
		return image_link;
	}

	public void setImage_link(String image_link) {
		this.image_link = image_link;
	}

	public String getImage_original_filename() {
		return image_original_filename;
	}

	public void setImage_original_filename(String image_original_filename) {
		this.image_original_filename = image_original_filename;
	}
	
}