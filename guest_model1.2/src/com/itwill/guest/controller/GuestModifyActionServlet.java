package com.itwill.guest.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwill.guest.Guest;
import com.itwill.guest.GuestService;

/**
 * Servlet implementation class GuestListServlet
 */
//@WebServlet("/guest_modify_action.do")
public class GuestModifyActionServlet extends HttpServlet {
	private GuestService guestService;
	public GuestModifyActionServlet() throws Exception{
		guestService=new GuestService();
	}
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String forwardPath="";
		try {
			if(request.getMethod().equalsIgnoreCase("GET")){
				forwardPath="redirect:guest_main.do";
			}else {
				String guest_noStr=request.getParameter("guest_no");
				String guest_name=request.getParameter("guest_name");
				String guest_email=request.getParameter("guest_email");
				String guest_homepage=request.getParameter("guest_homepage");
				String guest_title=request.getParameter("guest_title");
				String guest_content=request.getParameter("guest_content");
				Guest newGuest=new Guest(Integer.parseInt(guest_noStr),
										 guest_name,
										 null,
										 guest_email,
										 guest_homepage,
										 guest_title,
										 guest_content);
				guestService.update(newGuest);
				forwardPath="redirect:guest_view.do?guest_no="+guest_noStr;
				/*
				 * redirection할 것에 forwarding을 사용할 경우
				 * forwardPath="forward:/WEB-INF/views/guest_view.do " ==> 회원정보 수정완료를 눌렀을 때 /guest_mofify_action.do 호출 ->/guest_view.do 호출됨 ->/guest_view.jsp 출력됨
				 * 									즉 url은 guest_modify_action.do로 띄워지고 화면에는 guest_view.jsp가 출력되는 현상이 나옴 
				 */
				
			}
		} catch (Exception e) {
			e.printStackTrace();
			forwardPath="forward:/WEB-INF/views/guest_error.jsp";
		}
		
		/********forward or redirect**************/
		/*
		 * forward: -->forward:/WEB-INF/views/guest_XXX.jsp
		 * redirect: -->redirect:guest_XXX.do
		 */
		String[] pathArray=forwardPath.split(":");
		String forwardOrRedirect=pathArray[0];
		String path=pathArray[1];
		if(forwardOrRedirect.equals("redirect")) {
			//redirect
			response.sendRedirect(path);
		} else {
			//forwarding
			RequestDispatcher rd=request.getRequestDispatcher(path);
			rd.forward(request, response);
		}
		/******************************************/
		
		
	}

}
