package com.sg.freeple.vo;

import java.util.Date;

public class FP_BoardVo {
	
	private int board_no;
	private int mb_no;
	private String board_title;
	private String board_content;
	private int board_readcount;
	private Date board_writedate;
	private int board_commentcount;
	
	public FP_BoardVo() {
		// TODO Auto-generated constructor stub
	}

	public FP_BoardVo(int board_no, int mb_no, String board_title, String board_content, int board_readcount,
			Date board_writedate, int board_commentcount) {
		super();
		this.board_no = board_no;
		this.mb_no = mb_no;
		this.board_title = board_title;
		this.board_content = board_content;
		this.board_readcount = board_readcount;
		this.board_writedate = board_writedate;
		this.board_commentcount = board_commentcount;
	}

	public int getBoard_no() {
		return board_no;
	}

	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}

	public int getMb_no() {
		return mb_no;
	}

	public void setMb_no(int mb_no) {
		this.mb_no = mb_no;
	}

	public String getBoard_title() {
		return board_title;
	}

	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}

	public String getBoard_content() {
		return board_content;
	}

	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}

	public int getBoard_readcount() {
		return board_readcount;
	}

	public void setBoard_readcount(int board_readcount) {
		this.board_readcount = board_readcount;
	}

	public Date getBoard_writedate() {
		return board_writedate;
	}

	public void setBoard_writedate(Date board_writedate) {
		this.board_writedate = board_writedate;
	}

	public int getBoard_commentcount() {
		return board_commentcount;
	}

	public void setBoard_commentcount(int board_commentcount) {
		this.board_commentcount = board_commentcount;
	}
	
	
	
	

	
}