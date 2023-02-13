package com.itwill.bookbread.dto;


public class Cart {
	private int cart_no;
	private int cart_qty;
	private Member member;
	private Product product;
	
	public Cart() {
		// TODO Auto-generated constructor stub
	}

	public Cart(int cart_no, int cart_qty, Member member, Product product) {
		super();
		this.cart_no = cart_no;
		this.cart_qty = cart_qty;
		this.member = member;
		this.product = product;
	}

	public int getCart_no() {
		return cart_no;
	}

	public void setCart_no(int cart_no) {
		this.cart_no = cart_no;
	}

	public int getCart_qty() {
		return cart_qty;
	}

	public void setCart_qty(int cart_qty) {
		this.cart_qty = cart_qty;
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
		return "Cart [cart_no=" + cart_no + ", cart_qty=" + cart_qty + ", member=" + member + ", product=" + product
				+ "]";
	}
	
}