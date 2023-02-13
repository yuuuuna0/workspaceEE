<%@page import="com.itwill.bookbread.user.exception.ExistedUserException"%>
<%@page import="com.itwill.bookbread.dto.Member"%>
<%@page import="com.itwill.bookbread.service.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.net.URLEncoder"%>

<%	
	if(request.getMethod().equalsIgnoreCase("GET")){
		response.sendRedirect("member_write_form.jsp");
		return;
	}
	request.setCharacterEncoding("UTF-8");
	String userId = request.getParameter("userId");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
	String birth = request.getParameter("birth");
	String address = request.getParameter("address");
	String email = request.getParameter("email");
	String interest = request.getParameter("interest");
	Member newMember = null;	
	
	try{
		newMember = new Member(userId,password,name,phone,birth,address,email,interest);
		MemberService memberService = new MemberService();
		int rowCount = memberService.create(newMember);
		response.sendRedirect("member_login_form.jsp");
	}catch(ExistedUserException e){
		response.sendRedirect("member_write_form.jsp?msg="+URLEncoder.encode(e.getMessage(),"UTF-8"));
		
	}catch(Exception e){
		e.printStackTrace();
		response.sendRedirect("member_error.jsp");
	}
%>
