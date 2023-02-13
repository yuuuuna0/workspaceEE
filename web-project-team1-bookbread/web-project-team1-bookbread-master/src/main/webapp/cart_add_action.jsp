<%@page import="com.itwill.bookbread.dto.Product"%>
<%@page import="com.itwill.bookbread.dto.Member"%>
<%@page import="com.itwill.bookbread.dto.Cart"%>
<%@page import="com.itwill.bookbread.service.CartService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="login_check.jspf"%>

<%
	if(request.getMethod().equalsIgnoreCase("GET")){
		response.sendRedirect("product_list.jsp");
		return;
	}
	String cart_qty = request.getParameter("cart_qty");
	String p_no = request.getParameter("p_no");
	CartService cartService = new CartService();
	Cart cart = new Cart(0, Integer.parseInt(cart_qty),
			 new Member(sUserId, "", "", "", "", "", "", ""), 
			 new Product(Integer.parseInt(p_no), "", "", "", "", 0, "", "", null));
	cartService.addCart(cart);
	response.sendRedirect("cart_view.jsp");
%>