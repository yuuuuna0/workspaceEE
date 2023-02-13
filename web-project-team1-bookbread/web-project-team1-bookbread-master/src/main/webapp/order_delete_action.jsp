<%@page import="com.itwill.bookbread.service.OrdersService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="login_check.jspf"%>

<%
if(request.getMethod().equalsIgnoreCase("GET")){
	response.sendRedirect("order_list.jsp");
	return;
	
}

String o_noStr = request.getParameter("o_no");
OrdersService orderService = new OrdersService();
orderService.selectDelete(Integer.parseInt(o_noStr));
response.sendRedirect("order_list.jsp");



%>