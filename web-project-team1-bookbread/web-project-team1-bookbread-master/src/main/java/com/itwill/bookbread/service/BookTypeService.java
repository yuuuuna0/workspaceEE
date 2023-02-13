package com.itwill.bookbread.service;

import java.util.List;

import com.itwill.bookbread.dao.BookTypeDao;
import com.itwill.bookbread.dto.BookType;

public class BookTypeService {

	private BookTypeDao bookTypeDao;
	
	public BookTypeService() throws Exception{
		bookTypeDao = new BookTypeDao();
	}
	
	// 모든 booktype 출력하기
	public List<BookType> selectAllBookType() throws Exception {
		return bookTypeDao.selectAll();
	}
	
	
}
