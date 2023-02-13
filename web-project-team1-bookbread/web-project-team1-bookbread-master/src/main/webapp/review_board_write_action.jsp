<%@page import="com.itwill.bookbread.dto.BookType"%>
<%@page import="com.itwill.bookbread.dto.Product"%>
<%@page import="com.itwill.bookbread.dto.Member"%>
<%@page import="com.itwill.bookbread.service.ReviewBoardService"%>
<%@page import="com.itwill.bookbread.dto.ReviewBoard"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="login_check.jspf"%>
    

<%
 if(request.getMethod().equalsIgnoreCase("get")){
	 response.sendRedirect("shop_main.jsp");
	 return;
 }

request.setCharacterEncoding("UTF-8");
String noStr = request.getParameter("no");
String userId = request.getParameter("userId");
String title = request.getParameter("title");
String content = request.getParameter("content");

Member member = new Member(userId,"","","","","","","");
Product product = new Product(Integer.parseInt(noStr),"","","","",0,"","",new BookType());



try{
	ReviewBoard newReview = null;
	newReview = new ReviewBoard(Integer.parseInt(noStr),null,title,content,0,member,product);
	ReviewBoardService boardService = new ReviewBoardService();
	int rowCount = boardService.create(newReview);
	response.sendRedirect("product_detail.jsp?p_no="+noStr);
} catch(Exception e) {
	e.printStackTrace();
	response.sendRedirect("member_error.jsp");
}
%>