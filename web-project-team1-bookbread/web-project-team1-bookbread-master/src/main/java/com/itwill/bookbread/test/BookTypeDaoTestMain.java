package com.itwill.bookbread.test;

import java.util.List;

import com.itwill.bookbread.dao.BookTypeDao;
import com.itwill.bookbread.dto.BookType;

public class BookTypeDaoTestMain {
	
	public static void main(String[] args) throws Exception {
		
		BookTypeDao booktypeDao = new BookTypeDao();
		
		// 타입 리스트 출력
		//System.out.println(booktypeDao.selectAll());
		
		// 번호로 타입 찾기
		//System.out.println(booktypeDao.BooktypeByNo(1));
		
		// 타입추가
		//booktypeDao.insertBookType(5,"공포");
		 
		// 타입수정
		//System.out.println(booktypeDao.UpdateBookType(5,"왜안대"));
	
		// 타입삭제
		//booktypeDao.DeleteBookType(5);
		
		//수정,삭제 모두 ORA-01722: invalid number 오류
	}

}
