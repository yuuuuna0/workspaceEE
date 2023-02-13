
<%@page import="com.itwill.bookbread.dto.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String msg1 = request.getParameter("msg1");
String msg2 = request.getParameter("msg2");
if (msg1 == null)
	msg1 = "";
if (msg2 == null)
	msg2 = "";
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
function MemberCreate() {
	f.action = "member_write_form.jsp";
	f.submit();
}
function findId(){
	f.action = "member_find_id_form.jsp";
	f.submit();
}
function findPassword(){
	f.action = "member_find_password_form.jsp";
	f.submit();
}

function login() {
	if (f.userId.value == "") {
		alert("사용자 아이디를 입력하십시요.");
		f.userId.focus();
		return false;
	}
	if (f.password.value == "") {
		alert("비밀번호를 입력하십시요.");
		f.password.focus();
		return false;
	}

	f.action = "member_login_action.jsp";
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
							<form name="f" method="post">
								<table style = "margin-left: auto; margin-right: auto;" border="0" cellpadding="0" cellspacing="1"
									bgcolor="BBBBBB">
									<tr>

										<td width=100 align="center" bgcolor="ffecbb" height="22">사용자
											아이디</td>
										<td width=190 align="center" bgcolor="ffffff"

											style="padding-left: 5px"><input type="text"
											style="width: 150" name="userId"
											value="">&nbsp;&nbsp;<font
											color="red"><%=msg1%></font></td>
									</tr>

										<td width=100 align="center" bgcolor="ffecbb" height="22">비밀번호</td>
										<td width=190 align="center" bgcolor="ffffff"

											style="padding-left: 5px"><input type="password"
											style="width: 150" name="password"
											value="">&nbsp;&nbsp;<font
											color="red"><%=msg2%></font></td>
									</tr>
								</table>
							</form> <br />
							<table style = "margin-left: auto; margin-right: auto;" border="0" cellpadding="0" cellspacing="1">
								<tr>
									<td align=center>
										<input type="button" value="로그인" onClick="login();"> &nbsp; 
										<input type="button" value="회원가입" onClick="MemberCreate()"></td><br>
										
										
								</tr>
							</table>
							<table style = "margin-left: auto; margin-right: auto;" border="0" cellpadding="0" cellspacing="1">
								<tr>
									<td align=center>
										<input type="button" value="아이디찾기" onClick="findId();"> &nbsp; 
										<input type="button" value="비밀번호찾기" onClick="findPassword();"></td><br>
										
										
								</tr>
							</table>
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