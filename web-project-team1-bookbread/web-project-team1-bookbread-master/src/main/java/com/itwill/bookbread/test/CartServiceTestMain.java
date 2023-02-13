package com.itwill.bookbread.test;

import java.util.List;

import com.itwill.bookbread.dto.Cart;
import com.itwill.bookbread.dto.Member;
import com.itwill.bookbread.dto.Product;
import com.itwill.bookbread.service.CartService;

public class CartServiceTestMain {

	public static void main(String[] args) throws Exception{
		CartService cartService = new CartService();
		
		
		/*
		 * 카트 추가 or 업데이트
		 */
		/* --카트추가
		 int addCount = cartService.addCart(new Cart(0, 1, 
							new Member("soyoon", null, null, null, null, null, null, null, null), 
							new Product(2, null, null, null, null, 0, null, null, null)));
		 */
		/*
		 * --업데이트
		 * int addCount = cartService.addCart(new Cart(0, 5, 
					new Member("junyoung", null, null, null, null, null, null, null, null), 
					new Product(1, null, null, null, null, 0, null, null, null)));
		 */
		//System.out.println(addCount);
		
		
		/*
		 * 장바구니 수정
		 */
		/*
		int updateRowCount = cartService.updateCart(new Cart(9, 5, 
					new Member(null, null, null, null, null, null, null, null, null), 
					new Product(0, null, null, null, null, 0, null, null, null)));
		System.out.println(updateRowCount);
		*/
		
		/*
		 * 장바구니 선택 삭제
		 */
		/*
		int deleteCount = cartService.selectDelete(9);
		System.out.println(deleteCount);
		*/
		/*
		 * 장바구니 전체 삭제
		 */
		/*
		int deleteAllCount = cartService.deleteAll("soyoon");
		System.out.println(deleteAllCount);
		*/
		/*
		 * 장바구니 해당 상품 가져오기
		 */
		/*
		Cart cart = cartService.getCartItem(13);
		System.out.println(cart);
		*/
		/*
		 * 장바구니 전체보기
		 */
		/*
		List<Cart> cartList =  cartService.cartItemList("soyoon");
		System.out.println(cartList);
		*/
	}

}
