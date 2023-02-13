package com.itwill.bookbread.test;



import java.util.Date;

import com.itwill.bookbread.dao.ReviewBoardDao;
import com.itwill.bookbread.dto.BookType;
import com.itwill.bookbread.dto.Member;
import com.itwill.bookbread.dto.Product;
import com.itwill.bookbread.dto.ReviewBoard;


public class ReviewBoardDaoTestMain {

	public static void main(String[] args) throws Exception {
		ReviewBoardDao reviewBoardDao=new ReviewBoardDao();

		// Test_A) 새로운 리뷰생성
		//System.out.println(reviewBoardDao.create(new ReviewBoard(0,null,"새로운리뷰제목2","새로운리뷰내용2",0,new Member("junyoung","","","","","","",""),new Product(10,"","","","",0,"","",new BookType(0,"")))));

		// Test_B) 리뷰 수정
		System.out.println(reviewBoardDao.update(new ReviewBoard(1,null,"책3","3",0,new Member("jiwon","","","","","","",""),new Product(3,"","","","",0,"","",new BookType(0,"")))));
	
		// Test_C) 리뷰 삭제 -> 인자를 userId로 줄건지 고민필요(userId로 삭제하면 해당 아이디의 모든 리뷰가 삭제)
		//System.out.println(reviewBoardDao.remove("jiwon"));

		//System.out.println(reviewBoardDao.update(new ReviewBoard(1,null,"책3","3",0,new Member("jiwon","","","","","","",""),new Product(3,"","","","",0,"","",new BookType(0,"")))));
		//System.out.println(reviewBoardDao.create(new ReviewBoard(0,null,"책4","4",0,new Member("jiwon","","","","","","",""),new Product(4,"","","","",0,"","",new BookType(0,"")))));
		//System.out.println(reviewBoardDao.countUpdate(3));


		// Test_D) userID의 리뷰 전체리스트보기
		//System.out.println(reviewBoardDao.findReview("jiwon"));

		// Test_E) 리뷰전체보기
		//System.out.println(reviewBoardDao.findReviewList());

		// Test_G) 상품번호의 리뷰 전체리스트보기
		//System.out.println(reviewBoardDao.findReviewListByPno(1));

		// Test_H) 리뷰번호로 리뷰 삭제
		//System.out.println(reviewBoardDao.removeByNo(2));
	}

}
