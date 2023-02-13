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
		String pname = request.getParameter("pname");
		String pauthor = request.getParameter("pauthor");
		String ppublisher = request.getParameter("ppublisher");
		String ppublishdate = request.getParameter("ppublishdate");
		String pprice = request.getParameter("pprice");
		String pimage = request.getParameter("pimage");
		String pdetail = request.getParameter("pdetail");
		String ptypeno = request.getParameter("ptypeno");
		
		Product product = new Product(0,pname,pauthor,ppublisher,ppublishdate,Integer.parseInt(pprice),pimage,pdetail,new BookType(Integer.parseInt(ptypeno)));
		ProductService productService = new ProductService();
		productService.adminInsertProduct(product);
		
		response.sendRedirect("admin_product_list.jsp");
		
	}
	catch(Exception e){
		e.printStackTrace();
		response.sendRedirect("member_error.jsp");
	}

%>
