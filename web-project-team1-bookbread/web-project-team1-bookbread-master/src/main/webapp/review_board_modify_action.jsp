<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
if(request.getMethod().equalsIgnoreCase("get")){
	response.sendRedirect("shop_main.jsp");
	return;
}

request.setCharacterEncoding("UTF-8");

%>