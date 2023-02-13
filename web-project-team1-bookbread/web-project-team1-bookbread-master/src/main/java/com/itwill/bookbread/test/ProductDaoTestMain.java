package com.itwill.bookbread.test;

import java.util.List;

import com.itwill.bookbread.dao.ProductDao;
import com.itwill.bookbread.dto.BookType;
import com.itwill.bookbread.dto.Product;

public class ProductDaoTestMain {

	public static void main(String[] args) throws Exception {

		ProductDao productDao = new ProductDao();
		
		// Test_A) 전체도서리스트 출력
		//System.out.println(productDao.selectAll());
		
		// Test_B) 도서 이름으로 찾기
		//System.out.println(productDao.selectByName("불편한 편의점"));
		
		// Test_C) 저자 이름으로 찾기
		//System.out.println(productDao.selectByauthor("이미예"));
		
		// Test_D) 출판사 이름으로 찾기
		//System.out.println(productDao.selectBypublisher("팩토리나인"));
		
		// Test_E) 도서 타입으로 찾기
		//System.out.println(productDao.selectByTYPE(1));
		
		// Test_F) 도서 번호로 찾기
		//System.out.println(productDao.selectByNO(1));
		
		// Test_G) 도서 가격 수정
		//System.out.println(productDao.updatePrice(new Product(2, null, null, null, null, 500000, null, null, new BookType(0, null))));
		
		// Test_H) 도서 추가
		//System.out.println(productDao.InsertProduct(new Product(0, "신규도서1", "박준영", "아이티윌", "2021-08-03", 30000, null, "아주 재미있습니다.", new BookType(1,null))));
	
		// Test_I) 도서 삭제
		//System.out.println(productDao.deleteByProductNo(1));
		
		// 도서 이름리스트
		//System.out.println(productDao.selectListName("신규도서1"));
		
		// 저자 이름리스트
		//System.out.println(productDao.selectListAuthor("박준영"));
		
		// 출판사 이름리스트
		//System.out.println(productDao.selectListPublisher("아이티윌"));
		
		// 도서 타입리스트
		//System.out.println(productDao.selectListType("3"));
	}

}