<%@page import="com.itwill.bookbread.dto.Member"%>
<%@page import="com.itwill.bookbread.service.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%

if(request.getMethod().equalsIgnoreCase("GET")){
	response.sendRedirect("shop_main.jsp");
	return;
}

try{
	String userId = request.getParameter("userId");
	MemberService memberService = new MemberService();
	int removeRowCount = memberService.remove(userId);
	response.sendRedirect("admin_member_list.jsp");
}catch(Exception e){
	e.printStackTrace();
	response.sendRedirect("member_error.jsp");
}

%>
