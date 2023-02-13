package com.itwill.bookbread.sql;

public class ReviewBoardSQL {
	//update_pk(리뷰수정)
	public final static String REVIEW_UPDATE=
	"update review_board set r_title=?, r_content=? where r_no=?";

	//delete_pk(리뷰삭제)
	public final static String REVIEW_DELETE=
	"delete from review_board where userId=?";

	//insert(리뷰작성)
	public final static String REVIEW_INSERT=
	"insert into review_board values (review_board_r_no_seq.nextval,sysdate,?,?,?,?,?)";


	//select_pk(내가쓴리뷰보기)
	public final static String REVIEW_SELECET_BY_ID=
	"select * from review_board rb join product p on rb.p_no = p.p_no where userId=?";

	//select_all(리뷰전체보기)
	public final static String REVIEW_SELECT_ALL=
	"select * from review_board";

	//리뷰별 조회수 증가
	public final static String REVIEW_COUNT=
	"update review_board set r_count=r_count+1 where r_no=?";
	
	//select_상품번호 (PK로 보기)
	public final static String REVIEW_SELECT_BY_P_NO=
	"select * from review_board	where p_no=?";
	//게시판번호로 리뷰한개 삭제
	public final static String REVIEW_DELETE_BY_R_NO=
			"delete from review_board where r_no=?";
}
