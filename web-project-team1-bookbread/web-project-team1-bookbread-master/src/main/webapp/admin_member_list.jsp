<%@page import="java.util.List"%>
<%@page import="com.itwill.bookbread.service.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="login_check.jspf"%>
<%
MemberService memberService = new MemberService();
List<Member> memberList = memberService.findAllMember();
%>

<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Delicious Book Admin</title>
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

</head>
<body>
	<!-- include_common_top_menu.jsp start-->
	<jsp:include page="include_common_top_menu.jsp" />
	<!-- include_common_top_menu.jsp end-->
	<!-- include_common_top.jsp start-->
	<jsp:include page="include_common_top.jsp" />
	<!-- include_common_top.jsp end-->


	<table style="margin: auto" border=0 width=70% height=400 align=center>
		<tr valign=bottom>
			<td width=10% align=center class=t1><font size=2 color=#000000><b>회원
						아이디</b></font></td>
			<td width=10% align=center class=t1><font size=2 color=#000000><b>회원
						비밀번호</b></font></td>
			<td width=10% align=center class=t1><font size=2 color=#000000><b>회원
						이름</b></font></td>
			<td width=10% align=center class=t1><font size=2 color=#000000><b>회원
						전화번호</b></font></td>
			<td width=10% align=center class=t1><font size=2 color=#000000><b>회원
						생년월일</b></font></td>
			<td width=10% align=center class=t1><font size=2 color=#000000><b>회원
						주소</b></font></td>
			<td width=15% align=center class=t1><font size=2 color=#000000><b>회원
						이메일</b></font></td>
			<td width=10% align=center class=t1><font size=2 color=#000000><b>회원
						관심분야</b></font></td>
			<td width=10% align=center class=t1><font size=2 color=#000000><b>비
						고</b></font></td>
		</tr>
		<tr width=100%>
			<td colspan=3 height=5><hr color=#556b2f></td>
		</tr>
		<%
		for (int i = 0; i < memberList.size(); i++) {
		%>
			
		<form method="post" name="f">
				<tr valign=top>
					<td width=120 align=center class=t1><font size=2 color=#000000><input
							type="hidden" name="userId" readonly
							value="<%=memberList.get(i).getUserId()%>"/><b><%=memberList.get(i).getUserId()%></b></td>
							
					<td width=120 align=center class=t1><font size=2 color=#000000><input
							type="hidden" name="password" readonly
							value="<%=memberList.get(i).getPassword()%>"/><b><%=memberList.get(i).getPassword()%></b></td>

					<td width=120 align=center class=t1><font size=2 color=#000000><input
							type="hidden" name="name" readonly
							value="<%=memberList.get(i).getName()%>"/><b><%=memberList.get(i).getName()%></b></td>

					<td width=400 align=center class=t1><font size=2 color=#000000><input
							type="hidden" name="phone" readonly
							value="<%=memberList.get(i).getPhone()%>"/><b><%=memberList.get(i).getPhone()%></b></font></td>

					<td width=120 align=center class=t1><font size=2 color=#000000><input
							type="hidden" name="birth" readonly
							value="<%=memberList.get(i).getBirth()%>"/><b><%=memberList.get(i).getBirth()%></b></font></td>

					<td width=120 align=center class=t1><font size=2 color=#000000><input
							type="hidden" name="address" readonly
							value="<%=memberList.get(i).getAddress()%>"/><b><%=memberList.get(i).getAddress()%></b></font></td>

					<td width=120 align=center class=t1><font size=2 color=#000000><input
							type="hidden" name="email" readonly
							value="<%=memberList.get(i).getEmail()%>"/><b><%=memberList.get(i).getEmail()%></b></font></td>

					<td width=120 align=center class=t1><font size=2 color=#000000><input
							type="hidden" name="interest" readonly
							value="<%=memberList.get(i).getEmail()%>"/><b><%=memberList.get(i).getEmail()%></b></font></td>

					<td align=center class=t1><input type=submit value="수정" onclick="javascript: form.action='admin_member_modify_form.jsp';" />
					<input type=submit onclick="javascript: form.action='admin_member_remove_action.jsp';" value="삭제" /></td> 
				</tr>
		</form>
			
		
		<%
		}
		%>
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
