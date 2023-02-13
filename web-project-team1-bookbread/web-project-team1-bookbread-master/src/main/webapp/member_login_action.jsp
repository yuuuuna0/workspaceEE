<%@page import="com.itwill.bookbread.user.exception.PasswordMismatchException"%>
<%@page import="com.itwill.bookbread.user.exception.UserNotFoundException"%>
<%@page import="com.itwill.bookbread.dto.Member"%>
<%@page import="com.itwill.bookbread.service.MemberService"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true"%>

<%
if(request.getMethod().equalsIgnoreCase("GET")){
	response.sendRedirect("member_login_form.jsp");
	return;
}
String userId=null;
String password=null;
try{
	userId=request.getParameter("userId");
	password=request.getParameter("password");
	MemberService userService=new MemberService();
	Member loginUser = userService.login(userId, password);
	session.setAttribute("sUserId", userId);
	session.setAttribute("sUser", loginUser);
	response.sendRedirect("shop_main.jsp");
	
}catch(UserNotFoundException e){
	/*********************case3[forward]****************
	request.setAttribute("msg1", e.getMessage());
	request.setAttribute("fuser",new User(userId,password,"",""));
	RequestDispatcher rd=
			request.getRequestDispatcher("user_login_form.jsp");
	rd.forward(request, response);
	***********************************/
	/***************case1[redirect]****************/
	response.sendRedirect("member_login_form.jsp?msg1="+URLEncoder.encode(e.getMessage(), "UTF-8"));
	/************************************/
	/*****************case2[정상응답]**********************
	out.println("<script>");
	out.println("alert('"+e.getMessage()+"');");
	out.println("location.href='user_login_form.jsp';");
	out.println("</script>");
	********************************************/
	
}catch(PasswordMismatchException e){
	
	/*********************case3[forward]****************
	request.setAttribute("msg2", e.getMessage());
	request.setAttribute("fuser",new User(userId,password,"",""));
	RequestDispatcher rd=
			request.getRequestDispatcher("user_login_form.jsp");
	rd.forward(request, response);
	***********************************/
	/***************case1[redirect]****************/
	response.sendRedirect("member_login_form.jsp?msg2="+URLEncoder.encode(e.getMessage(), "UTF-8"));
	/************************************/
	/*****************case2[정상응답]**********************
	out.println("<script>");
	out.println("alert('"+e.getMessage()+"');");
	out.println("location.href='user_login_form.jsp';");
	out.println("</script>");
	********************************************/
}catch(Exception e){
	e.printStackTrace();
	response.sendRedirect("member_error.jsp");
}
%>			
