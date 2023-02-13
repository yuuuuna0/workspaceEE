package com.itwill.bookbread.sql;

public class CartSQL {
	/*
	 * 장바구니 존재 확인
	 */
	public static final String CHECK_CART_PRODUCT="select count(*) from cart where userid=? and p_no=?";
	/*
	 * 존재 없으면 삽입
	 */
	public static final String INSERT_CART_PRODUCT="insert into cart(cart_no,cart_qty,userid,p_no) values (cart_cart_no_SEQ.nextval,?,?,?)";
	/*
	 * 존재 있으면 추가
	 */
	public static final String ADD_CART_PRODUCT="update cart set cart_qty=cart_qty+? where userid=? and p_no=?";
	/*
	 * 장바구니에서 해당 제품 수량 수정
	 */
	public static final String UPDATE_CART_QTY="update cart set cart_qty=? where cart_no=?";
	/*
	 * 장바구니 전체 보기
	 */
	public static final String CART_LIST="select * from cart c join product p on c.p_no=p.p_no where c.userid=?";
	/*
	 * 장바구니 해당 상품 가져오기
	 */
	public static final String SELECT_CART_ITEM_BY_CART_NO="select * from cart c join product p on c.p_no=p.p_no where c.cart_no=?";
	/*
	 * 장바구니 선택 삭제
	 */
	public static final String SELECT_DELETE_BY_CART_NO="delete from cart where cart_no=?";
	/*
	 * 장바구니 전체 삭제
	 */
	public static final String DELETE_ALL_BY_USERID="delete from cart where userid=?";
}
