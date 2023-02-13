package com.itwill.bookbread.dto;

public class Product {
	private int p_no;
	private String p_name;
	private String p_author;
	private String p_publisher;
	private String p_publish_date;
	private int p_price;
	private String p_image;
	private String p_detail;
	private BookType booktype;
	
	public Product() {
		// TODO Auto-generated constructor stub
	}

	public Product(int p_no, String p_name, String p_author, String p_publisher, String p_publish_date, int p_price,
			String p_image, String p_detail, BookType booktype) {
		super();
		this.p_no = p_no;
		this.p_name = p_name;
		this.p_author = p_author;
		this.p_publisher = p_publisher;
		this.p_publish_date = p_publish_date;
		this.p_price = p_price;
		this.p_image = p_image;
		this.p_detail = p_detail;
		this.booktype = booktype;
	}

	
	public Product(int p_no, String p_name, String p_author, String p_publisher, String p_publish_date, int p_price,
			String p_image, String p_detail) {
		super();
		this.p_no = p_no;
		this.p_name = p_name;
		this.p_author = p_author;
		this.p_publisher = p_publisher;
		this.p_publish_date = p_publish_date;
		this.p_price = p_price;
		this.p_image = p_image;
		this.p_detail = p_detail;
	}

	public int getP_no() {
		return p_no;
	}

	public void setP_no(int p_no) {
		this.p_no = p_no;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public String getP_author() {
		return p_author;
	}

	public void setP_author(String p_author) {
		this.p_author = p_author;
	}

	public String getP_publisher() {
		return p_publisher;
	}

	public void setP_publisher(String p_publisher) {
		this.p_publisher = p_publisher;
	}

	public String getP_publish_date() {
		return p_publish_date;
	}

	public void setP_publish_date(String p_publish_date) {
		this.p_publish_date = p_publish_date;
	}

	public int getP_price() {
		return p_price;
	}

	public void setP_price(int p_price) {
		this.p_price = p_price;
	}

	public String getP_image() {
		return p_image;
	}

	public void setP_image(String p_image) {
		this.p_image = p_image;
	}

	public String getP_detail() {
		return p_detail;
	}

	public void setP_detail(String p_detail) {
		this.p_detail = p_detail;
	}

	public BookType getBookType() {
		return booktype;
	}

	public void setBookType(BookType booktype) {
		this.booktype = booktype;
	}

	@Override
	public String toString() {
		return "Product [p_no=" + p_no + ", p_name=" + p_name + ", p_author=" + p_author + ", p_publisher="
				+ p_publisher + ", p_publish_date=" + p_publish_date + ", p_price=" + p_price + ", p_image=" + p_image
				+ ", p_detail=" + p_detail + ", BookType=" + booktype + "]";
	}
	
	
}

