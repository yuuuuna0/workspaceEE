package com.itwill.bookbread.service;

import java.util.ArrayList;

import com.itwill.bookbread.dao.ReviewBoardDao;
import com.itwill.bookbread.dto.ReviewBoard;

public class ReviewBoardService {
private ReviewBoardDao reviewBoardDao;
public ReviewBoardService() throws Exception{
	reviewBoardDao = new ReviewBoardDao();
}
	
	
/*
 * 리뷰쓰기 
 */
	public int create(ReviewBoard reviewBoard) throws Exception{
		return reviewBoardDao.create(reviewBoard);
	}
/*
 * 리뷰삭제
 */
	public int removeByUserId(String userId) throws Exception{
		return reviewBoardDao.removeByUserId(userId);
	}
/*
 * 게시판 번호로 리뷰 삭제
 */
	public int removeByNo(int r_no) throws Exception{
		return reviewBoardDao.removeByNo(r_no);
	}
/*
 * 리뷰수정	
 */
	public int update(ReviewBoard reviewBoard) throws Exception{
		return reviewBoardDao.update(reviewBoard);
	}
/*
 * 아이디로 리뷰 검색
 */
	public ArrayList<ReviewBoard> findReviewById(String userId) throws Exception{
		return reviewBoardDao.findReviewById(userId);
	}
/*
 * 상품번호로 리뷰 검색
 */
	public ArrayList<ReviewBoard> findReviewListByPno(int p_no) throws Exception{
		return reviewBoardDao.findReviewListByPno(p_no);
	}
/*
 * 전체 리뷰보기
 */
	public ArrayList<ReviewBoard> findReviewList() throws Exception {
		return reviewBoardDao.findReviewList();
	}
/*
 * 리뷰 조회수 증가 
 */
	public int countUpdate(int r_count) throws Exception{
		return reviewBoardDao.countUpdate(r_count);
	}
}
