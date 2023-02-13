<%@page import="java.net.URLEncoder"%>
<%@page import="com.itwill.bookbread.user.exception.UserNotFoundException"%>
<%@page import="com.itwill.bookbread.dto.Member"%>
<%@page import="com.itwill.bookbread.service.MemberService"%>
<%@page import="java.nio.file.attribute.UserPrincipalLookupService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
session.invalidate();
response.sendRedirect("shop_main.jsp");
%>
