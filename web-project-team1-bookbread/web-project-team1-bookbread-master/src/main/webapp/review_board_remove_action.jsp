
<%@page import="com.itwill.bookbread.service.ReviewBoardService"%>
<%@include file="login_check.jspf"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
if(request.getMethod().equalsIgnoreCase("GET")){
	response.sendRedirect("review_board_list.jsp");
	return;
}

try {
	String rno = request.getParameter("rno");
	ReviewBoardService reviewBoardService = new ReviewBoardService();
	int removeRowCount = reviewBoardService.removeByNo(Integer.parseInt(rno));
	response.sendRedirect("review_board_list.jsp");
	
} catch (Exception e) {
	e.printStackTrace();
	response.sendRedirect("member_error.jsp");
}



%>
