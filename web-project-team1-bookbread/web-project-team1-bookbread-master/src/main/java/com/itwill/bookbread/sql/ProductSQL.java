package com.itwill.bookbread.sql;

public class ProductSQL {

	// 모든 도서 리스트
	public final static String PRODUCT_LIST = "select * from product";

	// 모든 도서 상세리스트
	public final static String PRODUCT_LIST_DETAIL = "select * from product p join book_type bt on p.type_no = bt.type_no order by p_no asc";

	// 관리자가 도서 추가
	// insert(회원가입)
	public final static String PRODUCT_ADMIN_INSERT = "insert into product values(product_p_no_SEQ.nextval, ?, ?, ?, ?,?,null, ?, ?)";

	// 관리자가 도서 업데이트
	public final static String PRODUCT_ADMIN_UPDATE = "update product set p_name=?,p_author=?,p_publisher=?,p_publish_date=?,p_price=?,p_detail=?,type_no=? where p_no=?";

	// 도서이름으로 도서찾기
	public final static String PRODUCT_BY_NAME = "select * from product where p_name=?";

	// 저자이름으로 도서찾기
	public final static String PRODUCT_BY_AUTHOR = "select * from product where p_author=?";

	// 출판사이름으로 도서찾기
	public final static String PRODUCT_BY_PUBLISHER = "select * from product where p_publisher=?";

	// 도서타입으로 도서찾기
	public final static String PRODUCT_BY_TYPE = "select * from product where type_no=?";

	// 도서번호로 도서찾기
	public final static String PRODUCT_BY_NO = "select * from product p join book_type b on p.type_no = b.type_no where p_no=?";

	// 도서가격 수정
	public final static String PRODUCT_UPDATE_PRICE = "update product set p_price=? where p_no=?";

	// 도서추가
	public final static String PRODUCT_INSERT = "insert into product (p_no, p_name, p_author, p_publisher, p_publish_date, p_price, p_image, p_detail, type_no) values (product_p_no_SEQ.nextval,?,?,?,?,?,?,?,?)";

	// 도서삭제
	public final static String PRODUCT_DELETE = "delete from product where p_no=?";

	// 출판일로 도서찾기
	public final static String PORDUCT_LIST_DATE = "select * from product where p_publish_date=?";

}
