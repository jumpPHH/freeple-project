package com.sg.freeple.vo;

public class FP_CafeMemberVo {

	private int cafeMember_no;
	private int cafe_no;
	private int mb_no;
	private int cafe_grade;
	private String cafeMember_nickname;
	
	public FP_CafeMemberVo() {
		super();
	}

	public FP_CafeMemberVo(int cafeMember_no, int cafe_no, int mb_no, int cafe_grade, String cafeMember_nickname) {
		super();
		this.cafeMember_no = cafeMember_no;
		this.cafe_no = cafe_no;
		this.mb_no = mb_no;
		this.cafe_grade = cafe_grade;
		this.cafeMember_nickname = cafeMember_nickname;
	}

	public int getCafeMember_no() {
		return cafeMember_no;
	}

	public void setCafeMember_no(int cafeMember_no) {
		this.cafeMember_no = cafeMember_no;
	}

	public int getCafe_no() {
		return cafe_no;
	}

	public void setCafe_no(int cafe_no) {
		this.cafe_no = cafe_no;
	}

	public int getMb_no() {
		return mb_no;
	}

	public void setMb_no(int mb_no) {
		this.mb_no = mb_no;
	}

	public int getCafe_grade() {
		return cafe_grade;
	}

	public void setCafe_grade(int cafe_grade) {
		this.cafe_grade = cafe_grade;
	}

	public String getCafeMember_nickname() {
		return cafeMember_nickname;
	}

	public void setCafeMember_nickname(String cafeMember_nickname) {
		this.cafeMember_nickname = cafeMember_nickname;
	}
}
