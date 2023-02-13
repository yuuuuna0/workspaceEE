<%@page import="com.itwill.bookbread.service.ProductService"%>
<%@page import="com.itwill.bookbread.dto.BookType"%>
<%@page import="com.itwill.bookbread.dto.Product"%>
<%@page import="com.itwill.bookbread.dto.Member"%>
<%@page import="com.itwill.bookbread.user.exception.ExistedUserException"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="com.itwill.bookbread.service.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%

	if(request.getMethod().equals("GET")){
		response.sendRedirect("shop_main.jsp");
		return;
	}
	try{
		String pno = request.getParameter("pnoStr");
		String pname = request.getParameter("pname");
		String pauthor = request.getParameter("pauthor");
		String ppublisher = request.getParameter("ppublisher");
		String ppublishdate = request.getParameter("ppublishdate");
		String pprice = request.getParameter("pprice");
		String pdetail = request.getParameter("pdetail");
		String pTypeNo = request.getParameter("ptypeno");
		/*
		String ptype = request.getParameter("ptype");
		*/
		
		Product product = new Product(Integer.parseInt(pno),pname,pauthor,ppublisher,ppublishdate,Integer.parseInt(pprice),pdetail,pdetail,new BookType(Integer.parseInt(pTypeNo)));
		ProductService productService = new ProductService();
		productService.adminUpdateProduct(product);
		response.sendRedirect("admin_product_list.jsp");
		
	}
	catch(Exception e){
		e.printStackTrace();
		response.sendRedirect("member_error.jsp");
	}

%>
