package com.itwill.guest.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwill.guest.Guest;
import com.itwill.guest.GuestService;
import com.itwill.summer.mvc.Controller;

public class GuestModifyActionController implements Controller {
	private GuestService guestService;
	public GuestModifyActionController() {
		guestService=new GuestService();
	}
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
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
		return forwardPath;
	}

}
