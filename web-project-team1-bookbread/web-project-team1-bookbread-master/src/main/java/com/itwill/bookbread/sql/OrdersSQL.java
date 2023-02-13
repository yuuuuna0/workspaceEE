package com.itwill.bookbread.sql;

public class OrdersSQL {
	/*
	 * 주문생성
	 */
	public static final String INSERT_ORDERS="insert into orders(o_no,o_desc,o_date,o_price,userid) values(orders_o_no_SEQ.nextval,?,sysdate,?,?)";
	
	public static final String INSERT_ORDER_ITEM="insert into order_item(oi_no,oi_qty,o_no,p_no) values (order_item_oi_no_SEQ.nextval,?,orders_o_no_SEQ.currval,?)";
	/*
	 * 주문전체조회(할 필요 없을듯..? 주문번호 상세조회 리스트로 뽑으면 되지 않나싶어서..)
	 */
	public static final String ORDER_LIST_BY_USERID="select * from orders where userid= ?";

	/*
	 * 관리자가 모든 주문내역 조회
	 */
	public static final String ORDER_LIST_FOR_ADMIN="select * from orders";
	
	/*
	 * 주문번호 1개 상세조회
	 */
	public static final String SELECT_O_NO = "select o_no from orders where userid = ?";
	public static final String SELECT_ORDER_NO="select o_no from orders where userid =?";
	
	public static final String ORDER_LIST_BY_O_NO="select * from orders o join order_item oi on oi.o_no = o.o_no join product p on p.p_no = oi.p_no where o.userid= ? and o.o_no=?";
	/*
	 * 주문번호 선택 삭제
	 */
	public static final String ORDER_DELETE_BY_NO="delete from orders where o_no=?";
	/*
	 * 로그인된 회원 주문내역 전체 삭제 
	 */
	public static final String ORDER_DELETE_ALL="delete from orders where userid=?";
}
