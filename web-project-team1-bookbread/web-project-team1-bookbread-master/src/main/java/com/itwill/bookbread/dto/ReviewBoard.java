package com.itwill.bookbread.dto;

import java.util.Date;

public class ReviewBoard {
	private int r_no;
	private Date r_date;
	private String r_title;
	private String r_content;
	private int r_count;
	/*********** Member ************/
	private Member member;
	/*********** product ************/
	private Product product;
	
	public ReviewBoard() {
		// TODO Auto-generated constructor stub
	}

	public ReviewBoard(int r_no, Date r_date, String r_title, String r_content, int r_count, Member member,
			Product product) {
		super();
		this.r_no = r_no;
		this.r_date = r_date;
		this.r_title = r_title;
		this.r_content = r_content;
		this.r_count = r_count;
		this.member = member;
		this.product = product;
	}

	public int getR_no() {
		return r_no;
	}

	public void setR_no(int r_no) {
		this.r_no = r_no;
	}

	public Date getR_date() {
		return r_date;
	}

	public void setR_date(Date r_date) {
		this.r_date = r_date;
	}

	public String getR_title() {
		return r_title;
	}

	public void setR_title(String r_title) {
		this.r_title = r_title;
	}

	public String getR_content() {
		return r_content;
	}

	public void setR_content(String r_content) {
		this.r_content = r_content;
	}

	public int getR_count() {
		return r_count;
	}

	public void setR_count(int r_count) {
		this.r_count = r_count;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	@Override
	public String toString() {
		return "ReviewBoard [r_no=" + r_no + ", r_date=" + r_date + ", r_title=" + r_title + ", r_content=" + r_content
				+ ", r_count=" + r_count + ", member=" + member + ", product=" + product + "]";
	}
	
	
	
	

}
