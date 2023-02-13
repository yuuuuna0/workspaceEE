<%@page import="com.itwill.bookbread.service.CartService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="login_check.jspf"%>

<%
	if(request.getMethod().equalsIgnoreCase("GET")){
		response.sendRedirect("cart_view.jsp");
		return;
	}
	CartService cartService = new CartService();
	cartService.deleteAll(sUserId);
	response.sendRedirect("cart_view.jsp");
%>
