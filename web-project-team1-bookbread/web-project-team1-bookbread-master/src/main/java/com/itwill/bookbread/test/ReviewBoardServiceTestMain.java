package com.itwill.bookbread.test;

import com.itwill.bookbread.dto.BookType;
import com.itwill.bookbread.dto.Member;
import com.itwill.bookbread.dto.Product;
import com.itwill.bookbread.dto.ReviewBoard;
import com.itwill.bookbread.service.ReviewBoardService;

public class ReviewBoardServiceTestMain {

	public static void main(String[] args) throws Exception {
		ReviewBoardService reviewBoardService = new ReviewBoardService();
		ReviewBoard insertReviewBoard = new ReviewBoard(10, null, "책이름10", "책내용10", 1,new Member("jiwon","","","","","","",""), new Product(8, "", "", "", "", 0, "", "",new BookType(0,"")));
		//System.out.println(reviewBoardService.create(insertReviewBoard));
		ReviewBoard updateReviewBoard = new ReviewBoard(10, null, "책이름12", "책내용12", 1,new Member("jiwon","","","","","","",""), new Product(10, "", "", "", "", 0, "", "",new BookType(0,"")));
		//System.out.println(reviewBoardService.update(updateReviewBoard));
		System.out.println(reviewBoardService.removeByUserId("heechul"));
		//System.out.println(reviewBoardService.removeByNo(9));
		//System.out.println(reviewBoardService.findReviewById("junyoung"));
		//System.out.println(reviewBoardService.findReviewListByPno(5));
		//System.out.println(reviewBoardService.findReviewList());
		//System.out.println(reviewBoardService.countUpdate(8));
	}

}
