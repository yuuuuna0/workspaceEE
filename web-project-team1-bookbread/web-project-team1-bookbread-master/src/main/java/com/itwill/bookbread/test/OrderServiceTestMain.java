package com.itwill.bookbread.test;

import com.itwill.bookbread.service.OrdersService;

public class OrderServiceTestMain {

	public static void main(String[] args) throws Exception{
		OrdersService orderService = new OrdersService();
		
		//System.out.println(orderService.ordersListAll("junyoung"));
		/*
		String[] cart_no_array= {"1","6"};
		int selectCreate = orderService.selectCreate("junyoung", cart_no_array);
		System.out.println(selectCreate);
		*/
		//int deleteCount = orderService.deleteAll("soyoon");
		
		System.out.println(orderService.detail("junyoung", 16));
	}

}
