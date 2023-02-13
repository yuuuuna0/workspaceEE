package com.itwill.bookbread.test;

import com.itwill.bookbread.dao.CartDao;
import com.itwill.bookbread.dto.Cart;
import com.itwill.bookbread.dto.Member;
import com.itwill.bookbread.dto.Product;

public class CartDaoTestMain {

	public static void main(String[] args) throws Exception{
		CartDao cartDao = new CartDao();
		/*
		 *상품 존재하는지 확인
		 */
		/*
		int count = cartDao.checkProduct(new Cart(0, 0, new Member("soyoon", null, null, null, null, null, null, null, null), 
										new Product(5, null, null, null, null, 0, null, null, null)));
		System.out.println(count);
		*/
		/*
		 * 상품 삽입
		 */
		/*
		int insertCount =cartDao.insert(new Cart(0, 7, new Member("junyoung", null, null, null, null, null, null, null, null), 
						new Product(1, null, null, null, null, 0, null, null, null)));
		System.out.println(insertCount);
		*/
		/*
		 * 존재하면 수량 업데이트
		 */
		/*
		int addCount =cartDao.add(new Cart(0, 3, new Member("junyoung", null, null, null, null, null, null, null, null), 
					new Product(1, null, null, null, null, 0, null, null, null)));
		System.out.println(addCount);
		*/
		/*
		 * 장바구니에서 해당 제품 수량 수정
		 */
		/*
		int updateCount =cartDao.update(new Cart(6, 10, new Member("junyoung", null, null, null, null, null, null, null, null), null));
		System.out.println(updateCount);
		*/
		
		/*
		 * 장바구니 선택삭제
		 */
		/*
		int deleteCount = cartDao.selectDelete(6);
		System.out.println(deleteCount);
		*/
		/*
		 * 장바구니 전체삭제
		 */
		/*
		int deleteAllCount = cartDao.deleteAll("soyoon");
		System.out.println(deleteAllCount);
		*/
		/*
		 * 장바구니 해당 상품 가져오기
		 */
		/*
		Cart cartItem = cartDao.getCartItem(9);
		System.out.println(cartItem);
		*/
		/*
		 * 'soyoon'님의 카트 전체보기
		 */
		/*
		System.out.println(cartDao.getCartList("soyoon"));
		System.out.println(cartDao.getCartList("junyoung"));
		*/
	}

}
