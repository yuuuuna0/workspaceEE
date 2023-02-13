<%@page import="com.itwill.bookbread.service.ProductService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%

if(request.getMethod().equalsIgnoreCase("GET")){
	response.sendRedirect("shop_main.jsp");
	return;
}

try{
	String pno = request.getParameter("pno");
	
	ProductService productService = new ProductService();
	int removeRowCount = productService.deleteByProductNo(Integer.parseInt(pno));
	response.sendRedirect("admin_product_list.jsp");
}catch(Exception e){
	e.printStackTrace();
	response.sendRedirect("member_error.jsp");
}

%>
