package com.itwill.bookbread.dto;

public class BookType {
	
	private int type_no;
	private String p_type;
	
	public BookType() {
	}
	
	public BookType(int type_no, String p_type) {
		super();
		this.type_no = type_no;
		this.p_type = p_type;
	}

	
	public BookType(int type_no) {
		super();
		this.type_no = type_no;
	}

	public int getType_no() {
		return type_no;
	}

	public void setType_no(int type_no) {
		this.type_no = type_no;
	}

	public String getP_type() {
		return p_type;
	}

	public void setP_type(String p_type) {
		this.p_type = p_type;
	}
	
	@Override
	public String toString() {
		return "BookType [type_no= " + type_no +", p_type= " + p_type + "]";
	}
}