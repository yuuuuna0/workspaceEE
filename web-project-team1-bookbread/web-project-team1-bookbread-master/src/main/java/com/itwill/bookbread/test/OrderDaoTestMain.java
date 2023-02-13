package com.itwill.bookbread.test;

import java.util.ArrayList;
import java.util.List;

import com.itwill.bookbread.dao.CartDao;
import com.itwill.bookbread.dao.OrdersDao;
import com.itwill.bookbread.dao.ProductDao;
import com.itwill.bookbread.dto.Cart;
import com.itwill.bookbread.dto.Member;
import com.itwill.bookbread.dto.OrderItem;
import com.itwill.bookbread.dto.Orders;
import com.itwill.bookbread.dto.Product;

public class OrderDaoTestMain {

	public static void main(String[] args) throws Exception{
	OrdersDao orderDao = new OrdersDao();
	CartDao cartDao = new CartDao();
	ProductDao productDao = new ProductDao();
		/*
		 * 1.상품에서 직접 주문
		 */
		/*
		List<OrderItem> orderItemListDirect = new ArrayList<OrderItem>();
		Product product = productDao.selectByNO(5);
		OrderItem orderItem = new OrderItem(0, 5, 0, product);
		orderItemListDirect.add(orderItem);
		Orders newOrderDirect = new Orders(0,
											orderItemListDirect.get(0).getProduct().getP_name()+"외"+(orderItemListDirect.get(0).getOi_qty())+"권", 
											null, 
											orderItemListDirect.get(0).getOi_qty()*orderItemListDirect.get(0).getProduct().getP_price(), 
											"soyoon", 
											orderItemListDirect);
		int createCount = orderDao.create(newOrderDirect);
		System.out.println(createCount);
		 */
	
	
		 /*
		 * 2.cart에서 주문
		 */
		/*
		List<Cart> cartItemList = cartDao.getCartList("soyoon");
		List<OrderItem> orderItemList = new ArrayList<OrderItem>();
		Cart cart = new Cart(2, 2, new Member("soyoon", null, null, null, null, null, null, null), null);
		cartItemList.add(cart);
		OrderItem orderItem = new OrderItem(0, cartItemList.get(0).getCart_qty(), 0, cartItemList.get(0).getProduct());
		orderItemList.add(orderItem);
		int oi_tot_count = 0;
		oi_tot_count = orderItem.getOi_qty();
		int o_tot_price = 0;
		o_tot_price = orderItem.getOi_qty()*orderItem.getProduct().getP_price();
		String desc = orderItemList.get(0).getProduct().getP_name()+" 외 "+(oi_tot_count-1)+" 권 ";
		Orders newOrder = new Orders(0, desc, null, o_tot_price, "soyoon", orderItemList);
		int createCount = orderDao.create(newOrder);
		System.out.println(createCount);
		cartDao.deleteAll("soyoon");
		*/
	
		/*
		 * 3.cart에서 선택주문
		 */
	}
	
}
