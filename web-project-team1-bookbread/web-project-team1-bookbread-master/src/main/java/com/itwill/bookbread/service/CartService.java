package com.itwill.bookbread.service;

import java.util.List;

import com.itwill.bookbread.dao.CartDao;
import com.itwill.bookbread.dto.Cart;
import com.itwill.bookbread.dto.Member;
import com.itwill.bookbread.dto.Product;

public class CartService {
	private CartDao cartDao;

	public CartService() throws Exception {
		cartDao = new CartDao();
	}
	/*
	 * 해당 제품이 없으면 카트 추가 / 있으면 카트 수량 업데이트
	 */
	public int addCart(Cart newCart) throws Exception{
		Cart cart = new Cart(0, newCart.getCart_qty(),
				 new Member(newCart.getMember().getUserId(), "", "", "", "", "", "", ""), 
				 new Product(newCart.getProduct().getP_no(), "", "", "", "", 0, "", "", null));
		int check = cartDao.checkProduct(cart);
		int addCount = -999;
		if(check==1) {
			addCount = cartDao.add(cart);
		}else if(check==0) {
			addCount = cartDao.insert(cart);
		}
		return addCount;
	}
	/*
	 * 장바구니 수정
	 */
	public int updateCart(Cart updateCart) throws Exception{
		return cartDao.update(updateCart);
	}
	/*
	 * 장바구니 선택 삭제
	 */
	public int selectDelete(int cart_no) throws Exception{
		return cartDao.selectDelete(cart_no);
	}
	/*
	 * 장바구니 전체 삭제
	 */
	public int deleteAll(String userId) throws Exception{
		return cartDao.deleteAll(userId);
	}
	/*
	 * 장바구니 해당 상품 가져오기
	 */
	public Cart getCartItem(int cart_no) throws Exception{
		return cartDao.getCartItem(cart_no);
	}
	/*
	 * 장바구니 전체보기
	 */
	public List<Cart> cartItemList(String userId) throws Exception{
		return cartDao.getCartList(userId);
	}
}
