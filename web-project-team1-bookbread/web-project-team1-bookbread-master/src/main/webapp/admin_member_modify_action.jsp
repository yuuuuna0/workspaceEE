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
		String userId = request.getParameter("userId");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String birth = request.getParameter("birth");
		String address = request.getParameter("address");
		String email = request.getParameter("email");
		
		Member member = new Member(userId,password,name,phone,birth,address,email);
		MemberService memberService = new MemberService();
		int updateRowCount = memberService.updateAdmin(member);
		response.sendRedirect("admin_member_list.jsp");
		
	}
	catch(Exception e){
		e.printStackTrace();
		response.sendRedirect("member_error.jsp");
	}

%>
