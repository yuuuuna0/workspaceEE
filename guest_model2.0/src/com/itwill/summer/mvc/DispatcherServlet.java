package com.itwill.summer.mvc;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwill.guest.Guest;
import com.itwill.guest.GuestService;
import com.itwill.guest.controller.GuestErrorController;
import com.itwill.guest.controller.GuestListController;
import com.itwill.guest.controller.GuestMainController;
import com.itwill.guest.controller.GuestModifyActionController;
import com.itwill.guest.controller.GuestModifyFormController;
import com.itwill.guest.controller.GuestRemoveActionController;
import com.itwill.guest.controller.GuestViewController;
import com.itwill.guest.controller.GuestWriteActionController;
import com.itwill.guest.controller.GuestWriteFormController;

/*
 * 1. 클라이언트(웹브라우져)의 모든요청을 받는 서블릿작성(front Controller)
 * 2. 확장자가 *.do인 모든클라이언트의 요청이 서블릿을 실행하도록 web.xml에 url pattern mapping
   << web.xml >>
    <servlet>
		<servlet-name>dispatcher</servlet-name>
		<servlet-class>com.itwill.summer.mvc.DispatcherServlet</servlet-class>
	</servlet>
	<servlet-mapping>
		<servlet-name>dispatcher</servlet-name>
		<url-pattern>*.do</url-pattern>
	</servlet-mapping>
 */

public class DispatcherServlet extends HttpServlet {
	/*
	 * Controller객체를 저장할 Map
	 */
	private Map<String, Controller> handlerMapping;
	
	@Override
		public void init(ServletConfig config) throws ServletException {
			super.init(config);
			handlerMapping=new HashMap<String, Controller>();
			/*
			 << Map<String, Controller> handlerMapping>>
			 ------------------------------------------------
			 |key(String)      |      value(Controller객체) |
			 ------------------------------------------------
			 |/guest_main.do   |com..GuestMainController객체|	
			  -----------------------------------------------
			 |/guest_list.do   |com..GuestListController객체|		
			  -----------------------------------------------
			 |/guest_view.do   |com..GuestViewController객체|		
			 ------------------------------------------------
			 */
			//요청url에 따른 객체 생성코드를 분리!!
			handlerMapping.put("/guest_main.do", new GuestMainController());
			handlerMapping.put("/guest_list.do", new GuestListController());
			handlerMapping.put("/guest_modify_action.do", new GuestModifyActionController());
			handlerMapping.put("/guest_modify_form.do", new GuestModifyFormController());
			handlerMapping.put("/guest_remove_action.do", new GuestRemoveActionController());
			handlerMapping.put("/guest_view.do", new GuestViewController());
			handlerMapping.put("/guest_write_action.do", new GuestWriteActionController());
			handlerMapping.put("/guest_write_form.do", new GuestWriteFormController());
			handlerMapping.put("/guest_error.do", new GuestErrorController());
			System.out.println(">> init: "+handlerMapping);
		}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}
	private void processRequest(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		/*
		<<요청 url(command)>>
		/guest_main.do  		
		/guest_list.do			
		/guest_view.do			
		/guest_write_form.do	
		/guest_write_action.do	
		/guest_modify_form.do	
		/guest_modify_action.do	
		/guest_remove_action.do	
		 */
		
		/*
		 * 1.DispatcherServlet이 클라이언트의 요청URI를 사용해서 요청분석
		 */
		
		String requestURI=request.getRequestURI();
		String contextPath=request.getContextPath();
		String command = requestURI.substring(contextPath.length());
		/*
		 * 2-1.DispatcherServlet이 클라이언트요청에따른 업무실행할 Controller객체 얻기
		 * 	<< handlerMapping 객체로부터 요청 command를 처리할 Controller 객체 얻기 >>
		 */
		Controller controller=handlerMapping.get(command);
		/*
		 * 2-2.DispatcherServlet이 Controller객체의 handleRequest메쏘드 실행
		 * 2-3.DispatcherServlet이 Controller객체의 handleRequest메쏘드 실행반환값인 forwardPath를 받는다.
		 */
		String forwardPath=controller.handleRequest(request, response);
		/*
		 * 3.DispatcherServlet이 forwardPath를 사용해서 forward 혹은 redirect를 한다.
		 */
		/************forward or redirect*************/
		/*
		 * forward ---> forward:/WEB-INF/views/guest_xxx.jsp
		 * redirect---> redirect:guest_xxx.do
		 */
		String[] pathArray = forwardPath.split(":");
		/*
		  << pathArray >>
		  |----0---|-----------------1------------|
		  |forward |/WEB-INF/views/guest_main.jsp |
		  |--------|------------------------------|
		  
		  |----0---|-------1-----|
		  |redirect|guest_main.do|
		  |--------|-------------|
		 */
		String forwardOrRedirect=pathArray[0];
		String path=pathArray[1];
		if(forwardOrRedirect.equals("redirect")) {
			//redirect
			response.sendRedirect(path);
		}else {
			//forwarding
			RequestDispatcher rd = request.getRequestDispatcher(path);
			rd.forward(request, response);
		}
		/*****************************************/
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	

}
