<%@page import="com.itwill.bookbread.user.exception.ExistedUserException"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="com.itwill.bookbread.service.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="login_check.jspf"%>
<%

	if(request.getMethod().equals("GET")){
		response.sendRedirect("shop_main.jsp");
		return;
	}
	try{
		
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String birth = request.getParameter("birth");
		String address = request.getParameter("address");
		String email = request.getParameter("email");
		String interest = request.getParameter("interest");
		
		Member member = new Member(sUserId,password,name,phone,birth,address,email,interest);
		MemberService memberService = new MemberService();
		
		int updateRowCount = memberService.update(member);
		
		response.sendRedirect("member_modify_form.jsp");
	}
	catch(Exception e){
		e.printStackTrace();
		response.sendRedirect("member_error.jsp");
	}

%>
