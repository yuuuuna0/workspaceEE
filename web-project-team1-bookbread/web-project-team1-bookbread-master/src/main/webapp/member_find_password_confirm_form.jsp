
<%@page import="com.itwill.bookbread.service.MemberService"%>
<%@page import="com.itwill.bookbread.dto.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%

if(request.getMethod().equalsIgnoreCase("GET")){
	response.sendRedirect("member_find_password_form.jsp");
	return;
}

 String userId = request.getParameter("userId");
 String email = request.getParameter("email");
 MemberService memberService = new MemberService();
 String mid = memberService.findPassword(userId,email);
 

 
 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Delicious Book Login</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<!-- Google Font -->
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700|Raleway:400,300,500,700,600'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.css"
	type="text/css">
<!-- Theme Stylesheet -->
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/responsive.css">

<script type="text/javascript">
function login() {
	f.action = "member_login_form.jsp";
	f.submit();
}
</script>
</head>
<body>
	<!-- include_common_top_menu.jsp start-->
	<jsp:include page="include_common_top_menu.jsp" />
	<!-- include_common_top_menu.jsp end-->
	<!-- include_common_top.jsp start-->
	<jsp:include page="include_common_top.jsp"/>
	<!-- include_common_top.jsp end-->

							 <!-- login Form  -->
							<form name="f" method="post" align=center>
								<table style = "margin-left: auto; margin-right: auto;" border="0" cellpadding="0" cellspacing="1"
									bgcolor="BBBBBB">
									<h >회원님의 비밀번호는" <%=
									mid
									%> " 입니다.	</h>
																	
								</table>
							</form> <br />
							<table style = "margin-left: auto; margin-right: auto;" border="0" cellpadding="0" cellspacing="1">
								<tr>
									<td align=center>
										<input type="button" value="로그인화면으로" onClick="login();"> &nbsp; 
										
										
										
						
	<!-- jQuery Library -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
	<!-- Latest compiled and minified JavaScript -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<!-- Script -->
	<script src="js/script.js"></script>
	<h1>&nbsp;</h1>
	<div id="footer">
		<!-- include_common_bottom.jsp start-->
		<jsp:include page="include_common_bottom.jsp" />
		<!-- include_common_bottom.jsp end-->
	</div>

</body>
</html>