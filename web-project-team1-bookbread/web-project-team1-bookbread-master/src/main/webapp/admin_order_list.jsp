<%@page import="com.itwill.bookbread.dto.Orders"%>
<%@page import="com.itwill.bookbread.service.OrdersService"%>
<%@page import="com.itwill.bookbread.dto.Product"%>
<%@page import="com.itwill.bookbread.service.ProductService"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="login_check.jspf"%>
<%
OrdersService ordersService = new OrdersService();
List<Orders> ordersList = ordersService.ordersListForAdmin();
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

	<table style="margin: auto" border=0 width=80% height=400 align=center>
		<tr valign=middle>
			<td width=5% align=center class=t1><font size=2 color=#000000><b>주문
						번호</b></font></td>
			<td width=10% align=center class=t1><font size=2 color=#000000><b>회원 아이디</b></font></td>
			<td width=10% align=center class=t1><font size=2 color=#000000><b>주문
						내역</b></font></td>
			<td width=5% align=center class=t1><font size=2 color=#000000><b>주문 일자</b></font></td>
			<td width=5% align=center class=t1><font size=2 color=#000000><b>결제 금액</b></font></td>
		</tr>
		<tr width=100%>
			<td colspan=3 height=5><hr color=#556b2f></td>
		</tr>
		<%
		for (int i = 0; i < ordersList.size(); i++) {
		%>

		<form method="post" name="f">
			<tr valign=top>
				<td width=120 align=center class=t1><font size=2 color=#000000><input
						type="hidden" name="pno" readonly
						value="<%=ordersList.get(i).getO_no()%>" /><b><%=ordersList.get(i).getO_no()%></b></td>
				<td width=120 align=center class=t1><font size=2 color=#000000><input
						type="hidden" name="pname" readonly
						value="<%=ordersList.get(i).getUserId()%>" /><b><%=ordersList.get(i).getUserId()%></b></td>
				<td width=120 align=center class=t1><font size=2 color=#000000><input
						type="hidden" name="pauthor" readonly
						value="<%=ordersList.get(i).getO_desc()%>" /><b><%=ordersList.get(i).getO_desc()%></b></td>
				<td width=400 align=center class=t1><font size=2 color=#000000><input
						type="hidden" name="ppublisher" readonly
						value="<%=ordersList.get(i).getO_date()%>" /><b><%=ordersList.get(i).getO_date()%></b></font></td>
				<td width=120 align=center class=t1><font size=2 color=#000000><input
						type="hidden" name="ppublishdate" readonly
						value="<%=ordersList.get(i).getO_price()%>" /><b><%=ordersList.get(i).getO_price()%>원</b></font></td>
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
