package com.itwill.bookbread.sql;

public class BookTypeSQL {

	// 도서타입 리스트
	public final static String TYPE_LIST = "select * from p_type";

	// 타입번호로 도서타입 선택
	public final static String TYPE_SELECT_BY_NO = "select * from book_type where type_no=?";

	// 타입추가
	public final static String TYPE_INSERT = "insert into book_type (type_no, p_type) values(book_type_type_no_SEQ.nextval,?)";

	// 타입수정
	public final static String TYPE_UPDATE = "update book_type set p_type=? where type_no=?";

	// 타입삭제
	public final static String TYPE_DELETE = "delete from p_type where type_no=?";
}