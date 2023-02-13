<%@page import="com.itwill.bakery.vo.QnA"%>
<%@page import="com.itwill.bakery.service.QnAService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="user_login_check.jspf"%> 
<%

	if(request.getParameter("qna_no")==null){
		response.sendRedirect("qna_list.jsp");
		return;
	}
	if(request.getParameter("groupno")==null){
		response.sendRedirect("qna_list.jsp");
		return;
	}
	int qna_no = Integer.parseInt(request.getParameter("qna_no"));
	QnA qna=QnAService.getInstance().findQnA(qna_no);
	if(qna==null){
		response.sendRedirect("qna_list.jsp");
		return;
	}
	String pageno="1";
	if(request.getParameter("pageno")!=null){
		pageno = request.getParameter("pageno");
	}
	
	String sUser_id=null;
	if(session.getAttribute("s_u_id")!=null){
		sUser_id=(String)session.getAttribute("s_u_id");
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>SEOUL BAGUETTE</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel=stylesheet href="css/styles.css" type="text/css">
<link rel=stylesheet href="css/menu.css" type="text/css">
<link rel=stylesheet href="css/shop.css" type="text/css">
<script type="text/javascript" src="js/qna.js">
	
</script>
</head>
<body bgcolor=#FFFFFF text=#000000 leftmargin=0 topmargin=0
	marginwidth=0 marginheight=0>
	<!-- container start-->
	<div id="container">
		<!-- header start -->
		<div id="header">
			<!-- include_common_top.jsp start-->
			<jsp:include page="include_common_top_main.jsp" />
			<!-- include_common_top.jsp end-->
		</div>
		<!-- header end -->
		<!-- wrapper start -->
		<div id="wrapper">
			<!-- content start -->
			<!-- include_content.jsp start-->
			<div id="content">
				<table border=0 cellpadding=0 cellspacing=0>
					<tr>
						<td><br />
							<table style="padding-left: 10px" border=0 cellpadding=0
								cellspacing=0>
								<caption
									style="text-align: left; font-weight: bold; padding-bottom: 7px">
									<span style="border-left: 4px solid #888888;"></span>&nbsp;&nbsp;
									Q & A > 게시물 답글작성
									</caption>
								
							</table> <br> <!-- write Form  -->
							<form name="f" action="qna_reply_write_action.jsp" method="post">
								<input type="hidden" name="pageno"  value="<%=pageno%>" />
		        				<input type="hidden" name="qna_no" value="<%=qna.getQna_no()%>"/>
		        				<input type="hidden" name="groupno" value="<%=qna.getGroupno()%>"/>

								<table border="0" cellpadding="0" cellspacing="1" width="590"
									bgcolor="BBBBBB">
									<tr>
										<td width=100 align=center bgcolor="E2E2E2" height="22">제목</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px" align="left">
											<input value="[RE]<%=qna.getQna_title()%>"  type="text" style="width: 150"
											name="qna_title">
										</td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E2E2E2" height="22">작성자</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px" align="left">
											<input value="<%=sUser_id%>" readonly="readonly" type="text" style="width: 150"
											name="user_id">
										</td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E2E2E2" height="22">내용</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px" align="left">
											<textarea name="qna_content" class="textarea" style="width: 350px" rows="14">>><%=qna.getQna_content().replace("\n",">>").trim()%></textarea>
										</td>
									</tr>


								</table>
							</form> <br>

							<table width=590 border=0 cellpadding=0 cellspacing=0>
								<tr>
									<td align=center>
									<input type="button" value="게시물 답글 작성" onClick="qnaReplyMsg()"> &nbsp; 
									<input type="button" value="게시물 목록" onClick="qnaList()"></td>
								</tr>
							</table></td>
					</tr>
				</table>
				</div>

				<!-- include_content.jsp end-->
				<!-- content end -->
			</div>
			<!--wrapper end-->
			<div id="footer">
				<!-- include_common_bottom.jsp start-->
				<jsp:include page="include_common_bottom.jsp" />
				<!-- include_common_bottom.jsp end-->
			</div>
		</div>
		<!--container end-->
</body>
</html>