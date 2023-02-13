<%@page import="com.itwill.bookbread.service.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="login_check.jspf"%>
<%
MemberService memberService = new MemberService();
Member member = memberService.findMember(sUserId);

if(member.getUserId().equalsIgnoreCase("admin")){
	response.sendRedirect("admin_view.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Delicious Book MyPage</title>
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
	function userRemove() {
		if (confirm("정말 탈퇴하시겠습니까? (당신의 지식레벨이 -1 될 수 있습니다.)")) {
			document.f.action = "member_remove_action.jsp";
			document.f.method = 'POST';
			document.f.submit();
		}
	}
</script>
</head>
<body>
	<!-- include_common_top_menu.jsp start-->
	<jsp:include page="include_common_top_menu.jsp" />
	<!-- include_common_top_menu.jsp end-->
	<!-- include_common_top.jsp start-->
	<jsp:include page="include_common_top.jsp" />
	<!-- include_common_top.jsp end-->
	<br />
	<br />
	<br />
	<table>

		<form name="f" method="post">
			<table align=center width="20%" border="1" cellpadding="0"
				cellspacing="1" bgcolor="BBBBBB" bordercolor="#BDBDBD">
				<tr>
					<td width=100 height=65 bgcolor="#f4bf6f" align=center class=t1>
						<font color="#fff"><b>회원서비스</b></font>
					</td>
				</tr>

				<tr>
					<td width=100 height=40 align=center bgcolor="ffffff" class=t1>
						<a href=member_modify_form.jsp><b>나의정보수정</b></a>
					</td>
				</tr>
				<tr>
					<td width=100 height=40 align=center bgcolor="ffffff" class=t1>
						<a href="review_board_list.jsp"><b>나의리뷰보기</b></a>
					</td>
				</tr>
				<tr>
					<td width=100 height=40 align=center bgcolor="ffffff" class=t1>
						<a href=order_list.jsp><b>나의주문내역</b></a>
					</td>
				</tr>
				<tr>
					<td width=100 height=40 align=center bgcolor="ffffff" class=t1
						onClick="userRemove()"><a href=#><b>회원탈퇴하기</b></a></td>
				</tr>

			</table>
		</form>
	</table>
	<br />




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