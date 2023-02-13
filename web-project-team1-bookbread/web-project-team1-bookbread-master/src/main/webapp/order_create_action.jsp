<%@page import="com.itwill.bookbread.service.MemberService"%>
<%@page import="com.itwill.bookbread.service.CartService"%>
<%@page import="com.itwill.bookbread.service.ProductService"%>
<%@page import="com.itwill.bookbread.service.OrdersService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="login_check.jspf"%>

<%
if(request.getMethod().equalsIgnoreCase("GET")){
	response.sendRedirect("order_list.jsp");
	return;
}

String buyType = request.getParameter("buyType");
String p_noStr = request.getParameter("p_no");
String p_qtyStr = request.getParameter("p_qty");
String[] cart_no_array = request.getParameterValues("cart_item_no");

String address = request.getParameter("address");
MemberService memberService = new MemberService();
Member addressModify = new Member(sUserId,"","","","",address,"","");


OrdersService orderService = new OrdersService();
CartService cartService = new CartService();

if(buyType.equals("cart")){
	orderService.createAll(sUserId);
	memberService.updateAddress(addressModify);
}else if(buyType.equals("cart_select")){
	orderService.selectCreate(sUserId, cart_no_array);
	memberService.updateAddress(addressModify);
}else if(buyType.equals("direct")){
	orderService.create(sUserId, Integer.parseInt(p_qtyStr), Integer.parseInt(p_noStr));
	memberService.updateAddress(addressModify);
}
response.sendRedirect("order_list.jsp");




%>