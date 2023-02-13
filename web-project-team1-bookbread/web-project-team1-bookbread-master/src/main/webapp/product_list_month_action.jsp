<%@page import="com.itwill.bookbread.dto.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.itwill.bookbread.service.ProductService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
if(request.getMethod().equalsIgnoreCase("GET")){
	response.sendRedirect("shop_main.jsp");
	return;
}
String p_publish_date = request.getParameter("p_publish_date");
ProductService productService = new ProductService();
List<Product> product =productService.selectListDate(p_publish_date);
response.sendRedirect("product_list_month_new.jsp");
%>