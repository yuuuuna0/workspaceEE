package com.itwill.bookbread.service;

import java.util.ArrayList;
import java.util.List;

import com.itwill.bookbread.dao.CartDao;
import com.itwill.bookbread.dao.OrdersDao;
import com.itwill.bookbread.dao.ProductDao;
import com.itwill.bookbread.dto.Cart;
import com.itwill.bookbread.dto.OrderItem;
import com.itwill.bookbread.dto.Orders;
import com.itwill.bookbread.dto.Product;

public class OrdersService {
	public OrdersDao ordersDao;
	public CartDao cartDao;
	public ProductDao productDao;
	public OrdersService() throws Exception{
		ordersDao = new OrdersDao();
		cartDao = new CartDao();
		productDao = new ProductDao();
	}
	/*
	 * 상품리스트에서 직접 주문
	 */
	public int create(String userId, int oi_qty, int p_no) throws Exception{
		Product product = productDao.selectByNO(p_no);
		OrderItem orderItem = new OrderItem(0, oi_qty, p_no, product);
		List<OrderItem> orderItemList = new ArrayList<OrderItem>();
		orderItemList.add(orderItem);
		String desc = orderItemList.get(0).getProduct().getP_name()+"외"+(oi_qty-1)+"권";
		int totprice=orderItemList.get(0).getOi_qty()*orderItemList.get(0).getProduct().getP_price();
		Orders newOrder = new Orders(0, desc, null, totprice, userId, orderItemList);
		return ordersDao.create(newOrder);
	}
	/*
	 * 카트에서 선택 주문
	 */
	public int selectCreate(String userId,String[] cart_nostr_array) throws Exception{
		List<OrderItem> orderItemList = new ArrayList<OrderItem>();
		int oi_tot_qty = 0;
		int o_tot_price = 0;
		for(int i = 0; i<cart_nostr_array.length; i++) {
			Cart cart = cartDao.getCartItem(Integer.parseInt(cart_nostr_array[i]));
			OrderItem orderItem = new OrderItem(0, cart.getCart_qty(), 0, cart.getProduct());
			orderItemList.add(orderItem);
			oi_tot_qty+= cart.getCart_qty();
			o_tot_price+= cart.getCart_qty()*cart.getProduct().getP_price();
		}
		String desc = orderItemList.get(0).getProduct().getP_name()+" 외 "+(oi_tot_qty-1)+" 권 ";
		Orders order = new Orders(0, desc, null, o_tot_price, userId, orderItemList);
		ordersDao.create(order);
		//선택된 카트번호들 삭제
		for(int i = 0; i<cart_nostr_array.length; i++) {
			cartDao.selectDelete(Integer.parseInt(cart_nostr_array[i]));
		}
		return 0;
	}
	
	
	/*
	 * 카트에서 전체 주문
	 */
	public int createAll(String userId) throws Exception{
		List<Cart> cartList = cartDao.getCartList(userId);
		List<OrderItem> orderItemList = new ArrayList<OrderItem>();
		int oi_tot_qty = 0;
		int o_tot_price = 0;
		for(Cart cart : cartList) {
			OrderItem orderItem = new OrderItem(0, cart.getCart_qty(), 0, null);
			orderItemList.add(orderItem);
			oi_tot_qty+=orderItem.getOi_qty();
			o_tot_price+= orderItem.getOi_qty()*orderItem.getProduct().getP_price();
		}
		String desc = orderItemList.get(0).getProduct().getP_name()+" 외 "+(oi_tot_qty-1)+" 권 ";
		Orders order = new Orders(0, userId, null, 0, userId, orderItemList);
		ordersDao.create(order);
		//주문내역에 들어가면 카트에 있는 전체 상품 삭제
		cartDao.deleteAll(userId);
		return 0;
	}
	
	/*
	 * 주문번호 1개 삭제
	 */
	public int selectDelete(int o_no) throws Exception{
		return ordersDao.selectDelete(o_no);
	}
	
	/*
	 * 주문내역 전체 삭제
	 */
	public int deleteAll(String userId) throws Exception{
		return ordersDao.deleteAll(userId);
	}
	
	/*
	 * 주문목록 상세보기
	 */
	public List<Orders> ordersList(String userId) throws Exception{
		return ordersDao.orderList(userId);
	}
	/*
	 * 주문목록 전체보기
	 */
	public List<Orders> ordersListAll(String userId) throws Exception{
		return ordersDao.orderListAll(userId);
	}
	/*
	 * 주문목록 아이디/주문번호로 상세보기
	 */
	public Orders detail(String userId, int o_no) throws Exception{
		return ordersDao.detail(userId, o_no);
	}
	
	/*
	 * 관리자가 모든 주문내역 조회
	 */
	public List<Orders> ordersListForAdmin() throws Exception{
		return ordersDao.orderListAllForAdmin();
	}
}
