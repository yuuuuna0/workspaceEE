<%@page import="com.itwill.bookbread.service.CartService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="login_check.jspf"%>

<%
	if(request.getMethod().equalsIgnoreCase("GET")){
		response.sendRedirect("product_list.jsp");
		return;
	}
	String cart_no = request.getParameter("cart_no");
	CartService cartService = new CartService();
	cartService.selectDelete(Integer.parseInt(cart_no));
	response.sendRedirect("cart_view.jsp");

%>
